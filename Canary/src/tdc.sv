
//! Behavioral TDC 
module pd #(
    parameter int  BANG_BANG = 0,    // Boolean setting for bang-bang +/-1 outputs 
    parameter real TDC_STEP = 10e3,  // LSB Step, in local time-units (fs)
    parameter real TDC_RANGE = 64    // Single-sided range, in units of LSBs
)(
    input  logic refclk,
    input  logic fbclk,
    input  logic resetn,
    output int   out
);
    `timescale 1fs/1fs

    real phase_targ, phase_meas, phase_diff;
    logic new_fb;

    always @(posedge fbclk) begin // Feedback Sampling 
        phase_meas = $realtime;
        new_fb = 1'b1;
    end
    always @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            out = 0; 
        end else if (BANG_BANG != 0) begin // Bang-Bang Operation 
            out = fbclk ? -1 : 1;
        end else begin // Linear Operation 
            if (!new_fb) begin // Consecutive refclks.
                out = TDC_RANGE; // Feedback late & outta range.
            end else begin 
                phase_targ = $realtime - TDC_RANGE * TDC_STEP; // Offset
                phase_diff = (phase_meas - phase_targ) / TDC_STEP;
                out = phase_diff > TDC_RANGE ? TDC_RANGE : phase_diff < -TDC_RANGE ? -TDC_RANGE : phase_diff;
            end
        end
        new_fb = 1'b0;
    end

endmodule

