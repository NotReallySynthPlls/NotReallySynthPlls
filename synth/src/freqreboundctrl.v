//=========================================================================
// RTL Model of Frequency Rebound Control
//-------------------------------------------------------------------------
//

module freqreboundctrl#( parameter W = 8 ) 
( 
    input               clk,
    input               rstb,
    input   [W-1:0]     q,

    output  [W-1:0]     fcode,
    output  [W-1:0]     fcode_syn
);

reg [W-1:0]     r_q0, r_q1, r_q2, r_min, r_code;
reg [W-1:0]     r_state [31:0];

wire [W-1:0]    w_fcode;
wire [W-1:0]    w_minsync;

genvar i;
// Async path
generate
for (i=0; i< W; i=i+1)
begin: gen_minasync
    assign w_fcode[i] = q[i] & r_min[i];
end
endgenerate

assign fcode[W-1:0] = w_fcode[W-1:0];

// Sync path
always@(posedge clk)
begin
    if (rstb != 1'b1)
    begin
        r_q0    <= {W{1'b1}};
        r_q1    <= {W{1'b1}};
        r_q2    <= {W{1'b1}};
        r_min   <= {W{1'b1}};
        r_code  <= {W{1'b1}};
    end
    else
    begin
        r_q0    <= q;
        r_q1    <= r_q0;    
        r_q2    <= r_q1;
        r_min   <= w_minsync;
        r_code  <= r_min;
    end 
end


// Shift reg
always@(posedge clk)
begin
    if (rstb != 1'b1) r_state[0] <= {W{1'b1}};
    else r_state[0][W-1:0] <= {r_min[W-2:0],1'b1};
end

genvar j;
generate
for (j=1; j<32; j=j+1)
begin: gen_shiftreg
    always@(posedge clk)
    begin
        if (rstb != 1'b1) r_state[j] <= {W{1'b1}};
        else r_state[j] <= r_state[j-1];
    end
end
endgenerate

// Min of shiftreg
genvar k;
generate
for(k=0; k<W; k=k+1)
begin: min_shiftreg
    assign w_minsync[k] =   r_state[0][k] & r_state[1][k] & r_state[2][k] & r_state[3][k] &
                            r_state[4][k] & r_state[5][k] & r_state[6][k] & r_state[7][k] &
                            r_state[8][k] & r_state[9][k] & r_state[10][k] & r_state[11][k] &
                            r_state[12][k] & r_state[13][k] & r_state[14][k] & r_state[15][k] &
                            r_state[16][k] & r_state[17][k] & r_state[18][k] & r_state[19][k] &
                            r_state[20][k] & r_state[21][k] & r_state[22][k] & r_state[23][k] &
                            r_state[24][k] & r_state[25][k] & r_state[26][k] & r_state[27][k] &
                            r_state[28][k] & r_state[29][k] & r_state[30][k] & r_state[31][k] &
                            r_q2[k];
end
endgenerate

// Moving average
localparam Nbits = 4;
localparam Noutbits = 10;
reg [Nbits-1:0]     r_codeavg_dly [31:0];
wire [W:0] w_sum;
reg [W-1:0]  r_codeavg_out;

genvar m;
generate
always@(posedge clk)
begin
    if (rstb != 1'b1) r_codeavg_dly[0] <= 4'd8;
    else r_codeavg_dly[0] <= r_code[7] + r_code[6] + r_code[5] + r_code[4] + r_code[3] + r_code[2] + r_code[1] + r_code[0];
end
for(m=1; m<32; m=m+1)
begin: moving_avg
    always@(posedge clk)
    begin
        if (rstb != 1'b1) r_codeavg_dly[m] <= 4'd8;
        else r_codeavg_dly[m] <= r_codeavg_dly[m-1];
    end
end
endgenerate

// Sum and divide (by power of 2)
assign w_sum    =       r_codeavg_dly[0] + r_codeavg_dly[1] + r_codeavg_dly[2] + r_codeavg_dly[3] +
                        r_codeavg_dly[4] + r_codeavg_dly[5] + r_codeavg_dly[6] + r_codeavg_dly[7] +
                        r_codeavg_dly[8] + r_codeavg_dly[9] + r_codeavg_dly[10] + r_codeavg_dly[11] +
                        r_codeavg_dly[12] + r_codeavg_dly[13] + r_codeavg_dly[14] + r_codeavg_dly[15] +
                        r_codeavg_dly[16] + r_codeavg_dly[17] + r_codeavg_dly[18] + r_codeavg_dly[19] +
                        r_codeavg_dly[20] + r_codeavg_dly[21] + r_codeavg_dly[22] + r_codeavg_dly[23] +
                        r_codeavg_dly[24] + r_codeavg_dly[25] + r_codeavg_dly[26] + r_codeavg_dly[27] +
                        r_codeavg_dly[28] + r_codeavg_dly[29] + r_codeavg_dly[30] + r_codeavg_dly[31] ;

always@(posedge clk)
begin
    if (rstb != 1'b1) r_codeavg_out <= 'd8;
    else r_codeavg_out <= w_sum >> 5; 
end

assign fcode_syn = r_codeavg_out;

endmodule
