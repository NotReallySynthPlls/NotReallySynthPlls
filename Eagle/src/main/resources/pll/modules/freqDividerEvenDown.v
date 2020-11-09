module frequencyDividerEvenDown #(
       parameter NUM_DIVISOR_BITS = 4
)(
       input wire in,
       input wire reset,
       input wire [NUM_DIVISOR_BITS-1:0] halfdivisor,
       output reg out
);

reg [NUM_DIVISOR_BITS-1:0] counter;

always @(negedge reset or posedge in)
     if (!reset) begin
          out <= 1'b0;
          counter <= {NUM_DIVISOR_BITS{1'b0}};
     end else
         if (!counter) begin
              out <= !out;
              counter <= halfdivisor;
         end else
              counter <= counter - 1'b1;

endmodule
