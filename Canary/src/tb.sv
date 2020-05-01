`timescale 1fs/1fs


module tb ();
    logic refclk, pclk, resetn, brake;
    parameter REFCLK_PERIOD = `REFCLK_PERIOD;
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        brake = 1'b0;
        #(1.5*REFCLK_PERIOD);
        resetn = 1'b1;

        for (int i=10; i>0; i--) begin
            #(1000*1000*1000); // 1µs
        end
        brake = 1'b1;
    end
    
    initial begin  // Ref-Clock Generation
        // Sadly these delays (in fs) get too big for ints!
        // vcs has a sad tendency to replace them with zero. 
        refclk = 1'b0;
        for (int i=6400; i>0; i--) begin
            #(REFCLK_PERIOD/2);
            refclk = !refclk;
        end
        $finish;
    end

    // DUT 
    parameter N = 32;

    pll i_pll(refclk, resetn, brake, N, pclk);

endmodule
