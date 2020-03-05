module FWriteReal #(
    parameter PATH = ".",
    parameter FNAME = "out.txt"
)(
    input clk,
    input en,
    input real data
);

integer f;
string fname;

//initial
initial begin
    $sformat(fname, "%s/%s", PATH, FNAME);
    f = $fopen(fname, "w");
end

always @(posedge clk) begin
    if (en) $fwrite(f, "%10.10g\n", data);
end//always

endmodule