`timescale 1fs/1fs


module dco_and_phase_sampling (
    input  int dctrl,
    input  logic refclk,
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    parameter real F0   = 3.99e9;
    parameter real FMIN = 3e9;
    parameter real FMAX = 5e9;
    parameter real KDCO = 5000.0; // Hz/code
    real freq, freq_calc, period, stage_delay;
    int dco_int_count, dco_frac_state;

    // DCO
    always #(stage_delay*1e15) begin 
        if (!resetn) dco_frac_state = 0; 
        else if (dco_frac_state >= 2 * `NUM_STAGES - 1) dco_frac_state = 0;
        else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= `NUM_STAGES) pclk = 1'b0;
        else pclk = 1'b1;
    end 
    // More realistic DCO would include stuff like this,
    // and accompanying decode logic 
    // reg [14:0] dco_frac_state, dco_frac_state_samp, dco_frac_state_samp_m1;
    // initial dco_frac_state = 15'b101011010101010; 
    // always @ (dco_frac_state) #STAGE_DELAY dco_frac_state <= {~dco_frac_state[13:0], ~dco_frac_state[14]};
    // assign pclk = dco_frac_state[0];

    // Integer DCO Cycle Count
    always @ (posedge pclk or negedge resetn) begin 
        if (!resetn) dco_int_count = 0;
        else dco_int_count = dco_int_count + 1;
    end 

    // Main Sampling-Time Action
    always @ (resetn or posedge refclk) begin
        if (!resetn) begin 
            pclk = 1'b1; // DCO reset, as via a hard loop-break 
            dco_frac_state = 0; 
            dco_int_count = 0;  // Reset all our sampled signals
            dco_phase = 0;

        end else begin  // Sample DCO Phase
            dco_phase <= 2 * `NUM_STAGES * dco_int_count + dco_frac_state;
        end 
    end
    
    assign freq_calc = F0 + dctrl * KDCO;
    assign freq = (freq_calc < FMIN ? FMIN : (freq_calc > FMAX ? FMAX : freq_calc) ); // Limiting
    assign period = 1 / freq;
    assign stage_delay = period / 2 / `NUM_STAGES;

endmodule

