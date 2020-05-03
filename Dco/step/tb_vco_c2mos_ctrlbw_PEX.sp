// Generated for: spectre
// Generated on: May  3 15:18:13 2020
// Design library name: sdbx_wrahman
// Design cell name: tb_vco_c2mos_ctrlbw
// Design view name: config
simulator lang=spectre
global 0
parameters Tstep=3.2n nPhase=1 VDD=0.7 TSTOP=5n fCLK=1G ctrl=7 \
    ctrlcoarse=127 ctrl2=ctrl TDEL=1p + nPhase/(5G*20)
include "/home/ff/ee241/spring20-labs/asap7PDK_r1p5/models/hspice/7nm_TT.pm"

// Library name: custom_cell
// Cell name: c2mos
// View name: calibre
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
//veriloga ahdl pspice dspf
subckt c2mos A ENA VDD VSS Y
    MM4 (MM4_d MM4_g MM4_s MM4_b) nmos_rvt w=8.1e-08 l=2e-08 nfin=3
    MM5 (MM5_d MM5_g MM5_s MM5_b) nmos_rvt w=8.1e-08 l=2e-08 nfin=3
    MM2 (MM2_d MM2_g MM2_s MM2_b) nmos_rvt w=8.1e-08 l=2e-08 nfin=3
    MM1 (MM1_d MM1_g MM1_s MM1_b) pmos_rvt w=8.1e-08 l=2e-08 nfin=3
    MM3 (MM3_d MM3_g MM3_s MM3_b) pmos_rvt w=8.1e-08 l=2e-08 nfin=3
    MM0 (MM0_d MM0_g MM0_s MM0_b) pmos_rvt w=8.1e-08 l=2e-08 nfin=3
    cc_18 (c_27_p noxref_13) capacitor c=8.38679e-19
    cc_17 (c_27_p noxref_12) capacitor c=5.80984e-19
    cc_16 (c_22_n PD1) capacitor c=2.61933e-18
    cc_15 (c_17_n PD1) capacitor c=2.56483e-18
    cc_14 (c_9_p noxref_13) capacitor c=9.66888e-18
    cc_13 (c_9_p noxref_10) capacitor c=9.66888e-18
    cc_12 (c_12_p c_24_n) capacitor c=7.90956e-19
    cc_11 (c_11_p c_24_n) capacitor c=7.90956e-19
    cc_10 (c_9_p c_22_n) capacitor c=9.66888e-18
    cc_9 (c_9_p MM4_g) capacitor c=9.66888e-18
    cc_8 (c_1_p noxref_12) capacitor c=9.66888e-18
    cc_7 (c_1_p noxref_9) capacitor c=9.66888e-18
    cc_6 (c_1_p c_22_n) capacitor c=9.66888e-18
    cc_5 (c_2_p c_19_n) capacitor c=3.96387e-19
    cc_4 (c_4_p c_17_n) capacitor c=7.90956e-19
    cc_3 (c_2_p c_17_n) capacitor c=3.88223e-19
    cc_2 (c_2_p c_16_n) capacitor c=3.89108e-19
    cc_1 (c_1_p MM4_g) capacitor c=9.66888e-18
    ciPU1_0 (MM1_s _net0) capacitor c=3.25129e-18
    ciPD1_4 (PD1_4 _net0) capacitor c=2.39065e-18
    ciPD1_3 (MM4_s _net0) capacitor c=2.39065e-18
    ciPD1_2 (PD1 _net0) capacitor c=1.71272e-19
    ciY_6 (Y_4 _net0) capacitor c=2.39065e-18
    ciY_5 (Y_9 _net0) capacitor c=2.50875e-18
    ciY_4 (Y_11 _net0) capacitor c=8.43364e-20
    ciY_3 (Y_21 _net0) capacitor c=1.28578e-19
    ciY_2 (c_27_p _net0) capacitor c=1.45097e-20
    ciENAB_12 (c_22_n _net0) capacitor c=1.40544e-18
    ciENAB_11 (MM2_d _net0) capacitor c=2.39065e-18
    ciENAB_10 (ENAB_10 _net0) capacitor c=1.28086e-19
    ciENAB_9 (MM0_d _net0) capacitor c=2.39065e-18
    ciENAB_8 (ENAB_19 _net0) capacitor c=2.62172e-20
    ciENAB_7 (ENAB_25 _net0) capacitor c=9.07954e-20
    ciENAB_6 (c_24_n _net0) capacitor c=3.7716e-20
    ciENAB_5 (ENAB_35 _net0) capacitor c=2.90194e-20
    ciA_2 (MM5_g _net0) capacitor c=1.27502e-18
    ciA_1 (A_5 _net0) capacitor c=9.27236e-20
    ciA_0 (A _net0) capacitor c=3.48126e-20
    ciENA_14 (MM2_g _net0) capacitor c=1.27502e-18
    ciENA_13 (MM4_g _net0) capacitor c=1.27502e-18
    ciENA_12 (ENA_13 _net0) capacitor c=6.69615e-20
    ciENA_11 (c_16_n _net0) capacitor c=1.99569e-20
    ciENA_10 (ENA_21 _net0) capacitor c=5.92555e-20
    ciENA_9 (c_17_n _net0) capacitor c=3.7716e-20
    ciENA_8 (c_19_n _net0) capacitor c=1.8282e-20
    ciENA_7 (ENA_35 _net0) capacitor c=1.45097e-20
    ciVDD_10 (c_11_p _net0) capacitor c=2.69584e-18
    ciVDD_9 (MM3_s _net0) capacitor c=2.39065e-18
    ciVDD_8 (c_12_p _net0) capacitor c=2.94787e-19
    ciVDD_7 (VDD_38 _net0) capacitor c=3.7702e-20
    ciVDD_6 (c_9_p _net0) capacitor c=8.69657e-21
    ciVSS_13 (VSS_4 _net0) capacitor c=2.39065e-18
    ciVSS_12 (MM5_s _net0) capacitor c=2.39065e-18
    ciVSS_11 (c_2_p _net0) capacitor c=3.05186e-19
    ciVSS_10 (c_4_p _net0) capacitor c=2.94787e-19
    ciVSS_9 (VSS_38 _net0) capacitor c=3.87682e-20
    ciVSS_8 (c_1_p _net0) capacitor c=8.69657e-21
    c_41 (noxref_13 _net0) capacitor c=1.23539e-18
    c_38 (noxref_12 _net0) capacitor c=1.15696e-18
    c_35 (noxref_11 _net0) capacitor c=1.27502e-18
    c_34 (noxref_10 _net0) capacitor c=1.15106e-18
    c_32 (noxref_9 _net0) capacitor c=1.15696e-18
    rPU1_2 (MM3_d PU1) resistor r=0.01
    rPU1_1 (MM1_s PU1) resistor r=16.7901
    rPD1_7 (MM5_d PD1_4) resistor r=7.40741
    rPD1_6 (PD1_4 PD1) resistor r=14.8325
    rPD1_5 (MM4_s PD1) resistor r=7.40741
    rY_23 (MM4_d Y_4) resistor r=7.40741
    rY_22 (Y_4 Y_21) resistor r=27.1875
    rY_21 (MM1_d Y_9) resistor r=7.40741
    rY_20 (Y_9 Y_13) resistor r=6.07099
    rY_19 (Y_11 Y_17) resistor r=2.22222
    rY_18 (Y_11 Y_25) resistor r=0.62081
    rY_17 (Y_13 Y_16) resistor r=1.11111
    rY_16 (Y_16 Y_17) resistor r=1.11111
    rY_15 (Y_18 Y_20) resistor r=1.11111
    rY_14 (Y_18 Y_24) resistor r=0.62081
    rY_13 (Y_20 Y_21) resistor r=6.07099
    rY_12 (Y_24 c_27_p) resistor r=1.38889
    rY_11 (Y_25 Y_31) resistor r=1.66667
    rY_10 (Y Y_29) resistor r=3.88889
    rY_9 (Y Y_30) resistor r=1.23457
    rY_8 (c_27_p Y_29) resistor r=0.277778
    rY_7 (Y_30 Y_31) resistor r=2.65432
    rENAB_32 (c_22_n MM1_g) resistor r=259.152
    rENAB_31 (c_22_n ENAB_35) resistor r=6.07099
    rENAB_30 (MM2_d ENAB_10) resistor r=7.40741
    rENAB_29 (ENAB_10 ENAB_19) resistor r=6.07099
    rENAB_28 (MM0_d ENAB_15) resistor r=7.40741
    rENAB_27 (ENAB_15 ENAB_25) resistor r=27.1875
    rENAB_26 (ENAB_17 ENAB_24) resistor r=0.555556
    rENAB_25 (ENAB_17 ENAB_28) resistor r=0.62081
    rENAB_24 (ENAB_19 ENAB_26) resistor r=4.01235
    rENAB_23 (ENAB_24 ENAB_25) resistor r=6.07099
    rENAB_22 (ENAB_24 ENAB_26) resistor r=0.987654
    rENAB_21 (c_24_n ENAB_32) resistor r=1.69753
    rENAB_20 (c_24_n ENAB_33) resistor r=0.62081
    rENAB_19 (ENAB_28 ENAB_29) resistor r=1.66667
    rENAB_18 (ENAB_29 ENAB_30) resistor r=1.11111
    rENAB_17 (ENAB_30 ENAB_31) resistor r=2.68519
    rENAB_16 (ENAB_31 ENAB_32) resistor r=3.39506
    rENAB_15 (ENAB_33 ENAB) resistor r=1.54321
    rENAB_14 (ENAB_35 ENAB_39) resistor r=0.555556
    rENAB_13 (ENAB_39 ENAB) resistor r=0.679012
    rA_5 (MM5_g A_5) resistor r=259.152
    rA_4 (A_5 MM3_g) resistor r=259.152
    rA_3 (A_5 A) resistor r=6.07099
    rENA_33 (MM2_g ENA_5) resistor r=259.152
    rENA_32 (ENA_5 MM0_g) resistor r=259.152
    rENA_31 (ENA_5 ENA_21) resistor r=16.6976
    rENA_30 (MM4_g ENA_13) resistor r=259.152
    rENA_29 (ENA_13 ENA_33) resistor r=6.07099
    rENA_28 (ENA_15 c_16_n) resistor r=1.54321
    rENA_27 (ENA_15 c_19_n) resistor r=0.62081
    rENA_26 (ENA ENA_19) resistor r=0.555556
    rENA_25 (ENA ENA_21) resistor r=6.07099
    rENA_24 (c_16_n ENA_19) resistor r=0.679012
    rENA_23 (c_17_n ENA_30) resistor r=1.97531
    rENA_22 (c_17_n ENA_31) resistor r=0.62081
    rENA_21 (c_19_n ENA_26) resistor r=2.68519
    rENA_20 (ENA_26 ENA_27) resistor r=3.39506
    rENA_19 (ENA_27 ENA_28) resistor r=1.69753
    rENA_18 (ENA_28 ENA_29) resistor r=1.11111
    rENA_17 (ENA_29 ENA_30) resistor r=0.246914
    rENA_16 (ENA_31 ENA_35) resistor r=1.54321
    rENA_15 (ENA_33 ENA_35) resistor r=1.23457
    rVDD_38 (MM3_b VDD) resistor r=0.01
    rVDD_37 (MM1_b VDD) resistor r=0.01
    rVDD_36 (MM0_b VDD) resistor r=0.01
    rVDD_35 (MM0_s c_11_p) resistor r=7.40741
    rVDD_34 (c_11_p VDD_45) resistor r=54.375
    rVDD_33 (MM3_s c_12_p) resistor r=7.40741
    rVDD_32 (c_12_p VDD_47) resistor r=54.375
    rVDD_31 (VDD_13 VDD_14) resistor r=6.82986
    rVDD_30 (VDD_13 VDD) resistor r=1.48148
    rVDD_29 (VDD_14 VDD_45) resistor r=68.8775
    rVDD_28 (VDD VDD_20) resistor r=1.85185
    rVDD_27 (VDD_20 VDD_45) resistor r=12.142
    rVDD_26 (VDD_20 VDD_45) resistor r=6.82986
    rVDD_25 (VDD_20 VDD_25) resistor r=3.33333
    rVDD_24 (VDD_25 VDD_47) resistor r=12.142
    rVDD_23 (VDD_25 VDD_47) resistor r=6.82986
    rVDD_22 (VDD_25 VDD_30) resistor r=3.33333
    rVDD_21 (VDD_30 VDD_31) resistor r=6.82986
    rVDD_20 (VDD_30 VDD_35) resistor r=2.22222
    rVDD_19 (VDD_31 VDD_47) resistor r=68.8775
    rVDD_18 (VDD_31 VDD_34) resistor r=68.8775
    rVDD_17 (VDD_33 VDD_34) resistor r=6.82986
    rVDD_16 (VDD_33 VDD_36) resistor r=0.864198
    rVDD_15 (VDD_33 VDD_38) resistor r=3.33333
    rVDD_14 (VDD_34 c_9_p) resistor r=68.8775
    rVDD_13 (VDD_35 VDD_36) resistor r=0.246914
    rVDD_12 (VDD_38 c_9_p) resistor r=6.82986
    rVDD_11 (VDD_45 VDD_47) resistor r=68.8775
    rVSS_42 (MM5_b VSS) resistor r=0.01
    rVSS_41 (MM4_b VSS) resistor r=0.01
    rVSS_40 (MM2_b VSS) resistor r=0.01
    rVSS_39 (MM2_s VSS_4) resistor r=7.40741
    rVSS_38 (VSS_4 c_2_p) resistor r=54.8065
    rVSS_37 (MM5_s VSS_9) resistor r=7.40741
    rVSS_36 (VSS_9 c_4_p) resistor r=54.8065
    rVSS_35 (VSS_13 VSS_14) resistor r=6.82986
    rVSS_34 (VSS_13 VSS_19) resistor r=0.555556
    rVSS_33 (VSS_14 c_2_p) resistor r=68.8775
    rVSS_32 (VSS VSS_19) resistor r=0.987654
    rVSS_31 (VSS VSS_23) resistor r=0.679012
    rVSS_30 (VSS_21 c_2_p) resistor r=6.82986
    rVSS_29 (VSS_21 VSS_23) resistor r=1.11111
    rVSS_28 (VSS_21 c_2_p) resistor r=12.142
    rVSS_27 (VSS_21 VSS_27) resistor r=3.33333
    rVSS_26 (c_2_p c_4_p) resistor r=68.8775
    rVSS_25 (VSS_27 c_4_p) resistor r=6.82986
    rVSS_24 (VSS_27 c_4_p) resistor r=12.142
    rVSS_23 (VSS_27 VSS_32) resistor r=3.33333
    rVSS_22 (c_4_p VSS_33) resistor r=68.8775
    rVSS_21 (VSS_32 VSS_33) resistor r=6.82986
    rVSS_20 (VSS_32 VSS_35) resistor r=3.33333
    rVSS_19 (VSS_33 VSS_36) resistor r=68.8775
    rVSS_18 (VSS_35 VSS_36) resistor r=6.82986
    rVSS_17 (VSS_35 VSS_40) resistor r=1.91358
    rVSS_16 (VSS_36 c_1_p) resistor r=68.8775
    rVSS_15 (VSS_38 c_1_p) resistor r=6.82986
    rVSS_14 (VSS_38 VSS_40) resistor r=1.41975
