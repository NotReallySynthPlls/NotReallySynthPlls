// Generated for: spectre
// Generated on: Apr 27 13:43:03 2020
// Design library name: sdbx_wrahman
// Design cell name: tb_vco_c2mos
// Design view name: config
simulator lang=spectre
global 0
parameters nPhase=1 ctrl2=0 VDD=0.75 TSTOP=2n fCLK=1G TDEL=11e-12 ctrl=0 \
    ctrlcoarse=127
include "/home/ff/ee241/spring20-labs/asap7PDK_r1p5/models/hspice/7nm_FF.pm"

// Library name: custom_cell
// Cell name: c2mos
// View name: schematic
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
//veriloga ahdl pspice dspf
subckt c2mos_schematic A ENA VDD VSS Y
    M4 (Y ENA pd1 VSS) nmos_rvt w=3*27n l=20n nfin=3
    M5 (pd1 A VSS VSS) nmos_rvt w=3*27n l=20n nfin=3
    M2 (ENAb ENA VSS VSS) nmos_rvt w=3*27n l=20n nfin=3
    M3 (pu1 A VDD VDD) pmos_rvt w=3*27n l=20n nfin=3
    M1 (Y ENAb pu1 VDD) pmos_rvt w=3*27n l=20n nfin=3
    M0 (ENAb ENA VDD VDD) pmos_rvt w=3*27n l=20n nfin=3
