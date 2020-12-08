
//! 
//! # Digitally Controlled Oscillator 
//! 
//! * Linear control model, with programmable-length array of control inputs
//! * Frequency Limiting
//! * Normally distributed frequency noise
//! * Over-sampled control updates help (although don't cure) high-frequency control changes
//! * Required reset/ initialization (no auto-initial oscillation), modeling the needs of longer ROs 
//! 
module dco #(
    parameter int  NCTRL = 4, //! Number of control codes
    parameter real KDCO [NCTRL] = {1e9, 1e8, 1e7, 1e6}, //! Gains in Hz/code
    parameter real F0   = 3e9, //! Center frequency in Hz
    parameter real FMIN = 1e8, //! Minimum frequency in Hz
    parameter real FMAX = 10e9, //! Maximum frequency in Hz
    parameter int  CTRL_OSR = 8, //! Control-code oversampling ratio. Equals number of sub-periods oscillation is broken into. 
    parameter real NOISE_RMS = 1e-12 //! Period Jitter Standard Deviation 
)(
    input  longint ctrl [NCTRL], //! Array of Control-Code Inputs
    input  logic resetn, //! Active-Low Reset/ Enable 
    output logic pclk  //! Output Clock 
);
    real freq, noise, period, delay, randn;
    int frac_state, next_state;
    int seed = $urandom; 

    always @(resetn or frac_state) begin // Main Oscillator Action 
        if (!resetn) begin // DCO Reset / Enable
            // Note this *is* a physical behavior for long ring oscillators, 
            // Which can get into a variety of fun oscillation modes if not initialized! 
            // This model *requires* the system restart/initialize it, 
            // Rather than including an initial block. 
            pclk = 1'b0; 
            frac_state = 0; 
            next_state = 0; 
            noise = 0;
        end else begin 
            if (frac_state == CTRL_OSR-1) begin 
                // Update noise once per period, just before the rising edge
                randn = $dist_normal(seed, 0, 1000) / 1e3;
                noise = NOISE_RMS * randn; 
                next_state = 0;
            end else begin 
                next_state = frac_state + 1; 
            end
            frac_state <= #(delay*1s) next_state; // Schedule our next update
            pclk = (frac_state < CTRL_OSR/2); // And set the output clock polarity 
        end
    end

    always_comb begin // Frequency Update Calculations
        freq = F0; 
        // Dctrl * Kdco Dot Product 
        foreach(ctrl[idx]) freq += ctrl[idx] * KDCO[idx];
        // Limiting
        if (freq < FMIN) freq = FMIN; 
        if (freq > FMAX) freq = FMAX; 
        // Invert to period, add noise and chop into sub-periods 
        period = 1 / freq + noise;
        delay = period / CTRL_OSR;
    end

    // Real-value control codes, largely for waveform dumping 
    // Sadly simple wave-formats won't take arrays of reals, e.g. `real ctrl_real [NCTRL]`. 
    // We explicitly break out four. If ya got more than four, gotta change this to observe them. 
    real ctrl0, ctrl1, ctrl2, ctrl3;
    always_comb begin 
        ctrl0 = 1.0 * ctrl[0];
        if (NCTRL > 1) ctrl1 = 1.0 * ctrl[1];
        else ctrl1 = 0.0;
        if (NCTRL > 2) ctrl2 = 1.0 * ctrl[2];
        else ctrl2 = 0.0;
        if (NCTRL > 3) ctrl3 = 1.0 * ctrl[3];
        else ctrl3 = 0.0;
    end

endmodule
