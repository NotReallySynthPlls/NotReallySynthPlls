

//! Proportional-Integral Loop Filter 
module pi_filter #(
    parameter longint KI = 1,
    parameter longint KP = 1,
    parameter longint DIV = 1,
    parameter longint LIMIT = 20e3
)(
    input  logic clk,
    input  logic resetn,
    input  longint inp,
    output longint out
);
    longint accum, accum_m1;

    always_comb begin
        accum = inp + accum_m1;
        if (accum > LIMIT)  accum =  LIMIT;
        if (accum < -LIMIT) accum = -LIMIT;
    end

    assign out = (accum * KI + inp * KP) / DIV;
    
    // Accumulator Updates
    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) accum_m1 <= 0;
        else accum_m1 <= accum;
    end

endmodule

typedef enum { INCOMPLETE, PASS, FAIL } freq_search_state_t;

//! 
//! Frequency Band-Search FSM 
//! 
module freq_band_search #(
    parameter longint NCYC = 16,
    parameter longint MINBAND = 0,
    parameter longint MAXBAND = 31
)(
    input  logic measclk,
    input  logic refclk,
    input  logic resetn,
    input  longint target,
    output longint band,
    output freq_search_state_t state
);
    longint cycle_count, cycle_count_m1, fmeas, freq_diff, ref_count;

    // Measured-Clock Roll-Over Counter
    always_ff @(posedge measclk or negedge resetn) begin
        if (!resetn) begin 
            cycle_count <= 0;
        end else begin
            cycle_count <= cycle_count + 1;
        end 
    end

    // Main FSM Action 
    always_ff @(posedge refclk or negedge resetn) begin
        if (!resetn) begin // Reset state
            state <= INCOMPLETE;
            band <= MINBAND;
            ref_count <= 0;
            cycle_count_m1 <= 0;
        end else if (state == INCOMPLETE) begin // FSM Working
            if (ref_count < NCYC-1) begin 
                ref_count <= ref_count + 1;
            end else begin 
                fmeas = cycle_count - cycle_count_m1;
                if (fmeas >= target * NCYC) begin 
                    // Successful case! We done.  
                    state <= PASS; 
                    // Decide whether to back down by one, 
                    // if the prior guess was (absolute-value) closer. 
                    if (fmeas - target * NCYC > -freq_diff) begin 
                        band <= band - 1;
                    end
                end else if (band >= MAXBAND) begin 
                    // No more bands to try. Something wrong. 
                    state <= FAIL;
                end else begin 
                    // Try next band in linear search
                    freq_diff = fmeas - target * NCYC;
                    band <= band + 1;
                end
                // Set up for our next measurement 
                ref_count <= 0;
                cycle_count_m1 <= cycle_count;
            end
        end 
    end 
endmodule

