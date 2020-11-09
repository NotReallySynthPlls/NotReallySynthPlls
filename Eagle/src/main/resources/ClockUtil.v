// This file contains all of the synthesizable extra stuff that Chisel doesn't
// handle well

// Used to build a programmable clock divider, phase detector, etc
module ClockFlop (
    input clockIn,
    input d,
    output reg clockOut
);

    // We don't actually have a clock flop in TSMC16
    always @(posedge clockIn)
        clockOut <= d;

endmodule

module ClockSignalNor2 (
    input clockIn,
    input signalIn,
    output clockOut
);

`ifdef EAGLE_CLOCKING_RTL_ONLY
    assign clockOut = !(signalIn || clockIn);
`else
    // A1 is the faster pin
    CKNR2D8BWP16P90LVT CKNOR2 (.A1(clockIn), .A2(signalIn), .ZN(clockOut));
`endif

endmodule

module ClockInverter (
    input clockIn,
    output clockOut
);

`ifdef EAGLE_CLOCKING_RTL_ONLY
    assign clockOut = !clockIn;
`else
    CKND8BWP16P90LVT CKINV (.I(clockIn), .ZN(clockOut));
`endif

endmodule

module ClockGater (
    input enable,
    input clockIn,
    output clockGated
);

`ifdef EAGLE_CLOCKING_RTL_ONLY
    reg qd;

    assign clockGated = qd & clockIn;

    always @(*) begin
        if (!clockIn) begin
            qd <= enable;
        end
    end
`else
    CKLNQD10BWP16P90LVT CKGATE (.TE(1'b0), .E(enable), .CP(clockIn), .Q(clockGated));
`endif

endmodule

module ClockMux2 (
    input clocksIn_0,
    input clocksIn_1,
    input sel,
    output clockOut
);

    // XXX be careful with this! You can get really nasty short edges if you
    // don't switch carefully
`ifdef EAGLE_CLOCKING_RTL_ONLY
    assign clockOut = sel ? clocksIn_1 : clocksIn_0;
`else
    CKMUX2D2BWP16P90LVT CKMUX (.I0(clocksIn_0), .I1(clocksIn_1), .S(sel), .Z(clockOut));
`endif

endmodule


module ClockOr2 (
    input clocksIn_0,
    input clocksIn_1,
    output clockOut
);

`ifdef EAGLE_CLOCKING_RTL_ONLY
    assign clockOut = clocksIn_0 | clocksIn_1;
`else
    CKOR2D2BWP16P90LVT CKOR (.A1(clocksIn_0), .A2(clocksIn_1), .Z(clockOut));
`endif

endmodule

// Testbench-only stuff
`ifndef SYNTHESIS
`timescale 1ps/1ps
module PeriodMonitor #(
    parameter minperiodps = 1000,
    parameter maxperiodps = 1000    // Set to 0 to ignore
) (
    input clock,
    input enable
);

    time edgetime = 1;
    integer period;

    always @(posedge clock) begin
        period = $time - edgetime;
        edgetime = $time;
        if (period > 0) begin
            if (enable && (period < minperiodps)) begin
                $fatal("PeriodMonitor detected a small period of %d ps at time %0t", period, $time);
            end
            if (enable && (maxperiodps > 0) && (period > maxperiodps)) begin
                $fatal("PeriodMonitor detected a large period of %d ps at time %0t", period, $time);
            end
        end
    end

endmodule

module ClockGenerator #(
    parameter periodps = 1000
) (
    output reg clock
);

    initial begin
        clock = 1'b0;
        forever #(periodps / 2) clock = ~clock;
    end

endmodule

`endif
