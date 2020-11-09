// Write edge times of `clock` to file `filename`
module edges #(
        parameter string filename = "edges.yml"
)(
        input wire clock,
        input wire enable
);

`timescale 1fs/1fs
int fileh;

initial begin 
$printtimescale(edges);
fileh = $fopen(filename, "w");
  $fdisplay(fileh, "timescale: 1e-15");
  $fdisplay(fileh, "edges:");
end 

always @(posedge clock) begin
  $fdisplay(fileh, "- %f", $realtime);
end 

final begin 
$fclose(fileh);
end

endmodule 
