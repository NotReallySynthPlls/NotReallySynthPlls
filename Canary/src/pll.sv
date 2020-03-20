`timescale 1fs/1fs


module pll (
    input wire refclk,
    output reg pclk
);
    // From bottom, DCO gain
    real err_real, freq, period, stage_delay;

    reg [31:0] accum_m1;
    wire [31:0] accum;

    // Ring-State DCO
    parameter STAGE_DELAY = 10*1000;
    // Numerical (30-state) DCO
    int dco_frac_state, dco_frac_state_samp, dco_frac_state_samp_m1;

    always #(stage_delay*1e15) begin // #STAGE_DELAY begin // 
        if (dco_frac_state >= 'd29) dco_frac_state = 'd0;
        else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= 'd15) pclk = 'b0;
        else pclk = 'b1;
    end 
    // More realistic DCO would include stuff like this,
    // and accompanying decode logic 
    // reg [14:0] dco_frac_state, dco_frac_state_samp, dco_frac_state_samp_m1;

    // initial dco_frac_state = 15'b010101010101010;
    // always @ (dco_frac_state) #STAGE_DELAY dco_frac_state <= {~dco_frac_state[13:0], ~dco_frac_state[14]};
    // // Primary Output
    // assign pclk = dco_frac_state[0];

    // Phase Sampling 
    int dco_int_count, dco_int_count_samp, dco_int_count_samp_m1;
    int dco_phase, dco_phase_m1, dco_phase_diff;
    // Reference-Phase Generation
    parameter N = 4;
    int targ_phase, err;
    initial begin 

        pclk = 'b0;
        dco_frac_state = 'd15;

        dco_int_count = 0;
        dco_phase = 0;
        dco_phase_m1 = 0;
        dco_phase_diff = 0;

        targ_phase = 'd0;

        accum_m1 = 0;

        
    end
    always @ (posedge pclk) dco_int_count = dco_int_count + 1;
    always @ (posedge refclk) begin
        accum_m1 <= accum;

        dco_frac_state_samp_m1 = dco_frac_state_samp;
        dco_frac_state_samp = dco_frac_state;

        dco_int_count_samp_m1 = dco_int_count_samp;
        dco_int_count_samp = dco_int_count;

        dco_phase_m1 = dco_phase;
        dco_phase = 30*dco_int_count + dco_frac_state;
        dco_phase_diff = dco_phase - dco_phase_m1; // FLL-ize

        targ_phase = targ_phase + 30*N;
        // err = targ_phase - dco_phase; // FB Loop inverts here!
        err = 30*N - dco_phase_diff; // FLL-ize
    end

    

    // Loop Filter
    assign accum = err + accum_m1;

    parameter KP = 500;
    parameter KI = 100;

    int di, dp, dctrl;
    assign dp = err * KP;
    assign di = accum * KI;
    assign dctrl = di + dp;

    // DCO Gain
    parameter real F0 = 4.1e9;
    parameter real KDCO = 10000.0; // Hz/code
    
    assign err_real = 1.0 * err;
    assign freq = F0 + dctrl * KDCO;
    assign period = 1 / freq;
    assign stage_delay = period / 30;

endmodule

module tb ();

    reg refclk;
    parameter REFCLK_PERIOD = 1000*1000;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars;

        // #(500*1000*1000);
        #(100000*REFCLK_PERIOD);
        $finish;
    end

    // Ref Clock Gen
    initial refclk = 1'b0;
    always  #(REFCLK_PERIOD/2) refclk = !refclk;

    // DUT 
    wire pclk;
    pll i_pll(refclk, pclk);

    // Divider 
    reg [31:0] div_count;
    reg divclk;
    initial divclk = 1'b0;
    initial div_count = 'd0;
    always @(posedge pclk) begin 
        if (div_count >= 2) begin 
            divclk = !divclk;
            div_count = 'd0;
        end else div_count = div_count + 1;
    end

endmodule

