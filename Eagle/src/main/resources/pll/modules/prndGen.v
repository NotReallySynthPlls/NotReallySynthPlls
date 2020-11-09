module prndGen #(
        parameter NUM_LFSR_BITS = 16,
        parameter NUM_PRND_BITS = 5,
        parameter NUM_PRND_MODULO_BITS = 8
)(
        input wire reset,
        input wire clock,
        input wire enable,
        input wire [NUM_PRND_BITS:0] prndRange,
//      output wire [NUM_PRND_BITS-1:0] prndNum
        output reg [NUM_PRND_BITS-1:0] prndNum
);

wire [NUM_PRND_MODULO_BITS-1:0] pseudoRandomNumber;
//assign prndNum = prndRange[NUM_PRND_BITS-1:0] ? pseudoRandomNumber % prndRange[NUM_PRND_BITS-1:0] : pseudoRandomNumber[NUM_PRND_BITS-1:0];
always @(posedge clock)
         prndNum <= prndRange[NUM_PRND_BITS-1:0] ? pseudoRandomNumber % prndRange[NUM_PRND_BITS-1:0] : pseudoRandomNumber[NUM_PRND_BITS-1:0];

/// Modular LFSR as PseudoRandom Generator ///
LFSRmodular #(
    .NUM_LFSR_BITS (NUM_LFSR_BITS       ),
    .NUM_PRND_BITS (NUM_PRND_MODULO_BITS)
) prndGenerator (
    .reset         (reset               ),
    .clock         (clock               ),
    .enable        (enable              ),
    .prndNum       (pseudoRandomNumber  )
);

endmodule
