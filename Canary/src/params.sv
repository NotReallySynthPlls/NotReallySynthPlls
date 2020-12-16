// Global Timescale
// (Hopefully not used anywhere)
`timescale 1fs/1fs

// Global Params 
`define NUM_STAGES 15
`define KDCO_COARSE 250e6
`define KDCO_FINE 50e6

// Global Enums 
typedef enum { BRAKES_OFF, BRAKING, RECOVERING } brake_state_t;
typedef enum { UNLOCKED, COARSE_FREQ_LOCKED, FINE_FREQ_LOCKED, PHASE_LOCKED } lock_state_t;

interface PllInterface ();
    logic refclk, pclk, resetn, divn;
    modport pll (
        input refclk,
        input resetn,
        output pclk
    );
    modport parent (
        output refclk,
        output resetn,
        input pclk
    );
endinterface 
