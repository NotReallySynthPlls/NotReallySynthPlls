module satDownCntr #(
       parameter NUM_CNTR_BITS = 5
)(
       input wire clock,
       input wire load,
       input wire [NUM_CNTR_BITS-1:0] cntrInput,
       output wire zeroed
);

reg [NUM_CNTR_BITS-1:0] cntrState;
reg loaded;

assign zeroed = !cntrState;

initial begin
    cntrState = 1'b0;
end

always @(posedge clock) begin
     if (load && !loaded) begin
         cntrState <= cntrInput;
         loaded <= 1'b1;
     end else begin
         if (!load)
              loaded <= 1'b0;
         if (cntrState)
             cntrState <= cntrState - 1'b1;
     end
end

endmodule
