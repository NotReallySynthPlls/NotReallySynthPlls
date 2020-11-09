

module dco #(
       parameter NUM_DCO_MATRIX_ROWS = 17,
       parameter NUM_DCO_MATRIX_COLUMNS = 15,
       parameter real KDCO = 250e6,
       parameter real FMIN = 0.5e9,
       parameter real FMAX = 2e9
)(
       input wire dither, // ? 
       input wire [NUM_DCO_MATRIX_ROWS-2:0] row_sel_b,
       input wire [NUM_DCO_MATRIX_COLUMNS-2:0] col_sel_b,
       input wire sleep_b,
       input wire [7:0] code_regulator,
        output reg clock 
);
	real freq_calc, freq, period;
	int code, count_ones, col_count, row_count; 

	always_comb begin
		// Reverse-engineer this thing's integer-valued code 
  	count_ones = '0; 
		foreach(col_sel_b[idx]) begin
			count_ones += col_sel_b[idx];
		end
		col_count = NUM_DCO_MATRIX_COLUMNS-1 - count_ones;
  	count_ones = '0; 
		foreach(row_sel_b[idx]) begin
			count_ones += row_sel_b[idx];
		end
		row_count = NUM_DCO_MATRIX_ROWS-1 - count_ones;
		//code = 2^(NUM_DCO_MATRIX_ROWS-1) * row_count + col_count;
		code = NUM_DCO_MATRIX_COLUMNS * row_count + col_count;
	end
	
	//`timescale 1fs/1fs // FIXME: get local control 
	initial clock = 1'b0;
	always #(1e12*period/2) clock = ~clock;
    
	assign freq_calc = FMIN + code * KDCO; 
	assign freq = (freq_calc < FMIN ? FMIN : (freq_calc > FMAX ? FMAX : freq_calc) ); // Limiting
	assign period = 1/freq;

endmodule 

