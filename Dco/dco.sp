* Standard-Cell ROs
.inc '/home/ff/ee241/spring20-labs/asap7PDK_r1p5/models/hspice/7nm_TT.pm'
.inc '/home/ff/ee241/spring20-labs/asap7libs_24/cdl/lvs/asap7_75t_R.cdl'
.inc '/home/ff/ee241/spring20-labs/asap7libs_24/cdl/lvs/asap7_75t_SL.cdl'

.subckt stg i o ctrl vdd vss 
**xi ctrl i vdd vss o  NAND2x1_ASAP7_75t_SL 
**xi i ctrl ctrl vdd vss o  AOI21xp5_ASAP7_75t_SL 
**xi ctrl i ctrl ctrl vdd vss o  AOI22x1_ASAP7_75t_SL 
xi ctrl i vdd vss o  NOR2x1_ASAP7_75t_R 
.ends

.subckt stg3x i o ctrl vdd vss
xi0  i  n1 ctrl vdd vss stg
xi1  n1 n2 ctrl vdd vss stg
xi2  n2 o  ctrl vdd vss stg
.ends

xd0 t0 t1 ctrl vdd vss stg3x
xd1 t1 t2 ctrl vdd vss stg3x
xd2 t2 t3 ctrl vdd vss stg3x
xd3 t3 t4 ctrl vdd vss stg3x
xd4 t4 t0 ctrl vdd vss stg3x

* Bias
**xb ctrl vss vdd vss ctrl  NOR2x1_ASAP7_75t_R 
**ictrl ctrl vss dc='ctrl'
vctrl ctrl vss dc='ctrl'
vvss vss 0 dc=0
vvdd vdd vss dc='vdd'

.param vdd=700m nfinn=100 nfinp=100 ctrl=0
.ic t0 0
.op
.tran 1p 100n
+ sweep ctrl 0 700m 100m 

.MEASURE TRAN tperiod 
+ TRIG V(t0) VAL='vdd/2' RISE=3 
+ TARG V(t0) VAL='vdd/2' RISE=13

.option autostop post=2 measdgt=10

.end


