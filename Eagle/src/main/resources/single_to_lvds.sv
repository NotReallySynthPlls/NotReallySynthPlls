`timescale 1ns/10fs

module single_to_lvds(
    input clock,
    output clockRef_p,
    output clockRef_n
);

    assign clockRef_p = clock;
    assign clockRef_n = ~clock;

endmodule