ends c2mos
// End of subcircuit definition.

// Library name: custom_cell
// Cell name: vco_c2mos
// View name: schematic
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
//veriloga ahdl pspice dspf
subckt vco_c2mos COARSE\<15\> COARSE\<14\> COARSE\<13\> COARSE\<12\> \
        COARSE\<11\> COARSE\<10\> COARSE\<9\> COARSE\<8\> COARSE\<7\> \
        COARSE\<6\> COARSE\<5\> COARSE\<4\> COARSE\<3\> COARSE\<2\> \
        COARSE\<1\> COARSE\<0\> FINE\<7\> FINE\<6\> FINE\<5\> FINE\<4\> \
        FINE\<3\> FINE\<2\> FINE\<1\> FINE\<0\> MID\<15\> MID\<14\> \
        MID\<13\> MID\<12\> MID\<11\> MID\<10\> MID\<9\> MID\<8\> MID\<7\> \
        MID\<6\> MID\<5\> MID\<4\> MID\<3\> MID\<2\> MID\<1\> MID\<0\> OUT \
        VDD VSS
    C5 (OUT VSS) capacitor c=60f
    C0 (wclk2 VSS) capacitor c=60f
    C1 (wclk1 VSS) capacitor c=60f
    C2 (wclk0 VSS) capacitor c=60f
    C4 (wclk3 VSS) capacitor c=60f
    C3 (OUT VSS) capacitor c=60f
    COARSESTG0\<63\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos
    COARSESTG0\<62\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos
    COARSESTG0\<61\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos
    COARSESTG0\<60\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos
    COARSESTG0\<59\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos
    COARSESTG0\<58\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos
    COARSESTG0\<57\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos
    COARSESTG0\<56\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos
    COARSESTG0\<55\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos
    COARSESTG0\<54\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos
    COARSESTG0\<53\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos
    COARSESTG0\<52\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos
    COARSESTG0\<51\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos
    COARSESTG0\<50\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos
    COARSESTG0\<49\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos
    COARSESTG0\<48\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos
    COARSESTG0\<47\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos
    COARSESTG0\<46\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos
    COARSESTG0\<45\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos
    COARSESTG0\<44\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos
    COARSESTG0\<43\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos
    COARSESTG0\<42\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos
    COARSESTG0\<41\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos
    COARSESTG0\<40\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos
    COARSESTG0\<39\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos
    COARSESTG0\<38\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos
    COARSESTG0\<37\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos
    COARSESTG0\<36\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos
    COARSESTG0\<35\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos
    COARSESTG0\<34\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos
    COARSESTG0\<33\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos
    COARSESTG0\<32\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos
    COARSESTG0\<31\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos
    COARSESTG0\<30\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos
    COARSESTG0\<29\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos
    COARSESTG0\<28\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos
    COARSESTG0\<27\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos
    COARSESTG0\<26\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos
    COARSESTG0\<25\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos
    COARSESTG0\<24\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos
    COARSESTG0\<23\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos
    COARSESTG0\<22\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos
    COARSESTG0\<21\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos
    COARSESTG0\<20\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos
    COARSESTG0\<19\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos
    COARSESTG0\<18\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos
    COARSESTG0\<17\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos
    COARSESTG0\<16\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos
    COARSESTG0\<15\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos
    COARSESTG0\<14\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos
    COARSESTG0\<13\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos
    COARSESTG0\<12\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos
    COARSESTG0\<11\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos
    COARSESTG0\<10\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos
    COARSESTG0\<9\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos
    COARSESTG0\<8\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos
    COARSESTG0\<7\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos
    COARSESTG0\<6\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos
    COARSESTG0\<5\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos
    COARSESTG0\<4\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos
    COARSESTG0\<3\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos
    COARSESTG0\<2\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos
    COARSESTG0\<1\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos
    COARSESTG0\<0\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos
    MIDSTG1\<15\> (wclk0 MID\<15\> VDD VSS wclk1) c2mos
    MIDSTG1\<14\> (wclk0 MID\<14\> VDD VSS wclk1) c2mos
    MIDSTG1\<13\> (wclk0 MID\<13\> VDD VSS wclk1) c2mos
    MIDSTG1\<12\> (wclk0 MID\<12\> VDD VSS wclk1) c2mos
    MIDSTG1\<11\> (wclk0 MID\<11\> VDD VSS wclk1) c2mos
    MIDSTG1\<10\> (wclk0 MID\<10\> VDD VSS wclk1) c2mos
    MIDSTG1\<9\> (wclk0 MID\<9\> VDD VSS wclk1) c2mos
    MIDSTG1\<8\> (wclk0 MID\<8\> VDD VSS wclk1) c2mos
    MIDSTG1\<7\> (wclk0 MID\<7\> VDD VSS wclk1) c2mos
    MIDSTG1\<6\> (wclk0 MID\<6\> VDD VSS wclk1) c2mos
    MIDSTG1\<5\> (wclk0 MID\<5\> VDD VSS wclk1) c2mos
    MIDSTG1\<4\> (wclk0 MID\<4\> VDD VSS wclk1) c2mos
    MIDSTG1\<3\> (wclk0 MID\<3\> VDD VSS wclk1) c2mos
    MIDSTG1\<2\> (wclk0 MID\<2\> VDD VSS wclk1) c2mos
    MIDSTG1\<1\> (wclk0 MID\<1\> VDD VSS wclk1) c2mos
    MIDSTG1\<0\> (wclk0 MID\<0\> VDD VSS wclk1) c2mos
    STG0\<7\> (OUT FINE\<7\> VDD VSS wclk0) c2mos
    STG0\<6\> (OUT FINE\<6\> VDD VSS wclk0) c2mos
    STG0\<5\> (OUT FINE\<5\> VDD VSS wclk0) c2mos
    STG0\<4\> (OUT FINE\<4\> VDD VSS wclk0) c2mos
    STG0\<3\> (OUT FINE\<3\> VDD VSS wclk0) c2mos
    STG0\<2\> (OUT FINE\<2\> VDD VSS wclk0) c2mos
    STG0\<1\> (OUT FINE\<1\> VDD VSS wclk0) c2mos
    STG0\<0\> (OUT FINE\<0\> VDD VSS wclk0) c2mos
    MIDSTG0\<15\> (OUT MID\<15\> VDD VSS wclk0) c2mos
    MIDSTG0\<14\> (OUT MID\<14\> VDD VSS wclk0) c2mos
    MIDSTG0\<13\> (OUT MID\<13\> VDD VSS wclk0) c2mos
    MIDSTG0\<12\> (OUT MID\<12\> VDD VSS wclk0) c2mos
    MIDSTG0\<11\> (OUT MID\<11\> VDD VSS wclk0) c2mos
    MIDSTG0\<10\> (OUT MID\<10\> VDD VSS wclk0) c2mos
    MIDSTG0\<9\> (OUT MID\<9\> VDD VSS wclk0) c2mos
    MIDSTG0\<8\> (OUT MID\<8\> VDD VSS wclk0) c2mos
    MIDSTG0\<7\> (OUT MID\<7\> VDD VSS wclk0) c2mos
    MIDSTG0\<6\> (OUT MID\<6\> VDD VSS wclk0) c2mos
    MIDSTG0\<5\> (OUT MID\<5\> VDD VSS wclk0) c2mos
    MIDSTG0\<4\> (OUT MID\<4\> VDD VSS wclk0) c2mos
    MIDSTG0\<3\> (OUT MID\<3\> VDD VSS wclk0) c2mos
    MIDSTG0\<2\> (OUT MID\<2\> VDD VSS wclk0) c2mos
    MIDSTG0\<1\> (OUT MID\<1\> VDD VSS wclk0) c2mos
    MIDSTG0\<0\> (OUT MID\<0\> VDD VSS wclk0) c2mos
    COARSESTG4\<63\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos
    COARSESTG4\<62\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos
    COARSESTG4\<61\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos
    COARSESTG4\<60\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos
    COARSESTG4\<59\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos
    COARSESTG4\<58\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos
    COARSESTG4\<57\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos
    COARSESTG4\<56\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos
    COARSESTG4\<55\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos
    COARSESTG4\<54\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos
    COARSESTG4\<53\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos
    COARSESTG4\<52\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos
    COARSESTG4\<51\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos
    COARSESTG4\<50\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos
    COARSESTG4\<49\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos
    COARSESTG4\<48\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos
    COARSESTG4\<47\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos
    COARSESTG4\<46\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos
    COARSESTG4\<45\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos
    COARSESTG4\<44\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos
    COARSESTG4\<43\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos
    COARSESTG4\<42\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos
    COARSESTG4\<41\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos
    COARSESTG4\<40\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos
    COARSESTG4\<39\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos
    COARSESTG4\<38\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos
    COARSESTG4\<37\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos
    COARSESTG4\<36\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos
    COARSESTG4\<35\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos
    COARSESTG4\<34\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos
    COARSESTG4\<33\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos
    COARSESTG4\<32\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos
    COARSESTG4\<31\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos
    COARSESTG4\<30\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos
    COARSESTG4\<29\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos
    COARSESTG4\<28\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos
    COARSESTG4\<27\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos
    COARSESTG4\<26\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos
    COARSESTG4\<25\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos
    COARSESTG4\<24\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos
    COARSESTG4\<23\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos
    COARSESTG4\<22\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos
    COARSESTG4\<21\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos
    COARSESTG4\<20\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos
    COARSESTG4\<19\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos
    COARSESTG4\<18\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos
    COARSESTG4\<17\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos
    COARSESTG4\<16\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos
    COARSESTG4\<15\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos
    COARSESTG4\<14\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos
    COARSESTG4\<13\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos
    COARSESTG4\<12\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos
    COARSESTG4\<11\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos
    COARSESTG4\<10\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos
    COARSESTG4\<9\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos
    COARSESTG4\<8\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos
    COARSESTG4\<7\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos
    COARSESTG4\<6\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos
    COARSESTG4\<5\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos
    COARSESTG4\<4\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos
    COARSESTG4\<3\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos
    COARSESTG4\<2\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos
    COARSESTG4\<1\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos
    COARSESTG4\<0\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos
    COARSESTG3\<63\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos
    COARSESTG3\<62\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos
    COARSESTG3\<61\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos
    COARSESTG3\<60\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos
    COARSESTG3\<59\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos
    COARSESTG3\<58\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos
    COARSESTG3\<57\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos
    COARSESTG3\<56\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos
    COARSESTG3\<55\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos
    COARSESTG3\<54\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos
    COARSESTG3\<53\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos
    COARSESTG3\<52\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos
    COARSESTG3\<51\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos
    COARSESTG3\<50\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos
    COARSESTG3\<49\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos
    COARSESTG3\<48\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos
    COARSESTG3\<47\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos
    COARSESTG3\<46\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos
    COARSESTG3\<45\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos
    COARSESTG3\<44\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos
    COARSESTG3\<43\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos
    COARSESTG3\<42\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos
    COARSESTG3\<41\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos
    COARSESTG3\<40\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos
    COARSESTG3\<39\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos
    COARSESTG3\<38\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos
    COARSESTG3\<37\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos
    COARSESTG3\<36\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos
    COARSESTG3\<35\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos
    COARSESTG3\<34\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos
    COARSESTG3\<33\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos
    COARSESTG3\<32\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos
    COARSESTG3\<31\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos
    COARSESTG3\<30\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos
    COARSESTG3\<29\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos
    COARSESTG3\<28\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos
    COARSESTG3\<27\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos
    COARSESTG3\<26\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos
    COARSESTG3\<25\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos
    COARSESTG3\<24\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos
    COARSESTG3\<23\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos
    COARSESTG3\<22\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos
    COARSESTG3\<21\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos
    COARSESTG3\<20\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos
    COARSESTG3\<19\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos
    COARSESTG3\<18\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos
    COARSESTG3\<17\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos
    COARSESTG3\<16\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos
    COARSESTG3\<15\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos
    COARSESTG3\<14\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos
    COARSESTG3\<13\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos
    COARSESTG3\<12\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos
    COARSESTG3\<11\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos
    COARSESTG3\<10\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos
    COARSESTG3\<9\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos
    COARSESTG3\<8\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos
    COARSESTG3\<7\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos
    COARSESTG3\<6\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos
    COARSESTG3\<5\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos
    COARSESTG3\<4\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos
    COARSESTG3\<3\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos
    COARSESTG3\<2\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos
    COARSESTG3\<1\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos
    COARSESTG3\<0\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos
    COARSESTG2\<63\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos
    COARSESTG2\<62\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos
    COARSESTG2\<61\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos
    COARSESTG2\<60\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos
    COARSESTG2\<59\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos
    COARSESTG2\<58\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos
    COARSESTG2\<57\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos
    COARSESTG2\<56\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos
    COARSESTG2\<55\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos
    COARSESTG2\<54\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos
    COARSESTG2\<53\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos
    COARSESTG2\<52\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos
    COARSESTG2\<51\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos
    COARSESTG2\<50\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos
    COARSESTG2\<49\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos
    COARSESTG2\<48\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos
    COARSESTG2\<47\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos
    COARSESTG2\<46\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos
    COARSESTG2\<45\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos
    COARSESTG2\<44\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos
    COARSESTG2\<43\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos
    COARSESTG2\<42\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos
    COARSESTG2\<41\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos
    COARSESTG2\<40\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos
    COARSESTG2\<39\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos
    COARSESTG2\<38\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos
    COARSESTG2\<37\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos
    COARSESTG2\<36\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos
    COARSESTG2\<35\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos
    COARSESTG2\<34\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos
    COARSESTG2\<33\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos
    COARSESTG2\<32\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos
    COARSESTG2\<31\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos
    COARSESTG2\<30\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos
    COARSESTG2\<29\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos
    COARSESTG2\<28\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos
    COARSESTG2\<27\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos
    COARSESTG2\<26\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos
    COARSESTG2\<25\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos
    COARSESTG2\<24\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos
    COARSESTG2\<23\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos
    COARSESTG2\<22\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos
    COARSESTG2\<21\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos
    COARSESTG2\<20\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos
    COARSESTG2\<19\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos
    COARSESTG2\<18\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos
    COARSESTG2\<17\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos
    COARSESTG2\<16\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos
    COARSESTG2\<15\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos
    COARSESTG2\<14\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos
    COARSESTG2\<13\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos
    COARSESTG2\<12\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos
    COARSESTG2\<11\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos
    COARSESTG2\<10\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos
    COARSESTG2\<9\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos
    COARSESTG2\<8\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos
    COARSESTG2\<7\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos
    COARSESTG2\<6\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos
    COARSESTG2\<5\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos
    COARSESTG2\<4\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos
    COARSESTG2\<3\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos
    COARSESTG2\<2\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos
    COARSESTG2\<1\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos
    COARSESTG2\<0\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos
    COARSESTG1\<63\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos
    COARSESTG1\<62\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos
    COARSESTG1\<61\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos
    COARSESTG1\<60\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos
    COARSESTG1\<59\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos
    COARSESTG1\<58\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos
    COARSESTG1\<57\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos
    COARSESTG1\<56\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos
    COARSESTG1\<55\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos
    COARSESTG1\<54\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos
    COARSESTG1\<53\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos
    COARSESTG1\<52\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos
    COARSESTG1\<51\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos
    COARSESTG1\<50\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos
    COARSESTG1\<49\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos
    COARSESTG1\<48\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos
    COARSESTG1\<47\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos
    COARSESTG1\<46\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos
    COARSESTG1\<45\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos
    COARSESTG1\<44\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos
    COARSESTG1\<43\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos
    COARSESTG1\<42\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos
    COARSESTG1\<41\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos
    COARSESTG1\<40\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos
    COARSESTG1\<39\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos
    COARSESTG1\<38\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos
    COARSESTG1\<37\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos
    COARSESTG1\<36\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos
    COARSESTG1\<35\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos
    COARSESTG1\<34\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos
    COARSESTG1\<33\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos
    COARSESTG1\<32\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos
    COARSESTG1\<31\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos
    COARSESTG1\<30\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos
    COARSESTG1\<29\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos
    COARSESTG1\<28\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos
    COARSESTG1\<27\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos
    COARSESTG1\<26\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos
    COARSESTG1\<25\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos
    COARSESTG1\<24\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos
    COARSESTG1\<23\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos
    COARSESTG1\<22\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos
    COARSESTG1\<21\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos
    COARSESTG1\<20\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos
    COARSESTG1\<19\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos
    COARSESTG1\<18\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos
    COARSESTG1\<17\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos
    COARSESTG1\<16\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos
    COARSESTG1\<15\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos
    COARSESTG1\<14\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos
    COARSESTG1\<13\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos
    COARSESTG1\<12\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos
    COARSESTG1\<11\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos
    COARSESTG1\<10\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos
    COARSESTG1\<9\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos
    COARSESTG1\<8\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos
    COARSESTG1\<7\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos
    COARSESTG1\<6\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos
    COARSESTG1\<5\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos
    COARSESTG1\<4\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos
    COARSESTG1\<3\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos
    COARSESTG1\<2\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos
    COARSESTG1\<1\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos
    COARSESTG1\<0\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos
    MIDSTG3\<15\> (wclk2 MID\<15\> VDD VSS wclk3) c2mos
    MIDSTG3\<14\> (wclk2 MID\<14\> VDD VSS wclk3) c2mos
    MIDSTG3\<13\> (wclk2 MID\<13\> VDD VSS wclk3) c2mos
    MIDSTG3\<12\> (wclk2 MID\<12\> VDD VSS wclk3) c2mos
    MIDSTG3\<11\> (wclk2 MID\<11\> VDD VSS wclk3) c2mos
    MIDSTG3\<10\> (wclk2 MID\<10\> VDD VSS wclk3) c2mos
    MIDSTG3\<9\> (wclk2 MID\<9\> VDD VSS wclk3) c2mos
    MIDSTG3\<8\> (wclk2 MID\<8\> VDD VSS wclk3) c2mos
    MIDSTG3\<7\> (wclk2 MID\<7\> VDD VSS wclk3) c2mos
    MIDSTG3\<6\> (wclk2 MID\<6\> VDD VSS wclk3) c2mos
    MIDSTG3\<5\> (wclk2 MID\<5\> VDD VSS wclk3) c2mos
    MIDSTG3\<4\> (wclk2 MID\<4\> VDD VSS wclk3) c2mos
    MIDSTG3\<3\> (wclk2 MID\<3\> VDD VSS wclk3) c2mos
    MIDSTG3\<2\> (wclk2 MID\<2\> VDD VSS wclk3) c2mos
    MIDSTG3\<1\> (wclk2 MID\<1\> VDD VSS wclk3) c2mos
    MIDSTG3\<0\> (wclk2 MID\<0\> VDD VSS wclk3) c2mos
    I14\<7\> (wclk3 FINE\<7\> VDD VSS OUT) c2mos
    I14\<6\> (wclk3 FINE\<6\> VDD VSS OUT) c2mos
    I14\<5\> (wclk3 FINE\<5\> VDD VSS OUT) c2mos
    I14\<4\> (wclk3 FINE\<4\> VDD VSS OUT) c2mos
    I14\<3\> (wclk3 FINE\<3\> VDD VSS OUT) c2mos
    I14\<2\> (wclk3 FINE\<2\> VDD VSS OUT) c2mos
    I14\<1\> (wclk3 FINE\<1\> VDD VSS OUT) c2mos
    I14\<0\> (wclk3 FINE\<0\> VDD VSS OUT) c2mos
    MIDSTG4\<15\> (wclk3 MID\<15\> VDD VSS OUT) c2mos
    MIDSTG4\<14\> (wclk3 MID\<14\> VDD VSS OUT) c2mos
    MIDSTG4\<13\> (wclk3 MID\<13\> VDD VSS OUT) c2mos
    MIDSTG4\<12\> (wclk3 MID\<12\> VDD VSS OUT) c2mos
    MIDSTG4\<11\> (wclk3 MID\<11\> VDD VSS OUT) c2mos
    MIDSTG4\<10\> (wclk3 MID\<10\> VDD VSS OUT) c2mos
    MIDSTG4\<9\> (wclk3 MID\<9\> VDD VSS OUT) c2mos
    MIDSTG4\<8\> (wclk3 MID\<8\> VDD VSS OUT) c2mos
    MIDSTG4\<7\> (wclk3 MID\<7\> VDD VSS OUT) c2mos
    MIDSTG4\<6\> (wclk3 MID\<6\> VDD VSS OUT) c2mos
    MIDSTG4\<5\> (wclk3 MID\<5\> VDD VSS OUT) c2mos
    MIDSTG4\<4\> (wclk3 MID\<4\> VDD VSS OUT) c2mos
    MIDSTG4\<3\> (wclk3 MID\<3\> VDD VSS OUT) c2mos
    MIDSTG4\<2\> (wclk3 MID\<2\> VDD VSS OUT) c2mos
    MIDSTG4\<1\> (wclk3 MID\<1\> VDD VSS OUT) c2mos
    MIDSTG4\<0\> (wclk3 MID\<0\> VDD VSS OUT) c2mos
    I25\<23\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<22\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<21\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<20\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<19\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<18\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<17\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<16\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<15\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<14\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<13\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<12\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<11\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<10\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<9\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<8\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<7\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<6\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<5\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<4\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<3\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<2\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<1\> (OUT VDD VDD VSS wclk0) c2mos
    I25\<0\> (OUT VDD VDD VSS wclk0) c2mos
    MIDSTG2\<15\> (wclk1 MID\<15\> VDD VSS wclk2) c2mos
    MIDSTG2\<14\> (wclk1 MID\<14\> VDD VSS wclk2) c2mos
    MIDSTG2\<13\> (wclk1 MID\<13\> VDD VSS wclk2) c2mos
    MIDSTG2\<12\> (wclk1 MID\<12\> VDD VSS wclk2) c2mos
    MIDSTG2\<11\> (wclk1 MID\<11\> VDD VSS wclk2) c2mos
    MIDSTG2\<10\> (wclk1 MID\<10\> VDD VSS wclk2) c2mos
    MIDSTG2\<9\> (wclk1 MID\<9\> VDD VSS wclk2) c2mos
    MIDSTG2\<8\> (wclk1 MID\<8\> VDD VSS wclk2) c2mos
    MIDSTG2\<7\> (wclk1 MID\<7\> VDD VSS wclk2) c2mos
    MIDSTG2\<6\> (wclk1 MID\<6\> VDD VSS wclk2) c2mos
    MIDSTG2\<5\> (wclk1 MID\<5\> VDD VSS wclk2) c2mos
    MIDSTG2\<4\> (wclk1 MID\<4\> VDD VSS wclk2) c2mos
    MIDSTG2\<3\> (wclk1 MID\<3\> VDD VSS wclk2) c2mos
    MIDSTG2\<2\> (wclk1 MID\<2\> VDD VSS wclk2) c2mos
    MIDSTG2\<1\> (wclk1 MID\<1\> VDD VSS wclk2) c2mos
    MIDSTG2\<0\> (wclk1 MID\<0\> VDD VSS wclk2) c2mos
    I29\<23\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<22\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<21\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<20\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<19\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<18\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<17\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<16\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<15\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<14\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<13\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<12\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<11\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<10\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<9\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<8\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<7\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<6\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<5\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<4\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<3\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<2\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<1\> (wclk3 VDD VDD VSS OUT) c2mos
    I29\<0\> (wclk3 VDD VDD VSS OUT) c2mos
    I28\<23\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<22\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<21\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<20\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<19\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<18\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<17\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<16\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<15\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<14\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<13\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<12\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<11\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<10\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<9\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<8\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<7\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<6\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<5\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<4\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<3\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<2\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<1\> (wclk2 VDD VDD VSS wclk3) c2mos
    I28\<0\> (wclk2 VDD VDD VSS wclk3) c2mos
    I26\<23\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<22\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<21\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<20\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<19\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<18\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<17\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<16\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<15\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<14\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<13\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<12\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<11\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<10\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<9\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<8\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<7\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<6\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<5\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<4\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<3\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<2\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<1\> (wclk0 VDD VDD VSS wclk1) c2mos
    I26\<0\> (wclk0 VDD VDD VSS wclk1) c2mos
    I27\<23\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<22\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<21\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<20\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<19\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<18\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<17\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<16\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<15\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<14\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<13\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<12\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<11\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<10\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<9\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<8\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<7\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<6\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<5\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<4\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<3\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<2\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<1\> (wclk1 VDD VDD VSS wclk2) c2mos
    I27\<0\> (wclk1 VDD VDD VSS wclk2) c2mos
    I15\<7\> (wclk2 FINE\<7\> VDD VSS wclk3) c2mos
    I15\<6\> (wclk2 FINE\<6\> VDD VSS wclk3) c2mos
    I15\<5\> (wclk2 FINE\<5\> VDD VSS wclk3) c2mos
    I15\<4\> (wclk2 FINE\<4\> VDD VSS wclk3) c2mos
    I15\<3\> (wclk2 FINE\<3\> VDD VSS wclk3) c2mos
    I15\<2\> (wclk2 FINE\<2\> VDD VSS wclk3) c2mos
    I15\<1\> (wclk2 FINE\<1\> VDD VSS wclk3) c2mos
    I15\<0\> (wclk2 FINE\<0\> VDD VSS wclk3) c2mos
    STG2\<7\> (wclk1 FINE\<7\> VDD VSS wclk2) c2mos
    STG2\<6\> (wclk1 FINE\<6\> VDD VSS wclk2) c2mos
    STG2\<5\> (wclk1 FINE\<5\> VDD VSS wclk2) c2mos
    STG2\<4\> (wclk1 FINE\<4\> VDD VSS wclk2) c2mos
    STG2\<3\> (wclk1 FINE\<3\> VDD VSS wclk2) c2mos
    STG2\<2\> (wclk1 FINE\<2\> VDD VSS wclk2) c2mos
    STG2\<1\> (wclk1 FINE\<1\> VDD VSS wclk2) c2mos
    STG2\<0\> (wclk1 FINE\<0\> VDD VSS wclk2) c2mos
    STG1\<7\> (wclk0 FINE\<7\> VDD VSS wclk1) c2mos
    STG1\<6\> (wclk0 FINE\<6\> VDD VSS wclk1) c2mos
    STG1\<5\> (wclk0 FINE\<5\> VDD VSS wclk1) c2mos
    STG1\<4\> (wclk0 FINE\<4\> VDD VSS wclk1) c2mos
    STG1\<3\> (wclk0 FINE\<3\> VDD VSS wclk1) c2mos
    STG1\<2\> (wclk0 FINE\<2\> VDD VSS wclk1) c2mos
    STG1\<1\> (wclk0 FINE\<1\> VDD VSS wclk1) c2mos
    STG1\<0\> (wclk0 FINE\<0\> VDD VSS wclk1) c2mos
