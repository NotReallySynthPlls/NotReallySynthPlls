// Generated for: spectre
// Generated on: May  3 15:18:14 2020
// Design library name: sdbx_wrahman
// Design cell name: tb_vco_c2mos_ctrlbw
// Design view name: config
simulator lang=spectre
global 0
parameters Tstep=1.0n nPhase=1 VDD=0.7 TSTOP=2n fCLK=1G ctrl=7 \
    ctrlcoarse=127 ctrl2=ctrl TDEL=1p + nPhase/(5G*20)
include "/home/ff/ee241/spring20-labs/asap7PDK_r1p5/models/hspice/7nm_TT.pm"

// Library name: custom_cell
// Cell name: c2mos
// View name: schematic
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
//veriloga ahdl pspice dspf
subckt c2mos A ENA VDD VSS Y
    M4 (Y ENA pd1 VSS) nmos_rvt w=3*27n l=20n nfin=3
    M5 (pd1 A VSS VSS) nmos_rvt w=3*27n l=20n nfin=3
    M2 (ENAb ENA VSS VSS) nmos_rvt w=3*27n l=20n nfin=3
    M3 (pu1 A VDD VDD) pmos_rvt w=3*27n l=20n nfin=3
    M1 (Y ENAb pu1 VDD) pmos_rvt w=3*27n l=20n nfin=3
    M0 (ENAb ENA VDD VDD) pmos_rvt w=3*27n l=20n nfin=3
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
simulatorOptions options reltol=1e-5 vabstol=1e-6 iabstol=1e-12 temp=27 \
    tnom=27 scalem=1.0 scale=1.0 gmin=1e-12 rforce=1 maxnotes=5 maxwarns=5 \
    digits=5 cols=80 pivrel=1e-3 sensfile="../psf/sens.output" \
    checklimitdest=psf 
tran tran stop=TSTOP write="spectre.ic" writefinal="spectre.fc" \
    annotate=status maxiters=5 

ic wck_out=0.7

