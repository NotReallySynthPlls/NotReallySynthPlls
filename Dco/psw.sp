* Standard-Cell ROs
.inc '/home/ff/ee241/spring20-labs/asap7PDK_r1p5/models/hspice/7nm_TT.pm'
.inc '/home/ff/ee241/spring20-labs/asap7libs_24/cdl/lvs/asap7_75t_R.cdl'
.inc '/home/ff/ee241/spring20-labs/asap7libs_24/cdl/lvs/asap7_75t_SL.cdl'

.subckt stg i o ctrl vdd vss 
xi i vdd vss o  INVx2_ASAP7_75t_R 
.ends

.subckt stg3x i o ctrl vdd vss
xi0  i  n1 ctrl vdd vss stg
xi1  n1 n2 ctrl vdd vss stg
xi2  n2 o  ctrl vdd vss stg
.ends

.subckt ring t0 ctrl vdd vss 
xd0 t0 t1 ctrl vdd vss stg3x
xd1 t1 t2 ctrl vdd vss stg3x
xd2 t2 t3 ctrl vdd vss stg3x
xd3 t3 t4 ctrl vdd vss stg3x
xd4 t4 t0 ctrl vdd vss stg3x
.ends

* DUT 
xring t0 ctrl vvdd vss ring 

.subckt psw vdd vvdd enb
mp vvdd enb vdd vdd pmos_rvt l=20n nfin=3
.ends

* Bias DAC
xsw_on vdd vvdd vss psw m=1
xsw0 vdd vvdd code_b[0] psw m=1
xsw1 vdd vvdd code_b[1] psw m=2
xsw2 vdd vvdd code_b[2] psw m=4
xsw3 vdd vvdd code_b[3] psw m=8
xsw4 vdd vvdd code_b[4] psw m=16
xsw5 vdd vvdd code_b[5] psw m=32
* xpu vss vss     vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=16
* xb      ctrl    vdd     vdd vss ctrl  NAND2x1_ASAP7_75t_SL m='mbias'
* xdac[0] code[0] vdd     vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=1
* xdac[1] code[1] vdd vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=2
* xdac[2] code[2] vdd vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=4
* xdac[3] code[3] vdd vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=8
* xdac[4] code[4] vdd vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=16
* xdac[5] code[5] vdd vdd vss ctrl  NAND2x1_ASAP7_75t_SL m=32
**ictrl ctrl vss dc='ctrl'
**vctrl ctrl vss dc='ctrl'



* Supplies 
vvss vss 0 dc=0
vvdd vdd vss dc='vdd'

.param code_val=1

* Code-Bus Generation
.param res5='code_val'
.param code5='res5 >= 32 ? 1 : 0'
.param res4='res5-32*code5'
.param code4='res4 >= 16 ? 1 : 0'
.param res3='res4-16*code4'
.param code3='res3 >= 8 ? 1 : 0'
.param res2='res3-8*code3'
.param code2='res2 >= 4 ? 1 : 0'
.param res1='res2-4*code2'
.param code1 = 'res1 >= 2 ? 1 : 0'
.param res0 = 'res1-2*code1'
.param code0 = 'res0 >= 1 ? 1 : 0'

vcode0 code[0] vss dc='vdd*code0'
vcode_b0 code_b[0] vss dc='vdd*(1-code0)'
vcode1 code[1] vss dc='vdd*code1'
vcode_b1 code_b[1] vss dc='vdd*(1-code1)'
vcode2 code[2] vss dc='vdd*code2'
vcode_b2 code_b[2] vss dc='vdd*(1-code2)'
vcode3 code[3] vss dc='vdd*code3'
vcode_b3 code_b[3] vss dc='vdd*(1-code3)'
vcode4 code[4] vss dc='vdd*code4'
vcode_b4 code_b[4] vss dc='vdd*(1-code4)'
vcode5 code[5] vss dc='vdd*code5'
vcode_b5 code_b[5] vss dc='vdd*(1-code5)'

.param vdd=700m nfinn=100 nfinp=100 ctrl=0 mbias=64
.ic t0 0

.op
.tran 1p 100n
+ sweep code_val 0 31 1

* .dc code_val 0 31 1
* + sweep mbias poi 6 1 4 8 16 32 64

.meas tran tperiod_10x  
+ TRIG V(t0) VAL='vdd/2' RISE=3 
+ TARG V(t0) VAL='vdd/2' RISE=13

.meas tran tperiod param='tperiod_10x/10'
.meas tran freq param='1/tperiod'

.option autostop post=2 measdgt=10

.end


