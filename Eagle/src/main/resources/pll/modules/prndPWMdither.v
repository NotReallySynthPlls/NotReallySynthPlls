module prndPWMdither #(
       parameter NUM_PRND_BITS = 5
)(
       input wire enable,
       input wire clockFast,
       input wire clockSlow,
       input wire [NUM_PRND_BITS:0] divisor,
       input wire [NUM_PRND_BITS-1:0] prndNumber,
       input wire [NUM_PRND_BITS-1:0] width,
       output wire ditherBit
);

wire prndZero, sumdiffZero;
wire [NUM_PRND_BITS:0] difference, sum;
wire [NUM_PRND_BITS-1:0] cntrLoad, prndNumEnable;

assign sum = prndNumber + width;
assign difference = sum - divisor;
assign prndNumEnable = enable ? prndNumber : {NUM_PRND_BITS{1'b0}};
//assign cntrLoad = difference[NUM_PRND_BITS] ? sum[NUM_PRND_BITS-1:0] : difference[NUM_PRND_BITS-1:0];
assign cntrLoad = enable ? difference[NUM_PRND_BITS] ? sum[NUM_PRND_BITS-1:0] : difference[NUM_PRND_BITS-1:0] : {NUM_PRND_BITS{1'b0}};
//assign ditherBit = difference[NUM_PRND_BITS] ? prndZero ^ sumdiffZero : prndZero ~^ sumdiffZero; 
assign ditherBit = enable ? difference[NUM_PRND_BITS] ? prndZero ^ sumdiffZero : prndZero ~^ sumdiffZero : 1'b0;

/// Pseudorandom Down-Counter ///
satDownCntr #(
   .NUM_CNTR_BITS (NUM_PRND_BITS)
) prndDownCntr (
   .clock         (clockFast    ),
   .load          (clockSlow    ),
   .cntrInput     (prndNumEnable),
   .zeroed        (prndZero     )
);

/// SumDifference Down-Counter ///
satDownCntr #(
   .NUM_CNTR_BITS (NUM_PRND_BITS)
) sumdiffDownCntr (
   .clock         (clockFast    ),
   .load          (clockSlow    ),
   .cntrInput     (cntrLoad     ),
   .zeroed        (sumdiffZero  )
);

endmodule
