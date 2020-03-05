module ClockGen #(
    parameter periodps=1000
) (
    output clock
);

    reg value = 1'b1;
    always #(periodps/2) value = ~value;
    assign clock = value;

endmodule