ends vco_c2mos
// End of subcircuit definition.

// Library name: sdbx_wrahman
// Cell name: tb_vco_c2mos_ctrlbw
// View name: schematic
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
// veriloga ahdl pspice dspf
VCO (wctl_enacoarse\<15\> wctl_enacoarse\<14\> wctl_enacoarse\<13\> \
        wctl_enacoarse\<12\> wctl_enacoarse\<11\> wctl_enacoarse\<10\> \
        wctl_enacoarse\<9\> wctl_enacoarse\<8\> wctl_enacoarse\<7\> \
        wctl_enacoarse\<6\> wctl_enacoarse\<5\> wctl_enacoarse\<4\> \
        wctl_enacoarse\<3\> wctl_enacoarse\<2\> wctl_enacoarse\<1\> \
        wctl_enacoarse\<0\> wctl2 wctl2 wctl2 wctl2 wctl2 wctl2 wctl2 \
        wctl2 wctl_enamid\<15\> wctl_enamid\<14\> wctl_enamid\<13\> \
        wctl_enamid\<12\> wctl_enamid\<11\> wctl_enamid\<10\> \
        wctl_enamid\<9\> wctl_enamid\<8\> wctl_enamid\<7\> \
        wctl_enamid\<6\> wctl_enamid\<5\> wctl_enamid\<4\> \
        wctl_enamid\<3\> wctl_enamid\<2\> wctl_enamid\<1\> \
        wctl_enamid\<0\> wck_out p_vdd p_vss) vco_c2mos
