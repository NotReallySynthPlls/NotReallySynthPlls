module lock_detect_v2 #(
    parameter NUM_INC_COUNTER_BITS = 4,
    parameter NUM_CLK_COUNTER_BITS = 4
)(
    input wire clock,
    input wire reset,
    input wire [8:0] lockThreshold,
    input wire freqUp,
    input wire freqDn,
    input wire ldDivideEnable,
    output reg locked
);
   
reg prevLocked;
//reg [NUM_INC_COUNTER_BITS-1:0] inc_counter;
//reg [NUM_INC_COUNTER_BITS-1:0] dec_counter;
reg [NUM_INC_COUNTER_BITS-1:0] lock_counter;
reg [NUM_CLK_COUNTER_BITS-1:0] clk_counter;

wire overflow, underflow;
wire clkReset;
wire [NUM_INC_COUNTER_BITS-1:0]  half_count;
assign half_count = {{1'b1},{NUM_INC_COUNTER_BITS-1{1'b0}}}; 

assign clkReset = (&clk_counter)|(!ldDivideEnable);
//assign overflow = &inc_counter;
assign overflow = &lock_counter;
//assign underflow = &dec_counter;
assign underflow = ~|lock_counter;

always @(*) begin
    if(!reset) begin
        clk_counter <= 0;
        //dec_counter <= 0;
        //inc_counter <= 0;
        lock_counter <= half_count; // Reset counter to halfway
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
    //if (freqUp && !(&inc_counter)) begin
        //inc_counter <= inc_counter + 1;
    //end

    //if (freqDn && !(&dec_counter)) begin
        //dec_counter <= dec_counter + 1;
    //end

    if (!(freqUp && freqDn)) begin
      if (freqUp && !overflow) begin
          lock_counter <= lock_counter + 1;
      end
      if (freqDn && !underflow) begin
          lock_counter <= lock_counter - 1;
      end
    end
    //inc_counter <= (|inc_counter && !freqUp) ? inc_counter - 1 : inc_counter;
    //dec_counter <= (|dec_counter && !freqDn) ? dec_counter - 1 : dec_counter
    if (clkReset) begin
        clk_counter <= 0;
        if (lock_counter >= half_count) begin
            locked <= (prevLocked && !((lock_counter - half_count) > lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((lock_counter - half_count) > lockThreshold) ? 1'b0 : 1'b1;
        end else if (half_count > lock_counter) begin
            locked <= (prevLocked && !((half_count - lock_counter) < lockThreshold)) ? 1'b1 : 1'b0;
            prevLocked <= ((half_count - lock_counter) > lockThreshold) ? 1'b0 : 1'b1;
        end
        lock_counter <= half_count; // Reset counter to halfway

        //if (|inc_counter) begin
            //inc_counter <= inc_counter - 1;
        //end

        //if (|dec_counter) begin
            //dec_counter <= dec_counter - 1;
        //end
        //inc_counter <= 0;
        //dec_counter <= 0;
        //overflow <= 1'b0;
        //underflow <= 1'b0;
    end
end
endmodule 
