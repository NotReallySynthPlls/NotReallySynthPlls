

module dco_and_phase_sampling_ctrl (
    input  int dctrl,
    input  logic refclk,
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    // Control-only phase-accumulator model 
    
    parameter real F0 = 4e9;
    parameter real KDCO = 5000.0; // Hz/code
    real freq, period;

    // Main Sampling-Time Action
    always @ (posedge refclk or negedge resetn) begin
        if (!resetn) begin // Reset all our sampled signals
            dco_phase = 0;
        end else begin  // Sample DCO Phase
            dco_phase <= dco_phase + 2 * `NUM_STAGES * `REFCLK_PERIOD * (F0 + KDCO * dctrl) / 1e15;
        end 
    end
    
    assign freq = F0 + dctrl * KDCO;
    assign period = 1 / freq;

    assign pclk = 1'b0;
    
endmodule

