
//! 
//! # Supply Droop and Recovery Manager
//! 
module droop_mgr(
    input  logic refclk,
    input  logic resetn,
    input  logic brake,
    output brake_state_t brake_state,
    output longint delta_f,
    output longint delta_n
);
    // Brake Handling 
    parameter longint BRAKE_DELTA_F = 1e9;
    parameter longint BRAKE_CODE = 1e6; // FIXME: these param dependences: K_PHASE_DIV * BRAKE_DELTA_F / `KDCO_FINE / KI_PHASE;
    parameter longint BRAKE_DIV = 10; // Divider initial delta-N
    parameter longint BRAKE_DIV_STEP = 1; // Step size during divider recovery 
    parameter longint BRAKE_HOLD_CYCLES = 32; // How many ref-cycles to hold at each recovery-step
    parameter longint BRAKE_CYCLES = 500; // How many cycles to hold before beginning recovery
    
    longint brake_countdown, brake_code_delta, brake_div_delta, brake_hold_cycles;

    // Main FSM Action
    always_ff @(posedge refclk or negedge resetn) begin 
        if (!resetn) begin 
            brake_state <= BRAKES_OFF;
            brake_hold_cycles <= BRAKE_HOLD_CYCLES;
            brake_countdown <= 0;
            // Codes are "pre-armed", and enabled combinationally
            brake_code_delta <= BRAKE_CODE; 
            brake_div_delta <= BRAKE_DIV;
        end else begin // Clock Edge
            if (brake_state == BRAKES_OFF) begin
                if (brake) begin // Latch into BRAKING state
                    brake_state <= BRAKING;
                    brake_countdown <= BRAKE_CYCLES;
                end
            end else if (brake_state == BRAKING) begin
                brake_code_delta <= 0; // This clears the brake-code accumulator input
                if (brake) begin // Sit here until brake-input de-asserted
                    brake_countdown <= BRAKE_CYCLES;
                end else if (brake_countdown > 0) begin 
                    brake_countdown <= brake_countdown - 1;
                end else begin // Countdown over, move to recovery 
                    brake_state <= RECOVERING;
                    brake_hold_cycles <= BRAKE_HOLD_CYCLES;
                end
            end else if (brake_state == RECOVERING) begin 
                brake_code_delta <= 0;
                if (brake_hold_cycles > 0) brake_hold_cycles <= brake_hold_cycles - 1;
                else begin 
                    brake_hold_cycles <= BRAKE_HOLD_CYCLES;
                    if (brake_div_delta > (BRAKE_DIV_STEP-1)) brake_div_delta <= brake_div_delta - BRAKE_DIV_STEP;
                    else begin // We handled it! We're done!
                        brake_state <= BRAKES_OFF;
                        // Codes are "pre-armed", and enabled combinationally
                        brake_code_delta <= BRAKE_CODE; 
                        brake_div_delta <= BRAKE_DIV;
                    end 
                end
            end
        end 
    end

    // Combinational brake-enable
    logic brakes_on;
    assign brakes_on = brake | (brake_state != BRAKES_OFF);
    assign delta_f = brakes_on ? brake_code_delta : 0;
    assign delta_n = brakes_on ? brake_div_delta : 0;

endmodule