THERMCTLMID (p_vdd p_vss wctlbinmid\<3\> wctlbinmid\<2\> wctlbinmid\<1\> \
        wctlbinmid\<0\> wctl_enamid\<15\> wctl_enamid\<14\> \
        wctl_enamid\<13\> wctl_enamid\<12\> wctl_enamid\<11\> \
        wctl_enamid\<10\> wctl_enamid\<9\> wctl_enamid\<8\> \
        wctl_enamid\<7\> wctl_enamid\<6\> wctl_enamid\<5\> \
        wctl_enamid\<4\> wctl_enamid\<3\> wctl_enamid\<2\> \
        wctl_enamid\<1\> wctl_enamid\<0\> net06\<0\> net06\<1\> net06\<2\> \
        net06\<3\> net06\<4\> net06\<5\> net06\<6\> net06\<7\> net06\<8\> \
        net06\<9\> net06\<10\> net06\<11\> net06\<12\> net06\<13\> \
        net06\<14\> net06\<15\>) bin2therm4to16 tdelay=1p trisefall=1p
THERMCTLCOARSE (p_vdd p_vss wctlbincoarse\<3\> wctlbincoarse\<2\> \
        wctlbincoarse\<1\> wctlbincoarse\<0\> wctl_enacoarse\<15\> \
        wctl_enacoarse\<14\> wctl_enacoarse\<13\> wctl_enacoarse\<12\> \
        wctl_enacoarse\<11\> wctl_enacoarse\<10\> wctl_enacoarse\<9\> \
        wctl_enacoarse\<8\> wctl_enacoarse\<7\> wctl_enacoarse\<6\> \
        wctl_enacoarse\<5\> wctl_enacoarse\<4\> wctl_enacoarse\<3\> \
        wctl_enacoarse\<2\> wctl_enacoarse\<1\> wctl_enacoarse\<0\> \
        net08\<0\> net08\<1\> net08\<2\> net08\<3\> net08\<4\> net08\<5\> \
        net08\<6\> net08\<7\> net08\<8\> net08\<9\> net08\<10\> \
        net08\<11\> net08\<12\> net08\<13\> net08\<14\> net08\<15\>) \
        bin2therm4to16 tdelay=1p trisefall=1p
