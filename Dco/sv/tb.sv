
`timescale 1fs/1fs

//! DCO Open-Loop Testbench
module tb ();
    logic pclk, resetn;
    logic edge_meas_enable;
    longint dctrl [3];
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        edge_meas_enable = 1'b0;
        dctrl = {0, 0, 0};

        // De-assert reset
        resetn = #100ns 1'b1;
        // Give some time to lock before measuring edges 
        edge_meas_enable = #100ns 1'b1;

        #15us $finish;
    end
    
    // Clock Edge Measurement 
    edges #(.filename("pclk.yml")) i_edges (
        .clock(pclk),
        .enable(edge_meas_enable)
    );

    // DUT 
    dco #(
        .NCTRL(3),
        .KDCO({1e9, 1e9, 1e9}),
        .F0(1e9),
        .NOISE_RMS(25e-12)
    ) i_dco (
        .ctrl(dctrl),
        .resetn(resetn),
        .pclk(pclk)
    );

endmodule // tb