finalTimeOP info what=oppoint where=rawfile
modelParameter info what=models where=rawfile
element info what=inst where=rawfile
outputParameter info what=output where=rawfile
designParamVals info what=parameters where=rawfile
primitives info what=primitives where=rawfile
subckts info what=subckts where=rawfile
save wck_out wctl2 
saveOptions options save=allpub
ahdl_include "bin2therm4to16.va"
ahdl_include "bin2therm3to8.va"
ahdl_include "adc_3bit.va"
ahdl_include "adc_8bit.va"
simulator lang=spice 
.option measdgt 12 
.meas tran cross_wck_out_0 when v(wck_out)=0.35 cross=0 
.meas tran cross_wck_out_1 when v(wck_out)=0.35 cross=1 
.meas tran cross_wck_out_2 when v(wck_out)=0.35 cross=2 
.meas tran cross_wck_out_3 when v(wck_out)=0.35 cross=3 
.meas tran cross_wck_out_4 when v(wck_out)=0.35 cross=4 
.meas tran cross_wck_out_5 when v(wck_out)=0.35 cross=5 
.meas tran cross_wck_out_6 when v(wck_out)=0.35 cross=6 
.meas tran cross_wck_out_7 when v(wck_out)=0.35 cross=7 
.meas tran cross_wck_out_8 when v(wck_out)=0.35 cross=8 
.meas tran cross_wck_out_9 when v(wck_out)=0.35 cross=9 
.meas tran cross_wck_out_10 when v(wck_out)=0.35 cross=10 
.meas tran cross_wck_out_11 when v(wck_out)=0.35 cross=11 
.meas tran cross_wck_out_12 when v(wck_out)=0.35 cross=12 
.meas tran cross_wck_out_13 when v(wck_out)=0.35 cross=13 
.meas tran cross_wck_out_14 when v(wck_out)=0.35 cross=14 
.meas tran cross_wck_out_15 when v(wck_out)=0.35 cross=15 
.meas tran cross_wck_out_16 when v(wck_out)=0.35 cross=16 
.meas tran cross_wck_out_17 when v(wck_out)=0.35 cross=17 
.meas tran cross_wck_out_18 when v(wck_out)=0.35 cross=18 
.meas tran cross_wck_out_19 when v(wck_out)=0.35 cross=19 
.meas tran cross_wck_out_20 when v(wck_out)=0.35 cross=20 
.meas tran cross_wck_out_21 when v(wck_out)=0.35 cross=21 
.meas tran cross_wck_out_22 when v(wck_out)=0.35 cross=22 
.meas tran cross_wck_out_23 when v(wck_out)=0.35 cross=23 
.meas tran cross_wck_out_24 when v(wck_out)=0.35 cross=24 
.meas tran cross_wck_out_25 when v(wck_out)=0.35 cross=25 
.meas tran cross_wck_out_26 when v(wck_out)=0.35 cross=26 
.meas tran cross_wck_out_27 when v(wck_out)=0.35 cross=27 
.meas tran cross_wck_out_28 when v(wck_out)=0.35 cross=28 
.meas tran cross_wck_out_29 when v(wck_out)=0.35 cross=29 
.meas tran cross_wck_out_30 when v(wck_out)=0.35 cross=30 
.meas tran cross_wck_out_31 when v(wck_out)=0.35 cross=31 
.meas tran cross_wck_out_32 when v(wck_out)=0.35 cross=32 
.meas tran cross_wck_out_33 when v(wck_out)=0.35 cross=33 
.meas tran cross_wck_out_34 when v(wck_out)=0.35 cross=34 
.meas tran cross_wck_out_35 when v(wck_out)=0.35 cross=35 
.meas tran cross_wck_out_36 when v(wck_out)=0.35 cross=36 
.meas tran cross_wck_out_37 when v(wck_out)=0.35 cross=37 
.meas tran cross_wck_out_38 when v(wck_out)=0.35 cross=38 
.meas tran cross_wck_out_39 when v(wck_out)=0.35 cross=39 
.meas tran cross_wck_out_40 when v(wck_out)=0.35 cross=40 
.meas tran cross_wck_out_41 when v(wck_out)=0.35 cross=41 
.meas tran cross_wck_out_42 when v(wck_out)=0.35 cross=42 
.meas tran cross_wck_out_43 when v(wck_out)=0.35 cross=43 
.meas tran cross_wck_out_44 when v(wck_out)=0.35 cross=44 
.meas tran cross_wck_out_45 when v(wck_out)=0.35 cross=45 
.meas tran cross_wck_out_46 when v(wck_out)=0.35 cross=46 
.meas tran cross_wck_out_47 when v(wck_out)=0.35 cross=47 
.meas tran cross_wck_out_48 when v(wck_out)=0.35 cross=48 
.meas tran cross_wck_out_49 when v(wck_out)=0.35 cross=49 
.meas tran cross_wck_out_50 when v(wck_out)=0.35 cross=50 
.meas tran cross_wck_out_51 when v(wck_out)=0.35 cross=51 
.meas tran cross_wck_out_52 when v(wck_out)=0.35 cross=52 
.meas tran cross_wck_out_53 when v(wck_out)=0.35 cross=53 
.meas tran cross_wck_out_54 when v(wck_out)=0.35 cross=54 
.meas tran cross_wck_out_55 when v(wck_out)=0.35 cross=55 
.meas tran cross_wck_out_56 when v(wck_out)=0.35 cross=56 
.meas tran cross_wck_out_57 when v(wck_out)=0.35 cross=57 
.meas tran cross_wck_out_58 when v(wck_out)=0.35 cross=58 
.meas tran cross_wck_out_59 when v(wck_out)=0.35 cross=59 
.meas tran cross_wck_out_60 when v(wck_out)=0.35 cross=60 
.meas tran cross_wck_out_61 when v(wck_out)=0.35 cross=61 
.meas tran cross_wck_out_62 when v(wck_out)=0.35 cross=62 
.meas tran cross_wck_out_63 when v(wck_out)=0.35 cross=63 
.meas tran cross_wck_out_64 when v(wck_out)=0.35 cross=64 
.meas tran cross_wck_out_65 when v(wck_out)=0.35 cross=65 
.meas tran cross_wck_out_66 when v(wck_out)=0.35 cross=66 
.meas tran cross_wck_out_67 when v(wck_out)=0.35 cross=67 
.meas tran cross_wck_out_68 when v(wck_out)=0.35 cross=68 
.meas tran cross_wck_out_69 when v(wck_out)=0.35 cross=69 
.meas tran cross_wck_out_70 when v(wck_out)=0.35 cross=70 
.meas tran cross_wck_out_71 when v(wck_out)=0.35 cross=71 
.meas tran cross_wck_out_72 when v(wck_out)=0.35 cross=72 
.meas tran cross_wck_out_73 when v(wck_out)=0.35 cross=73 
.meas tran cross_wck_out_74 when v(wck_out)=0.35 cross=74 
.meas tran cross_wck_out_75 when v(wck_out)=0.35 cross=75 
.meas tran cross_wck_out_76 when v(wck_out)=0.35 cross=76 
.meas tran cross_wck_out_77 when v(wck_out)=0.35 cross=77 
.meas tran cross_wck_out_78 when v(wck_out)=0.35 cross=78 
.meas tran cross_wck_out_79 when v(wck_out)=0.35 cross=79 
.meas tran cross_wck_out_80 when v(wck_out)=0.35 cross=80 
.meas tran cross_wck_out_81 when v(wck_out)=0.35 cross=81 
.meas tran cross_wck_out_82 when v(wck_out)=0.35 cross=82 
.meas tran cross_wck_out_83 when v(wck_out)=0.35 cross=83 
.meas tran cross_wck_out_84 when v(wck_out)=0.35 cross=84 
.meas tran cross_wck_out_85 when v(wck_out)=0.35 cross=85 
.meas tran cross_wck_out_86 when v(wck_out)=0.35 cross=86 
.meas tran cross_wck_out_87 when v(wck_out)=0.35 cross=87 
.meas tran cross_wck_out_88 when v(wck_out)=0.35 cross=88 
.meas tran cross_wck_out_89 when v(wck_out)=0.35 cross=89 
.meas tran cross_wck_out_90 when v(wck_out)=0.35 cross=90 
.meas tran cross_wck_out_91 when v(wck_out)=0.35 cross=91 
.meas tran cross_wck_out_92 when v(wck_out)=0.35 cross=92 
.meas tran cross_wck_out_93 when v(wck_out)=0.35 cross=93 
.meas tran cross_wck_out_94 when v(wck_out)=0.35 cross=94 
.meas tran cross_wck_out_95 when v(wck_out)=0.35 cross=95 
.meas tran cross_wck_out_96 when v(wck_out)=0.35 cross=96 
.meas tran cross_wck_out_97 when v(wck_out)=0.35 cross=97 
.meas tran cross_wck_out_98 when v(wck_out)=0.35 cross=98 
.meas tran cross_wck_out_99 when v(wck_out)=0.35 cross=99 
.meas tran cross_wck_out_100 when v(wck_out)=0.35 cross=100 
.meas tran cross_wck_out_101 when v(wck_out)=0.35 cross=101 
.meas tran cross_wck_out_102 when v(wck_out)=0.35 cross=102 
.meas tran cross_wck_out_103 when v(wck_out)=0.35 cross=103 
.meas tran cross_wck_out_104 when v(wck_out)=0.35 cross=104 
.meas tran cross_wck_out_105 when v(wck_out)=0.35 cross=105 
.meas tran cross_wck_out_106 when v(wck_out)=0.35 cross=106 
.meas tran cross_wck_out_107 when v(wck_out)=0.35 cross=107 
.meas tran cross_wck_out_108 when v(wck_out)=0.35 cross=108 
.meas tran cross_wck_out_109 when v(wck_out)=0.35 cross=109 
.meas tran cross_wck_out_110 when v(wck_out)=0.35 cross=110 
.meas tran cross_wck_out_111 when v(wck_out)=0.35 cross=111 
.meas tran cross_wck_out_112 when v(wck_out)=0.35 cross=112 
.meas tran cross_wck_out_113 when v(wck_out)=0.35 cross=113 
.meas tran cross_wck_out_114 when v(wck_out)=0.35 cross=114 
.meas tran cross_wck_out_115 when v(wck_out)=0.35 cross=115 
.meas tran cross_wck_out_116 when v(wck_out)=0.35 cross=116 
.meas tran cross_wck_out_117 when v(wck_out)=0.35 cross=117 
.meas tran cross_wck_out_118 when v(wck_out)=0.35 cross=118 
.meas tran cross_wck_out_119 when v(wck_out)=0.35 cross=119 
.meas tran cross_wck_out_120 when v(wck_out)=0.35 cross=120 
.meas tran cross_wck_out_121 when v(wck_out)=0.35 cross=121 
.meas tran cross_wck_out_122 when v(wck_out)=0.35 cross=122 
.meas tran cross_wck_out_123 when v(wck_out)=0.35 cross=123 
.meas tran cross_wck_out_124 when v(wck_out)=0.35 cross=124 
.meas tran cross_wck_out_125 when v(wck_out)=0.35 cross=125 
.meas tran cross_wck_out_126 when v(wck_out)=0.35 cross=126 
.meas tran cross_wck_out_127 when v(wck_out)=0.35 cross=127 
.meas tran cross_wck_out_128 when v(wck_out)=0.35 cross=128 
.meas tran cross_wck_out_129 when v(wck_out)=0.35 cross=129 
.meas tran cross_wck_out_130 when v(wck_out)=0.35 cross=130 
.meas tran cross_wck_out_131 when v(wck_out)=0.35 cross=131 
.meas tran cross_wck_out_132 when v(wck_out)=0.35 cross=132 
.meas tran cross_wck_out_133 when v(wck_out)=0.35 cross=133 
.meas tran cross_wck_out_134 when v(wck_out)=0.35 cross=134 
.meas tran cross_wck_out_135 when v(wck_out)=0.35 cross=135 
.meas tran cross_wck_out_136 when v(wck_out)=0.35 cross=136 
.meas tran cross_wck_out_137 when v(wck_out)=0.35 cross=137 
.meas tran cross_wck_out_138 when v(wck_out)=0.35 cross=138 
.meas tran cross_wck_out_139 when v(wck_out)=0.35 cross=139 
.meas tran cross_wck_out_140 when v(wck_out)=0.35 cross=140 
.meas tran cross_wck_out_141 when v(wck_out)=0.35 cross=141 
.meas tran cross_wck_out_142 when v(wck_out)=0.35 cross=142 
.meas tran cross_wck_out_143 when v(wck_out)=0.35 cross=143 
.meas tran cross_wck_out_144 when v(wck_out)=0.35 cross=144 
.meas tran cross_wck_out_145 when v(wck_out)=0.35 cross=145 
.meas tran cross_wck_out_146 when v(wck_out)=0.35 cross=146 
.meas tran cross_wck_out_147 when v(wck_out)=0.35 cross=147 
.meas tran cross_wck_out_148 when v(wck_out)=0.35 cross=148 
.meas tran cross_wck_out_149 when v(wck_out)=0.35 cross=149 
.meas tran cross_wck_out_150 when v(wck_out)=0.35 cross=150 
.meas tran cross_wck_out_151 when v(wck_out)=0.35 cross=151 
.meas tran cross_wck_out_152 when v(wck_out)=0.35 cross=152 
.meas tran cross_wck_out_153 when v(wck_out)=0.35 cross=153 
.meas tran cross_wck_out_154 when v(wck_out)=0.35 cross=154 
.meas tran cross_wck_out_155 when v(wck_out)=0.35 cross=155 
.meas tran cross_wck_out_156 when v(wck_out)=0.35 cross=156 
.meas tran cross_wck_out_157 when v(wck_out)=0.35 cross=157 
.meas tran cross_wck_out_158 when v(wck_out)=0.35 cross=158 
.meas tran cross_wck_out_159 when v(wck_out)=0.35 cross=159 
.meas tran cross_wck_out_160 when v(wck_out)=0.35 cross=160 
.meas tran cross_wck_out_161 when v(wck_out)=0.35 cross=161 
.meas tran cross_wck_out_162 when v(wck_out)=0.35 cross=162 
.meas tran cross_wck_out_163 when v(wck_out)=0.35 cross=163 
.meas tran cross_wck_out_164 when v(wck_out)=0.35 cross=164 
.meas tran cross_wck_out_165 when v(wck_out)=0.35 cross=165 
.meas tran cross_wck_out_166 when v(wck_out)=0.35 cross=166 
.meas tran cross_wck_out_167 when v(wck_out)=0.35 cross=167 
.meas tran cross_wck_out_168 when v(wck_out)=0.35 cross=168 
.meas tran cross_wck_out_169 when v(wck_out)=0.35 cross=169 
.meas tran cross_wck_out_170 when v(wck_out)=0.35 cross=170 
.meas tran cross_wck_out_171 when v(wck_out)=0.35 cross=171 
.meas tran cross_wck_out_172 when v(wck_out)=0.35 cross=172 
.meas tran cross_wck_out_173 when v(wck_out)=0.35 cross=173 
.meas tran cross_wck_out_174 when v(wck_out)=0.35 cross=174 
.meas tran cross_wck_out_175 when v(wck_out)=0.35 cross=175 
.meas tran cross_wck_out_176 when v(wck_out)=0.35 cross=176 
.meas tran cross_wck_out_177 when v(wck_out)=0.35 cross=177 
.meas tran cross_wck_out_178 when v(wck_out)=0.35 cross=178 
.meas tran cross_wck_out_179 when v(wck_out)=0.35 cross=179 
.meas tran cross_wck_out_180 when v(wck_out)=0.35 cross=180 
.meas tran cross_wck_out_181 when v(wck_out)=0.35 cross=181 
.meas tran cross_wck_out_182 when v(wck_out)=0.35 cross=182 
.meas tran cross_wck_out_183 when v(wck_out)=0.35 cross=183 
.meas tran cross_wck_out_184 when v(wck_out)=0.35 cross=184 
.meas tran cross_wck_out_185 when v(wck_out)=0.35 cross=185 
.meas tran cross_wck_out_186 when v(wck_out)=0.35 cross=186 
.meas tran cross_wck_out_187 when v(wck_out)=0.35 cross=187 
.meas tran cross_wck_out_188 when v(wck_out)=0.35 cross=188 
.meas tran cross_wck_out_189 when v(wck_out)=0.35 cross=189 
.meas tran cross_wck_out_190 when v(wck_out)=0.35 cross=190 
.meas tran cross_wck_out_191 when v(wck_out)=0.35 cross=191 
.meas tran cross_wck_out_192 when v(wck_out)=0.35 cross=192 
.meas tran cross_wck_out_193 when v(wck_out)=0.35 cross=193 
.meas tran cross_wck_out_194 when v(wck_out)=0.35 cross=194 
.meas tran cross_wck_out_195 when v(wck_out)=0.35 cross=195 
.meas tran cross_wck_out_196 when v(wck_out)=0.35 cross=196 
.meas tran cross_wck_out_197 when v(wck_out)=0.35 cross=197 
.meas tran cross_wck_out_198 when v(wck_out)=0.35 cross=198 
.meas tran cross_wck_out_199 when v(wck_out)=0.35 cross=199 
.meas tran cross_wck_out_200 when v(wck_out)=0.35 cross=200 
.meas tran cross_wck_out_201 when v(wck_out)=0.35 cross=201 
.meas tran cross_wck_out_202 when v(wck_out)=0.35 cross=202 
.meas tran cross_wck_out_203 when v(wck_out)=0.35 cross=203 
.meas tran cross_wck_out_204 when v(wck_out)=0.35 cross=204 
.meas tran cross_wck_out_205 when v(wck_out)=0.35 cross=205 
.meas tran cross_wck_out_206 when v(wck_out)=0.35 cross=206 
.meas tran cross_wck_out_207 when v(wck_out)=0.35 cross=207 
.meas tran cross_wck_out_208 when v(wck_out)=0.35 cross=208 
.meas tran cross_wck_out_209 when v(wck_out)=0.35 cross=209 
.meas tran cross_wck_out_210 when v(wck_out)=0.35 cross=210 
.meas tran cross_wck_out_211 when v(wck_out)=0.35 cross=211 
.meas tran cross_wck_out_212 when v(wck_out)=0.35 cross=212 
.meas tran cross_wck_out_213 when v(wck_out)=0.35 cross=213 
.meas tran cross_wck_out_214 when v(wck_out)=0.35 cross=214 
.meas tran cross_wck_out_215 when v(wck_out)=0.35 cross=215 
.meas tran cross_wck_out_216 when v(wck_out)=0.35 cross=216 
.meas tran cross_wck_out_217 when v(wck_out)=0.35 cross=217 
.meas tran cross_wck_out_218 when v(wck_out)=0.35 cross=218 
.meas tran cross_wck_out_219 when v(wck_out)=0.35 cross=219 
.meas tran cross_wck_out_220 when v(wck_out)=0.35 cross=220 
.meas tran cross_wck_out_221 when v(wck_out)=0.35 cross=221 
.meas tran cross_wck_out_222 when v(wck_out)=0.35 cross=222 
.meas tran cross_wck_out_223 when v(wck_out)=0.35 cross=223 
.meas tran cross_wck_out_224 when v(wck_out)=0.35 cross=224 
.meas tran cross_wck_out_225 when v(wck_out)=0.35 cross=225 
.meas tran cross_wck_out_226 when v(wck_out)=0.35 cross=226 
.meas tran cross_wck_out_227 when v(wck_out)=0.35 cross=227 
.meas tran cross_wck_out_228 when v(wck_out)=0.35 cross=228 
.meas tran cross_wck_out_229 when v(wck_out)=0.35 cross=229 
.meas tran cross_wck_out_230 when v(wck_out)=0.35 cross=230 
.meas tran cross_wck_out_231 when v(wck_out)=0.35 cross=231 
.meas tran cross_wck_out_232 when v(wck_out)=0.35 cross=232 
.meas tran cross_wck_out_233 when v(wck_out)=0.35 cross=233 
.meas tran cross_wck_out_234 when v(wck_out)=0.35 cross=234 
.meas tran cross_wck_out_235 when v(wck_out)=0.35 cross=235 
.meas tran cross_wck_out_236 when v(wck_out)=0.35 cross=236 
.meas tran cross_wck_out_237 when v(wck_out)=0.35 cross=237 
.meas tran cross_wck_out_238 when v(wck_out)=0.35 cross=238 
.meas tran cross_wck_out_239 when v(wck_out)=0.35 cross=239 
.meas tran cross_wck_out_240 when v(wck_out)=0.35 cross=240 
.meas tran cross_wck_out_241 when v(wck_out)=0.35 cross=241 
.meas tran cross_wck_out_242 when v(wck_out)=0.35 cross=242 
.meas tran cross_wck_out_243 when v(wck_out)=0.35 cross=243 
.meas tran cross_wck_out_244 when v(wck_out)=0.35 cross=244 
.meas tran cross_wck_out_245 when v(wck_out)=0.35 cross=245 
.meas tran cross_wck_out_246 when v(wck_out)=0.35 cross=246 
.meas tran cross_wck_out_247 when v(wck_out)=0.35 cross=247 
.meas tran cross_wck_out_248 when v(wck_out)=0.35 cross=248 
.meas tran cross_wck_out_249 when v(wck_out)=0.35 cross=249 
.meas tran cross_wclk0_0 when v(vco.wclk0)=0.35 cross=0 
.meas tran cross_wclk0_1 when v(vco.wclk0)=0.35 cross=1 
.meas tran cross_wclk0_2 when v(vco.wclk0)=0.35 cross=2 
.meas tran cross_wclk0_3 when v(vco.wclk0)=0.35 cross=3 
.meas tran cross_wclk0_4 when v(vco.wclk0)=0.35 cross=4 
.meas tran cross_wclk0_5 when v(vco.wclk0)=0.35 cross=5 
.meas tran cross_wclk0_6 when v(vco.wclk0)=0.35 cross=6 
.meas tran cross_wclk0_7 when v(vco.wclk0)=0.35 cross=7 
.meas tran cross_wclk0_8 when v(vco.wclk0)=0.35 cross=8 
.meas tran cross_wclk0_9 when v(vco.wclk0)=0.35 cross=9 
.meas tran cross_wclk0_10 when v(vco.wclk0)=0.35 cross=10 
.meas tran cross_wclk0_11 when v(vco.wclk0)=0.35 cross=11 
.meas tran cross_wclk0_12 when v(vco.wclk0)=0.35 cross=12 
.meas tran cross_wclk0_13 when v(vco.wclk0)=0.35 cross=13 
.meas tran cross_wclk0_14 when v(vco.wclk0)=0.35 cross=14 
.meas tran cross_wclk0_15 when v(vco.wclk0)=0.35 cross=15 
.meas tran cross_wclk0_16 when v(vco.wclk0)=0.35 cross=16 
.meas tran cross_wclk0_17 when v(vco.wclk0)=0.35 cross=17 
.meas tran cross_wclk0_18 when v(vco.wclk0)=0.35 cross=18 
.meas tran cross_wclk0_19 when v(vco.wclk0)=0.35 cross=19 
.meas tran cross_wclk0_20 when v(vco.wclk0)=0.35 cross=20 
.meas tran cross_wclk0_21 when v(vco.wclk0)=0.35 cross=21 
.meas tran cross_wclk0_22 when v(vco.wclk0)=0.35 cross=22 
.meas tran cross_wclk0_23 when v(vco.wclk0)=0.35 cross=23 
.meas tran cross_wclk0_24 when v(vco.wclk0)=0.35 cross=24 
.meas tran cross_wclk0_25 when v(vco.wclk0)=0.35 cross=25 
.meas tran cross_wclk0_26 when v(vco.wclk0)=0.35 cross=26 
.meas tran cross_wclk0_27 when v(vco.wclk0)=0.35 cross=27 
.meas tran cross_wclk0_28 when v(vco.wclk0)=0.35 cross=28 
.meas tran cross_wclk0_29 when v(vco.wclk0)=0.35 cross=29 
.meas tran cross_wclk0_30 when v(vco.wclk0)=0.35 cross=30 
.meas tran cross_wclk0_31 when v(vco.wclk0)=0.35 cross=31 
.meas tran cross_wclk0_32 when v(vco.wclk0)=0.35 cross=32 
.meas tran cross_wclk0_33 when v(vco.wclk0)=0.35 cross=33 
.meas tran cross_wclk0_34 when v(vco.wclk0)=0.35 cross=34 
.meas tran cross_wclk0_35 when v(vco.wclk0)=0.35 cross=35 
.meas tran cross_wclk0_36 when v(vco.wclk0)=0.35 cross=36 
.meas tran cross_wclk0_37 when v(vco.wclk0)=0.35 cross=37 
.meas tran cross_wclk0_38 when v(vco.wclk0)=0.35 cross=38 
.meas tran cross_wclk0_39 when v(vco.wclk0)=0.35 cross=39 
.meas tran cross_wclk0_40 when v(vco.wclk0)=0.35 cross=40 
.meas tran cross_wclk0_41 when v(vco.wclk0)=0.35 cross=41 
.meas tran cross_wclk0_42 when v(vco.wclk0)=0.35 cross=42 
.meas tran cross_wclk0_43 when v(vco.wclk0)=0.35 cross=43 
.meas tran cross_wclk0_44 when v(vco.wclk0)=0.35 cross=44 
.meas tran cross_wclk0_45 when v(vco.wclk0)=0.35 cross=45 
.meas tran cross_wclk0_46 when v(vco.wclk0)=0.35 cross=46 
.meas tran cross_wclk0_47 when v(vco.wclk0)=0.35 cross=47 
.meas tran cross_wclk0_48 when v(vco.wclk0)=0.35 cross=48 
.meas tran cross_wclk0_49 when v(vco.wclk0)=0.35 cross=49 
.meas tran cross_wclk0_50 when v(vco.wclk0)=0.35 cross=50 
.meas tran cross_wclk0_51 when v(vco.wclk0)=0.35 cross=51 
.meas tran cross_wclk0_52 when v(vco.wclk0)=0.35 cross=52 
.meas tran cross_wclk0_53 when v(vco.wclk0)=0.35 cross=53 
.meas tran cross_wclk0_54 when v(vco.wclk0)=0.35 cross=54 
.meas tran cross_wclk0_55 when v(vco.wclk0)=0.35 cross=55 
.meas tran cross_wclk0_56 when v(vco.wclk0)=0.35 cross=56 
.meas tran cross_wclk0_57 when v(vco.wclk0)=0.35 cross=57 
.meas tran cross_wclk0_58 when v(vco.wclk0)=0.35 cross=58 
.meas tran cross_wclk0_59 when v(vco.wclk0)=0.35 cross=59 
.meas tran cross_wclk0_60 when v(vco.wclk0)=0.35 cross=60 
.meas tran cross_wclk0_61 when v(vco.wclk0)=0.35 cross=61 
.meas tran cross_wclk0_62 when v(vco.wclk0)=0.35 cross=62 
.meas tran cross_wclk0_63 when v(vco.wclk0)=0.35 cross=63 
.meas tran cross_wclk0_64 when v(vco.wclk0)=0.35 cross=64 
.meas tran cross_wclk0_65 when v(vco.wclk0)=0.35 cross=65 
.meas tran cross_wclk0_66 when v(vco.wclk0)=0.35 cross=66 
.meas tran cross_wclk0_67 when v(vco.wclk0)=0.35 cross=67 
.meas tran cross_wclk0_68 when v(vco.wclk0)=0.35 cross=68 
.meas tran cross_wclk0_69 when v(vco.wclk0)=0.35 cross=69 
.meas tran cross_wclk0_70 when v(vco.wclk0)=0.35 cross=70 
.meas tran cross_wclk0_71 when v(vco.wclk0)=0.35 cross=71 
.meas tran cross_wclk0_72 when v(vco.wclk0)=0.35 cross=72 
.meas tran cross_wclk0_73 when v(vco.wclk0)=0.35 cross=73 
.meas tran cross_wclk0_74 when v(vco.wclk0)=0.35 cross=74 
.meas tran cross_wclk0_75 when v(vco.wclk0)=0.35 cross=75 
.meas tran cross_wclk0_76 when v(vco.wclk0)=0.35 cross=76 
.meas tran cross_wclk0_77 when v(vco.wclk0)=0.35 cross=77 
.meas tran cross_wclk0_78 when v(vco.wclk0)=0.35 cross=78 
.meas tran cross_wclk0_79 when v(vco.wclk0)=0.35 cross=79 
.meas tran cross_wclk0_80 when v(vco.wclk0)=0.35 cross=80 
.meas tran cross_wclk0_81 when v(vco.wclk0)=0.35 cross=81 
.meas tran cross_wclk0_82 when v(vco.wclk0)=0.35 cross=82 
.meas tran cross_wclk0_83 when v(vco.wclk0)=0.35 cross=83 
.meas tran cross_wclk0_84 when v(vco.wclk0)=0.35 cross=84 
.meas tran cross_wclk0_85 when v(vco.wclk0)=0.35 cross=85 
.meas tran cross_wclk0_86 when v(vco.wclk0)=0.35 cross=86 
.meas tran cross_wclk0_87 when v(vco.wclk0)=0.35 cross=87 
.meas tran cross_wclk0_88 when v(vco.wclk0)=0.35 cross=88 
.meas tran cross_wclk0_89 when v(vco.wclk0)=0.35 cross=89 
.meas tran cross_wclk0_90 when v(vco.wclk0)=0.35 cross=90 
.meas tran cross_wclk0_91 when v(vco.wclk0)=0.35 cross=91 
.meas tran cross_wclk0_92 when v(vco.wclk0)=0.35 cross=92 
.meas tran cross_wclk0_93 when v(vco.wclk0)=0.35 cross=93 
.meas tran cross_wclk0_94 when v(vco.wclk0)=0.35 cross=94 
.meas tran cross_wclk0_95 when v(vco.wclk0)=0.35 cross=95 
.meas tran cross_wclk0_96 when v(vco.wclk0)=0.35 cross=96 
.meas tran cross_wclk0_97 when v(vco.wclk0)=0.35 cross=97 
.meas tran cross_wclk0_98 when v(vco.wclk0)=0.35 cross=98 
.meas tran cross_wclk0_99 when v(vco.wclk0)=0.35 cross=99 
.meas tran cross_wclk0_100 when v(vco.wclk0)=0.35 cross=100 
.meas tran cross_wclk0_101 when v(vco.wclk0)=0.35 cross=101 
.meas tran cross_wclk0_102 when v(vco.wclk0)=0.35 cross=102 
.meas tran cross_wclk0_103 when v(vco.wclk0)=0.35 cross=103 
.meas tran cross_wclk0_104 when v(vco.wclk0)=0.35 cross=104 
.meas tran cross_wclk0_105 when v(vco.wclk0)=0.35 cross=105 
.meas tran cross_wclk0_106 when v(vco.wclk0)=0.35 cross=106 
.meas tran cross_wclk0_107 when v(vco.wclk0)=0.35 cross=107 
.meas tran cross_wclk0_108 when v(vco.wclk0)=0.35 cross=108 
.meas tran cross_wclk0_109 when v(vco.wclk0)=0.35 cross=109 
.meas tran cross_wclk0_110 when v(vco.wclk0)=0.35 cross=110 
.meas tran cross_wclk0_111 when v(vco.wclk0)=0.35 cross=111 
.meas tran cross_wclk0_112 when v(vco.wclk0)=0.35 cross=112 
.meas tran cross_wclk0_113 when v(vco.wclk0)=0.35 cross=113 
.meas tran cross_wclk0_114 when v(vco.wclk0)=0.35 cross=114 
.meas tran cross_wclk0_115 when v(vco.wclk0)=0.35 cross=115 
.meas tran cross_wclk0_116 when v(vco.wclk0)=0.35 cross=116 
.meas tran cross_wclk0_117 when v(vco.wclk0)=0.35 cross=117 
.meas tran cross_wclk0_118 when v(vco.wclk0)=0.35 cross=118 
.meas tran cross_wclk0_119 when v(vco.wclk0)=0.35 cross=119 
.meas tran cross_wclk0_120 when v(vco.wclk0)=0.35 cross=120 
.meas tran cross_wclk0_121 when v(vco.wclk0)=0.35 cross=121 
.meas tran cross_wclk0_122 when v(vco.wclk0)=0.35 cross=122 
.meas tran cross_wclk0_123 when v(vco.wclk0)=0.35 cross=123 
.meas tran cross_wclk0_124 when v(vco.wclk0)=0.35 cross=124 
.meas tran cross_wclk0_125 when v(vco.wclk0)=0.35 cross=125 
.meas tran cross_wclk0_126 when v(vco.wclk0)=0.35 cross=126 
.meas tran cross_wclk0_127 when v(vco.wclk0)=0.35 cross=127 
.meas tran cross_wclk0_128 when v(vco.wclk0)=0.35 cross=128 
.meas tran cross_wclk0_129 when v(vco.wclk0)=0.35 cross=129 
.meas tran cross_wclk0_130 when v(vco.wclk0)=0.35 cross=130 
.meas tran cross_wclk0_131 when v(vco.wclk0)=0.35 cross=131 
.meas tran cross_wclk0_132 when v(vco.wclk0)=0.35 cross=132 
.meas tran cross_wclk0_133 when v(vco.wclk0)=0.35 cross=133 
.meas tran cross_wclk0_134 when v(vco.wclk0)=0.35 cross=134 
.meas tran cross_wclk0_135 when v(vco.wclk0)=0.35 cross=135 
.meas tran cross_wclk0_136 when v(vco.wclk0)=0.35 cross=136 
.meas tran cross_wclk0_137 when v(vco.wclk0)=0.35 cross=137 
.meas tran cross_wclk0_138 when v(vco.wclk0)=0.35 cross=138 
.meas tran cross_wclk0_139 when v(vco.wclk0)=0.35 cross=139 
.meas tran cross_wclk0_140 when v(vco.wclk0)=0.35 cross=140 
.meas tran cross_wclk0_141 when v(vco.wclk0)=0.35 cross=141 
.meas tran cross_wclk0_142 when v(vco.wclk0)=0.35 cross=142 
.meas tran cross_wclk0_143 when v(vco.wclk0)=0.35 cross=143 
.meas tran cross_wclk0_144 when v(vco.wclk0)=0.35 cross=144 
.meas tran cross_wclk0_145 when v(vco.wclk0)=0.35 cross=145 
.meas tran cross_wclk0_146 when v(vco.wclk0)=0.35 cross=146 
.meas tran cross_wclk0_147 when v(vco.wclk0)=0.35 cross=147 
.meas tran cross_wclk0_148 when v(vco.wclk0)=0.35 cross=148 
.meas tran cross_wclk0_149 when v(vco.wclk0)=0.35 cross=149 
.meas tran cross_wclk0_150 when v(vco.wclk0)=0.35 cross=150 
.meas tran cross_wclk0_151 when v(vco.wclk0)=0.35 cross=151 
.meas tran cross_wclk0_152 when v(vco.wclk0)=0.35 cross=152 
.meas tran cross_wclk0_153 when v(vco.wclk0)=0.35 cross=153 
.meas tran cross_wclk0_154 when v(vco.wclk0)=0.35 cross=154 
.meas tran cross_wclk0_155 when v(vco.wclk0)=0.35 cross=155 
.meas tran cross_wclk0_156 when v(vco.wclk0)=0.35 cross=156 
.meas tran cross_wclk0_157 when v(vco.wclk0)=0.35 cross=157 
.meas tran cross_wclk0_158 when v(vco.wclk0)=0.35 cross=158 
.meas tran cross_wclk0_159 when v(vco.wclk0)=0.35 cross=159 
.meas tran cross_wclk0_160 when v(vco.wclk0)=0.35 cross=160 
.meas tran cross_wclk0_161 when v(vco.wclk0)=0.35 cross=161 
.meas tran cross_wclk0_162 when v(vco.wclk0)=0.35 cross=162 
.meas tran cross_wclk0_163 when v(vco.wclk0)=0.35 cross=163 
.meas tran cross_wclk0_164 when v(vco.wclk0)=0.35 cross=164 
.meas tran cross_wclk0_165 when v(vco.wclk0)=0.35 cross=165 
.meas tran cross_wclk0_166 when v(vco.wclk0)=0.35 cross=166 
.meas tran cross_wclk0_167 when v(vco.wclk0)=0.35 cross=167 
.meas tran cross_wclk0_168 when v(vco.wclk0)=0.35 cross=168 
.meas tran cross_wclk0_169 when v(vco.wclk0)=0.35 cross=169 
.meas tran cross_wclk0_170 when v(vco.wclk0)=0.35 cross=170 
.meas tran cross_wclk0_171 when v(vco.wclk0)=0.35 cross=171 
.meas tran cross_wclk0_172 when v(vco.wclk0)=0.35 cross=172 
.meas tran cross_wclk0_173 when v(vco.wclk0)=0.35 cross=173 
.meas tran cross_wclk0_174 when v(vco.wclk0)=0.35 cross=174 
.meas tran cross_wclk0_175 when v(vco.wclk0)=0.35 cross=175 
.meas tran cross_wclk0_176 when v(vco.wclk0)=0.35 cross=176 
.meas tran cross_wclk0_177 when v(vco.wclk0)=0.35 cross=177 
.meas tran cross_wclk0_178 when v(vco.wclk0)=0.35 cross=178 
.meas tran cross_wclk0_179 when v(vco.wclk0)=0.35 cross=179 
.meas tran cross_wclk0_180 when v(vco.wclk0)=0.35 cross=180 
.meas tran cross_wclk0_181 when v(vco.wclk0)=0.35 cross=181 
.meas tran cross_wclk0_182 when v(vco.wclk0)=0.35 cross=182 
.meas tran cross_wclk0_183 when v(vco.wclk0)=0.35 cross=183 
.meas tran cross_wclk0_184 when v(vco.wclk0)=0.35 cross=184 
.meas tran cross_wclk0_185 when v(vco.wclk0)=0.35 cross=185 
.meas tran cross_wclk0_186 when v(vco.wclk0)=0.35 cross=186 
.meas tran cross_wclk0_187 when v(vco.wclk0)=0.35 cross=187 
.meas tran cross_wclk0_188 when v(vco.wclk0)=0.35 cross=188 
.meas tran cross_wclk0_189 when v(vco.wclk0)=0.35 cross=189 
.meas tran cross_wclk0_190 when v(vco.wclk0)=0.35 cross=190 
.meas tran cross_wclk0_191 when v(vco.wclk0)=0.35 cross=191 
.meas tran cross_wclk0_192 when v(vco.wclk0)=0.35 cross=192 
.meas tran cross_wclk0_193 when v(vco.wclk0)=0.35 cross=193 
.meas tran cross_wclk0_194 when v(vco.wclk0)=0.35 cross=194 
.meas tran cross_wclk0_195 when v(vco.wclk0)=0.35 cross=195 
.meas tran cross_wclk0_196 when v(vco.wclk0)=0.35 cross=196 
.meas tran cross_wclk0_197 when v(vco.wclk0)=0.35 cross=197 
.meas tran cross_wclk0_198 when v(vco.wclk0)=0.35 cross=198 
.meas tran cross_wclk0_199 when v(vco.wclk0)=0.35 cross=199 
.meas tran cross_wclk0_200 when v(vco.wclk0)=0.35 cross=200 
.meas tran cross_wclk0_201 when v(vco.wclk0)=0.35 cross=201 
.meas tran cross_wclk0_202 when v(vco.wclk0)=0.35 cross=202 
.meas tran cross_wclk0_203 when v(vco.wclk0)=0.35 cross=203 
.meas tran cross_wclk0_204 when v(vco.wclk0)=0.35 cross=204 
.meas tran cross_wclk0_205 when v(vco.wclk0)=0.35 cross=205 
.meas tran cross_wclk0_206 when v(vco.wclk0)=0.35 cross=206 
.meas tran cross_wclk0_207 when v(vco.wclk0)=0.35 cross=207 
.meas tran cross_wclk0_208 when v(vco.wclk0)=0.35 cross=208 
.meas tran cross_wclk0_209 when v(vco.wclk0)=0.35 cross=209 
.meas tran cross_wclk0_210 when v(vco.wclk0)=0.35 cross=210 
.meas tran cross_wclk0_211 when v(vco.wclk0)=0.35 cross=211 
.meas tran cross_wclk0_212 when v(vco.wclk0)=0.35 cross=212 
.meas tran cross_wclk0_213 when v(vco.wclk0)=0.35 cross=213 
.meas tran cross_wclk0_214 when v(vco.wclk0)=0.35 cross=214 
.meas tran cross_wclk0_215 when v(vco.wclk0)=0.35 cross=215 
.meas tran cross_wclk0_216 when v(vco.wclk0)=0.35 cross=216 
.meas tran cross_wclk0_217 when v(vco.wclk0)=0.35 cross=217 
.meas tran cross_wclk0_218 when v(vco.wclk0)=0.35 cross=218 
.meas tran cross_wclk0_219 when v(vco.wclk0)=0.35 cross=219 
.meas tran cross_wclk0_220 when v(vco.wclk0)=0.35 cross=220 
.meas tran cross_wclk0_221 when v(vco.wclk0)=0.35 cross=221 
.meas tran cross_wclk0_222 when v(vco.wclk0)=0.35 cross=222 
.meas tran cross_wclk0_223 when v(vco.wclk0)=0.35 cross=223 
.meas tran cross_wclk0_224 when v(vco.wclk0)=0.35 cross=224 
.meas tran cross_wclk0_225 when v(vco.wclk0)=0.35 cross=225 
.meas tran cross_wclk0_226 when v(vco.wclk0)=0.35 cross=226 
.meas tran cross_wclk0_227 when v(vco.wclk0)=0.35 cross=227 
.meas tran cross_wclk0_228 when v(vco.wclk0)=0.35 cross=228 
.meas tran cross_wclk0_229 when v(vco.wclk0)=0.35 cross=229 
.meas tran cross_wclk0_230 when v(vco.wclk0)=0.35 cross=230 
.meas tran cross_wclk0_231 when v(vco.wclk0)=0.35 cross=231 
.meas tran cross_wclk0_232 when v(vco.wclk0)=0.35 cross=232 
.meas tran cross_wclk0_233 when v(vco.wclk0)=0.35 cross=233 
.meas tran cross_wclk0_234 when v(vco.wclk0)=0.35 cross=234 
.meas tran cross_wclk0_235 when v(vco.wclk0)=0.35 cross=235 
.meas tran cross_wclk0_236 when v(vco.wclk0)=0.35 cross=236 
.meas tran cross_wclk0_237 when v(vco.wclk0)=0.35 cross=237 
.meas tran cross_wclk0_238 when v(vco.wclk0)=0.35 cross=238 
.meas tran cross_wclk0_239 when v(vco.wclk0)=0.35 cross=239 
.meas tran cross_wclk0_240 when v(vco.wclk0)=0.35 cross=240 
.meas tran cross_wclk0_241 when v(vco.wclk0)=0.35 cross=241 
.meas tran cross_wclk0_242 when v(vco.wclk0)=0.35 cross=242 
.meas tran cross_wclk0_243 when v(vco.wclk0)=0.35 cross=243 
.meas tran cross_wclk0_244 when v(vco.wclk0)=0.35 cross=244 
.meas tran cross_wclk0_245 when v(vco.wclk0)=0.35 cross=245 
.meas tran cross_wclk0_246 when v(vco.wclk0)=0.35 cross=246 
.meas tran cross_wclk0_247 when v(vco.wclk0)=0.35 cross=247 
.meas tran cross_wclk0_248 when v(vco.wclk0)=0.35 cross=248 
.meas tran cross_wclk0_249 when v(vco.wclk0)=0.35 cross=249 
.meas tran cross_wclk1_0 when v(vco.wclk1)=0.35 cross=0 
.meas tran cross_wclk1_1 when v(vco.wclk1)=0.35 cross=1 
.meas tran cross_wclk1_2 when v(vco.wclk1)=0.35 cross=2 
.meas tran cross_wclk1_3 when v(vco.wclk1)=0.35 cross=3 
.meas tran cross_wclk1_4 when v(vco.wclk1)=0.35 cross=4 
.meas tran cross_wclk1_5 when v(vco.wclk1)=0.35 cross=5 
.meas tran cross_wclk1_6 when v(vco.wclk1)=0.35 cross=6 
.meas tran cross_wclk1_7 when v(vco.wclk1)=0.35 cross=7 
.meas tran cross_wclk1_8 when v(vco.wclk1)=0.35 cross=8 
.meas tran cross_wclk1_9 when v(vco.wclk1)=0.35 cross=9 
.meas tran cross_wclk1_10 when v(vco.wclk1)=0.35 cross=10 
.meas tran cross_wclk1_11 when v(vco.wclk1)=0.35 cross=11 
.meas tran cross_wclk1_12 when v(vco.wclk1)=0.35 cross=12 
.meas tran cross_wclk1_13 when v(vco.wclk1)=0.35 cross=13 
.meas tran cross_wclk1_14 when v(vco.wclk1)=0.35 cross=14 
.meas tran cross_wclk1_15 when v(vco.wclk1)=0.35 cross=15 
.meas tran cross_wclk1_16 when v(vco.wclk1)=0.35 cross=16 
.meas tran cross_wclk1_17 when v(vco.wclk1)=0.35 cross=17 
.meas tran cross_wclk1_18 when v(vco.wclk1)=0.35 cross=18 
.meas tran cross_wclk1_19 when v(vco.wclk1)=0.35 cross=19 
.meas tran cross_wclk1_20 when v(vco.wclk1)=0.35 cross=20 
.meas tran cross_wclk1_21 when v(vco.wclk1)=0.35 cross=21 
.meas tran cross_wclk1_22 when v(vco.wclk1)=0.35 cross=22 
.meas tran cross_wclk1_23 when v(vco.wclk1)=0.35 cross=23 
.meas tran cross_wclk1_24 when v(vco.wclk1)=0.35 cross=24 
.meas tran cross_wclk1_25 when v(vco.wclk1)=0.35 cross=25 
.meas tran cross_wclk1_26 when v(vco.wclk1)=0.35 cross=26 
.meas tran cross_wclk1_27 when v(vco.wclk1)=0.35 cross=27 
.meas tran cross_wclk1_28 when v(vco.wclk1)=0.35 cross=28 
.meas tran cross_wclk1_29 when v(vco.wclk1)=0.35 cross=29 
.meas tran cross_wclk1_30 when v(vco.wclk1)=0.35 cross=30 
.meas tran cross_wclk1_31 when v(vco.wclk1)=0.35 cross=31 
.meas tran cross_wclk1_32 when v(vco.wclk1)=0.35 cross=32 
.meas tran cross_wclk1_33 when v(vco.wclk1)=0.35 cross=33 
.meas tran cross_wclk1_34 when v(vco.wclk1)=0.35 cross=34 
.meas tran cross_wclk1_35 when v(vco.wclk1)=0.35 cross=35 
.meas tran cross_wclk1_36 when v(vco.wclk1)=0.35 cross=36 
.meas tran cross_wclk1_37 when v(vco.wclk1)=0.35 cross=37 
.meas tran cross_wclk1_38 when v(vco.wclk1)=0.35 cross=38 
.meas tran cross_wclk1_39 when v(vco.wclk1)=0.35 cross=39 
.meas tran cross_wclk1_40 when v(vco.wclk1)=0.35 cross=40 
.meas tran cross_wclk1_41 when v(vco.wclk1)=0.35 cross=41 
.meas tran cross_wclk1_42 when v(vco.wclk1)=0.35 cross=42 
.meas tran cross_wclk1_43 when v(vco.wclk1)=0.35 cross=43 
.meas tran cross_wclk1_44 when v(vco.wclk1)=0.35 cross=44 
.meas tran cross_wclk1_45 when v(vco.wclk1)=0.35 cross=45 
.meas tran cross_wclk1_46 when v(vco.wclk1)=0.35 cross=46 
.meas tran cross_wclk1_47 when v(vco.wclk1)=0.35 cross=47 
.meas tran cross_wclk1_48 when v(vco.wclk1)=0.35 cross=48 
.meas tran cross_wclk1_49 when v(vco.wclk1)=0.35 cross=49 
.meas tran cross_wclk1_50 when v(vco.wclk1)=0.35 cross=50 
.meas tran cross_wclk1_51 when v(vco.wclk1)=0.35 cross=51 
.meas tran cross_wclk1_52 when v(vco.wclk1)=0.35 cross=52 
.meas tran cross_wclk1_53 when v(vco.wclk1)=0.35 cross=53 
.meas tran cross_wclk1_54 when v(vco.wclk1)=0.35 cross=54 
.meas tran cross_wclk1_55 when v(vco.wclk1)=0.35 cross=55 
.meas tran cross_wclk1_56 when v(vco.wclk1)=0.35 cross=56 
.meas tran cross_wclk1_57 when v(vco.wclk1)=0.35 cross=57 
.meas tran cross_wclk1_58 when v(vco.wclk1)=0.35 cross=58 
.meas tran cross_wclk1_59 when v(vco.wclk1)=0.35 cross=59 
.meas tran cross_wclk1_60 when v(vco.wclk1)=0.35 cross=60 
.meas tran cross_wclk1_61 when v(vco.wclk1)=0.35 cross=61 
.meas tran cross_wclk1_62 when v(vco.wclk1)=0.35 cross=62 
.meas tran cross_wclk1_63 when v(vco.wclk1)=0.35 cross=63 
.meas tran cross_wclk1_64 when v(vco.wclk1)=0.35 cross=64 
.meas tran cross_wclk1_65 when v(vco.wclk1)=0.35 cross=65 
.meas tran cross_wclk1_66 when v(vco.wclk1)=0.35 cross=66 
.meas tran cross_wclk1_67 when v(vco.wclk1)=0.35 cross=67 
.meas tran cross_wclk1_68 when v(vco.wclk1)=0.35 cross=68 
.meas tran cross_wclk1_69 when v(vco.wclk1)=0.35 cross=69 
.meas tran cross_wclk1_70 when v(vco.wclk1)=0.35 cross=70 
.meas tran cross_wclk1_71 when v(vco.wclk1)=0.35 cross=71 
.meas tran cross_wclk1_72 when v(vco.wclk1)=0.35 cross=72 
.meas tran cross_wclk1_73 when v(vco.wclk1)=0.35 cross=73 
.meas tran cross_wclk1_74 when v(vco.wclk1)=0.35 cross=74 
.meas tran cross_wclk1_75 when v(vco.wclk1)=0.35 cross=75 
.meas tran cross_wclk1_76 when v(vco.wclk1)=0.35 cross=76 
.meas tran cross_wclk1_77 when v(vco.wclk1)=0.35 cross=77 
.meas tran cross_wclk1_78 when v(vco.wclk1)=0.35 cross=78 
.meas tran cross_wclk1_79 when v(vco.wclk1)=0.35 cross=79 
.meas tran cross_wclk1_80 when v(vco.wclk1)=0.35 cross=80 
.meas tran cross_wclk1_81 when v(vco.wclk1)=0.35 cross=81 
.meas tran cross_wclk1_82 when v(vco.wclk1)=0.35 cross=82 
.meas tran cross_wclk1_83 when v(vco.wclk1)=0.35 cross=83 
.meas tran cross_wclk1_84 when v(vco.wclk1)=0.35 cross=84 
.meas tran cross_wclk1_85 when v(vco.wclk1)=0.35 cross=85 
.meas tran cross_wclk1_86 when v(vco.wclk1)=0.35 cross=86 
.meas tran cross_wclk1_87 when v(vco.wclk1)=0.35 cross=87 
.meas tran cross_wclk1_88 when v(vco.wclk1)=0.35 cross=88 
.meas tran cross_wclk1_89 when v(vco.wclk1)=0.35 cross=89 
.meas tran cross_wclk1_90 when v(vco.wclk1)=0.35 cross=90 
.meas tran cross_wclk1_91 when v(vco.wclk1)=0.35 cross=91 
.meas tran cross_wclk1_92 when v(vco.wclk1)=0.35 cross=92 
.meas tran cross_wclk1_93 when v(vco.wclk1)=0.35 cross=93 
.meas tran cross_wclk1_94 when v(vco.wclk1)=0.35 cross=94 
.meas tran cross_wclk1_95 when v(vco.wclk1)=0.35 cross=95 
.meas tran cross_wclk1_96 when v(vco.wclk1)=0.35 cross=96 
.meas tran cross_wclk1_97 when v(vco.wclk1)=0.35 cross=97 
.meas tran cross_wclk1_98 when v(vco.wclk1)=0.35 cross=98 
.meas tran cross_wclk1_99 when v(vco.wclk1)=0.35 cross=99 
.meas tran cross_wclk1_100 when v(vco.wclk1)=0.35 cross=100 
.meas tran cross_wclk1_101 when v(vco.wclk1)=0.35 cross=101 
.meas tran cross_wclk1_102 when v(vco.wclk1)=0.35 cross=102 
.meas tran cross_wclk1_103 when v(vco.wclk1)=0.35 cross=103 
.meas tran cross_wclk1_104 when v(vco.wclk1)=0.35 cross=104 
.meas tran cross_wclk1_105 when v(vco.wclk1)=0.35 cross=105 
.meas tran cross_wclk1_106 when v(vco.wclk1)=0.35 cross=106 
.meas tran cross_wclk1_107 when v(vco.wclk1)=0.35 cross=107 
.meas tran cross_wclk1_108 when v(vco.wclk1)=0.35 cross=108 
.meas tran cross_wclk1_109 when v(vco.wclk1)=0.35 cross=109 
.meas tran cross_wclk1_110 when v(vco.wclk1)=0.35 cross=110 
.meas tran cross_wclk1_111 when v(vco.wclk1)=0.35 cross=111 
.meas tran cross_wclk1_112 when v(vco.wclk1)=0.35 cross=112 
.meas tran cross_wclk1_113 when v(vco.wclk1)=0.35 cross=113 
.meas tran cross_wclk1_114 when v(vco.wclk1)=0.35 cross=114 
.meas tran cross_wclk1_115 when v(vco.wclk1)=0.35 cross=115 
.meas tran cross_wclk1_116 when v(vco.wclk1)=0.35 cross=116 
.meas tran cross_wclk1_117 when v(vco.wclk1)=0.35 cross=117 
.meas tran cross_wclk1_118 when v(vco.wclk1)=0.35 cross=118 
.meas tran cross_wclk1_119 when v(vco.wclk1)=0.35 cross=119 
.meas tran cross_wclk1_120 when v(vco.wclk1)=0.35 cross=120 
.meas tran cross_wclk1_121 when v(vco.wclk1)=0.35 cross=121 
.meas tran cross_wclk1_122 when v(vco.wclk1)=0.35 cross=122 
.meas tran cross_wclk1_123 when v(vco.wclk1)=0.35 cross=123 
.meas tran cross_wclk1_124 when v(vco.wclk1)=0.35 cross=124 
.meas tran cross_wclk1_125 when v(vco.wclk1)=0.35 cross=125 
.meas tran cross_wclk1_126 when v(vco.wclk1)=0.35 cross=126 
.meas tran cross_wclk1_127 when v(vco.wclk1)=0.35 cross=127 
.meas tran cross_wclk1_128 when v(vco.wclk1)=0.35 cross=128 
.meas tran cross_wclk1_129 when v(vco.wclk1)=0.35 cross=129 
.meas tran cross_wclk1_130 when v(vco.wclk1)=0.35 cross=130 
.meas tran cross_wclk1_131 when v(vco.wclk1)=0.35 cross=131 
.meas tran cross_wclk1_132 when v(vco.wclk1)=0.35 cross=132 
.meas tran cross_wclk1_133 when v(vco.wclk1)=0.35 cross=133 
.meas tran cross_wclk1_134 when v(vco.wclk1)=0.35 cross=134 
.meas tran cross_wclk1_135 when v(vco.wclk1)=0.35 cross=135 
.meas tran cross_wclk1_136 when v(vco.wclk1)=0.35 cross=136 
.meas tran cross_wclk1_137 when v(vco.wclk1)=0.35 cross=137 
.meas tran cross_wclk1_138 when v(vco.wclk1)=0.35 cross=138 
.meas tran cross_wclk1_139 when v(vco.wclk1)=0.35 cross=139 
.meas tran cross_wclk1_140 when v(vco.wclk1)=0.35 cross=140 
.meas tran cross_wclk1_141 when v(vco.wclk1)=0.35 cross=141 
.meas tran cross_wclk1_142 when v(vco.wclk1)=0.35 cross=142 
.meas tran cross_wclk1_143 when v(vco.wclk1)=0.35 cross=143 
.meas tran cross_wclk1_144 when v(vco.wclk1)=0.35 cross=144 
.meas tran cross_wclk1_145 when v(vco.wclk1)=0.35 cross=145 
.meas tran cross_wclk1_146 when v(vco.wclk1)=0.35 cross=146 
.meas tran cross_wclk1_147 when v(vco.wclk1)=0.35 cross=147 
.meas tran cross_wclk1_148 when v(vco.wclk1)=0.35 cross=148 
.meas tran cross_wclk1_149 when v(vco.wclk1)=0.35 cross=149 
.meas tran cross_wclk1_150 when v(vco.wclk1)=0.35 cross=150 
.meas tran cross_wclk1_151 when v(vco.wclk1)=0.35 cross=151 
.meas tran cross_wclk1_152 when v(vco.wclk1)=0.35 cross=152 
.meas tran cross_wclk1_153 when v(vco.wclk1)=0.35 cross=153 
.meas tran cross_wclk1_154 when v(vco.wclk1)=0.35 cross=154 
.meas tran cross_wclk1_155 when v(vco.wclk1)=0.35 cross=155 
.meas tran cross_wclk1_156 when v(vco.wclk1)=0.35 cross=156 
.meas tran cross_wclk1_157 when v(vco.wclk1)=0.35 cross=157 
.meas tran cross_wclk1_158 when v(vco.wclk1)=0.35 cross=158 
.meas tran cross_wclk1_159 when v(vco.wclk1)=0.35 cross=159 
.meas tran cross_wclk1_160 when v(vco.wclk1)=0.35 cross=160 
.meas tran cross_wclk1_161 when v(vco.wclk1)=0.35 cross=161 
.meas tran cross_wclk1_162 when v(vco.wclk1)=0.35 cross=162 
.meas tran cross_wclk1_163 when v(vco.wclk1)=0.35 cross=163 
.meas tran cross_wclk1_164 when v(vco.wclk1)=0.35 cross=164 
.meas tran cross_wclk1_165 when v(vco.wclk1)=0.35 cross=165 
.meas tran cross_wclk1_166 when v(vco.wclk1)=0.35 cross=166 
.meas tran cross_wclk1_167 when v(vco.wclk1)=0.35 cross=167 
.meas tran cross_wclk1_168 when v(vco.wclk1)=0.35 cross=168 
.meas tran cross_wclk1_169 when v(vco.wclk1)=0.35 cross=169 
.meas tran cross_wclk1_170 when v(vco.wclk1)=0.35 cross=170 
.meas tran cross_wclk1_171 when v(vco.wclk1)=0.35 cross=171 
.meas tran cross_wclk1_172 when v(vco.wclk1)=0.35 cross=172 
.meas tran cross_wclk1_173 when v(vco.wclk1)=0.35 cross=173 
.meas tran cross_wclk1_174 when v(vco.wclk1)=0.35 cross=174 
.meas tran cross_wclk1_175 when v(vco.wclk1)=0.35 cross=175 
.meas tran cross_wclk1_176 when v(vco.wclk1)=0.35 cross=176 
.meas tran cross_wclk1_177 when v(vco.wclk1)=0.35 cross=177 
.meas tran cross_wclk1_178 when v(vco.wclk1)=0.35 cross=178 
.meas tran cross_wclk1_179 when v(vco.wclk1)=0.35 cross=179 
.meas tran cross_wclk1_180 when v(vco.wclk1)=0.35 cross=180 
.meas tran cross_wclk1_181 when v(vco.wclk1)=0.35 cross=181 
.meas tran cross_wclk1_182 when v(vco.wclk1)=0.35 cross=182 
.meas tran cross_wclk1_183 when v(vco.wclk1)=0.35 cross=183 
.meas tran cross_wclk1_184 when v(vco.wclk1)=0.35 cross=184 
.meas tran cross_wclk1_185 when v(vco.wclk1)=0.35 cross=185 
.meas tran cross_wclk1_186 when v(vco.wclk1)=0.35 cross=186 
.meas tran cross_wclk1_187 when v(vco.wclk1)=0.35 cross=187 
.meas tran cross_wclk1_188 when v(vco.wclk1)=0.35 cross=188 
.meas tran cross_wclk1_189 when v(vco.wclk1)=0.35 cross=189 
.meas tran cross_wclk1_190 when v(vco.wclk1)=0.35 cross=190 
.meas tran cross_wclk1_191 when v(vco.wclk1)=0.35 cross=191 
.meas tran cross_wclk1_192 when v(vco.wclk1)=0.35 cross=192 
.meas tran cross_wclk1_193 when v(vco.wclk1)=0.35 cross=193 
.meas tran cross_wclk1_194 when v(vco.wclk1)=0.35 cross=194 
.meas tran cross_wclk1_195 when v(vco.wclk1)=0.35 cross=195 
.meas tran cross_wclk1_196 when v(vco.wclk1)=0.35 cross=196 
.meas tran cross_wclk1_197 when v(vco.wclk1)=0.35 cross=197 
.meas tran cross_wclk1_198 when v(vco.wclk1)=0.35 cross=198 
.meas tran cross_wclk1_199 when v(vco.wclk1)=0.35 cross=199 
.meas tran cross_wclk1_200 when v(vco.wclk1)=0.35 cross=200 
.meas tran cross_wclk1_201 when v(vco.wclk1)=0.35 cross=201 
.meas tran cross_wclk1_202 when v(vco.wclk1)=0.35 cross=202 
.meas tran cross_wclk1_203 when v(vco.wclk1)=0.35 cross=203 
.meas tran cross_wclk1_204 when v(vco.wclk1)=0.35 cross=204 
.meas tran cross_wclk1_205 when v(vco.wclk1)=0.35 cross=205 
.meas tran cross_wclk1_206 when v(vco.wclk1)=0.35 cross=206 
.meas tran cross_wclk1_207 when v(vco.wclk1)=0.35 cross=207 
.meas tran cross_wclk1_208 when v(vco.wclk1)=0.35 cross=208 
.meas tran cross_wclk1_209 when v(vco.wclk1)=0.35 cross=209 
.meas tran cross_wclk1_210 when v(vco.wclk1)=0.35 cross=210 
.meas tran cross_wclk1_211 when v(vco.wclk1)=0.35 cross=211 
.meas tran cross_wclk1_212 when v(vco.wclk1)=0.35 cross=212 
.meas tran cross_wclk1_213 when v(vco.wclk1)=0.35 cross=213 
.meas tran cross_wclk1_214 when v(vco.wclk1)=0.35 cross=214 
.meas tran cross_wclk1_215 when v(vco.wclk1)=0.35 cross=215 
.meas tran cross_wclk1_216 when v(vco.wclk1)=0.35 cross=216 
.meas tran cross_wclk1_217 when v(vco.wclk1)=0.35 cross=217 
.meas tran cross_wclk1_218 when v(vco.wclk1)=0.35 cross=218 
.meas tran cross_wclk1_219 when v(vco.wclk1)=0.35 cross=219 
.meas tran cross_wclk1_220 when v(vco.wclk1)=0.35 cross=220 
.meas tran cross_wclk1_221 when v(vco.wclk1)=0.35 cross=221 
.meas tran cross_wclk1_222 when v(vco.wclk1)=0.35 cross=222 
.meas tran cross_wclk1_223 when v(vco.wclk1)=0.35 cross=223 
.meas tran cross_wclk1_224 when v(vco.wclk1)=0.35 cross=224 
.meas tran cross_wclk1_225 when v(vco.wclk1)=0.35 cross=225 
.meas tran cross_wclk1_226 when v(vco.wclk1)=0.35 cross=226 
.meas tran cross_wclk1_227 when v(vco.wclk1)=0.35 cross=227 
.meas tran cross_wclk1_228 when v(vco.wclk1)=0.35 cross=228 
.meas tran cross_wclk1_229 when v(vco.wclk1)=0.35 cross=229 
.meas tran cross_wclk1_230 when v(vco.wclk1)=0.35 cross=230 
.meas tran cross_wclk1_231 when v(vco.wclk1)=0.35 cross=231 
.meas tran cross_wclk1_232 when v(vco.wclk1)=0.35 cross=232 
.meas tran cross_wclk1_233 when v(vco.wclk1)=0.35 cross=233 
.meas tran cross_wclk1_234 when v(vco.wclk1)=0.35 cross=234 
.meas tran cross_wclk1_235 when v(vco.wclk1)=0.35 cross=235 
.meas tran cross_wclk1_236 when v(vco.wclk1)=0.35 cross=236 
.meas tran cross_wclk1_237 when v(vco.wclk1)=0.35 cross=237 
.meas tran cross_wclk1_238 when v(vco.wclk1)=0.35 cross=238 
.meas tran cross_wclk1_239 when v(vco.wclk1)=0.35 cross=239 
.meas tran cross_wclk1_240 when v(vco.wclk1)=0.35 cross=240 
.meas tran cross_wclk1_241 when v(vco.wclk1)=0.35 cross=241 
.meas tran cross_wclk1_242 when v(vco.wclk1)=0.35 cross=242 
.meas tran cross_wclk1_243 when v(vco.wclk1)=0.35 cross=243 
.meas tran cross_wclk1_244 when v(vco.wclk1)=0.35 cross=244 
.meas tran cross_wclk1_245 when v(vco.wclk1)=0.35 cross=245 
.meas tran cross_wclk1_246 when v(vco.wclk1)=0.35 cross=246 
.meas tran cross_wclk1_247 when v(vco.wclk1)=0.35 cross=247 
.meas tran cross_wclk1_248 when v(vco.wclk1)=0.35 cross=248 
.meas tran cross_wclk1_249 when v(vco.wclk1)=0.35 cross=249 
.meas tran cross_wclk2_0 when v(vco.wclk2)=0.35 cross=0 
.meas tran cross_wclk2_1 when v(vco.wclk2)=0.35 cross=1 
.meas tran cross_wclk2_2 when v(vco.wclk2)=0.35 cross=2 
.meas tran cross_wclk2_3 when v(vco.wclk2)=0.35 cross=3 
.meas tran cross_wclk2_4 when v(vco.wclk2)=0.35 cross=4 
.meas tran cross_wclk2_5 when v(vco.wclk2)=0.35 cross=5 
.meas tran cross_wclk2_6 when v(vco.wclk2)=0.35 cross=6 
.meas tran cross_wclk2_7 when v(vco.wclk2)=0.35 cross=7 
.meas tran cross_wclk2_8 when v(vco.wclk2)=0.35 cross=8 
.meas tran cross_wclk2_9 when v(vco.wclk2)=0.35 cross=9 
.meas tran cross_wclk2_10 when v(vco.wclk2)=0.35 cross=10 
.meas tran cross_wclk2_11 when v(vco.wclk2)=0.35 cross=11 
.meas tran cross_wclk2_12 when v(vco.wclk2)=0.35 cross=12 
.meas tran cross_wclk2_13 when v(vco.wclk2)=0.35 cross=13 
.meas tran cross_wclk2_14 when v(vco.wclk2)=0.35 cross=14 
.meas tran cross_wclk2_15 when v(vco.wclk2)=0.35 cross=15 
.meas tran cross_wclk2_16 when v(vco.wclk2)=0.35 cross=16 
.meas tran cross_wclk2_17 when v(vco.wclk2)=0.35 cross=17 
.meas tran cross_wclk2_18 when v(vco.wclk2)=0.35 cross=18 
.meas tran cross_wclk2_19 when v(vco.wclk2)=0.35 cross=19 
.meas tran cross_wclk2_20 when v(vco.wclk2)=0.35 cross=20 
.meas tran cross_wclk2_21 when v(vco.wclk2)=0.35 cross=21 
.meas tran cross_wclk2_22 when v(vco.wclk2)=0.35 cross=22 
.meas tran cross_wclk2_23 when v(vco.wclk2)=0.35 cross=23 
.meas tran cross_wclk2_24 when v(vco.wclk2)=0.35 cross=24 
.meas tran cross_wclk2_25 when v(vco.wclk2)=0.35 cross=25 
.meas tran cross_wclk2_26 when v(vco.wclk2)=0.35 cross=26 
.meas tran cross_wclk2_27 when v(vco.wclk2)=0.35 cross=27 
.meas tran cross_wclk2_28 when v(vco.wclk2)=0.35 cross=28 
.meas tran cross_wclk2_29 when v(vco.wclk2)=0.35 cross=29 
.meas tran cross_wclk2_30 when v(vco.wclk2)=0.35 cross=30 
.meas tran cross_wclk2_31 when v(vco.wclk2)=0.35 cross=31 
.meas tran cross_wclk2_32 when v(vco.wclk2)=0.35 cross=32 
.meas tran cross_wclk2_33 when v(vco.wclk2)=0.35 cross=33 
.meas tran cross_wclk2_34 when v(vco.wclk2)=0.35 cross=34 
.meas tran cross_wclk2_35 when v(vco.wclk2)=0.35 cross=35 
.meas tran cross_wclk2_36 when v(vco.wclk2)=0.35 cross=36 
.meas tran cross_wclk2_37 when v(vco.wclk2)=0.35 cross=37 
.meas tran cross_wclk2_38 when v(vco.wclk2)=0.35 cross=38 
.meas tran cross_wclk2_39 when v(vco.wclk2)=0.35 cross=39 
.meas tran cross_wclk2_40 when v(vco.wclk2)=0.35 cross=40 
.meas tran cross_wclk2_41 when v(vco.wclk2)=0.35 cross=41 
.meas tran cross_wclk2_42 when v(vco.wclk2)=0.35 cross=42 
.meas tran cross_wclk2_43 when v(vco.wclk2)=0.35 cross=43 
.meas tran cross_wclk2_44 when v(vco.wclk2)=0.35 cross=44 
.meas tran cross_wclk2_45 when v(vco.wclk2)=0.35 cross=45 
.meas tran cross_wclk2_46 when v(vco.wclk2)=0.35 cross=46 
.meas tran cross_wclk2_47 when v(vco.wclk2)=0.35 cross=47 
.meas tran cross_wclk2_48 when v(vco.wclk2)=0.35 cross=48 
.meas tran cross_wclk2_49 when v(vco.wclk2)=0.35 cross=49 
.meas tran cross_wclk2_50 when v(vco.wclk2)=0.35 cross=50 
.meas tran cross_wclk2_51 when v(vco.wclk2)=0.35 cross=51 
.meas tran cross_wclk2_52 when v(vco.wclk2)=0.35 cross=52 
.meas tran cross_wclk2_53 when v(vco.wclk2)=0.35 cross=53 
.meas tran cross_wclk2_54 when v(vco.wclk2)=0.35 cross=54 
.meas tran cross_wclk2_55 when v(vco.wclk2)=0.35 cross=55 
.meas tran cross_wclk2_56 when v(vco.wclk2)=0.35 cross=56 
.meas tran cross_wclk2_57 when v(vco.wclk2)=0.35 cross=57 
.meas tran cross_wclk2_58 when v(vco.wclk2)=0.35 cross=58 
.meas tran cross_wclk2_59 when v(vco.wclk2)=0.35 cross=59 
.meas tran cross_wclk2_60 when v(vco.wclk2)=0.35 cross=60 
.meas tran cross_wclk2_61 when v(vco.wclk2)=0.35 cross=61 
.meas tran cross_wclk2_62 when v(vco.wclk2)=0.35 cross=62 
.meas tran cross_wclk2_63 when v(vco.wclk2)=0.35 cross=63 
.meas tran cross_wclk2_64 when v(vco.wclk2)=0.35 cross=64 
.meas tran cross_wclk2_65 when v(vco.wclk2)=0.35 cross=65 
.meas tran cross_wclk2_66 when v(vco.wclk2)=0.35 cross=66 
.meas tran cross_wclk2_67 when v(vco.wclk2)=0.35 cross=67 
.meas tran cross_wclk2_68 when v(vco.wclk2)=0.35 cross=68 
.meas tran cross_wclk2_69 when v(vco.wclk2)=0.35 cross=69 
.meas tran cross_wclk2_70 when v(vco.wclk2)=0.35 cross=70 
.meas tran cross_wclk2_71 when v(vco.wclk2)=0.35 cross=71 
.meas tran cross_wclk2_72 when v(vco.wclk2)=0.35 cross=72 
.meas tran cross_wclk2_73 when v(vco.wclk2)=0.35 cross=73 
.meas tran cross_wclk2_74 when v(vco.wclk2)=0.35 cross=74 
.meas tran cross_wclk2_75 when v(vco.wclk2)=0.35 cross=75 
.meas tran cross_wclk2_76 when v(vco.wclk2)=0.35 cross=76 
.meas tran cross_wclk2_77 when v(vco.wclk2)=0.35 cross=77 
.meas tran cross_wclk2_78 when v(vco.wclk2)=0.35 cross=78 
.meas tran cross_wclk2_79 when v(vco.wclk2)=0.35 cross=79 
.meas tran cross_wclk2_80 when v(vco.wclk2)=0.35 cross=80 
.meas tran cross_wclk2_81 when v(vco.wclk2)=0.35 cross=81 
.meas tran cross_wclk2_82 when v(vco.wclk2)=0.35 cross=82 
.meas tran cross_wclk2_83 when v(vco.wclk2)=0.35 cross=83 
.meas tran cross_wclk2_84 when v(vco.wclk2)=0.35 cross=84 
.meas tran cross_wclk2_85 when v(vco.wclk2)=0.35 cross=85 
.meas tran cross_wclk2_86 when v(vco.wclk2)=0.35 cross=86 
.meas tran cross_wclk2_87 when v(vco.wclk2)=0.35 cross=87 
.meas tran cross_wclk2_88 when v(vco.wclk2)=0.35 cross=88 
.meas tran cross_wclk2_89 when v(vco.wclk2)=0.35 cross=89 
.meas tran cross_wclk2_90 when v(vco.wclk2)=0.35 cross=90 
.meas tran cross_wclk2_91 when v(vco.wclk2)=0.35 cross=91 
.meas tran cross_wclk2_92 when v(vco.wclk2)=0.35 cross=92 
.meas tran cross_wclk2_93 when v(vco.wclk2)=0.35 cross=93 
.meas tran cross_wclk2_94 when v(vco.wclk2)=0.35 cross=94 
.meas tran cross_wclk2_95 when v(vco.wclk2)=0.35 cross=95 
.meas tran cross_wclk2_96 when v(vco.wclk2)=0.35 cross=96 
.meas tran cross_wclk2_97 when v(vco.wclk2)=0.35 cross=97 
.meas tran cross_wclk2_98 when v(vco.wclk2)=0.35 cross=98 
.meas tran cross_wclk2_99 when v(vco.wclk2)=0.35 cross=99 
.meas tran cross_wclk2_100 when v(vco.wclk2)=0.35 cross=100 
.meas tran cross_wclk2_101 when v(vco.wclk2)=0.35 cross=101 
.meas tran cross_wclk2_102 when v(vco.wclk2)=0.35 cross=102 
.meas tran cross_wclk2_103 when v(vco.wclk2)=0.35 cross=103 
.meas tran cross_wclk2_104 when v(vco.wclk2)=0.35 cross=104 
.meas tran cross_wclk2_105 when v(vco.wclk2)=0.35 cross=105 
.meas tran cross_wclk2_106 when v(vco.wclk2)=0.35 cross=106 
.meas tran cross_wclk2_107 when v(vco.wclk2)=0.35 cross=107 
.meas tran cross_wclk2_108 when v(vco.wclk2)=0.35 cross=108 
.meas tran cross_wclk2_109 when v(vco.wclk2)=0.35 cross=109 
.meas tran cross_wclk2_110 when v(vco.wclk2)=0.35 cross=110 
.meas tran cross_wclk2_111 when v(vco.wclk2)=0.35 cross=111 
.meas tran cross_wclk2_112 when v(vco.wclk2)=0.35 cross=112 
.meas tran cross_wclk2_113 when v(vco.wclk2)=0.35 cross=113 
.meas tran cross_wclk2_114 when v(vco.wclk2)=0.35 cross=114 
.meas tran cross_wclk2_115 when v(vco.wclk2)=0.35 cross=115 
.meas tran cross_wclk2_116 when v(vco.wclk2)=0.35 cross=116 
.meas tran cross_wclk2_117 when v(vco.wclk2)=0.35 cross=117 
.meas tran cross_wclk2_118 when v(vco.wclk2)=0.35 cross=118 
.meas tran cross_wclk2_119 when v(vco.wclk2)=0.35 cross=119 
.meas tran cross_wclk2_120 when v(vco.wclk2)=0.35 cross=120 
.meas tran cross_wclk2_121 when v(vco.wclk2)=0.35 cross=121 
.meas tran cross_wclk2_122 when v(vco.wclk2)=0.35 cross=122 
.meas tran cross_wclk2_123 when v(vco.wclk2)=0.35 cross=123 
.meas tran cross_wclk2_124 when v(vco.wclk2)=0.35 cross=124 
.meas tran cross_wclk2_125 when v(vco.wclk2)=0.35 cross=125 
.meas tran cross_wclk2_126 when v(vco.wclk2)=0.35 cross=126 
.meas tran cross_wclk2_127 when v(vco.wclk2)=0.35 cross=127 
.meas tran cross_wclk2_128 when v(vco.wclk2)=0.35 cross=128 
.meas tran cross_wclk2_129 when v(vco.wclk2)=0.35 cross=129 
.meas tran cross_wclk2_130 when v(vco.wclk2)=0.35 cross=130 
.meas tran cross_wclk2_131 when v(vco.wclk2)=0.35 cross=131 
.meas tran cross_wclk2_132 when v(vco.wclk2)=0.35 cross=132 
.meas tran cross_wclk2_133 when v(vco.wclk2)=0.35 cross=133 
.meas tran cross_wclk2_134 when v(vco.wclk2)=0.35 cross=134 
.meas tran cross_wclk2_135 when v(vco.wclk2)=0.35 cross=135 
.meas tran cross_wclk2_136 when v(vco.wclk2)=0.35 cross=136 
.meas tran cross_wclk2_137 when v(vco.wclk2)=0.35 cross=137 
.meas tran cross_wclk2_138 when v(vco.wclk2)=0.35 cross=138 
.meas tran cross_wclk2_139 when v(vco.wclk2)=0.35 cross=139 
.meas tran cross_wclk2_140 when v(vco.wclk2)=0.35 cross=140 
.meas tran cross_wclk2_141 when v(vco.wclk2)=0.35 cross=141 
.meas tran cross_wclk2_142 when v(vco.wclk2)=0.35 cross=142 
.meas tran cross_wclk2_143 when v(vco.wclk2)=0.35 cross=143 
.meas tran cross_wclk2_144 when v(vco.wclk2)=0.35 cross=144 
.meas tran cross_wclk2_145 when v(vco.wclk2)=0.35 cross=145 
.meas tran cross_wclk2_146 when v(vco.wclk2)=0.35 cross=146 
.meas tran cross_wclk2_147 when v(vco.wclk2)=0.35 cross=147 
.meas tran cross_wclk2_148 when v(vco.wclk2)=0.35 cross=148 
.meas tran cross_wclk2_149 when v(vco.wclk2)=0.35 cross=149 
.meas tran cross_wclk2_150 when v(vco.wclk2)=0.35 cross=150 
.meas tran cross_wclk2_151 when v(vco.wclk2)=0.35 cross=151 
.meas tran cross_wclk2_152 when v(vco.wclk2)=0.35 cross=152 
.meas tran cross_wclk2_153 when v(vco.wclk2)=0.35 cross=153 
.meas tran cross_wclk2_154 when v(vco.wclk2)=0.35 cross=154 
.meas tran cross_wclk2_155 when v(vco.wclk2)=0.35 cross=155 
.meas tran cross_wclk2_156 when v(vco.wclk2)=0.35 cross=156 
.meas tran cross_wclk2_157 when v(vco.wclk2)=0.35 cross=157 
.meas tran cross_wclk2_158 when v(vco.wclk2)=0.35 cross=158 
.meas tran cross_wclk2_159 when v(vco.wclk2)=0.35 cross=159 
.meas tran cross_wclk2_160 when v(vco.wclk2)=0.35 cross=160 
.meas tran cross_wclk2_161 when v(vco.wclk2)=0.35 cross=161 
.meas tran cross_wclk2_162 when v(vco.wclk2)=0.35 cross=162 
.meas tran cross_wclk2_163 when v(vco.wclk2)=0.35 cross=163 
.meas tran cross_wclk2_164 when v(vco.wclk2)=0.35 cross=164 
.meas tran cross_wclk2_165 when v(vco.wclk2)=0.35 cross=165 
.meas tran cross_wclk2_166 when v(vco.wclk2)=0.35 cross=166 
.meas tran cross_wclk2_167 when v(vco.wclk2)=0.35 cross=167 
.meas tran cross_wclk2_168 when v(vco.wclk2)=0.35 cross=168 
.meas tran cross_wclk2_169 when v(vco.wclk2)=0.35 cross=169 
.meas tran cross_wclk2_170 when v(vco.wclk2)=0.35 cross=170 
.meas tran cross_wclk2_171 when v(vco.wclk2)=0.35 cross=171 
.meas tran cross_wclk2_172 when v(vco.wclk2)=0.35 cross=172 
.meas tran cross_wclk2_173 when v(vco.wclk2)=0.35 cross=173 
.meas tran cross_wclk2_174 when v(vco.wclk2)=0.35 cross=174 
.meas tran cross_wclk2_175 when v(vco.wclk2)=0.35 cross=175 
.meas tran cross_wclk2_176 when v(vco.wclk2)=0.35 cross=176 
.meas tran cross_wclk2_177 when v(vco.wclk2)=0.35 cross=177 
.meas tran cross_wclk2_178 when v(vco.wclk2)=0.35 cross=178 
.meas tran cross_wclk2_179 when v(vco.wclk2)=0.35 cross=179 
.meas tran cross_wclk2_180 when v(vco.wclk2)=0.35 cross=180 
.meas tran cross_wclk2_181 when v(vco.wclk2)=0.35 cross=181 
.meas tran cross_wclk2_182 when v(vco.wclk2)=0.35 cross=182 
.meas tran cross_wclk2_183 when v(vco.wclk2)=0.35 cross=183 
.meas tran cross_wclk2_184 when v(vco.wclk2)=0.35 cross=184 
.meas tran cross_wclk2_185 when v(vco.wclk2)=0.35 cross=185 
.meas tran cross_wclk2_186 when v(vco.wclk2)=0.35 cross=186 
.meas tran cross_wclk2_187 when v(vco.wclk2)=0.35 cross=187 
.meas tran cross_wclk2_188 when v(vco.wclk2)=0.35 cross=188 
.meas tran cross_wclk2_189 when v(vco.wclk2)=0.35 cross=189 
.meas tran cross_wclk2_190 when v(vco.wclk2)=0.35 cross=190 
.meas tran cross_wclk2_191 when v(vco.wclk2)=0.35 cross=191 
.meas tran cross_wclk2_192 when v(vco.wclk2)=0.35 cross=192 
.meas tran cross_wclk2_193 when v(vco.wclk2)=0.35 cross=193 
.meas tran cross_wclk2_194 when v(vco.wclk2)=0.35 cross=194 
.meas tran cross_wclk2_195 when v(vco.wclk2)=0.35 cross=195 
.meas tran cross_wclk2_196 when v(vco.wclk2)=0.35 cross=196 
.meas tran cross_wclk2_197 when v(vco.wclk2)=0.35 cross=197 
.meas tran cross_wclk2_198 when v(vco.wclk2)=0.35 cross=198 
.meas tran cross_wclk2_199 when v(vco.wclk2)=0.35 cross=199 
.meas tran cross_wclk2_200 when v(vco.wclk2)=0.35 cross=200 
.meas tran cross_wclk2_201 when v(vco.wclk2)=0.35 cross=201 
.meas tran cross_wclk2_202 when v(vco.wclk2)=0.35 cross=202 
.meas tran cross_wclk2_203 when v(vco.wclk2)=0.35 cross=203 
.meas tran cross_wclk2_204 when v(vco.wclk2)=0.35 cross=204 
.meas tran cross_wclk2_205 when v(vco.wclk2)=0.35 cross=205 
.meas tran cross_wclk2_206 when v(vco.wclk2)=0.35 cross=206 
.meas tran cross_wclk2_207 when v(vco.wclk2)=0.35 cross=207 
.meas tran cross_wclk2_208 when v(vco.wclk2)=0.35 cross=208 
.meas tran cross_wclk2_209 when v(vco.wclk2)=0.35 cross=209 
.meas tran cross_wclk2_210 when v(vco.wclk2)=0.35 cross=210 
.meas tran cross_wclk2_211 when v(vco.wclk2)=0.35 cross=211 
.meas tran cross_wclk2_212 when v(vco.wclk2)=0.35 cross=212 
.meas tran cross_wclk2_213 when v(vco.wclk2)=0.35 cross=213 
.meas tran cross_wclk2_214 when v(vco.wclk2)=0.35 cross=214 
.meas tran cross_wclk2_215 when v(vco.wclk2)=0.35 cross=215 
.meas tran cross_wclk2_216 when v(vco.wclk2)=0.35 cross=216 
.meas tran cross_wclk2_217 when v(vco.wclk2)=0.35 cross=217 
.meas tran cross_wclk2_218 when v(vco.wclk2)=0.35 cross=218 
.meas tran cross_wclk2_219 when v(vco.wclk2)=0.35 cross=219 
.meas tran cross_wclk2_220 when v(vco.wclk2)=0.35 cross=220 
.meas tran cross_wclk2_221 when v(vco.wclk2)=0.35 cross=221 
.meas tran cross_wclk2_222 when v(vco.wclk2)=0.35 cross=222 
.meas tran cross_wclk2_223 when v(vco.wclk2)=0.35 cross=223 
.meas tran cross_wclk2_224 when v(vco.wclk2)=0.35 cross=224 
.meas tran cross_wclk2_225 when v(vco.wclk2)=0.35 cross=225 
.meas tran cross_wclk2_226 when v(vco.wclk2)=0.35 cross=226 
.meas tran cross_wclk2_227 when v(vco.wclk2)=0.35 cross=227 
.meas tran cross_wclk2_228 when v(vco.wclk2)=0.35 cross=228 
.meas tran cross_wclk2_229 when v(vco.wclk2)=0.35 cross=229 
.meas tran cross_wclk2_230 when v(vco.wclk2)=0.35 cross=230 
.meas tran cross_wclk2_231 when v(vco.wclk2)=0.35 cross=231 
.meas tran cross_wclk2_232 when v(vco.wclk2)=0.35 cross=232 
.meas tran cross_wclk2_233 when v(vco.wclk2)=0.35 cross=233 
.meas tran cross_wclk2_234 when v(vco.wclk2)=0.35 cross=234 
.meas tran cross_wclk2_235 when v(vco.wclk2)=0.35 cross=235 
.meas tran cross_wclk2_236 when v(vco.wclk2)=0.35 cross=236 
.meas tran cross_wclk2_237 when v(vco.wclk2)=0.35 cross=237 
.meas tran cross_wclk2_238 when v(vco.wclk2)=0.35 cross=238 
.meas tran cross_wclk2_239 when v(vco.wclk2)=0.35 cross=239 
.meas tran cross_wclk2_240 when v(vco.wclk2)=0.35 cross=240 
.meas tran cross_wclk2_241 when v(vco.wclk2)=0.35 cross=241 
.meas tran cross_wclk2_242 when v(vco.wclk2)=0.35 cross=242 
.meas tran cross_wclk2_243 when v(vco.wclk2)=0.35 cross=243 
.meas tran cross_wclk2_244 when v(vco.wclk2)=0.35 cross=244 
.meas tran cross_wclk2_245 when v(vco.wclk2)=0.35 cross=245 
.meas tran cross_wclk2_246 when v(vco.wclk2)=0.35 cross=246 
.meas tran cross_wclk2_247 when v(vco.wclk2)=0.35 cross=247 
.meas tran cross_wclk2_248 when v(vco.wclk2)=0.35 cross=248 
.meas tran cross_wclk2_249 when v(vco.wclk2)=0.35 cross=249 
.meas tran cross_wclk3_0 when v(vco.wclk3)=0.35 cross=0 
.meas tran cross_wclk3_1 when v(vco.wclk3)=0.35 cross=1 
.meas tran cross_wclk3_2 when v(vco.wclk3)=0.35 cross=2 
.meas tran cross_wclk3_3 when v(vco.wclk3)=0.35 cross=3 
.meas tran cross_wclk3_4 when v(vco.wclk3)=0.35 cross=4 
.meas tran cross_wclk3_5 when v(vco.wclk3)=0.35 cross=5 
.meas tran cross_wclk3_6 when v(vco.wclk3)=0.35 cross=6 
.meas tran cross_wclk3_7 when v(vco.wclk3)=0.35 cross=7 
.meas tran cross_wclk3_8 when v(vco.wclk3)=0.35 cross=8 
.meas tran cross_wclk3_9 when v(vco.wclk3)=0.35 cross=9 
.meas tran cross_wclk3_10 when v(vco.wclk3)=0.35 cross=10 
.meas tran cross_wclk3_11 when v(vco.wclk3)=0.35 cross=11 
.meas tran cross_wclk3_12 when v(vco.wclk3)=0.35 cross=12 
.meas tran cross_wclk3_13 when v(vco.wclk3)=0.35 cross=13 
.meas tran cross_wclk3_14 when v(vco.wclk3)=0.35 cross=14 
.meas tran cross_wclk3_15 when v(vco.wclk3)=0.35 cross=15 
.meas tran cross_wclk3_16 when v(vco.wclk3)=0.35 cross=16 
.meas tran cross_wclk3_17 when v(vco.wclk3)=0.35 cross=17 
.meas tran cross_wclk3_18 when v(vco.wclk3)=0.35 cross=18 
.meas tran cross_wclk3_19 when v(vco.wclk3)=0.35 cross=19 
.meas tran cross_wclk3_20 when v(vco.wclk3)=0.35 cross=20 
.meas tran cross_wclk3_21 when v(vco.wclk3)=0.35 cross=21 
.meas tran cross_wclk3_22 when v(vco.wclk3)=0.35 cross=22 
.meas tran cross_wclk3_23 when v(vco.wclk3)=0.35 cross=23 
.meas tran cross_wclk3_24 when v(vco.wclk3)=0.35 cross=24 
.meas tran cross_wclk3_25 when v(vco.wclk3)=0.35 cross=25 
.meas tran cross_wclk3_26 when v(vco.wclk3)=0.35 cross=26 
.meas tran cross_wclk3_27 when v(vco.wclk3)=0.35 cross=27 
.meas tran cross_wclk3_28 when v(vco.wclk3)=0.35 cross=28 
.meas tran cross_wclk3_29 when v(vco.wclk3)=0.35 cross=29 
.meas tran cross_wclk3_30 when v(vco.wclk3)=0.35 cross=30 
.meas tran cross_wclk3_31 when v(vco.wclk3)=0.35 cross=31 
.meas tran cross_wclk3_32 when v(vco.wclk3)=0.35 cross=32 
.meas tran cross_wclk3_33 when v(vco.wclk3)=0.35 cross=33 
.meas tran cross_wclk3_34 when v(vco.wclk3)=0.35 cross=34 
.meas tran cross_wclk3_35 when v(vco.wclk3)=0.35 cross=35 
.meas tran cross_wclk3_36 when v(vco.wclk3)=0.35 cross=36 
.meas tran cross_wclk3_37 when v(vco.wclk3)=0.35 cross=37 
.meas tran cross_wclk3_38 when v(vco.wclk3)=0.35 cross=38 
.meas tran cross_wclk3_39 when v(vco.wclk3)=0.35 cross=39 
.meas tran cross_wclk3_40 when v(vco.wclk3)=0.35 cross=40 
.meas tran cross_wclk3_41 when v(vco.wclk3)=0.35 cross=41 
.meas tran cross_wclk3_42 when v(vco.wclk3)=0.35 cross=42 
.meas tran cross_wclk3_43 when v(vco.wclk3)=0.35 cross=43 
.meas tran cross_wclk3_44 when v(vco.wclk3)=0.35 cross=44 
.meas tran cross_wclk3_45 when v(vco.wclk3)=0.35 cross=45 
.meas tran cross_wclk3_46 when v(vco.wclk3)=0.35 cross=46 
.meas tran cross_wclk3_47 when v(vco.wclk3)=0.35 cross=47 
.meas tran cross_wclk3_48 when v(vco.wclk3)=0.35 cross=48 
.meas tran cross_wclk3_49 when v(vco.wclk3)=0.35 cross=49 
.meas tran cross_wclk3_50 when v(vco.wclk3)=0.35 cross=50 
.meas tran cross_wclk3_51 when v(vco.wclk3)=0.35 cross=51 
.meas tran cross_wclk3_52 when v(vco.wclk3)=0.35 cross=52 
.meas tran cross_wclk3_53 when v(vco.wclk3)=0.35 cross=53 
.meas tran cross_wclk3_54 when v(vco.wclk3)=0.35 cross=54 
.meas tran cross_wclk3_55 when v(vco.wclk3)=0.35 cross=55 
.meas tran cross_wclk3_56 when v(vco.wclk3)=0.35 cross=56 
.meas tran cross_wclk3_57 when v(vco.wclk3)=0.35 cross=57 
.meas tran cross_wclk3_58 when v(vco.wclk3)=0.35 cross=58 
.meas tran cross_wclk3_59 when v(vco.wclk3)=0.35 cross=59 
.meas tran cross_wclk3_60 when v(vco.wclk3)=0.35 cross=60 
.meas tran cross_wclk3_61 when v(vco.wclk3)=0.35 cross=61 
.meas tran cross_wclk3_62 when v(vco.wclk3)=0.35 cross=62 
.meas tran cross_wclk3_63 when v(vco.wclk3)=0.35 cross=63 
.meas tran cross_wclk3_64 when v(vco.wclk3)=0.35 cross=64 
.meas tran cross_wclk3_65 when v(vco.wclk3)=0.35 cross=65 
.meas tran cross_wclk3_66 when v(vco.wclk3)=0.35 cross=66 
.meas tran cross_wclk3_67 when v(vco.wclk3)=0.35 cross=67 
.meas tran cross_wclk3_68 when v(vco.wclk3)=0.35 cross=68 
.meas tran cross_wclk3_69 when v(vco.wclk3)=0.35 cross=69 
.meas tran cross_wclk3_70 when v(vco.wclk3)=0.35 cross=70 
.meas tran cross_wclk3_71 when v(vco.wclk3)=0.35 cross=71 
.meas tran cross_wclk3_72 when v(vco.wclk3)=0.35 cross=72 
.meas tran cross_wclk3_73 when v(vco.wclk3)=0.35 cross=73 
.meas tran cross_wclk3_74 when v(vco.wclk3)=0.35 cross=74 
.meas tran cross_wclk3_75 when v(vco.wclk3)=0.35 cross=75 
.meas tran cross_wclk3_76 when v(vco.wclk3)=0.35 cross=76 
.meas tran cross_wclk3_77 when v(vco.wclk3)=0.35 cross=77 
.meas tran cross_wclk3_78 when v(vco.wclk3)=0.35 cross=78 
.meas tran cross_wclk3_79 when v(vco.wclk3)=0.35 cross=79 
.meas tran cross_wclk3_80 when v(vco.wclk3)=0.35 cross=80 
.meas tran cross_wclk3_81 when v(vco.wclk3)=0.35 cross=81 
.meas tran cross_wclk3_82 when v(vco.wclk3)=0.35 cross=82 
.meas tran cross_wclk3_83 when v(vco.wclk3)=0.35 cross=83 
.meas tran cross_wclk3_84 when v(vco.wclk3)=0.35 cross=84 
.meas tran cross_wclk3_85 when v(vco.wclk3)=0.35 cross=85 
.meas tran cross_wclk3_86 when v(vco.wclk3)=0.35 cross=86 
.meas tran cross_wclk3_87 when v(vco.wclk3)=0.35 cross=87 
.meas tran cross_wclk3_88 when v(vco.wclk3)=0.35 cross=88 
.meas tran cross_wclk3_89 when v(vco.wclk3)=0.35 cross=89 
.meas tran cross_wclk3_90 when v(vco.wclk3)=0.35 cross=90 
.meas tran cross_wclk3_91 when v(vco.wclk3)=0.35 cross=91 
.meas tran cross_wclk3_92 when v(vco.wclk3)=0.35 cross=92 
.meas tran cross_wclk3_93 when v(vco.wclk3)=0.35 cross=93 
.meas tran cross_wclk3_94 when v(vco.wclk3)=0.35 cross=94 
.meas tran cross_wclk3_95 when v(vco.wclk3)=0.35 cross=95 
.meas tran cross_wclk3_96 when v(vco.wclk3)=0.35 cross=96 
.meas tran cross_wclk3_97 when v(vco.wclk3)=0.35 cross=97 
.meas tran cross_wclk3_98 when v(vco.wclk3)=0.35 cross=98 
.meas tran cross_wclk3_99 when v(vco.wclk3)=0.35 cross=99 
.meas tran cross_wclk3_100 when v(vco.wclk3)=0.35 cross=100 
.meas tran cross_wclk3_101 when v(vco.wclk3)=0.35 cross=101 
.meas tran cross_wclk3_102 when v(vco.wclk3)=0.35 cross=102 
.meas tran cross_wclk3_103 when v(vco.wclk3)=0.35 cross=103 
.meas tran cross_wclk3_104 when v(vco.wclk3)=0.35 cross=104 
.meas tran cross_wclk3_105 when v(vco.wclk3)=0.35 cross=105 
.meas tran cross_wclk3_106 when v(vco.wclk3)=0.35 cross=106 
.meas tran cross_wclk3_107 when v(vco.wclk3)=0.35 cross=107 
.meas tran cross_wclk3_108 when v(vco.wclk3)=0.35 cross=108 
.meas tran cross_wclk3_109 when v(vco.wclk3)=0.35 cross=109 
.meas tran cross_wclk3_110 when v(vco.wclk3)=0.35 cross=110 
.meas tran cross_wclk3_111 when v(vco.wclk3)=0.35 cross=111 
.meas tran cross_wclk3_112 when v(vco.wclk3)=0.35 cross=112 
.meas tran cross_wclk3_113 when v(vco.wclk3)=0.35 cross=113 
.meas tran cross_wclk3_114 when v(vco.wclk3)=0.35 cross=114 
.meas tran cross_wclk3_115 when v(vco.wclk3)=0.35 cross=115 
.meas tran cross_wclk3_116 when v(vco.wclk3)=0.35 cross=116 
.meas tran cross_wclk3_117 when v(vco.wclk3)=0.35 cross=117 
.meas tran cross_wclk3_118 when v(vco.wclk3)=0.35 cross=118 
.meas tran cross_wclk3_119 when v(vco.wclk3)=0.35 cross=119 
.meas tran cross_wclk3_120 when v(vco.wclk3)=0.35 cross=120 
.meas tran cross_wclk3_121 when v(vco.wclk3)=0.35 cross=121 
.meas tran cross_wclk3_122 when v(vco.wclk3)=0.35 cross=122 
.meas tran cross_wclk3_123 when v(vco.wclk3)=0.35 cross=123 
.meas tran cross_wclk3_124 when v(vco.wclk3)=0.35 cross=124 
.meas tran cross_wclk3_125 when v(vco.wclk3)=0.35 cross=125 
.meas tran cross_wclk3_126 when v(vco.wclk3)=0.35 cross=126 
.meas tran cross_wclk3_127 when v(vco.wclk3)=0.35 cross=127 
.meas tran cross_wclk3_128 when v(vco.wclk3)=0.35 cross=128 
.meas tran cross_wclk3_129 when v(vco.wclk3)=0.35 cross=129 
.meas tran cross_wclk3_130 when v(vco.wclk3)=0.35 cross=130 
.meas tran cross_wclk3_131 when v(vco.wclk3)=0.35 cross=131 
.meas tran cross_wclk3_132 when v(vco.wclk3)=0.35 cross=132 
.meas tran cross_wclk3_133 when v(vco.wclk3)=0.35 cross=133 
.meas tran cross_wclk3_134 when v(vco.wclk3)=0.35 cross=134 
.meas tran cross_wclk3_135 when v(vco.wclk3)=0.35 cross=135 
.meas tran cross_wclk3_136 when v(vco.wclk3)=0.35 cross=136 
.meas tran cross_wclk3_137 when v(vco.wclk3)=0.35 cross=137 
.meas tran cross_wclk3_138 when v(vco.wclk3)=0.35 cross=138 
.meas tran cross_wclk3_139 when v(vco.wclk3)=0.35 cross=139 
.meas tran cross_wclk3_140 when v(vco.wclk3)=0.35 cross=140 
.meas tran cross_wclk3_141 when v(vco.wclk3)=0.35 cross=141 
.meas tran cross_wclk3_142 when v(vco.wclk3)=0.35 cross=142 
.meas tran cross_wclk3_143 when v(vco.wclk3)=0.35 cross=143 
.meas tran cross_wclk3_144 when v(vco.wclk3)=0.35 cross=144 
.meas tran cross_wclk3_145 when v(vco.wclk3)=0.35 cross=145 
.meas tran cross_wclk3_146 when v(vco.wclk3)=0.35 cross=146 
.meas tran cross_wclk3_147 when v(vco.wclk3)=0.35 cross=147 
.meas tran cross_wclk3_148 when v(vco.wclk3)=0.35 cross=148 
.meas tran cross_wclk3_149 when v(vco.wclk3)=0.35 cross=149 
.meas tran cross_wclk3_150 when v(vco.wclk3)=0.35 cross=150 
.meas tran cross_wclk3_151 when v(vco.wclk3)=0.35 cross=151 
.meas tran cross_wclk3_152 when v(vco.wclk3)=0.35 cross=152 
.meas tran cross_wclk3_153 when v(vco.wclk3)=0.35 cross=153 
.meas tran cross_wclk3_154 when v(vco.wclk3)=0.35 cross=154 
.meas tran cross_wclk3_155 when v(vco.wclk3)=0.35 cross=155 
.meas tran cross_wclk3_156 when v(vco.wclk3)=0.35 cross=156 
.meas tran cross_wclk3_157 when v(vco.wclk3)=0.35 cross=157 
.meas tran cross_wclk3_158 when v(vco.wclk3)=0.35 cross=158 
.meas tran cross_wclk3_159 when v(vco.wclk3)=0.35 cross=159 
.meas tran cross_wclk3_160 when v(vco.wclk3)=0.35 cross=160 
.meas tran cross_wclk3_161 when v(vco.wclk3)=0.35 cross=161 
.meas tran cross_wclk3_162 when v(vco.wclk3)=0.35 cross=162 
.meas tran cross_wclk3_163 when v(vco.wclk3)=0.35 cross=163 
.meas tran cross_wclk3_164 when v(vco.wclk3)=0.35 cross=164 
.meas tran cross_wclk3_165 when v(vco.wclk3)=0.35 cross=165 
.meas tran cross_wclk3_166 when v(vco.wclk3)=0.35 cross=166 
.meas tran cross_wclk3_167 when v(vco.wclk3)=0.35 cross=167 
.meas tran cross_wclk3_168 when v(vco.wclk3)=0.35 cross=168 
.meas tran cross_wclk3_169 when v(vco.wclk3)=0.35 cross=169 
.meas tran cross_wclk3_170 when v(vco.wclk3)=0.35 cross=170 
.meas tran cross_wclk3_171 when v(vco.wclk3)=0.35 cross=171 
.meas tran cross_wclk3_172 when v(vco.wclk3)=0.35 cross=172 
.meas tran cross_wclk3_173 when v(vco.wclk3)=0.35 cross=173 
.meas tran cross_wclk3_174 when v(vco.wclk3)=0.35 cross=174 
.meas tran cross_wclk3_175 when v(vco.wclk3)=0.35 cross=175 
.meas tran cross_wclk3_176 when v(vco.wclk3)=0.35 cross=176 
.meas tran cross_wclk3_177 when v(vco.wclk3)=0.35 cross=177 
.meas tran cross_wclk3_178 when v(vco.wclk3)=0.35 cross=178 
.meas tran cross_wclk3_179 when v(vco.wclk3)=0.35 cross=179 
.meas tran cross_wclk3_180 when v(vco.wclk3)=0.35 cross=180 
.meas tran cross_wclk3_181 when v(vco.wclk3)=0.35 cross=181 
.meas tran cross_wclk3_182 when v(vco.wclk3)=0.35 cross=182 
.meas tran cross_wclk3_183 when v(vco.wclk3)=0.35 cross=183 
.meas tran cross_wclk3_184 when v(vco.wclk3)=0.35 cross=184 
.meas tran cross_wclk3_185 when v(vco.wclk3)=0.35 cross=185 
.meas tran cross_wclk3_186 when v(vco.wclk3)=0.35 cross=186 
.meas tran cross_wclk3_187 when v(vco.wclk3)=0.35 cross=187 
.meas tran cross_wclk3_188 when v(vco.wclk3)=0.35 cross=188 
.meas tran cross_wclk3_189 when v(vco.wclk3)=0.35 cross=189 
.meas tran cross_wclk3_190 when v(vco.wclk3)=0.35 cross=190 
.meas tran cross_wclk3_191 when v(vco.wclk3)=0.35 cross=191 
.meas tran cross_wclk3_192 when v(vco.wclk3)=0.35 cross=192 
.meas tran cross_wclk3_193 when v(vco.wclk3)=0.35 cross=193 
.meas tran cross_wclk3_194 when v(vco.wclk3)=0.35 cross=194 
.meas tran cross_wclk3_195 when v(vco.wclk3)=0.35 cross=195 
.meas tran cross_wclk3_196 when v(vco.wclk3)=0.35 cross=196 
.meas tran cross_wclk3_197 when v(vco.wclk3)=0.35 cross=197 
.meas tran cross_wclk3_198 when v(vco.wclk3)=0.35 cross=198 
.meas tran cross_wclk3_199 when v(vco.wclk3)=0.35 cross=199 
.meas tran cross_wclk3_200 when v(vco.wclk3)=0.35 cross=200 
.meas tran cross_wclk3_201 when v(vco.wclk3)=0.35 cross=201 
.meas tran cross_wclk3_202 when v(vco.wclk3)=0.35 cross=202 
.meas tran cross_wclk3_203 when v(vco.wclk3)=0.35 cross=203 
.meas tran cross_wclk3_204 when v(vco.wclk3)=0.35 cross=204 
.meas tran cross_wclk3_205 when v(vco.wclk3)=0.35 cross=205 
.meas tran cross_wclk3_206 when v(vco.wclk3)=0.35 cross=206 
.meas tran cross_wclk3_207 when v(vco.wclk3)=0.35 cross=207 
.meas tran cross_wclk3_208 when v(vco.wclk3)=0.35 cross=208 
.meas tran cross_wclk3_209 when v(vco.wclk3)=0.35 cross=209 
.meas tran cross_wclk3_210 when v(vco.wclk3)=0.35 cross=210 
.meas tran cross_wclk3_211 when v(vco.wclk3)=0.35 cross=211 
.meas tran cross_wclk3_212 when v(vco.wclk3)=0.35 cross=212 
.meas tran cross_wclk3_213 when v(vco.wclk3)=0.35 cross=213 
.meas tran cross_wclk3_214 when v(vco.wclk3)=0.35 cross=214 
.meas tran cross_wclk3_215 when v(vco.wclk3)=0.35 cross=215 
.meas tran cross_wclk3_216 when v(vco.wclk3)=0.35 cross=216 
.meas tran cross_wclk3_217 when v(vco.wclk3)=0.35 cross=217 
.meas tran cross_wclk3_218 when v(vco.wclk3)=0.35 cross=218 
.meas tran cross_wclk3_219 when v(vco.wclk3)=0.35 cross=219 
.meas tran cross_wclk3_220 when v(vco.wclk3)=0.35 cross=220 
.meas tran cross_wclk3_221 when v(vco.wclk3)=0.35 cross=221 
.meas tran cross_wclk3_222 when v(vco.wclk3)=0.35 cross=222 
.meas tran cross_wclk3_223 when v(vco.wclk3)=0.35 cross=223 
.meas tran cross_wclk3_224 when v(vco.wclk3)=0.35 cross=224 
.meas tran cross_wclk3_225 when v(vco.wclk3)=0.35 cross=225 
.meas tran cross_wclk3_226 when v(vco.wclk3)=0.35 cross=226 
.meas tran cross_wclk3_227 when v(vco.wclk3)=0.35 cross=227 
.meas tran cross_wclk3_228 when v(vco.wclk3)=0.35 cross=228 
.meas tran cross_wclk3_229 when v(vco.wclk3)=0.35 cross=229 
.meas tran cross_wclk3_230 when v(vco.wclk3)=0.35 cross=230 
.meas tran cross_wclk3_231 when v(vco.wclk3)=0.35 cross=231 
.meas tran cross_wclk3_232 when v(vco.wclk3)=0.35 cross=232 
.meas tran cross_wclk3_233 when v(vco.wclk3)=0.35 cross=233 
.meas tran cross_wclk3_234 when v(vco.wclk3)=0.35 cross=234 
.meas tran cross_wclk3_235 when v(vco.wclk3)=0.35 cross=235 
.meas tran cross_wclk3_236 when v(vco.wclk3)=0.35 cross=236 
.meas tran cross_wclk3_237 when v(vco.wclk3)=0.35 cross=237 
.meas tran cross_wclk3_238 when v(vco.wclk3)=0.35 cross=238 
.meas tran cross_wclk3_239 when v(vco.wclk3)=0.35 cross=239 
.meas tran cross_wclk3_240 when v(vco.wclk3)=0.35 cross=240 
.meas tran cross_wclk3_241 when v(vco.wclk3)=0.35 cross=241 
.meas tran cross_wclk3_242 when v(vco.wclk3)=0.35 cross=242 
.meas tran cross_wclk3_243 when v(vco.wclk3)=0.35 cross=243 
.meas tran cross_wclk3_244 when v(vco.wclk3)=0.35 cross=244 
.meas tran cross_wclk3_245 when v(vco.wclk3)=0.35 cross=245 
.meas tran cross_wclk3_246 when v(vco.wclk3)=0.35 cross=246 
.meas tran cross_wclk3_247 when v(vco.wclk3)=0.35 cross=247 
.meas tran cross_wclk3_248 when v(vco.wclk3)=0.35 cross=248 
.meas tran cross_wclk3_249 when v(vco.wclk3)=0.35 cross=249 
simulator lang=spectre 
