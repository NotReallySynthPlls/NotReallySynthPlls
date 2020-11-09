`timescale 1ps/1fs

module pll_testbench;

    reg reset;
    reg referenceClock;
    reg freqAcqEnable;
    reg phaseAcqEnable;
    reg prndGeneratorEnable;
    reg prndDitheringEnable;
    reg dcoCtrlCodeOverride;
    reg ldDivideEnable;
    reg [8:0] lockThreshold;
    reg [13:0] dcoColSelOverride;
    reg [15:0] dcoRowSelectOverride;
    reg [3:0] divisor;
    reg [6:0] integralConstant;
    reg [6:0] proportionalConstant;
    reg sleep_b;
    reg [7:0] codeRegulator;
    //reg [7:0] cycles;
    
    wire dco_clock;
    wire dcoDither;
    wire locked;
    wire [15:0] dcoRowSelect;
    wire [13:0] dcoColumnSelect;

    //eagle_dco_lin_k dut(
            //.dither(dcoDither),
            //.row_sel_b(dcoRowSelect),
            //.col_sel_b(dcoColumnSelect),
            //.clock(dco_clock)
    //);

    dco dut(
        .dither(dcoDither),
        .row_sel_b(dcoRowSelect),
        .col_sel_b(dcoColumnSelect),
        .clock(dco_clock),
        .sleep_b(sleep_b),
        .code_regulator(codeRegulator)
    );

    bbpllDFE #(.NUM_DCO_MATRIX_COLUMNS(15), .NUM_DCO_MATRIX_ROWS(17)) loop (
            .reset(reset),
            .referenceClock(referenceClock),
            .outputClock(dco_clock),
            .freqAcqEnable(freqAcqEnable),
            .phaseAcqEnable(phaseAcqEnable),
            .prndGeneratorEnable(prndGeneratorEnable),
            .prndDitheringEnable(prndDitheringEnable),
            .lockThreshold(lockThreshold),
            .locked(locked),
            .ldDivideEnable(ldDivideEnable),
            .dcoCtrlCodeOverride(dcoCtrlCodeOverride),
            .dcoColSelectOverride(dcoColSelOverride),
            .dcoRowSelectOverride(dcoRowSelectOverride),
            .divisor(divisor),
            .integralConstant(integralConstant),
            .proportionalConstant(proportionalConstant),
            .dcoRowSelect(dcoRowSelect),
            .dcoColumnSelect(dcoColumnSelect),
            .dcoDither(dcoDither)
    );

    edges #(.filename("dco_clock.yml")) i_edges (
        .clock(dco_clock),
        .enable(1'b1)
    );

    integer n = 0;
    real ref_delay_ps;

    
    initial begin
        $dumpfile("test.vcd");
        $dumpvars;
        //$vcdpluson();
        reset = 1'b1;
        //dcoDither = 1'b0; 
        freqAcqEnable = 1'b1;
        phaseAcqEnable = 1'b1;
        prndGeneratorEnable = 1'b0;
        prndDitheringEnable = 1'b0;
        dcoCtrlCodeOverride = 1'b1;
        ldDivideEnable = 1'b1;
        dcoColSelOverride = 14'b11111111111111;
        dcoRowSelectOverride = 16'b1111111111111111;
        divisor = 4'b0010;
        ref_delay_ps = 03333;
        referenceClock = 1'b0;
        integralConstant = 7'b0000001;
        proportionalConstant = 7'b0000010;
        lockThreshold = 4'b1000;
        sleep_b = 1'b1;
        codeRegulator = 8'b0;
                        #(2.3 * ref_delay_ps)
            reset = 1'b0;
            #(ref_delay_ps+100)
            dcoCtrlCodeOverride = 1'b0;
            prndGeneratorEnable = 1'b0;
            prndDitheringEnable = 1'b0;
            #500_000_000

//#(2.3 * ref_delay_ps)
            //reset = 1'b0;
            //#(ref_delay_ps+100)
            //dcoCtrlCodeOverride = 1'b0;
            //prndGeneratorEnable = 1'b0;
            //prndDitheringEnable = 1'b0;
            //#50000000
            //divisor = 4'b0100;
            //#50000000
            //divisor = 4'b0001;
            //#50000000
            //divisor = 4'b0010;
            //#50000000
        $finish;
    end

    initial begin
        forever begin
            //if (!reset) begin
                    #(ref_delay_ps) referenceClock = !referenceClock;
            //end else begin
                //referenceClock = 1'b0;
            //end
        end
    end
endmodule
