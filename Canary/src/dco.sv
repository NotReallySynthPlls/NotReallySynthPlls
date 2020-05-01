`timescale 1fs/1fs


module dco (
    input  int dctrl_coarse,
    input  int dctrl_fine,
    input  logic refclk,
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    parameter real F0   = 3e9;
    parameter real FMIN = 2e9;
    parameter real FMAX = 6e9;
    parameter real KCOARSE = `KDCO_COARSE; // Hz/code
    parameter real KFINE = `KDCO_FINE; // Hz/code
    real freq, freq_calc, period, stage_delay;
    int dco_frac_state;

    // DCO
    always #(stage_delay*1e15) begin 
        if (!resetn) dco_frac_state = 0; 
        else if (dco_frac_state >= 2 * `NUM_STAGES - 1) dco_frac_state = 0;
        else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= `NUM_STAGES) pclk = 1'b0;
        else pclk = 1'b1;
    end 

    always @ (resetn) begin
        if (!resetn) begin 
            pclk = 1'b1; // DCO reset, as via a hard loop-break 
            dco_frac_state = 0; 
        end
    end
    
    assign freq_calc = F0 + dctrl_coarse * KCOARSE + dctrl_fine * KFINE;
    assign freq = (freq_calc < FMIN ? FMIN : (freq_calc > FMAX ? FMAX : freq_calc) ); // Limiting
    assign period = 1 / freq;
    assign stage_delay = period / 2 / `NUM_STAGES;

    // Hold-over from phase-sampling edition
    assign dco_phase = 0;

endmodule

