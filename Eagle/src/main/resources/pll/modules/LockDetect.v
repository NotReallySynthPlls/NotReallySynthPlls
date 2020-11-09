module lock_detect #(
    parameter NUM_INC_COUNTER_BITS = 4,
    parameter NUM_CLK_COUNTER_BITS = 4
)(
    input wire clock,
    input wire reset,
    input wire [2:0] lockThreshold,
    input wire freqUp,
    input wire freqDn,
    input wire ldDivideEnable,
    output reg locked
);
   
reg prevLocked;
reg [NUM_INC_COUNTER_BITS-1:0] inc_counter;
reg [NUM_INC_COUNTER_BITS-1:0] dec_counter;
reg [NUM_CLK_COUNTER_BITS-1:0] clk_counter;

wire overflow, underflow;
wire clkReset;

assign clkReset = (&clk_counter)|(!ldDivideEnable);
assign overflow = &inc_counter;
assign underflow = &dec_counter;

always @(*) begin
    if(!reset) begin
        clk_counter <= 0;
        dec_counter <= 0;
        inc_counter <= 0;
        //overflow <= 0;
        //underflow <=0;
        locked <= 1'b0;
        prevLocked <= 1'b0;
    end
    if (overflow || underflow) begin
        locked <= 1'b0;
        prevLocked <= 1'b0;
    end
end

always @(posedge clock) begin
    if (!clkReset && ldDivideEnable) begin
        clk_counter <= clk_counter + 1;
    end
    //else if(!ldDivideEnable)  begin
        //clk_counter <= {NUM_CLK_COUNTER_BITS{1'b1}};
    //end
    if (freqUp && !(&inc_counter)) begin
        inc_counter <= inc_counter + 1;
    end

    if (freqDn && !(&dec_counter)) begin
        dec_counter <= dec_counter + 1;
    end

    //inc_counter <= (|inc_counter && !freqUp) ? inc_counter - 1 : inc_counter;
    //dec_counter <= (|dec_counter && !freqDn) ? dec_counter - 1 : dec_counter
    if (clkReset) begin
        clk_counter <= 0;
        if (inc_counter > dec_counter) begin
            locked <= (prevLocked && !((inc_counter - dec_counter) > lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((inc_counter - dec_counter) > lockThreshold) ? 1'b0 : 1'b1;
        end else if (dec_counter > inc_counter) begin
            locked <= (prevLocked && !((dec_counter - inc_counter) > lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((dec_counter - inc_counter) > lockThreshold) ? 1'b0 : 1'b1;
        end

        if (|inc_counter) begin
            inc_counter <= inc_counter - 1;
        end

        if (|dec_counter) begin
            dec_counter <= dec_counter - 1;
        end
        inc_counter <= 0;
        dec_counter <= 0;
        //overflow <= 1'b0;
        //underflow <= 1'b0;
    end
end
endmodule 
