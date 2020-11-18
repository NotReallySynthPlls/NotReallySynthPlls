`timescale 1fs/1fs

//! Canary PLL Testbench
module tb ();
    logic refclk, pclk, resetn, brake;
    logic edge_meas_enable;
    parameter refclk_period = 8ns;
    parameter divn = 32;
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        brake = 1'b0;
        edge_meas_enable = 1'b0;

        // De-assert reset
        resetn = #(101.5*refclk_period) 1'b1;
        // Give some time to lock before measuring edges 
        edge_meas_enable = #10us 1'b1;

        // Apply supply-droop brakes
        // brake = 1'b1;
        // brake = #1ns 1'b0;

        #50us $finish;
    end
    
    initial begin  // Ref-Clock Generation
        refclk = 1'b0;
        forever begin
            refclk = #(refclk_period/2) ~refclk;
        end
    end

    // Clock Edge Measurement 
    edges #(.filename("pclk.yml")) i_edges (
        .clock(pclk),
        .enable(edge_meas_enable)
    );
    // DUT 
    pll i_pll(refclk, resetn, brake, divn, pclk);

endmodule // tb

