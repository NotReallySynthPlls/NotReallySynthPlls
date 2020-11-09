module bpd (
       input wire clock,
       input wire vfb,
       output reg updn
);

always @(posedge clock)
         updn <= vfb;

endmodule
