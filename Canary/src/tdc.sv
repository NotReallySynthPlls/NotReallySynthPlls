`timescale 1fs/1fs


module pd (
    input  logic refclk,
    input  logic fbclk,
    input  logic resetn,
    output int out
);
    // Phase Detector IO
    parameter int TDC_STEP = 1 * 1e3; // In fs, units of tick-timescale
    parameter int TDC_RANGE = 4000; // Single-sided range, in units of LSBs
    // FIXME: set TDC_RANGE = 1000, STEP=1e3 to show some failing

    int phase_targ, phase_meas, phase_diff;
    logic new_fb;

    always @(posedge fbclk) begin 
        phase_meas = $time;
        new_fb = 1'b1;
    end
    always @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            // FIXME: zero output maybe? Internal phase-state?
            out = 0; 
            // phase_lock_count = FLOCK_CYCLES;
        end else if (!new_fb) begin 
            out = TDC_RANGE; // Feedback late & outta range
        end else begin 
            phase_targ = $time - TDC_RANGE * TDC_STEP; // Offset
            phase_diff = (phase_meas - phase_targ) / TDC_STEP;
            out = phase_diff > TDC_RANGE ? TDC_RANGE : phase_diff < -TDC_RANGE ? -TDC_RANGE : phase_diff;
        end
        new_fb = 1'b0;
    end

endmodule