ends c2mos_schematic
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
    COARSESTG0\<63\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<62\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<61\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<60\> (OUT COARSE\<15\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<59\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<58\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<57\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<56\> (OUT COARSE\<14\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<55\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<54\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<53\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<52\> (OUT COARSE\<13\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<51\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<50\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<49\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<48\> (OUT COARSE\<12\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<47\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<46\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<45\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<44\> (OUT COARSE\<11\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<43\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<42\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<41\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<40\> (OUT COARSE\<10\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<39\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<38\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<37\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<36\> (OUT COARSE\<9\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<35\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<34\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<33\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<32\> (OUT COARSE\<8\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<31\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<30\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<29\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<28\> (OUT COARSE\<7\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<27\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<26\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<25\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<24\> (OUT COARSE\<6\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<23\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<22\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<21\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<20\> (OUT COARSE\<5\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<19\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<18\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<17\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<16\> (OUT COARSE\<4\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<15\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<14\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<13\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<12\> (OUT COARSE\<3\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<11\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<10\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<9\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<8\> (OUT COARSE\<2\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<7\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<6\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<5\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<4\> (OUT COARSE\<1\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<3\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<2\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<1\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos_schematic
    COARSESTG0\<0\> (OUT COARSE\<0\> VDD VSS wclk0) c2mos_schematic
    MIDSTG1\<15\> (wclk0 MID\<15\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<14\> (wclk0 MID\<14\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<13\> (wclk0 MID\<13\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<12\> (wclk0 MID\<12\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<11\> (wclk0 MID\<11\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<10\> (wclk0 MID\<10\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<9\> (wclk0 MID\<9\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<8\> (wclk0 MID\<8\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<7\> (wclk0 MID\<7\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<6\> (wclk0 MID\<6\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<5\> (wclk0 MID\<5\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<4\> (wclk0 MID\<4\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<3\> (wclk0 MID\<3\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<2\> (wclk0 MID\<2\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<1\> (wclk0 MID\<1\> VDD VSS wclk1) c2mos_schematic
    MIDSTG1\<0\> (wclk0 MID\<0\> VDD VSS wclk1) c2mos_schematic
    STG0\<7\> (OUT FINE\<7\> VDD VSS wclk0) c2mos_schematic
    STG0\<6\> (OUT FINE\<6\> VDD VSS wclk0) c2mos_schematic
    STG0\<5\> (OUT FINE\<5\> VDD VSS wclk0) c2mos_schematic
    STG0\<4\> (OUT FINE\<4\> VDD VSS wclk0) c2mos_schematic
    STG0\<3\> (OUT FINE\<3\> VDD VSS wclk0) c2mos_schematic
    STG0\<2\> (OUT FINE\<2\> VDD VSS wclk0) c2mos_schematic
    STG0\<1\> (OUT FINE\<1\> VDD VSS wclk0) c2mos_schematic
    STG0\<0\> (OUT FINE\<0\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<15\> (OUT MID\<15\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<14\> (OUT MID\<14\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<13\> (OUT MID\<13\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<12\> (OUT MID\<12\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<11\> (OUT MID\<11\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<10\> (OUT MID\<10\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<9\> (OUT MID\<9\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<8\> (OUT MID\<8\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<7\> (OUT MID\<7\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<6\> (OUT MID\<6\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<5\> (OUT MID\<5\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<4\> (OUT MID\<4\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<3\> (OUT MID\<3\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<2\> (OUT MID\<2\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<1\> (OUT MID\<1\> VDD VSS wclk0) c2mos_schematic
    MIDSTG0\<0\> (OUT MID\<0\> VDD VSS wclk0) c2mos_schematic
    COARSESTG4\<63\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<62\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<61\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<60\> (wclk3 COARSE\<15\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<59\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<58\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<57\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<56\> (wclk3 COARSE\<14\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<55\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<54\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<53\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<52\> (wclk3 COARSE\<13\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<51\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<50\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<49\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<48\> (wclk3 COARSE\<12\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<47\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<46\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<45\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<44\> (wclk3 COARSE\<11\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<43\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<42\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<41\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<40\> (wclk3 COARSE\<10\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<39\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<38\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<37\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<36\> (wclk3 COARSE\<9\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<35\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<34\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<33\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<32\> (wclk3 COARSE\<8\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<31\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<30\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<29\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<28\> (wclk3 COARSE\<7\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<27\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<26\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<25\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<24\> (wclk3 COARSE\<6\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<23\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<22\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<21\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<20\> (wclk3 COARSE\<5\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<19\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<18\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<17\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<16\> (wclk3 COARSE\<4\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<15\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<14\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<13\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<12\> (wclk3 COARSE\<3\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<11\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<10\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<9\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<8\> (wclk3 COARSE\<2\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<7\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<6\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<5\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<4\> (wclk3 COARSE\<1\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<3\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<2\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<1\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos_schematic
    COARSESTG4\<0\> (wclk3 COARSE\<0\> VDD VSS OUT) c2mos_schematic
    COARSESTG3\<63\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<62\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<61\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<60\> (wclk2 COARSE\<15\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<59\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<58\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<57\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<56\> (wclk2 COARSE\<14\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<55\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<54\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<53\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<52\> (wclk2 COARSE\<13\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<51\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<50\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<49\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<48\> (wclk2 COARSE\<12\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<47\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<46\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<45\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<44\> (wclk2 COARSE\<11\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<43\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<42\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<41\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<40\> (wclk2 COARSE\<10\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<39\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<38\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<37\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<36\> (wclk2 COARSE\<9\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<35\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<34\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<33\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<32\> (wclk2 COARSE\<8\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<31\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<30\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<29\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<28\> (wclk2 COARSE\<7\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<27\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<26\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<25\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<24\> (wclk2 COARSE\<6\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<23\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<22\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<21\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<20\> (wclk2 COARSE\<5\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<19\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<18\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<17\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<16\> (wclk2 COARSE\<4\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<15\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<14\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<13\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<12\> (wclk2 COARSE\<3\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<11\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<10\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<9\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<8\> (wclk2 COARSE\<2\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<7\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<6\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<5\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<4\> (wclk2 COARSE\<1\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<3\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<2\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<1\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos_schematic
    COARSESTG3\<0\> (wclk2 COARSE\<0\> VDD VSS wclk3) c2mos_schematic
    COARSESTG2\<63\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<62\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<61\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<60\> (wclk1 COARSE\<15\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<59\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<58\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<57\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<56\> (wclk1 COARSE\<14\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<55\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<54\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<53\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<52\> (wclk1 COARSE\<13\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<51\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<50\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<49\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<48\> (wclk1 COARSE\<12\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<47\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<46\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<45\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<44\> (wclk1 COARSE\<11\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<43\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<42\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<41\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<40\> (wclk1 COARSE\<10\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<39\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<38\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<37\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<36\> (wclk1 COARSE\<9\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<35\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<34\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<33\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<32\> (wclk1 COARSE\<8\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<31\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<30\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<29\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<28\> (wclk1 COARSE\<7\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<27\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<26\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<25\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<24\> (wclk1 COARSE\<6\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<23\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<22\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<21\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<20\> (wclk1 COARSE\<5\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<19\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<18\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<17\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<16\> (wclk1 COARSE\<4\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<15\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<14\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<13\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<12\> (wclk1 COARSE\<3\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<11\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<10\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<9\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<8\> (wclk1 COARSE\<2\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<7\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<6\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<5\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<4\> (wclk1 COARSE\<1\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<3\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<2\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<1\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos_schematic
    COARSESTG2\<0\> (wclk1 COARSE\<0\> VDD VSS wclk2) c2mos_schematic
    COARSESTG1\<63\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<62\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<61\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<60\> (wclk0 COARSE\<15\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<59\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<58\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<57\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<56\> (wclk0 COARSE\<14\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<55\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<54\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<53\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<52\> (wclk0 COARSE\<13\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<51\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<50\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<49\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<48\> (wclk0 COARSE\<12\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<47\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<46\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<45\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<44\> (wclk0 COARSE\<11\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<43\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<42\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<41\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<40\> (wclk0 COARSE\<10\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<39\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<38\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<37\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<36\> (wclk0 COARSE\<9\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<35\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<34\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<33\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<32\> (wclk0 COARSE\<8\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<31\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<30\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<29\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<28\> (wclk0 COARSE\<7\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<27\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<26\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<25\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<24\> (wclk0 COARSE\<6\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<23\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<22\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<21\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<20\> (wclk0 COARSE\<5\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<19\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<18\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<17\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<16\> (wclk0 COARSE\<4\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<15\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<14\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<13\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<12\> (wclk0 COARSE\<3\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<11\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<10\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<9\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<8\> (wclk0 COARSE\<2\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<7\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<6\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<5\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<4\> (wclk0 COARSE\<1\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<3\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<2\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<1\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos_schematic
    COARSESTG1\<0\> (wclk0 COARSE\<0\> VDD VSS wclk1) c2mos_schematic
    MIDSTG3\<15\> (wclk2 MID\<15\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<14\> (wclk2 MID\<14\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<13\> (wclk2 MID\<13\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<12\> (wclk2 MID\<12\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<11\> (wclk2 MID\<11\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<10\> (wclk2 MID\<10\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<9\> (wclk2 MID\<9\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<8\> (wclk2 MID\<8\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<7\> (wclk2 MID\<7\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<6\> (wclk2 MID\<6\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<5\> (wclk2 MID\<5\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<4\> (wclk2 MID\<4\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<3\> (wclk2 MID\<3\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<2\> (wclk2 MID\<2\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<1\> (wclk2 MID\<1\> VDD VSS wclk3) c2mos_schematic
    MIDSTG3\<0\> (wclk2 MID\<0\> VDD VSS wclk3) c2mos_schematic
    I14\<7\> (wclk3 FINE\<7\> VDD VSS OUT) c2mos_schematic
    I14\<6\> (wclk3 FINE\<6\> VDD VSS OUT) c2mos_schematic
    I14\<5\> (wclk3 FINE\<5\> VDD VSS OUT) c2mos_schematic
    I14\<4\> (wclk3 FINE\<4\> VDD VSS OUT) c2mos_schematic
    I14\<3\> (wclk3 FINE\<3\> VDD VSS OUT) c2mos_schematic
    I14\<2\> (wclk3 FINE\<2\> VDD VSS OUT) c2mos_schematic
    I14\<1\> (wclk3 FINE\<1\> VDD VSS OUT) c2mos_schematic
    I14\<0\> (wclk3 FINE\<0\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<15\> (wclk3 MID\<15\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<14\> (wclk3 MID\<14\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<13\> (wclk3 MID\<13\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<12\> (wclk3 MID\<12\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<11\> (wclk3 MID\<11\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<10\> (wclk3 MID\<10\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<9\> (wclk3 MID\<9\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<8\> (wclk3 MID\<8\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<7\> (wclk3 MID\<7\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<6\> (wclk3 MID\<6\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<5\> (wclk3 MID\<5\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<4\> (wclk3 MID\<4\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<3\> (wclk3 MID\<3\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<2\> (wclk3 MID\<2\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<1\> (wclk3 MID\<1\> VDD VSS OUT) c2mos_schematic
    MIDSTG4\<0\> (wclk3 MID\<0\> VDD VSS OUT) c2mos_schematic
    I25\<23\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<22\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<21\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<20\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<19\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<18\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<17\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<16\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<15\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<14\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<13\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<12\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<11\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<10\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<9\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<8\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<7\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<6\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<5\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<4\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<3\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<2\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<1\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    I25\<0\> (OUT VDD VDD VSS wclk0) c2mos_schematic
    MIDSTG2\<15\> (wclk1 MID\<15\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<14\> (wclk1 MID\<14\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<13\> (wclk1 MID\<13\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<12\> (wclk1 MID\<12\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<11\> (wclk1 MID\<11\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<10\> (wclk1 MID\<10\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<9\> (wclk1 MID\<9\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<8\> (wclk1 MID\<8\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<7\> (wclk1 MID\<7\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<6\> (wclk1 MID\<6\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<5\> (wclk1 MID\<5\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<4\> (wclk1 MID\<4\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<3\> (wclk1 MID\<3\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<2\> (wclk1 MID\<2\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<1\> (wclk1 MID\<1\> VDD VSS wclk2) c2mos_schematic
    MIDSTG2\<0\> (wclk1 MID\<0\> VDD VSS wclk2) c2mos_schematic
    I29\<23\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<22\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<21\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<20\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<19\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<18\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<17\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<16\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<15\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<14\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<13\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<12\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<11\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<10\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<9\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<8\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<7\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<6\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<5\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<4\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<3\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<2\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<1\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I29\<0\> (wclk3 VDD VDD VSS OUT) c2mos_schematic
    I28\<23\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<22\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<21\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<20\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<19\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<18\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<17\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<16\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<15\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<14\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<13\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<12\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<11\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<10\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<9\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<8\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<7\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<6\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<5\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<4\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<3\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<2\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<1\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I28\<0\> (wclk2 VDD VDD VSS wclk3) c2mos_schematic
    I26\<23\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<22\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<21\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<20\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<19\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<18\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<17\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<16\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<15\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<14\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<13\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<12\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<11\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<10\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<9\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<8\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<7\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<6\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<5\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<4\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<3\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<2\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<1\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I26\<0\> (wclk0 VDD VDD VSS wclk1) c2mos_schematic
    I27\<23\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<22\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<21\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<20\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<19\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<18\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<17\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<16\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<15\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<14\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<13\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<12\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<11\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<10\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<9\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<8\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<7\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<6\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<5\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<4\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<3\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<2\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<1\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I27\<0\> (wclk1 VDD VDD VSS wclk2) c2mos_schematic
    I15\<7\> (wclk2 FINE\<7\> VDD VSS wclk3) c2mos_schematic
    I15\<6\> (wclk2 FINE\<6\> VDD VSS wclk3) c2mos_schematic
    I15\<5\> (wclk2 FINE\<5\> VDD VSS wclk3) c2mos_schematic
    I15\<4\> (wclk2 FINE\<4\> VDD VSS wclk3) c2mos_schematic
    I15\<3\> (wclk2 FINE\<3\> VDD VSS wclk3) c2mos_schematic
    I15\<2\> (wclk2 FINE\<2\> VDD VSS wclk3) c2mos_schematic
    I15\<1\> (wclk2 FINE\<1\> VDD VSS wclk3) c2mos_schematic
    I15\<0\> (wclk2 FINE\<0\> VDD VSS wclk3) c2mos_schematic
    STG2\<7\> (wclk1 FINE\<7\> VDD VSS wclk2) c2mos_schematic
    STG2\<6\> (wclk1 FINE\<6\> VDD VSS wclk2) c2mos_schematic
    STG2\<5\> (wclk1 FINE\<5\> VDD VSS wclk2) c2mos_schematic
    STG2\<4\> (wclk1 FINE\<4\> VDD VSS wclk2) c2mos_schematic
    STG2\<3\> (wclk1 FINE\<3\> VDD VSS wclk2) c2mos_schematic
    STG2\<2\> (wclk1 FINE\<2\> VDD VSS wclk2) c2mos_schematic
    STG2\<1\> (wclk1 FINE\<1\> VDD VSS wclk2) c2mos_schematic
    STG2\<0\> (wclk1 FINE\<0\> VDD VSS wclk2) c2mos_schematic
    STG1\<7\> (wclk0 FINE\<7\> VDD VSS wclk1) c2mos_schematic
    STG1\<6\> (wclk0 FINE\<6\> VDD VSS wclk1) c2mos_schematic
    STG1\<5\> (wclk0 FINE\<5\> VDD VSS wclk1) c2mos_schematic
    STG1\<4\> (wclk0 FINE\<4\> VDD VSS wclk1) c2mos_schematic
    STG1\<3\> (wclk0 FINE\<3\> VDD VSS wclk1) c2mos_schematic
    STG1\<2\> (wclk0 FINE\<2\> VDD VSS wclk1) c2mos_schematic
    STG1\<1\> (wclk0 FINE\<1\> VDD VSS wclk1) c2mos_schematic
    STG1\<0\> (wclk0 FINE\<0\> VDD VSS wclk1) c2mos_schematic
ends vco_c2mos
// End of subcircuit definition.

// Library name: sdbx_wrahman
// Cell name: tb_vco_c2mos
// View name: schematic
// Inherited view list: spectre cmos_sch cmos.sch calibre schematic
// veriloga ahdl pspice dspf
VCO (wctl_enacoarse\<15\> wctl_enacoarse\<14\> wctl_enacoarse\<13\> \
        wctl_enacoarse\<12\> wctl_enacoarse\<11\> wctl_enacoarse\<10\> \
        wctl_enacoarse\<9\> wctl_enacoarse\<8\> wctl_enacoarse\<7\> \
        wctl_enacoarse\<6\> wctl_enacoarse\<5\> wctl_enacoarse\<4\> \
        wctl_enacoarse\<3\> wctl_enacoarse\<2\> wctl_enacoarse\<1\> \
        wctl_enacoarse\<0\> wctl_ena\<7\> wctl_ena\<6\> wctl_ena\<5\> \
        wctl_ena\<4\> wctl_ena\<3\> wctl_ena\<2\> wctl_ena\<1\> \
        wctl_ena\<0\> wctl_enamid\<15\> wctl_enamid\<14\> \
        wctl_enamid\<13\> wctl_enamid\<12\> wctl_enamid\<11\> \
        wctl_enamid\<10\> wctl_enamid\<9\> wctl_enamid\<8\> \
        wctl_enamid\<7\> wctl_enamid\<6\> wctl_enamid\<5\> \
        wctl_enamid\<4\> wctl_enamid\<3\> wctl_enamid\<2\> \
        wctl_enamid\<1\> wctl_enamid\<0\> wck_out p_vdd p_vss) vco_c2mos
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
ic VCO.wclk0=0 
simulatorOptions options reltol=1e-4 vabstol=1e-6 iabstol=1e-12 temp=27 \
    tnom=27 scalem=1.0 scale=1.0 gmin=1e-12 rforce=1 maxnotes=5 maxwarns=5 \
    digits=5 cols=80 pivrel=1e-3 sensfile="../psf/sens.output" \
    checklimitdest=psf 
tran tran stop=TSTOP errpreset=conservative write="spectre.ic" \
    writefinal="spectre.fc" annotate=status maxiters=5 
finalTimeOP info what=oppoint where=rawfile
modelParameter info what=models where=rawfile
element info what=inst where=rawfile
outputParameter info what=output where=rawfile
designParamVals info what=parameters where=rawfile
primitives info what=primitives where=rawfile
subckts info what=subckts where=rawfile
save wctlbin\<2\> wctlbin\<1\> wctlbin\<0\> wctl_ena\<7\> wctl_ena\<6\> \
    wctl_ena\<5\> wctl_ena\<4\> wctl_ena\<3\> wctl_ena\<2\> wctl_ena\<1\> \
    wctl_ena\<0\> wck_out VCO:42 p_vdd p_vss VCO.wclk0 VCO.wclk1 \
    wctlcoarse wctl wclk_ctl wctlbincoarse\<3\> wctlbincoarse\<2\> \
    wctlbincoarse\<1\> wctlbincoarse\<0\> wctl_enacoarse\<15\> \
    wctl_enacoarse\<14\> wctl_enacoarse\<13\> wctl_enacoarse\<12\> \
    wctl_enacoarse\<11\> wctl_enacoarse\<10\> wctl_enacoarse\<9\> \
    wctl_enacoarse\<8\> wctl_enacoarse\<7\> wctl_enacoarse\<6\> \
    wctl_enacoarse\<5\> wctl_enacoarse\<4\> wctl_enacoarse\<3\> \
    wctl_enacoarse\<2\> wctl_enacoarse\<1\> wctl_enacoarse\<0\> 
saveOptions options save=selected
ahdl_include "bin2therm4to16.va"
ahdl_include "bin2therm3to8.va"
ahdl_include "adc_3bit.va"
ahdl_include "adc_8bit.va"
