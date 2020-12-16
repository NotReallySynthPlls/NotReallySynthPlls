
//! Canary PLL Testbench
module tb ();
    parameter refclk_period = 8ns;
    parameter divn = 30;
    
    logic refclk, pclk, resetn, brake;
    logic edge_meas_enable, locked;
    lock_state_t lock_state;
    assign locked = (lock_state == PHASE_LOCKED);
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        brake = 1'b0;
        edge_meas_enable = 1'b0;

        // De-assert reset
        resetn = #(101.5*refclk_period) 1'b1;
        
        // Wait for lock, or time-out
        fork begin // This trick courtesy the "SystemVerilog Gotchas" book. 
            fork   // Create a race for the first one of these to complete. 
                @(locked);
                #10us $fatal("********* FATAL ERROR: PLL Failed To Lock *********");
            join_any
            disable fork;
        end join 

        // Give a bit more time before measuring edges 
        edge_meas_enable = #10ns 1'b1;

        // Apply supply-droop brakes
        // brake = 1'b1;
        // brake = #1ns 1'b0;

        #10us $finish;
    end
    
    initial begin  // Ref-Clock Generation
        refclk = 1'b0;
        forever refclk = #(refclk_period/2) ~refclk;
    end

    // Clock Edge Measurement 
    edges #(.filename("pclk.yml")) i_edges (
        .clock(pclk),
        .enable(edge_meas_enable)
    );
    // DUT 
    pll i_pll(
        .refclk(refclk), 
        .resetn(resetn), 
        .brake(brake), 
        .divn(divn), 
        .lock_state(lock_state), 
        .pclk(pclk)
    );

endmodule // tb

