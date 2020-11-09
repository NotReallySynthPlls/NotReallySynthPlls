module dlf #(
       parameter NUM_FRACTIONAL_BITS = 7,
       parameter NUM_DITHERING_BITS = 5
)(
       input wire reset,
       input wire enable,
       input wire clock,
       input wire updn,
       input wire [NUM_FRACTIONAL_BITS-1:0] ki,
       input wire [NUM_FRACTIONAL_BITS-1:0] kp,
       output wire overflow,
       output wire underflow,
       output wire [NUM_DITHERING_BITS-1:0] ditherWidth
);

wire carry;
reg updnPrevious;
wire [1:0] selectConst;
wire [NUM_FRACTIONAL_BITS-1:0] signedSum;
reg [NUM_FRACTIONAL_BITS-1:0] accumulator, PIconstant;

assign selectConst = {updn,updnPrevious};
assign {carry,signedSum} = PIconstant + accumulator;
assign overflow = !PIconstant[NUM_FRACTIONAL_BITS-1] &&  carry;
assign underflow = PIconstant[NUM_FRACTIONAL_BITS-1] && !carry;
//assign ditherWidth = accumulator[NUM_FRACTIONAL_BITS-1:NUM_FRACTIONAL_BITS-NUM_DITHERING_BITS];
assign ditherWidth = signedSum[NUM_FRACTIONAL_BITS-1:NUM_FRACTIONAL_BITS-NUM_DITHERING_BITS];

always @ (selectConst)
    case (selectConst)
          2'b00 : PIconstant =   ki;
          2'b01 : PIconstant =   ki + kp;
          2'b10 : PIconstant = - ki - kp;
          2'b11 : PIconstant = - ki;
    endcase

always @(negedge reset or posedge clock)
     if (!reset) begin
         updnPrevious <= 1'b0;
         accumulator <= {NUM_FRACTIONAL_BITS{1'b0}};
     end else if (enable) begin
         updnPrevious <= updn;
         accumulator <= signedSum[NUM_FRACTIONAL_BITS-1:0];
     end

endmodule
