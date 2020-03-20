`timescale 1ps/1ps


module pll (
    input wire refclk,
    output reg pclk
);
    // Ring-State DCO
    parameter STAGE_DELAY = 10;
    // Numerical (30-state) DCO
    reg [31:0] dco_state, dco_samp, dco_samp_m1;
    initial begin 
        pclk = 'b0;
        dco_state = 'd0;
    end
    always #STAGE_DELAY begin 
        if (dco_state >= 'd29) dco_state = 'd0;
        else dco_state = dco_state + 1;
        
        if (dco_state >= 'd15) pclk = 'b1;
        else pclk = 'b0;
    end 
    // More realistic DCO would include stuff like this,
    // and accompanying decode logic 
    // reg [14:0] dco_state, dco_samp, dco_samp_m1;
    // initial dco_state = 15'b010101010101010;
    // always @ (dco_state) #STAGE_DELAY dco_state <= {~dco_state[13:0], ~dco_state[14]};
    // // Primary Output
    // assign pclk = dco_state[0];

    // Phase Sampling 
    reg [31:0] fcount, fcount_samp;
    initial fcount = 0;
    always @ (pclk) fcount = fcount + 1;
    always @ (refclk) begin
        dco_samp_m1 = dco_samp;
        dco_samp = dco_state;
        fcount_samp = fcount;
    end

    // Reference-Phase Generation





endmodule

module tb ();

    reg refclk;
    parameter REFCLK_PERIOD = 100*1000; // 100ns

    initial begin
        $dumpfile("test.vcd");
        $dumpvars;

        #(10*REFCLK_PERIOD);
        $finish;
    end

    // Ref Clock Gen
    initial #(REFCLK_PERIOD/2) refclk = 1'b0;
    always  #(REFCLK_PERIOD/2) refclk = !refclk;

    // DUT 
    wire pclk;
    pll i_pll(refclk, pclk);

endmodule
