//! 
//! # Digitally Controlled Oscillator 
//! 
//! * Linear control model, with programmable-length array of control inputs
//! * Normally distributed frequency noise
//! 
module dco #(
    parameter int nctrl = 4, //! Number of control codes
    parameter real kdco [nctrl] = {1e9, 1e8, 1e7, 1e6}, //! Gains in Hz/code
    parameter real F0   = 3e9,
    parameter real FMIN = 2e9,
    parameter real FMAX = 6e9
)(
    input  longint ctrl [nctrl],
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    real freq, freq_calc, freq_clean, noise, period, stage_delay;
    int dco_frac_state;
    int seed = $urandom;

    // DCO
    always #(stage_delay*1s) begin 
        if (!resetn) dco_frac_state = 0; 
        else if (dco_frac_state >= 2 * `NUM_STAGES - 1) begin 
            dco_frac_state = 0;
            noise = freq_clean/200 * $dist_normal(seed, 0, 1);
        end else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= `NUM_STAGES) pclk = 1'b0;
        else pclk = 1'b1;
    end 

    always @ (resetn) begin
        if (!resetn) begin 
            pclk = 1'b1; // DCO reset, as via a hard loop-break 
            dco_frac_state = 0; 
            noise = 0;
        end
    end

    always_comb begin // Frequency Update Calculations
        freq_calc = F0;
        foreach(ctrl[idx]) begin // Dctrl * Kdco Dot Product 
			freq_calc += ctrl[idx] * kdco[idx];
		end
        freq_clean = (freq_calc < FMIN ? FMIN : (freq_calc > FMAX ? FMAX : freq_calc) ); // Limiting
    end
    assign freq = freq_clean + noise;
    assign period = 1 / freq;
    assign stage_delay = period / 2 / `NUM_STAGES;

    // Real-value control codes, largely for waveform dumping 
    // Sadly simple wave-formats won't take things like `real ctrl_real [nctrl]`
    // We explicitly break out four. If ya got more than four, gotta change this to observe them. 
    real ctrl0, ctrl1, ctrl2, ctrl3;
    always_comb begin 
        ctrl0 = 1.0 * ctrl[0];
        if (nctrl > 1) ctrl1 = 1.0 * ctrl[1];
        else ctrl1 = 0.0;
        if (nctrl > 2) ctrl2 = 1.0 * ctrl[2];
        else ctrl2 = 0.0;
        if (nctrl > 3) ctrl3 = 1.0 * ctrl[3];
        else ctrl3 = 0.0;
    end

    // Hold-over from phase-sampling edition
    assign dco_phase = 0;

endmodule

