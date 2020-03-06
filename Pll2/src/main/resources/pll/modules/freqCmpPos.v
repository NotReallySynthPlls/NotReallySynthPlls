module freqCmpPos (
       input wire reset,
       input wire enable,
       input wire refClk,
       input wire divClk,
       output reg freqInc,
       output reg freqDec
);

reg refClkBy2, firstEdge, secondEdge;

always @(negedge reset or posedge refClk)
	if (!reset)
		refClkBy2 <= 1'b0;
	else
		refClkBy2 <= !refClkBy2;

always @(negedge divClk or posedge refClkBy2) begin
	if (refClkBy2) begin
		firstEdge <= 1'b0;
		secondEdge <= 1'b0;
	end
	else if (!firstEdge)
		firstEdge <= 1'b1;
	else
		secondEdge <= 1'b1;
end

always @(negedge enable or posedge refClk) begin
	if (!enable) begin
		freqDec <= 1'b0;
		freqInc <= 1'b0;
	end else if (refClkBy2) begin
		freqDec <= 1'b0;
		freqInc <= 1'b0;
	end else case ({secondEdge,firstEdge})
		2'b00: begin freqDec <= 1'b0; freqInc <= 1'b1; end
		2'b11: begin freqDec <= 1'b1; freqInc <= 1'b0; end
		default: begin freqDec <= 1'b0; freqInc <= 1'b0; end
	endcase
end

endmodule
