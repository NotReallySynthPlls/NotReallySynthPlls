
typedef enum { BRAKES_OFF, BRAKING, RECOVERING } brake_state_t;

//! 
//! # Supply Droop and Recovery Manager
//! 
module droop_mgr(
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    output brake_state_t brake_state,
    output longint delta_f,
    output longint delta_n
);
    // Brake Handling 
    parameter longint BRAKE_DELTA_F = 1e9;
    parameter longint BRAKE_CODE = 1e6; // FIXME: these param dependences: K_PHASE_DIV * BRAKE_DELTA_F / `KDCO_FINE / KI_PHASE;
    parameter longint BRAKE_DIV = 10; // Divider initial delta-N
    parameter longint BRAKE_DIV_STEP = 1; // Step size during divider recovery 
    parameter longint BRAKE_HOLD_CYCLES = 32; // How many ref-cycles to hold at each recovery-step
    parameter longint BRAKE_CYCLES = 500; // How many cycles to hold before beginning recovery
    
    longint brake_countdown, brake_code_delta, brake_div_delta, brake_hold_cycles;

    // Main FSM Action
    always_ff @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            brake_state <= BRAKES_OFF;
            brake_hold_cycles <= BRAKE_HOLD_CYCLES;
            brake_countdown <= 0;
            // Codes are "pre-armed", and enabled combinationally
            brake_code_delta <= BRAKE_CODE; 
            brake_div_delta <= BRAKE_DIV;
        end else begin // Clock Edge
            if (brake_state == BRAKES_OFF) begin
                if (brake) begin // Latch into BRAKING state
                    brake_state <= BRAKING;
                    brake_countdown <= BRAKE_CYCLES;
                end
            end else if (brake_state == BRAKING) begin
                brake_code_delta <= 0; // This clears the brake-code accumulator input
                if (brake) begin // Sit here until brake-input de-asserted
                    brake_countdown <= BRAKE_CYCLES;
                end else if (brake_countdown > 0) begin 
                    brake_countdown <= brake_countdown - 1;
                end else begin // Countdown over, move to recovery 
                    brake_state <= RECOVERING;
                    brake_hold_cycles <= BRAKE_HOLD_CYCLES;
                end
            end else if (brake_state == RECOVERING) begin 
                brake_code_delta <= 0;
                if (brake_hold_cycles > 0) brake_hold_cycles <= brake_hold_cycles - 1;
                else begin 
                    brake_hold_cycles <= BRAKE_HOLD_CYCLES;
                    if (brake_div_delta > (BRAKE_DIV_STEP-1)) brake_div_delta <= brake_div_delta - BRAKE_DIV_STEP;
                    else begin // We handled it! We're done!
                        brake_state <= BRAKES_OFF;
                        // Codes are "pre-armed", and enabled combinationally
                        brake_code_delta <= BRAKE_CODE; 
                        brake_div_delta <= BRAKE_DIV;
                    end 
                end
            end
        end 
    end

    // Combinational brake-enable
    logic brakes_on;
    assign brakes_on = brake | (brake_state != BRAKES_OFF);
    assign delta_f = brakes_on ? brake_code_delta : 0;
    assign delta_n = brakes_on ? brake_div_delta : 0;

endmodule

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


//! 
//! # Canary PLL 
//! 
module pll (
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    input  int  divn,
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
    longint pd_out, phase_lock_count;

    // Lock Detection & State 
    enum { UNLOCKED, COARSE_FREQ_LOCKED, FINE_FREQ_LOCKED, PHASE_LOCKED } lock_state;

    // Divider Target
    longint freq_target;
    assign freq_target = divn - delta_n;

    longint dctrl [3];
    dco #(
        .NCTRL(3),
        .KDCO({`KDCO_COARSE, `KDCO_FINE, `KDCO_FINE})
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
                if (fmeas_ready && freq_diff <= 1 && freq_diff >= -1) begin
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
    logic coarse_freq_fb_en, fine_freq_fb_en, phase_fb_en;
    assign coarse_freq_fb_en  = (fmeas_ready && (lock_state == UNLOCKED || brake_state != BRAKES_OFF));
    assign fine_freq_fb_en = (fmeas_ready && (lock_state == COARSE_FREQ_LOCKED) && brake_state == BRAKES_OFF);
    assign phase_fb_en = (fmeas_ready && (lock_state == FINE_FREQ_LOCKED || lock_state == PHASE_LOCKED) && brake_state == BRAKES_OFF);

    // Loop Params
    parameter longint KP_PHASE = 0;//1e11;
    parameter longint KI_PHASE = 30e3;//KP_PHASE / 32;
    parameter longint K_PHASE_DIV = 1e3;
    parameter longint KP_FREQ = 0;
    parameter longint KI_FREQ = 10;
    parameter longint K_FREQ_DIV = 1e3;

    // Frequency Loop Filter
    longint freq_err;
    assign freq_err = coarse_freq_fb_en ? freq_diff : 0; 
    pi_filter #(
        .KI(KI_FREQ),
        .KP(KP_FREQ),
        .DIV(K_FREQ_DIV),
        .LIMIT(1024)
    ) i_filt_freq_coarse (
        .clk(refclk),
        .resetn(resetn),
        .inp(freq_err),
        .out(dctrl[0])
    );

    // Fine-Frequency Loop Filter
    longint freq_err_fine;
    assign freq_err_fine = fine_freq_fb_en ? freq_diff : 0;
    pi_filter #(
        .KP(0),
        .KI(10),
        .DIV(1),
        .LIMIT(1024)
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
        .DIV(1),
        .LIMIT(64)
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