V14 (wctlcoarse 0) vsource dc=ctrlcoarse*(VDD/256)+1p type=dc
VSRC_VSS (p_vss 0) vsource dc=0 type=dc
VSRC_VDD (p_vdd 0) vsource dc=VDD type=dc
THERMCTL (p_vdd p_vss wctlbin\<2\> wctlbin\<1\> wctlbin\<0\> wctl_ena\<7\> \
        wctl_ena\<6\> wctl_ena\<5\> wctl_ena\<4\> wctl_ena\<3\> \
        wctl_ena\<2\> wctl_ena\<1\> wctl_ena\<0\> net02\<0\> net02\<1\> \
        net02\<2\> net02\<3\> net02\<4\> net02\<5\> net02\<6\> net02\<7\>) \
        bin2therm3to8 tdelay=1p trisefall=1p
ADCCTL (wctl wclk_ctl wctlbin\<2\> wctlbin\<1\> wctlbin\<0\>) adc_3b \
        vmax=VDD vmin=0 one=VDD zero=0 vth=VDD/2.0 slack=1f trise=1p \
        tfall=1p tconv=1p traceflag=0
V1 (wctl2 0) vsource dc=VDD type=pulse val0=VDD val1=0 period=1 \
        delay=Tstep rise=1p fall=1p width=500.0m