//! 
//! # Canary PLL 
//! 
module pll (
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    input  int  divn,
    output lock_state_t lock_state,
    output logic  pclk
);
    // Droop-Management Brakes
    brake_state_t brake_state;
    longint delta_f, delta_n;
    droop_mgr i_droop_mgr (
        .refclk(refclk),
        .resetn(resetn),
        .brake(brake),
        .brake_state(brake_state),
        .delta_f(delta_f),
        .delta_n(delta_n)
    );

    // Frequency Count
    longint cycle_count, cycle_count_samp, cycle_count_m1, fmeas, fmeas_startup, freq_diff, flock_count;
    logic fmeas_ready;
    parameter FLOCK_CYCLES = 255;
    // Phase Detector & Lock Detector
    int pd_out, phase_lock_count; 

    // Divider Target
    longint freq_target;
    assign freq_target = divn - delta_n;

    longint dctrl [3];
    dco #(
        .NCTRL(3),
        .KDCO({`KDCO_COARSE, `KDCO_FINE, `KDCO_FINE}),
        .NOISE_RMS(3e-12)
    ) i_dco (
        .ctrl(dctrl),
        .resetn(resetn),
        .pclk(pclk)
    );

    // Frequency Count
    always_ff @(posedge pclk or negedge resetn) begin
        if (!resetn) cycle_count <= 0;
        else cycle_count <= cycle_count + 1;
    end 
    always_ff @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            cycle_count_m1 <= 0;
            fmeas_ready <= 1'b0;
            fmeas_startup <= 2;
        end else begin 
            cycle_count_samp <= cycle_count;
            cycle_count_m1 <= cycle_count_samp;
            if (fmeas_startup == 0) fmeas_ready <= 1'b1;
            else fmeas_startup <= fmeas_startup - 1; 
        end 
    end
    assign fmeas = cycle_count_samp - cycle_count_m1;
    assign freq_diff = freq_target - fmeas;

    // Feedback Divider
    longint div_count;
    logic fbclk;
    always_ff @(posedge pclk or negedge resetn) begin
        if (!resetn) begin 
            div_count <= freq_target - 1;
        end else begin // pclk rising edge
            if (div_count == 0) div_count <= freq_target - 1;
            else div_count <= div_count - 1;
        end
    end 
    // FIXME: can this glitch on brake-event? Maybe, probably
    assign fbclk = div_count >= freq_target / 2;

    // Phase Detector 
    pd #( .BANG_BANG(1) ) i_pd (
        .refclk(refclk),
        .fbclk(fbclk),
        .resetn(resetn),
        .out(pd_out)
    );

    // Lock Detectors
    always_ff @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            lock_state <= UNLOCKED;
            flock_count <= FLOCK_CYCLES;
            phase_lock_count <= FLOCK_CYCLES;
        end else begin             
            // Lock Detection Countdown
            // Requires `FLOCK_CYCLES` *consecutive* cycles of low error 
            // FIXME: this locks *once* and never again, for now.
            if (lock_state == UNLOCKED) begin 

                if (fmeas_ready && freq_diff <= 2 && freq_diff >= -2) begin
                    if (flock_count > 0) flock_count <= flock_count - 1;
                    else begin 
                        flock_count <= FLOCK_CYCLES;
                        lock_state <= COARSE_FREQ_LOCKED;
                    end
                end else begin // freq_diff > 1
                    flock_count <= FLOCK_CYCLES;
                end 
            end else if (lock_state == COARSE_FREQ_LOCKED) begin 
                if (fmeas_ready && freq_diff <= 1 && freq_diff >= -1) begin
                    if (flock_count > 0) flock_count <= flock_count - 1;
                    else begin 
                        flock_count <= FLOCK_CYCLES;
                        lock_state <= FINE_FREQ_LOCKED;
                    end
                end else begin // freq_diff > 1
                    flock_count <= FLOCK_CYCLES;
                end 
            end else if (lock_state == FINE_FREQ_LOCKED) begin 
                if (pd_out < 5 && pd_out > -5) begin
                    if (phase_lock_count > 0) phase_lock_count <= phase_lock_count - 1;
                    else lock_state <= PHASE_LOCKED;
                end else begin // phase error too big
                    phase_lock_count <= FLOCK_CYCLES;
                end 
            end 
        end
    end

    // Loop Selection 
    logic fine_freq_fb_en, phase_fb_en;
    assign fine_freq_fb_en = (fmeas_ready && (lock_state == COARSE_FREQ_LOCKED) && brake_state == BRAKES_OFF);
    assign phase_fb_en = (fmeas_ready && (lock_state == FINE_FREQ_LOCKED || lock_state == PHASE_LOCKED) && brake_state == BRAKES_OFF);

    // Band-Search FSM 
    // Sets coarse-est of 3 DCO control codes
    freq_search_state_t freq_search_state;
    freq_band_search #(
        .NCYC(32),
        .MINBAND(-5),
        .MAXBAND(31)
    ) i_freq_band_search (
        .measclk(pclk),
        .refclk(refclk),
        .resetn(resetn),
        .target(freq_target),
        .state(freq_search_state),
        .band(dctrl[0])
    );

    // Frequency Loop Filter
    longint freq_err_fine;
    assign freq_err_fine = fine_freq_fb_en ? freq_diff : 0;
    pi_filter #(
        .KP(0),
        .KI(10),
        .DIV(10),
        .LIMIT(50e3)
    ) i_filt_freq_fine (
        .clk(refclk),
        .resetn(resetn),
        .inp(freq_err_fine),
        .out(dctrl[1])
    );

    // Phase Loop Filter
    longint phase_err;
    assign phase_err = phase_fb_en ? pd_out : 0; 
    longint phase_ctrl_nc;
    pi_filter #(
        .KP(10),
        .KI(1),
        .DIV(10),
        .LIMIT(100)
    ) i_filt_phase (
        .clk(refclk),
        .resetn(resetn),
        .inp(phase_err),
        .out(dctrl[2])
    );

    // Debug real-valued error signals
    // Sadly, synthesis doesnt wanna ignore these
    real phase_err_real, freq_err_real;
    assign freq_err_real = 1.0 * freq_diff;
    assign phase_err_real = 1.0 * phase_err;

endmodule // pll 

