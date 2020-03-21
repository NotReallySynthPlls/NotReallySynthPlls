`timescale 1fs/1fs
`define NUM_STAGES 15

module pll (
    input  wire refclk,
    input  wire resetn,
    input  wire brake,
    output reg  pclk
);
    parameter N = 32;
    logic ready;
    real err_real, freq, period, stage_delay;
    int accum, accum_m1, targ_phase, err;
    int dco_int_count, dco_frac_state, dco_phase, dco_phase_m1, dco_phase_diff;

    // DCO
    always #(stage_delay*1e15) begin 
        if (!resetn) dco_frac_state = `NUM_STAGES; // "Half way" through cycle
        else if (dco_frac_state >= 2 * `NUM_STAGES - 1) dco_frac_state = 0;
        else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= `NUM_STAGES) pclk = 1'b0;
        else pclk = 1'b1;
    end 
    // More realistic DCO would include stuff like this,
    // and accompanying decode logic 
    // reg [14:0] dco_frac_state, dco_frac_state_samp, dco_frac_state_samp_m1;
    // initial dco_frac_state = 15'b010101010101010;
    // always @ (dco_frac_state) #STAGE_DELAY dco_frac_state <= {~dco_frac_state[13:0], ~dco_frac_state[14]};
    // assign pclk = dco_frac_state[0];

    // Integer DCO Cycle Count
    always @ (posedge pclk or negedge resetn) begin 
        if (!resetn) dco_int_count = 0;
        else dco_int_count = dco_int_count + 1;
    end 
    // Main Sampling-Time Action
    always @ (posedge refclk or negedge resetn) begin
        if (!resetn) begin 
            pclk = 1'b0; // DCO reset, as via a hard loop-break 
            dco_frac_state = `NUM_STAGES; 

            // Reset all our sampled signals
            dco_int_count = 0;
            dco_phase = 0;
            dco_phase_m1 = 0;
            dco_phase_diff = 0;
            targ_phase = 'd0;
            accum_m1 = 0;
            ready = 1'b0;
        end else begin
            // Sample DCO Phase
            dco_phase_m1 = dco_phase;  // Keep one past sample, in case we want frequency feedback 
            dco_phase = 2 * `NUM_STAGES * dco_int_count + dco_frac_state;
            
            if (ready) begin // Make FB Loop updates. Several require a cycle of initialization. 
                targ_phase = targ_phase + 2 * `NUM_STAGES * N;
                accum_m1 = accum;
                err = targ_phase - dco_phase; // Note FB Loop inverts here!

                // Frequency measurement 1-z**-1
                // dco_phase_diff = dco_phase - dco_phase_m1; 
                // err = 2 * `NUM_STAGES * N - dco_phase_diff; // Note FB Loop inverts here!
            end else begin 
                targ_phase = dco_phase;
                ready = 1'b1;
            end
        end 
    end

    // Loop Filter
    assign accum = err + accum_m1;

    parameter KP = 400;
    parameter KI = 60;

    int di, dp, dctrl;
    assign dp = err * KP;
    assign di = accum * KI;
    assign dctrl = di + dp;

    // DCO Gain
    parameter real F0 = 3e9;
    parameter real KDCO = 10000.0; // Hz/code
    
    assign err_real = 1.0 * err;
    assign freq = F0 + dctrl * KDCO;
    assign period = 1 / freq;
    assign stage_delay = period / 2 / `NUM_STAGES;

endmodule

module tb ();
    logic refclk, pclk, resetn, brake;
    parameter REFCLK_PERIOD = 8*1000*1000;
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        brake = 1'b0;
        #(1.5*REFCLK_PERIOD);
        resetn = 1'b1;
    end
    
    initial begin  // Ref-Clock Generation
        // Sadly these delays (in fs) get too big for ints!
        // vcs has a sad tendency to replace them with zero. 
        refclk = 1'b0;
        for (int i=200; i>0; i--) begin
            #(REFCLK_PERIOD/2);
            refclk = !refclk;
        end
        $finish;
    end

    // DUT 
    pll i_pll(refclk, resetn, brake, pclk);

endmodule
