module LFSRstandard #(
       parameter NUM_LFSR_BITS = 16,
       parameter NUM_PRND_BITS = 5
)(
       input wire clock,
       input wire reset,
       input wire enable,
       output wire [NUM_PRND_BITS-1:0] rnd
);

reg [NUM_LFSR_BITS-1:0] lfsr;
wire inputlfsr;

assign rnd = lfsr[NUM_PRND_BITS-1:0];

xnor(inputlfsr,lfsr[15],lfsr[14],lfsr[12],lfsr[3]);

always @(negedge reset or posedge clock) begin
    if (!reset)
        lfsr <= {NUM_LFSR_BITS{1'b0}};
    else if (enable)
        lfsr <= {lfsr[NUM_LFSR_BITS-2:0],inputlfsr};
end

endmodule
