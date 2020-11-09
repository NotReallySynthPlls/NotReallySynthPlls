module divcomb #(
       parameter NUM_DIVIDEND_BITS = 8,
       parameter NUM_DIVISOR_BITS = 5
)(
       input wire [NUM_DIVIDEND_BITS-1:0] dividend,
       input wire [NUM_DIVISOR_BITS-1:0] divisor,
       output wire [NUM_DIVISOR_BITS-1:0] modulus
);

assign modulus = dividend % divisor;

endmodule
