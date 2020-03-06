module bbpll #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter NUM_DCO_CONTROL_BITS_INT = 8,
       parameter NUM_DCO_CONTROL_BITS_FRC = 7,
       parameter NUM_EVEN_DIVISOR_BITS = 4,
       parameter NUM_LFSR_BITS = 16,
       parameter NUM_PRND_MOD_BITS = 9,
       parameter NUM_CTRL_COUNTER_BITS = 4,
       parameter NUM_CLK_COUNTER_BITS = 7
)(
//////////////////////////////////////////////////////////////////
///////////////////////////// PINS ///////////////////////////////
//////////////////////////////////////////////////////////////////
       input wire reset,
       input wire referenceClock,
       input wire frequencyAcqEnable,
       input wire phaseAcqEnable,
       input wire prndGenEnable,
       input wire prndDitEnable,
       input wire [2:0] lockThreshold,
       input wire dcoCtrlCodeOverride,
       input wire sleepB,
       input wire [7:0] codeRegulator,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColSelectOverride,
       input wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelectOverride,
       input wire [NUM_EVEN_DIVISOR_BITS-1:0] divisor,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] intConstant,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] propConstant,
       output wire outputClock,
       output wire locked
);

///////////////////////////////////////////////
////////// Signals ////////////////////////////
///////////////////////////////////////////////

wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelect;
wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColumnSelect;
wire dcoDither;

////////////////////////////////////////////////
//// Instances /////////////////////////////////
////////////////////////////////////////////////

/////////////////////
///////// DFE ///////
/////////////////////
bbpllDFE #(
   .NUM_DCO_MATRIX_ROWS     (NUM_DCO_MATRIX_ROWS     ),
   .NUM_DCO_MATRIX_COLUMNS  (NUM_DCO_MATRIX_COLUMNS  ),
   .NUM_DCO_CONTROL_BITS_INT(NUM_DCO_CONTROL_BITS_INT),
   .NUM_DCO_CONTROL_BITS_FRC(NUM_DCO_CONTROL_BITS_FRC),
   .NUM_EVEN_DIVISOR_BITS   (NUM_EVEN_DIVISOR_BITS   ),
   .NUM_LFSR_BITS           (NUM_LFSR_BITS           ),
   .NUM_PRND_MOD_BITS       (NUM_PRND_MOD_BITS       ),
   .NUM_CTRL_COUNTER_BITS   (NUM_CTRL_COUNTER_BITS   ),
   .NUM_CLK_COUNTER_BITS    (NUM_CLK_COUNTER_BITS    )
) bbpllDig (
   .reset                   (reset                   ),
   .referenceClock          (referenceClock          ),
   .outputClock             (outputClock             ),
   .freqAcqEnable           (frequencyAcqEnable      ),
   .phaseAcqEnable          (phaseAcqEnable          ),
   .prndGeneratorEnable     (prndGenEnable           ),
   .prndDitheringEnable     (prndDitEnable           ),
   .lockThreshold           (lockThreshold           ),
   .locked                  (locked                  ),
   .dcoCtrlCodeOverride     (dcoCtrlCodeOverride     ),
   .dcoColSelectOverride    (dcoColSelectOverride    ),
   .dcoRowSelectOverride    (dcoRowSelectOverride    ),
   .divisor                 (divisor                 ),
   .integralConstant        (intConstant             ),
   .proportionalConstant    (propConstant            ),
   .dcoRowSelect            (dcoRowSelect            ),
   .dcoColumnSelect         (dcoColumnSelect         ),
   .dcoDither               (dcoDither               )
);

//////////////////
////// ABE ///////
//////////////////
/*bbpllABE #(
   .NUM_DCO_MATRIX_ROWS     (NUM_DCO_MATRIX_ROWS     ),
   .NUM_DCO_MATRIX_COLUMNS  (NUM_DCO_MATRIX_COLUMNS  ),
   .NUM_DCO_CONTROL_BITS_INT(NUM_DCO_CONTROL_BITS_INT)
) bbpllDCO (
   .rowSelect             (dcoRowSelect            ),
   .colSelect             (dcoColumnSelect         ),
   .Dither                (dcoDither               ),
   .Output                (outputClock             )
);*/


eagle_dco #(
   .EAGLE_DCO_ROWS        (NUM_DCO_MATRIX_ROWS - 1   ),
   .EAGLE_DCO_COLS        (NUM_DCO_MATRIX_COLUMNS - 1)
) bbpllDCO(
        .dither           (dcoDither                 ),
        .row_sel_b        (dcoRowSelect              ),
        .col_sel_b        (dcoColumnSelect           ),
        .sleep_b          (sleepB                    ),
        .code_regulator   (codeRegulator             ),
        .clock            (outputClock               )
);


endmodule
