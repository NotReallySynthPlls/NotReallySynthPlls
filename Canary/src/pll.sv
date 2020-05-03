`timescale 1fs/1fs

typedef enum { BRAKES_OFF, BRAKING, RECOVERING } brake_state_t;

module droop_mgr(
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    output brake_state_t brake_state,
    output int delta_f,
    output int delta_n
);
    // Brake Handling 
    parameter int BRAKE_DELTA_F = 1e9;
    parameter int BRAKE_CODE = 1e6; // FIXME: these param dependences: K_PHASE_DIV * BRAKE_DELTA_F / `KDCO_FINE / KI_PHASE;
    parameter int BRAKE_DIV = 10; // Divider initial delta-N
    parameter int BRAKE_DIV_STEP = 1; // Step size during divider recovery 
    parameter int BRAKE_HOLD_CYCLES = 32; // How many ref-cycles to hold at each recovery-step
    parameter int BRAKE_CYCLES = 500; // How many cycles to hold before beginning recovery
    
    int brake_countdown, brake_code_delta, brake_div_delta, brake_hold_cycles;

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


module pll (
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    input  int  divn,
    output logic  pclk
);
    // Loop Params
    parameter int KP_PHASE = 1e5;
    parameter int KI_PHASE = 1e3;
    parameter int K_PHASE_DIV = 1e4;
    parameter int KP_FREQ = 0;
    parameter int KI_FREQ = 10;
    parameter int K_FREQ_DIV = 1e3;

    int di_freq, dp_freq, di_phase, dp_phase, dctrl_phase, dctrl_freq, freq_target;

    // Brakes
    brake_state_t brake_state;
    int delta_f, delta_n;

    droop_mgr i_droop_mgr (
        .refclk(refclk),
        .resetn(resetn),
        .brake(brake),
        .brake_state(brake_state),
        .delta_f(delta_f),
        .delta_n(delta_n)
    );

    int accum_phase, accum_phase_m1, phase_err;
    int accum_freq, accum_freq_m1, freq_err;

    // Frequency Count
    int cycle_count, cycle_count_samp, cycle_count_m1, fmeas, fmeas_startup, freq_diff, flock_count;
    logic fmeas_ready;
    parameter FLOCK_CYCLES = 255;
    // Phase Detector & Lock Detector
    int pd_out, phase_lock_count;

    // Lock Detection & State 
    enum { UNLOCKED, FREQ_LOCKED, PHASE_LOCKED } lock_state;

    // Divider Target
    assign freq_target = divn - delta_n;

    dco i_dco (
        .dctrl_coarse(dctrl_freq),
        .dctrl_fine(dctrl_phase),
        .refclk(refclk),
        .resetn(resetn),
        .pclk(pclk), 
        .dco_phase(dco_phase)
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
    int div_count;
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
    pd i_pd(
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
                if (fmeas_ready && freq_diff < 1 && freq_diff > -1) begin
                    if (flock_count > 0) flock_count <= flock_count - 1;
                    else lock_state <= FREQ_LOCKED;
                end else begin // freq_diff > 1
                    flock_count <= FLOCK_CYCLES;
                end 
            end else if (lock_state == FREQ_LOCKED) begin 
                if (pd_out < 2 && pd_out > -2) begin
                    if (phase_lock_count > 0) phase_lock_count <= phase_lock_count - 1;
                    else lock_state <= PHASE_LOCKED;
                end else begin // phase error too big
                    phase_lock_count <= FLOCK_CYCLES;
                end 
            end 
        end
    end

    // Phase Loop Filter
    logic freq_fb_en, phase_fb_en;
    assign freq_fb_en  = (fmeas_ready && (lock_state == UNLOCKED || brake_state != BRAKES_OFF));
    assign phase_fb_en = (fmeas_ready && (lock_state == FREQ_LOCKED || lock_state == PHASE_LOCKED) && brake_state == BRAKES_OFF);

    assign phase_err = phase_fb_en ? pd_out : 0; // TDC Loop
    assign accum_phase = phase_err + accum_phase_m1 - delta_f;
    assign dctrl_phase = (accum_phase * KI_PHASE + phase_err * KP_PHASE) / K_PHASE_DIV;

    // Frequency Loop Filter
    assign freq_err = freq_fb_en ? freq_diff : 0; 
    assign accum_freq = freq_err + accum_freq_m1;
    assign dctrl_freq = (accum_freq * KI_FREQ + freq_err * KP_FREQ) / K_FREQ_DIV;

    // Accumulator Updates
    always_ff @(posedge refclk or negedge resetn) begin
        if (!resetn) begin 
            accum_phase_m1 <= 0;
            accum_freq_m1 <= 0;
        end else begin // Rising edge 
            accum_phase_m1 <= accum_phase;
            accum_freq_m1 <= accum_freq;
        end 
    end

    // Debug real-valued error signals
    // Sadly, synthesis doesnt wanna ignore these
    // real phase_err_real, freq_err_real;
    // assign freq_err_real = 1.0 * freq_err;
    // assign phase_err_real = 1.0 * phase_err;

endmodule

