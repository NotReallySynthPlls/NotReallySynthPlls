module bbpllABE #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter NUM_DCO_CONTROL_BITS_INT = 8 // should be 2^ceil(log2(17*15))
)(
       input wire [NUM_DCO_MATRIX_ROWS-2:0] rowSelect,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] colSelect,
       input wire Dither,
       output wire Output
);

// [jcw]: turn this off during synthesis and just have a stub
`ifndef SYNTHESIS
wire [NUM_DCO_CONTROL_BITS_INT-1:0] dcoCtrlCodeInt;

dcoMatrix2binary #(
  .NUM_DCO_MATRIX_ROWS     (NUM_DCO_MATRIX_ROWS     ),
  .NUM_DCO_MATRIX_COLUMNS  (NUM_DCO_MATRIX_COLUMNS  ),
  .NUM_DCO_CONTROL_BITS_INT(NUM_DCO_CONTROL_BITS_INT)
) dcom2b (
  .dcoRowSelect            (rowSelect         ),
  .dcoColumnSelect         (colSelect         ),
  .dcoCtrlCodeInt          (dcoCtrlCodeInt    )
);

DCOcore #(
  .NUM_DCO_CONTROL_BITS_INT(NUM_DCO_CONTROL_BITS_INT)
) GROcore (
  .dcoCtrlCodeInt          (dcoCtrlCodeInt     ),
  .dcoDither               (Dither             ),
  .dco                     (Output             )
);
`endif

endmodule


module dcoMatrix2binary #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter NUM_DCO_CONTROL_BITS_INT = 8 // should be 2^ceil(log2(17*15))
)(
       input wire [NUM_DCO_MATRIX_ROWS-2:0] dcoRowSelect,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] dcoColumnSelect,
      output wire [NUM_DCO_CONTROL_BITS_INT-1:0] dcoCtrlCodeInt
);

// [jcw]: changed this to an integer so it's verilog compatible
integer dcoCtrlCode, i, j;
initial dcoCtrlCode = 0;

always @(dcoRowSelect or dcoColumnSelect) begin
       dcoCtrlCode = 0;
       for (i=0; i<NUM_DCO_MATRIX_ROWS-1; i=i+1)
            if (dcoRowSelect[i] == 0)
                dcoCtrlCode = dcoCtrlCode + NUM_DCO_MATRIX_COLUMNS;
       for (j=0; j<NUM_DCO_MATRIX_COLUMNS-1; j=j+1)
            if (dcoColumnSelect[j] == 0)
                dcoCtrlCode = dcoCtrlCode + 1;
end

assign dcoCtrlCodeInt = dcoCtrlCode;

endmodule


module DCOcore #(
        parameter NUM_DCO_CONTROL_BITS_INT = 8,
        parameter FREE_RUNNING_FREQUENCY = 123.4, // in units of MHz
        parameter KDCO = 15.7, // in units of MHz/LSB
        parameter DCO_JITTER = 123.45 // rms jitter in units of fs
)(
        input wire [NUM_DCO_CONTROL_BITS_INT-1:0] dcoCtrlCodeInt,
        input wire dcoDither,
        output reg dco
);

parameter RAND_BIT_SIZE = 32;
parameter ENTRY_BIT_SIZE = 25;
parameter NUM_RAND_ENTRIES = (1 << ENTRY_BIT_SIZE);
parameter RMS_VALUE = (1 << (RAND_BIT_SIZE-1))/6;
parameter DCO_JITTER_NS = DCO_JITTER/1.0e3;
parameter noise_gain = DCO_JITTER_NS/RMS_VALUE;

reg signed [RAND_BIT_SIZE-1:0] phase_noise_value = 0;

real fdco, fdcoUpdate;
integer seed;

initial fdco = FREE_RUNNING_FREQUENCY;
initial fdcoUpdate = FREE_RUNNING_FREQUENCY;
initial dco = 0;

wire dcoCtrlCodeShortInt = dcoCtrlCodeInt;

always @(dcoCtrlCodeInt or dcoDither) begin
	fdco = FREE_RUNNING_FREQUENCY + KDCO * (dcoCtrlCodeShortInt + dcoDither); // in MHz
end

always #((noise_gain * phase_noise_value) + (0.5e6 / fdcoUpdate)) begin
	dco <= !dco;
	if (dco == 1) begin
		phase_noise_value = 0;
	end else begin
		fdcoUpdate=fdco;
		phase_noise_value = $dist_normal(seed,0,357140000);
	end
end

endmodule
