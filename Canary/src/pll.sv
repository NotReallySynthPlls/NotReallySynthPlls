`timescale 1fs/1fs
`define NUM_STAGES 15
`define REFCLK_PERIOD 8*1000*1000


module dco_and_phase_sampling (
    input  int dctrl,
    input  logic refclk,
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    parameter real F0   = 3.99e9;
    parameter real FMIN = 3e9;
    parameter real FMAX = 5e9;
    parameter real KDCO = 5000.0; // Hz/code
    real freq, freq_calc, period, stage_delay;
    int dco_int_count, dco_frac_state;

    // DCO
    always #(stage_delay*1e15) begin 
        if (!resetn) dco_frac_state = 0; 
        else if (dco_frac_state >= 2 * `NUM_STAGES - 1) dco_frac_state = 0;
        else dco_frac_state = dco_frac_state + 1;

        if (dco_frac_state >= `NUM_STAGES) pclk = 1'b0;
        else pclk = 1'b1;
    end 
    // More realistic DCO would include stuff like this,
    // and accompanying decode logic 
    // reg [14:0] dco_frac_state, dco_frac_state_samp, dco_frac_state_samp_m1;
    // initial dco_frac_state = 15'b101011010101010; 
    // always @ (dco_frac_state) #STAGE_DELAY dco_frac_state <= {~dco_frac_state[13:0], ~dco_frac_state[14]};
    // assign pclk = dco_frac_state[0];

    // Integer DCO Cycle Count
    always @ (posedge pclk or negedge resetn) begin 
        if (!resetn) dco_int_count = 0;
        else dco_int_count = dco_int_count + 1;
    end 

    // Main Sampling-Time Action
    always @ (resetn or posedge refclk) begin
        if (!resetn) begin 
            pclk = 1'b1; // DCO reset, as via a hard loop-break 
            dco_frac_state = 0; 
            dco_int_count = 0;  // Reset all our sampled signals
            dco_phase = 0;

        end else begin  // Sample DCO Phase
            dco_phase <= 2 * `NUM_STAGES * dco_int_count + dco_frac_state;
        end 
    end
    
    assign freq_calc = F0 + dctrl * KDCO;
    assign freq = (freq_calc < FMIN ? FMIN : (freq_calc > FMAX ? FMAX : freq_calc) ); // Limiting
    assign period = 1 / freq;
    assign stage_delay = period / 2 / `NUM_STAGES;

endmodule


module dco_and_phase_sampling_ctrl (
    input  int dctrl,
    input  logic refclk,
    input  logic resetn,
    output logic pclk, 
    output int dco_phase
);
    // Control-only phase-accumulator model 
    
    parameter real F0 = 4e9;
    parameter real KDCO = 5000.0; // Hz/code
    real freq, period;

    // Main Sampling-Time Action
    always @ (posedge refclk or negedge resetn) begin
        if (!resetn) begin // Reset all our sampled signals
            dco_phase = 0;
        end else begin  // Sample DCO Phase
            dco_phase <= dco_phase + 2 * `NUM_STAGES * `REFCLK_PERIOD * (F0 + KDCO * dctrl) / 1e15;
        end 
    end
    
    assign freq = F0 + dctrl * KDCO;
    assign period = 1 / freq;

    assign pclk = 1'b0;
    
endmodule


module pll (
    input  wire refclk,
    input  wire resetn,
    input  wire brake,
    input  int  divn,
    output reg  pclk
);

    // DCO Gain
    parameter real F0 = 4e9;
    parameter real KDCO = 5000.0; // Hz/code

    parameter int KP = 10;
    parameter int KI = 1;
    parameter int KP_FREQ = 0;
    parameter int KI_FREQ = 400;

    int di, dp, dctrl;

    // Brakes
    parameter real BRAKE_DELTA_F = 1.0e9;
    parameter int BRAKE_CODE = BRAKE_DELTA_F / KDCO / KI;
    parameter int BRAKE_DIV = 10 * 2 * `NUM_STAGES;

    logic ready;
    real err_real;
    int accum, accum_m1, targ_phase, err;
    int dco_phase, dco_phase_m1, dco_phase_diff, freq_target;

    enum { BRAKES_OFF, BRAKING, RECOVERING } brake_state;
    int brake_countdown, brake_code_delta, brake_div_delta;
    always @(posedge brake) begin
        brake_state = BRAKING;
        brake_code_delta = BRAKE_CODE;
        brake_countdown = 'd100;
        brake_div_delta = BRAKE_DIV;
        ready = 0;
    end

    assign freq_target = 2 * `NUM_STAGES * divn - brake_div_delta;

    dco_and_phase_sampling i_dco (
        .dctrl(dctrl),
        .refclk(refclk),
        .resetn(resetn),
        .pclk(pclk), 
        .dco_phase(dco_phase)
    );

    // Main Sampling-Time Action
    always @ (resetn or refclk) begin
        if (!resetn) begin 

            // Reset all our sampled signals
            dco_phase_m1 = 0;
            dco_phase_diff = 0;
            targ_phase = 'd0;
            accum_m1 = 0;
            ready = 1'b0;

            brake_state = BRAKES_OFF;
            brake_countdown = 0;
            brake_code_delta = 0;
            brake_div_delta = 0;
        end else if (refclk) begin // Rising edge 
            dco_phase_m1 <= dco_phase;  // Keep one past sample, in case we want frequency feedback 
            
            if (ready) begin // Make FB Loop updates. Several require a cycle of initialization. 
                accum_m1 <= accum;
                brake_code_delta <= 0;

                
                targ_phase <= targ_phase + freq_target;

                if (brake_state == BRAKING) begin
                    if (brake_countdown > 0) brake_countdown <= brake_countdown - 1;
                    else brake_state <= RECOVERING;
                end else if (brake_state == RECOVERING) begin 
                    if (brake_div_delta > 3) brake_div_delta <= brake_div_delta - 4;
                    else brake_state <= BRAKES_OFF;
                end

                // Frequency measurement 1-z**-1
                // dco_phase_diff = dco_phase - dco_phase_m1; 
                // err <= 2 * `NUM_STAGES * divn - dco_phase_diff; // Note FB Loop inverts here!
            end 
            else begin 
                targ_phase <= dco_phase + freq_target;
                ready = 1'b1;
            end
        end 
    end

    // Frequency Count
    int cycle_count, cycle_count_m1, fmeas, fmeas_startup, freq_err;
    logic fmeas_ready;
    always @(posedge pclk or negedge resetn) begin
        if (!resetn) begin 
            cycle_count = 0;
            cycle_count_m1 = 0;
        end else begin 
            cycle_count = cycle_count + 1;
        end
    end 
    always @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            fmeas = 0;
            fmeas_ready = 1'b0;
            fmeas_startup = 2;
        end else begin 
            fmeas = cycle_count - cycle_count_m1;
            cycle_count_m1 = cycle_count;
            freq_err = divn - fmeas;
            if (fmeas_startup == 0) fmeas_ready = 1'b1;
            else fmeas_startup = fmeas_startup - 1;
        end
    end

    // Feedback Divider
    int div_count;
    logic fbclk;
    always @(posedge pclk or negedge resetn) begin
        if (!resetn || div_count == 0) begin
            div_count = divn-1;
        end else begin 
            div_count = div_count - 1;
        end
    end 
    assign fbclk = div_count >= divn/2;

    // TDC
    int phase_targ, phase_meas, phase_err, tdc_out;
    logic new_fb;
    always @(posedge fbclk) begin 
        phase_meas = $time;
        new_fb = 1'b1;
    end
    always @(posedge refclk) begin
        if (!new_fb) tdc_out = 4000; // Feedback late & outta range
        else begin 
            phase_targ = $time - 4e6; // Offset
            phase_err = (phase_meas - phase_targ) / 1e3;
            tdc_out = phase_err > 4000 ? 4000 : phase_err < -4000 ? -4000 : phase_err;
        end
        new_fb = 1'b0;
    end

    // Loop Filter
    assign err = fmeas_ready ? tdc_out : 0; // TDC Loop
    // assign err = fmeas_ready ? freq_err : 0; // FLL
    //assign err = ready ? targ_phase - dco_phase : 0; // Note FB Loop inverts here
    assign accum = err + accum_m1 - brake_code_delta;
    assign dp = err * KP;
    assign di = accum * KI;
    assign dctrl = di + dp;
    assign err_real = 1.0 * err;

endmodule

module tb ();
    logic refclk, pclk, resetn, brake;
    parameter REFCLK_PERIOD = `REFCLK_PERIOD;
    
    initial begin  // TB Setup
        $dumpfile("test.vcd");
        $dumpvars;

        resetn = 1'b0;
        brake = 1'b0;
        #(1.5*REFCLK_PERIOD);
        resetn = 1'b1;

        #(1000*1000*1000);
        // brake = 1'b1;
    end
    
    initial begin  // Ref-Clock Generation
        // Sadly these delays (in fs) get too big for ints!
        // vcs has a sad tendency to replace them with zero. 
        refclk = 1'b0;
        for (int i=1600; i>0; i--) begin
            #(REFCLK_PERIOD/2);
            refclk = !refclk;
        end
        $finish;
    end

    // DUT 
    parameter N = 32;

    pll i_pll(refclk, resetn, brake, N, pclk);

endmodule
