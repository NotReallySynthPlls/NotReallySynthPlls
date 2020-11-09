module shiftDCOctrl #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15
)(
       input wire reset,
       input wire override,
       input wire clock,
       input wire dec,
       input wire inc,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColSelOverride,
       input wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelOverride,
       output reg [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColumnSelect,
       output reg [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelect
);

always @(negedge reset or posedge clock) begin
     if (!reset) begin
         dcoColumnSelect <= {{NUM_DCO_MATRIX_COLUMNS-6{1'b1}},{5{1'b0}}};
         dcoRowSelect <= {{NUM_DCO_MATRIX_ROWS-1{1'b1}}};
     end else if (override) begin
         dcoColumnSelect <= dcoColSelOverride;
         dcoRowSelect <= dcoRowSelOverride;
     end else begin
         if (dec && !inc) begin
              if (!dcoColumnSelect[0])
                  dcoColumnSelect <= {1'b1,dcoColumnSelect[NUM_DCO_MATRIX_COLUMNS-2:1]};
              else if (!dcoRowSelect[0]) begin
                  dcoColumnSelect <= {NUM_DCO_MATRIX_COLUMNS-1{1'b0}};
                  dcoRowSelect <= {1'b1,dcoRowSelect[NUM_DCO_MATRIX_ROWS-2:1]};
              end
     end if (inc && !dec) begin
              if (dcoColumnSelect[NUM_DCO_MATRIX_COLUMNS-2])
                   dcoColumnSelect <= {dcoColumnSelect[NUM_DCO_MATRIX_COLUMNS-3:0],1'b0};
              else if (dcoRowSelect[NUM_DCO_MATRIX_ROWS-2]) begin
                   dcoColumnSelect <= {NUM_DCO_MATRIX_COLUMNS-1{1'b1}};
                   dcoRowSelect <= {dcoRowSelect[NUM_DCO_MATRIX_ROWS-3:0],1'b0};
              end
         end
     end
end

endmodule