V0 (wclk_ctl 0) vsource type=pulse val0=0 val1=VDD period=1/fCLK \
        delay=TDEL rise=1p fall=1p width=0.5/fCLK
V6 (wctl 0) vsource dc=ctrl*(VDD/8)+1p type=pulse val0=ctrl*(VDD/8)+1p \
        val1=ctrl2*(VDD/8)+1p period=1 delay=700.0p rise=1p fall=1p \
        width=500.0m
I32 (wctlcoarse wclk_ctl wctlbincoarse\<3\> wctlbincoarse\<2\> \
        wctlbincoarse\<1\> wctlbincoarse\<0\> wctlbinmid\<3\> \
        wctlbinmid\<2\> wctlbinmid\<1\> wctlbinmid\<0\>) adc_8b vmax=VDD \
        vmin=0 one=VDD zero=0 vth=VDD/2.0 slack=1f trise=1p tfall=1p \
        tconv=1p traceflag=0
simulatorOptions options reltol=1e-3 vabstol=1e-6 iabstol=1e-12 temp=27 \
    tnom=27 scalem=1.0 scale=1.0 gmin=1e-12 rforce=1 maxnotes=5 maxwarns=5 \
    digits=5 cols=80 pivrel=1e-3 sensfile="../psf/sens.output" \
    checklimitdest=psf 
tran tran stop=TSTOP write="spectre.ic" writefinal="spectre.fc" \
    annotate=status maxiters=5 
finalTimeOP info what=oppoint where=rawfile
modelParameter info what=models where=rawfile
element info what=inst where=rawfile
outputParameter info what=output where=rawfile
designParamVals info what=parameters where=rawfile
primitives info what=primitives where=rawfile
subckts info what=subckts where=rawfile
save wck_out wctl2 
saveOptions options save=allpub
ahdl_include "/home/aa/users/cs199-cnj/CustomCadenceLibs/sdbx_wrahman/bin2therm4to16/veriloga/veriloga.va"
ahdl_include "/home/aa/users/cs199-cnj/CustomCadenceLibs/sdbx_wrahman/bin2therm3to8/veriloga/veriloga.va"
ahdl_include "/home/aa/users/cs199-cnj/CustomCadenceLibs/sdbx_wrahman/adc_3bit/veriloga/veriloga.va"
ahdl_include "/home/aa/users/cs199-cnj/CustomCadenceLibs/sdbx_wrahman/adc_8bit/veriloga/veriloga.va"
