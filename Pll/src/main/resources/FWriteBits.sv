module FWriteBits #(
    parameter PATH = ".",
    parameter FNAME = "out.txt",
    parameter WIDTH = 1
)(
    input clk,
    input en,
    input [WIDTH-1:0] data
);

integer f;
string fname;

//initial
initial begin
    $sformat(fname, "%s/%s", PATH, FNAME);
    f = $fopen(fname, "w");
end

always @(posedge clk) begin
    if (en) $fwrite(f, "%b\n", data);
end//always

endmodule