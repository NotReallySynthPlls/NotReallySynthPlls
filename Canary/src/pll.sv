`timescale 1fs/1fs


module pll (
    input  wire refclk,
    input  wire resetn,
    input  wire brake,
    input  int  divn,
    output reg  pclk
);

    // Loop Params
    parameter int KP_PHASE = 1e5;
    parameter int KI_PHASE = 1e3;
    parameter int K_PHASE_DIV = 1e4;
    parameter int KP_FREQ = 0;
    parameter int KI_FREQ = 10;

    int di_freq, dp_freq, di_phase, dp_phase, dctrl, dctrl_phase, dctrl_freq;

    // Brakes
    parameter real BRAKE_DELTA_F = 1e9;
    parameter int BRAKE_CODE = K_PHASE_DIV * BRAKE_DELTA_F / `KDCO_FINE / KI_PHASE;
    // parameter int BRAKE_DIV = 10 * 2 * `NUM_STAGES;
    parameter int BRAKE_DIV = 10;
    parameter int BRAKE_DIV_STEP = 1;
    parameter int BRAKE_HOLD_CYCLES = 32; // How many ref-cycles to hold at each recovery-step
    parameter int BRAKE_CYCLES = 500;

    logic ready;
    real phase_err_real, freq_err_real;
    int accum_phase, accum_phase_m1, targ_phase, phase_err;
    int accum_freq, accum_freq_m1, freq_err;
    int dco_phase, dco_phase_m1, dco_phase_diff, freq_target;

    // Frequency Count
    int cycle_count, cycle_count_m1, fmeas, fmeas_startup, freq_diff, flock_count;
    logic fmeas_ready;
    parameter FLOCK_CYCLES = 255;
    // TDC
    int phase_targ, phase_meas, phase_diff, tdc_out;
    int phase_lock_count;
    logic new_fb;

    // Lock Detection & State 
    enum { UNLOCKED, FREQ_LOCKED, PHASE_LOCKED, BRAKE_RECOVERY } lock_state;

    // Brake Handling & State
    enum { BRAKES_OFF, BRAKING, RECOVERING } brake_state;
    int brake_countdown, brake_code_delta, brake_div_delta, brake_hold_cycles;
    always @(posedge brake) begin
        brake_state = BRAKING;
        brake_code_delta = BRAKE_CODE;
        brake_countdown = BRAKE_CYCLES;
        brake_div_delta = BRAKE_DIV;
        ready = 0;
        lock_state = BRAKE_RECOVERY;
    end

    // assign freq_target = 2 * `NUM_STAGES * divn - brake_div_delta;
    assign freq_target = divn - brake_div_delta;

    dco i_dco (
        .dctrl_coarse(dctrl_freq),
        .dctrl_fine(dctrl_phase),
        .refclk(refclk),
        .resetn(resetn),
        .pclk(pclk), 
        .dco_phase(dco_phase)
    );

    // Main Sampling-Time Action
    always @ (resetn or refclk) begin
        if (!resetn) begin 

            // Reset all our sampled signals
            dco_phase_m1 = 0;
            dco_phase_diff = 0;
            targ_phase = 'd0;
            accum_phase_m1 = 0;
            accum_freq_m1 = 0;
            ready = 1'b0;

            brake_state = BRAKES_OFF;
            brake_hold_cycles = BRAKE_HOLD_CYCLES;
            brake_countdown = 0;
            brake_code_delta = 0;
            brake_div_delta = 0;

        end else if (refclk) begin // Rising edge 
            dco_phase_m1 <= dco_phase;  // Keep one past sample, in case we want frequency feedback 
            
            if (ready) begin // Make FB Loop updates. Several require a cycle of initialization. 
                accum_phase_m1 <= accum_phase;
                accum_freq_m1 <= accum_freq;
                brake_code_delta <= 0;

                
                targ_phase <= targ_phase + freq_target;

                if (brake_state == BRAKING) begin
                    if (brake_countdown > 0) brake_countdown <= brake_countdown - 1;
                    else begin 
                        brake_state <= RECOVERING;
                        brake_hold_cycles = BRAKE_HOLD_CYCLES;
                        phase_lock_count = FLOCK_CYCLES;
                        flock_count = FLOCK_CYCLES;
                        lock_state = BRAKE_RECOVERY;
                    end
                end else if (brake_state == RECOVERING) begin 
                    if (brake_hold_cycles > 0) brake_hold_cycles = brake_hold_cycles - 1;
                    else begin 
                        brake_hold_cycles = BRAKE_HOLD_CYCLES;
                        if (brake_div_delta > (BRAKE_DIV_STEP-1)) brake_div_delta <= brake_div_delta - BRAKE_DIV_STEP;
                        else begin // We handled it! We're done!
                            brake_state <= BRAKES_OFF;
                            lock_state <= FREQ_LOCKED;
                        end 
                    end
                end

                // Frequency measurement 1-z**-1
                // dco_phase_diff = dco_phase - dco_phase_m1; 
                // err <= 2 * `NUM_STAGES * divn - dco_phase_diff; // Note FB Loop inverts here!
            end 
            else begin // Falling edge refclk
                targ_phase <= dco_phase + freq_target;
                ready = 1'b1;
            end
        end 
    end

    // Frequency Count
    always @(posedge pclk or negedge resetn) begin
        if (!resetn) begin 
            cycle_count = 0;
            cycle_count_m1 = 0;
        end else begin 
            cycle_count = cycle_count + 1;
        end
    end 
    always @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            fmeas = 0;
            fmeas_ready = 1'b0;
            fmeas_startup = 2;
            lock_state = UNLOCKED;
            flock_count = FLOCK_CYCLES;
        end else begin 
            fmeas = cycle_count - cycle_count_m1;
            cycle_count_m1 = cycle_count;
            freq_diff = freq_target - fmeas;
            if (fmeas_startup == 0) fmeas_ready = 1'b1;
            else fmeas_startup = fmeas_startup - 1; 
            
            // Lock Detection Countdown
            // Requires `FLOCK_CYCLES` *consecutive* cycles of low error 
            // FIXME: this locks *once* and never again, for now.
            if (lock_state == UNLOCKED) begin 
                if (freq_diff < 1 && freq_diff > -1) begin
                    if (flock_count > 0) flock_count = flock_count - 1;
                    else lock_state = FREQ_LOCKED;
                end else begin // freq_diff > 1
                    flock_count = FLOCK_CYCLES;
                end 
            end 
        end
    end

    // Feedback Divider
    int div_count;
    logic fbclk;
    always @(posedge pclk or negedge resetn) begin
        if (!resetn || div_count == 0) begin
            div_count = freq_target - 1;
        end else begin 
            div_count = div_count - 1;
        end
    end 
    // FIXME: can this glitch on brake-event? Maybe, probably
    assign fbclk = div_count >= freq_target / 2;

    // TDC 
    parameter TDC_STEP = 1 * 1e3; // In fs, units of tick-timescale
    parameter TDC_RANGE = 4000; // Single-sided range, in units of LSBs
    // FIXME: set TDC_RANGE = 1000, STEP=1e3 to show some failing
    always @(posedge fbclk) begin 
        phase_meas = $time;
        new_fb = 1'b1;
    end
    always @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            phase_lock_count = FLOCK_CYCLES;
        end else if (!new_fb) begin 
            tdc_out = TDC_RANGE; // Feedback late & outta range
        end else begin 
            phase_targ = $time - TDC_RANGE * TDC_STEP; // Offset
            phase_diff = (phase_meas - phase_targ) / TDC_STEP;
            tdc_out = phase_diff > TDC_RANGE ? TDC_RANGE : phase_diff < -TDC_RANGE ? -TDC_RANGE : phase_diff;

            // Lock Detection Countdown
            // Requires `FLOCK_CYCLES` *consecutive* cycles of low error 
            // FIXME: this locks *once* and never again, for now.
            if (lock_state == FREQ_LOCKED) begin 
                if (tdc_out < 2 && tdc_out > -2) begin
                    if (phase_lock_count > 0) phase_lock_count = phase_lock_count - 1;
                    else lock_state = PHASE_LOCKED;
                end else begin // phase_lock_count > 1
                    phase_lock_count = FLOCK_CYCLES;
                end 
            end 
        end
        new_fb = 1'b0;
    end

    // Loop Filter
    assign phase_err = (lock_state == FREQ_LOCKED || lock_state == PHASE_LOCKED) ? tdc_out : 0; // TDC Loop
    assign accum_phase = phase_err + accum_phase_m1 - brake_code_delta;
    assign dctrl_phase = (accum_phase * KI_PHASE + phase_err * KP_PHASE) / K_PHASE_DIV;
    assign phase_err_real = 1.0 * phase_err;

    // Loop Filter
    assign freq_err = (fmeas_ready && (lock_state == UNLOCKED || lock_state == BRAKE_RECOVERY)) ? freq_diff : 0; 
    assign accum_freq = freq_err + accum_freq_m1;
    assign dctrl_freq = (accum_freq * KI_FREQ + freq_err * KP_FREQ) / 1e3;
    assign freq_err_real = 1.0 * freq_err;

    // Sum here for now; eventually likely separate DCO paths
    assign dctrl = dctrl_phase + dctrl_freq;

    // DCO-TDC Edition
    //assign err = ready ? targ_phase - dco_phase : 0; // Note FB Loop inverts here

endmodule

