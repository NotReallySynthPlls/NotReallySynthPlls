
//! Write edge times of `clock` to YAML-format file `filename`
module edges #(
  parameter string filename = "edges.yml"
)(
  input logic clock,
  input logic enable
);

// Local-scope `timescale`, as `$realtime` depends on it 
`timescale 1fs/1fs 
int fileh;

initial begin 
  fileh = $fopen(filename, "w");
  $fdisplay(fileh, "timescale: 1e-15");
  $fdisplay(fileh, "edges:");
end 

always @(posedge clock) begin
  if (enable) begin 
    $fdisplay(fileh, "- %f", $realtime);
  end
end 

final begin 
  $fclose(fileh);
end

endmodule 

