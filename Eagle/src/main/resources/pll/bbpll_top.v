module bbpll #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter NUM_DCO_CONTROL_BITS_INT = 8,
       parameter NUM_DCO_CONTROL_BITS_FRC = 7,
       parameter NUM_EVEN_DIVISOR_BITS = 4,
       parameter NUM_LFSR_BITS = 16,
       parameter NUM_PRND_MOD_BITS = 9
)(
//////////////////////////////////////////////////////////////////
///////////////////////////// PINS ///////////////////////////////
//////////////////////////////////////////////////////////////////
       input wire reset,
       input wire referenceClock,
       output wire outputClock,
       input wire frequencyAcqEnable,
       input wire phaseAcqEnable,
       input wire prndGenEnable,
       input wire prndDitEnable,
       input wire dcoCtrlCodeOverride,
       input wire ldDivideEnable,
       input wire sleep_b,
       input wire [7:0] code_regulator,
       input wire [8:0] lockThreshold,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColSelectOverride,
       input wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelectOverride,
       input wire [NUM_EVEN_DIVISOR_BITS-1:0] divisor,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] intConstant,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] propConstant,
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
   .NUM_PRND_MOD_BITS       (NUM_PRND_MOD_BITS       )
) bbpllDig (
   .reset                   (reset                   ),
   .referenceClock          (referenceClock          ),
   .outputClock             (outputClock             ),
   .freqAcqEnable           (frequencyAcqEnable      ),
   .phaseAcqEnable          (phaseAcqEnable          ),
   .prndGeneratorEnable     (prndGenEnable           ),
   .prndDitheringEnable     (prndDitEnable           ),
   .dcoCtrlCodeOverride     (dcoCtrlCodeOverride     ),
   .ldDivideEnable          (ldDivideEnable          ),
   .lockThreshold           (lockThreshold           ),
   .dcoColSelectOverride    (dcoColSelectOverride    ),
   .dcoRowSelectOverride    (dcoRowSelectOverride    ),
   .divisor                 (divisor                 ),
   .integralConstant        (intConstant             ),
   .proportionalConstant    (propConstant            ),
   .dcoRowSelect            (dcoRowSelect            ),
   .dcoColumnSelect         (dcoColumnSelect         ),
   .dcoDither               (dcoDither               ),
   .locked                  (locked                  )
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
        .sleep_b          (sleep_b                   ),
        .code_regulator   (code_regulator            ),
        .clock            (dco_clock                 )
);


endmodule
