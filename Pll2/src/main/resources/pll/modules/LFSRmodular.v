module LFSRmodular #(
       parameter NUM_LFSR_BITS = 16,
       parameter NUM_PRND_BITS = 9
)(
       input wire reset,
       input wire clock,
       input wire enable,
       output wire [NUM_PRND_BITS-1:0] prndNum
);

reg [NUM_LFSR_BITS-1:0] lfsr;
//assign prndNum = lfsr[NUM_PRND_BITS-1:0]; // this line or the following
//assign prndNum = lfsr[NUM_LFSR_BITS-1:NUM_LFSR_BITS-NUM_PRND_BITS];
assign prndNum = {lfsr[15],lfsr[13],lfsr[11],lfsr[9],lfsr[8],lfsr[6],lfsr[4],lfsr[2],lfsr[0]};

always @(negedge reset or posedge clock) begin
     if (!reset)
         lfsr <= {NUM_LFSR_BITS{1'b0}};
     else if (enable) begin
         if (lfsr[0])
             lfsr <= {lfsr[0],lfsr[NUM_LFSR_BITS-1:1]};
         else
             lfsr <= {lfsr[0],lfsr[NUM_LFSR_BITS-1:1]} ~^ ~16'h4009;//16'h4009;//16'h5008;//16'h255A; // LFSR feedback
     end
end

endmodule
