// DCO Gate-Level Netlist
module dco (
       input wire reset,
       input wire enable,
       input wire refclk,
       input wire [63:0] ctrl,
       output reg [2:0] ck,
       output reg [2:0] ph
);

// DCO Stages 
// With 64b control, but only 1b hooked up
///NAND3xp33_ASAP7_75t_R stg0f (.A (ck[0]), .B (enable), .C(1'b1),     .Y (ck[1]));
///NAND3xp33_ASAP7_75t_R stg0c (.A (ck[0]), .B (enable), .C(ctrl[0]), .Y (ck[1]));
///NAND3xp33_ASAP7_75t_R stg1f (.A (ck[1]), .B (enable), .C(1'b1),     .Y (ck[2]));
///NAND3xp33_ASAP7_75t_R stg1c (.A (ck[1]), .B (enable), .C(ctrl[0]), .Y (ck[2]));
///NAND3xp33_ASAP7_75t_R stg2f (.A (ck[2]), .B (enable), .C(1'b1),     .Y (ck[0]));
///NAND3xp33_ASAP7_75t_R stg2c (.A (ck[2]), .B (enable), .C(ctrl[0]), .Y (ck[0]));

//NAND3xp33_ASAP7_75t_R stg1[63:0] (
  //.A (ck[1]), .B (enable), .C(ctrl[63:0]), .Y (ck[2])
//);
//NAND3xp33_ASAP7_75t_R stg2[63:0] (
  //.A (ck[2]), .B (enable), .C(ctrl[63:0]), .Y (ck[0])
//);
 // 
//ASYNC_DFFHx1_ASAP7_75t_SL fsamp[2:0] (
  //.RESET (reset), .SET(logic_0_1_net), 
  //.CLK (refclk), .D (ck[2:0]), .QN(ph[2:0])
//);
  
// This fake-out flip-flop is here (for now) 
// to keep PnR from complaining that it cant find any timing paths. 
///ASYNC_DFFHx1_ASAP7_75t_SL fs (
  ///.RESET (reset), .SET(logic_0_1_net), 
  ///.CLK (refclk), .D (logic_0_1_net), .QN(ph[0])
///);
///TIELOx1_ASAP7_75t_SL tie_0_cell(.L (logic_0_1_net));

endmodule

