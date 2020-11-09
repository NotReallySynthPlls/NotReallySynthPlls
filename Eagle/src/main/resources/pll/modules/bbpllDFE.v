module bbpllDFE #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter NUM_DCO_CONTROL_BITS_INT = 8,
       parameter NUM_DCO_CONTROL_BITS_FRC = 7,
       parameter NUM_EVEN_DIVISOR_BITS = 4,
       parameter NUM_LFSR_BITS = 16,
       parameter NUM_PRND_MOD_BITS = 9
)(
       input wire reset,
       input wire referenceClock,
       input wire outputClock,
       input wire freqAcqEnable,
       input wire phaseAcqEnable,
       input wire prndGeneratorEnable,
       input wire prndDitheringEnable,
       input wire dcoCtrlCodeOverride,
       input wire ldDivideEnable,
       input wire [8:0] lockThreshold,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColSelectOverride,
       input wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelectOverride,
       input wire [NUM_EVEN_DIVISOR_BITS-1:0] divisor,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] integralConstant,
       input wire [NUM_DCO_CONTROL_BITS_FRC-1:0] proportionalConstant,
       output wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelect,
       output wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColumnSelect,
       output wire dcoDither,
       output wire locked
);

wire dividedClock, rstneg, updn, freqDec, freqInc, overflow, underflow, dcoCtrlCodeIntDec, dcoCtrlCodeIntInc;
wire [NUM_EVEN_DIVISOR_BITS:0] ditheringWidth, pseudoRandomNumber;
wire [NUM_EVEN_DIVISOR_BITS+1:0] divisoReal;

assign rstneg = !reset;
assign divisoReal = {divisor+1'b1,1'b0};
assign dcoCtrlCodeIntDec = freqDec || underflow;
assign dcoCtrlCodeIntInc = freqInc || overflow;

/// Binary Phase Detector (BPD) ///
bpd //#()
phaseDetector(
   .clock             (referenceClock      ),
   .vfb               (dividedClock        ),
   .updn              (updn                )
);

/// Fractional Digital Loop Filter ///
dlf #(
   .NUM_FRACTIONAL_BITS (NUM_DCO_CONTROL_BITS_FRC),
   .NUM_DITHERING_BITS  (NUM_EVEN_DIVISOR_BITS+1)
) loopFilter (
   .reset             (rstneg              ),
   .enable            (phaseAcqEnable      ),
   //.clock             (dividedClock        ),
   .clock             (referenceClock      ),
   .updn              (updn                ),
   .ki                (integralConstant    ),
   .kp                (proportionalConstant),
   .overflow          (overflow            ),
   .underflow         (underflow           ),
   .ditherWidth       (ditheringWidth      )
);

/// DCO Shift Control /////
shiftDCOctrl #(
   .NUM_DCO_MATRIX_ROWS (NUM_DCO_MATRIX_ROWS),
   .NUM_DCO_MATRIX_COLUMNS(NUM_DCO_MATRIX_COLUMNS)
)
DCOshiftRegControl (
   .reset             (rstneg              ),
   .override          (dcoCtrlCodeOverride ),
   //.clock             (dividedClock        ),
 .clock             (referenceClock      ),
   .dec               (dcoCtrlCodeIntDec   ),
   .inc               (dcoCtrlCodeIntInc   ),
   .dcoColSelOverride (dcoColSelectOverride),
   .dcoRowSelOverride (dcoRowSelectOverride),
   .dcoColumnSelect   (dcoColumnSelect     ),
   .dcoRowSelect      (dcoRowSelect        )
);

/// Frequency Detector ///
//freqCmpNeg //#()
freqCmpPos //#()
frequencyComparator (
   .reset             (rstneg              ),
   .enable            (freqAcqEnable       ),
   .refClk            (referenceClock      ),
   .divClk            (dividedClock        ),
   .freqInc           (freqInc             ),
   .freqDec           (freqDec             )
);

/// Software PseudoRandom Number Generator ///
//PRNDideal #(
//   .NUM_PRND_BITS   (NUM_EVEN_DIVISOR_BITS+1)
//) prndSoftwareGen (
//   .clock             (dividedClock        ),
//   .enable            (prndGeneratorEnable ),
//   .prndRange         (divisoReal          ),
//   .prndNum           (pseudoRandomNumber  )
//);

/// Hardware PseudoRandom Number Generator ///
prndGen #(
   .NUM_LFSR_BITS      (NUM_LFSR_BITS       ),
   .NUM_PRND_BITS   (NUM_EVEN_DIVISOR_BITS+1),
   .NUM_PRND_MODULO_BITS(NUM_PRND_MOD_BITS  )
) prndHardwareGen (
   .reset             (rstneg              ),
   .clock             (dividedClock        ),
   .enable            (prndGeneratorEnable ),
   .prndRange         (divisoReal          ),
   .prndNum           (pseudoRandomNumber  )
);

/// PseudoRandom PWM Fractional Dithering ///
prndPWMdither #(
   .NUM_PRND_BITS  (NUM_EVEN_DIVISOR_BITS+1)
) pseudorandomDithering (
   .enable            (prndDitheringEnable ),
   .clockFast         (outputClock         ),
   .clockSlow         (dividedClock        ),
   .divisor           (divisoReal          ),
   .prndNumber        (pseudoRandomNumber  ),
   .width             (ditheringWidth      ),
   .ditherBit         (dcoDither           )
);

/// Integer-N Frequency Divider ///
frequencyDividerEvenDown #(
//frequencyDividerEvenUp #(
   .NUM_DIVISOR_BITS (NUM_EVEN_DIVISOR_BITS)
) integerNfrequencyDivider (
   .in                (outputClock         ),
   .reset             (rstneg              ),
   .halfdivisor       (divisor             ),
   .out               (dividedClock        )
);

lock_detect_v2 #(
    .NUM_INC_COUNTER_BITS(6),
    .NUM_CLK_COUNTER_BITS(07)
) lock_detector (
    .clock(referenceClock),
    .reset(rstneg),
    .lockThreshold(lockThreshold),
    .freqUp(dcoCtrlCodeIntInc),
    .freqDn(dcoCtrlCodeIntDec),
    .ldDivideEnable(ldDivideEnable),
    .locked(locked)
);

endmodule
