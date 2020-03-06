module lock_detect #(
    parameter NUM_CTRL_COUNTER_BITS = 4,
    parameter NUM_CLK_COUNTER_BITS = 4
)(
    input wire clock,
    input wire reset,
    input wire [2:0] lockThreshold,
    input wire freqUp,
    input wire freqDn,
    output reg locked
);
   
reg prevLocked;
reg [NUM_CTRL_COUNTER_BITS-1:0] inc_counter;
reg [NUM_CTRL_COUNTER_BITS-1:0] dec_counter;
reg [NUM_CLK_COUNTER_BITS-1:0] clk_counter;

wire lock_decision;

assign lock_decision = &clk_counter;

// The PLL determines if it is locked by counting how often freqUp and freqDn change during
// clock windows of 2^NUM_CLK_COUNTER_BITS.  The absolute value of the difference
// is compared to lockThreshold for each window.  If two consecutive windows show minimal
// frequency code adjustments, the PLL is considered locked.

always @(posedge clock or negedge reset) begin
    // Count frequency up and down events:
    if (!reset) begin
        clk_counter <= 0;
        inc_counter <= 0;
        dec_counter <= 0;
    end else if (lock_decision) begin
        clk_counter <= 0;
        inc_counter <= 0;
        dec_counter <= 0;
    end else begin
        clk_counter <= clk_counter + 1;
        if (freqUp && !(&inc_counter)) begin
           inc_counter <= inc_counter + 1;
	end
        if (freqDn && !(&dec_counter)) begin
           dec_counter <= dec_counter + 1;
	end
    end
end // always @ (posedge clock or negedge reset)

always @(posedge clock or negedge reset) begin
    if (!reset) begin
        locked <= 1'b0;
        prevLocked <= 1'b0;
    end else if (lock_decision) begin
        // Calculate Abs(inc_counter-dec_counter) <= lockThreshold;
        // If true during two windows, PLL is locked.
        if (inc_counter > dec_counter) begin
            locked <= (prevLocked && ((inc_counter - dec_counter) <= lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((inc_counter - dec_counter) <= lockThreshold) ? 1'b1 : 1'b0;
        end else begin
            locked <= (prevLocked && ((dec_counter - inc_counter) <= lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((dec_counter - inc_counter) <= lockThreshold) ? 1'b1 : 1'b0;
        end
    end
end // always @ (posedge clock or negedge reset)

endmodule 
