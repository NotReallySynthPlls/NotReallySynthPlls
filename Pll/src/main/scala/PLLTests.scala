package pll

import chisel3._
import chisel3.util._


class PLLTest(mode: Int, timeout: Int = 500000) extends Module { //UnitTest(timeout) {
	implicit val c = PLLDigConfig()
    implicit val vcoCfg = VCOModelConfig(coarseWidth=c.coarseWidth, fineWidth=c.fineWidth, intWidth=c.intWidth)
    implicit val fdCfg = FDConfig()

    val io = IO(new Bundle {
        val finished = Output(Bool())
    })

    // val fname = s"data_mode_$mode.csv"

    val refClockGen = Module(new ClockGen(2000))
    val divClockGen = Module(new ClockGen(1e6/875))
    val divClk  = Wire(Bool())
    val cntrClk = Wire(Bool())
    divClk  := divClockGen.io.clock.asUInt().toBool()
    cntrClk := divClockGen.io.clock.asUInt().toBool()

    val dut = withClock(divClk.asClock()) { Module(new PLLDig) }
    val vco_model = Module(new vco)


    vco_model.io.coarse_tune    := dut.io.coarse_band
    vco_model.io.fine_tune      := dut.io.fine_band
    vco_model.io.int_val        := dut.io.int_band
    vco_model.io.prop_val       := ~dut.io.pd_out // flipped due to VCO
    vco_model.io.prop_gain_ctrl := 0.U
    vco_model.io.en             := true.B

    val vcoClkDiv = Module(new clkdivbbox(9, 0, 0)) // 9 should result in 16? 2 * (9 - 1)
    vcoClkDiv.io.clk := vco_model.io.vco
    vcoClkDiv.io.rst := reset

    val vcoClkDivPD = Module(new clkdivbbox(15, 0, 0)) // 15 should result in 28? 2 * (15 - 1)
    vcoClkDivPD.io.clk := vco_model.io.vco
    vcoClkDivPD.io.rst := reset

    val droppedWidth = c.freqAccumWidth - c.coarseWidth - c.fineWidth - c.intWidth

    val finished = RegInit(false.B)
    // val num_cycles = 10.U
    val num_cycles = Wire(UInt(32.W))
    num_cycles := 10.U

    val freq_band = Cat(dut.io.coarse_band, dut.io.fine_band, dut.io.int_band)
    val (freq_band_flopped, reset_flopped, init_ovrd_en_flopped_2, init_hold) = withClock(refClockGen.io.clock) {
        (
            RegNext(freq_band),
            RegNext(reset),
            ShiftRegister(dut.io.init_ovrd_en, n=2, resetData=false.B, en=true.B),
            RegInit(false.B)
        )
    }
    val init_done = init_hold || init_ovrd_en_flopped_2
    init_hold := init_done
    val init_hold_flopped = withClock(refClockGen.io.clock) { RegNext(init_hold, init=false.B) }

    val counter = withClock(cntrClk.asClock()) { Module(new AsyncResetRegVec(num_cycles.getWidth, 0)) }
    counter.io.en := true.B
    counter.io.d := counter.io.q + 1.U

    when (!finished) { finished := counter.io.q === num_cycles }
    io.finished := finished

    dut.io.ref_clk := refClockGen.io.clock
    dut.io.freq.div_ratio := 1000.U
    dut.io.freq.ovrd_b1   := 0.U
    dut.io.freq.ovrd_b0   := 1.U
    dut.io.freq.ovrd_en   := true.B
    dut.io.freq.flip      := false.B
    dut.io.freq.th_low    := 1749.U
    dut.io.freq.th_high   := 1751.U
    
    dut.io.int_gain       := 0.U
    dut.io.int_flip       := false.B
    dut.io.prop_flip       := false.B
    dut.io.freq_gain      := 0.U

    dut.io.pd_ovrd             := 0.U
    dut.io.pd_ovrd_en          := false.B
    dut.io.coarse_band_ovrd    := ~(0.asUInt(dut.io.coarse_band_ovrd.getWidth.W))
    dut.io.fine_band_ovrd      := ~(0.asUInt(dut.io.fine_band_ovrd.getWidth.W))
    dut.io.int_ovrd            := ~(0.asUInt(dut.io.int_ovrd.getWidth.W)) // clkDiv.io.output.asUInt()
    dut.io.init_ovrd           := ~(0.U(c.freqAccumWidth.W))
    dut.io.coarse_band_ovrd_en := false.B
    dut.io.fine_band_ovrd_en   := false.B
    dut.io.int_ovrd_en         := false.B
    dut.io.init_ovrd_en        := false.B

    when (init_ovrd_en_flopped_2) {
        assert (dut.io.freq_accum === dut.io.init_ovrd, "Freq summer should be initialized to proper value")
    }

    if (mode == 0) { // Override check
        num_cycles := 5.U * dut.io.freq.div_ratio
        dut.io.coarse_band_ovrd_en := true.B
        dut.io.fine_band_ovrd_en   := true.B
        dut.io.int_ovrd_en         := true.B
        assert(~freq_band === 0.U, "Not overriden")
    }
    else if (mode == 1) { // Open loop, drive PD output to 0
        num_cycles          := ((1.U << c.coarseWidth) + 1.U) * (1.U << (c.fineWidth + c.intWidth))//64.U * 64.U * 17.U//dut.io.freq_div_ratio
        dut.io.int_gain     := 1.U << droppedWidth
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        val freq_band_writer = Module(new FWriteBits("csvs", "freq_band_pd_0.csv", c.coarseWidth + c.fineWidth + c.intWidth))
        freq_band_writer.io.clk := refClockGen.io.clock
        freq_band_writer.io.en := !io.finished
        freq_band_writer.io.data := freq_band
        when (init_hold_flopped && (freq_band != 0.U)) {
            assert((freq_band_flopped - freq_band) === 1.U, "Not decreasing by 1")
        }
    }
    else if (mode == 2) { // Open loop, drive PD output to 1
        num_cycles          := ((1.U << c.coarseWidth) + 1.U) * (1.U << (c.fineWidth + c.intWidth))//64.U * 64.U * 17.U//dut.io.freq_div_ratio
        dut.io.int_gain     := 1.U << droppedWidth
        dut.io.init_ovrd    := 0.U
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        
        val freq_band_writer = Module(new FWriteBits("csvs", "freq_band_pd_1.csv", c.coarseWidth + c.fineWidth + c.intWidth))
        freq_band_writer.io.clk  := refClockGen.io.clock
        freq_band_writer.io.en   := !io.finished
        freq_band_writer.io.data := freq_band
        when (init_hold_flopped && (~freq_band != 0.U)) {
            assert((freq_band - freq_band_flopped) === 1.U, "Not increasing by 1")
        }
    }
    else if (mode == 3) { // Disconnect PD, connect FD
        // Clock connections
        divClk  := vcoClkDiv.io.clko.asUInt().toBool()  // Connect divClk to VCO's divided clock output
        cntrClk := dut.io.ref_clk_div.asUInt().toBool() // Count by refClkDiv (how often FD updates)

        num_cycles          := 300.U
        // dut.io.init_ovrd    := (1.U << (c.freqAccumWidth - 1)) - (1.U << (droppedWidth + c.intWidth)) + 1.U
        dut.io.init_ovrd    := (1.U << (c.freqAccumWidth - 1)) + (2.U << (droppedWidth + c.intWidth))
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        dut.io.freq.ovrd_en := false.B
        dut.io.freq_gain    := 1.U << (droppedWidth + 1)
        
        val freq_band_writer = Module(new FWriteBits("csvs", "freq_band.csv", c.coarseWidth + c.fineWidth + c.intWidth))
        freq_band_writer.io.clk  := refClockGen.io.clock
        freq_band_writer.io.en   := !io.finished
        freq_band_writer.io.data := freq_band
        
        val vco_freq = Module(new VCO_Freq)
        vco_freq.io.coarse_tune    := vco_model.io.coarse_tune
        vco_freq.io.fine_tune      := vco_model.io.fine_tune
        vco_freq.io.int_val        := vco_model.io.int_val
        vco_freq.io.prop_val       := vco_model.io.prop_val
        vco_freq.io.prop_gain_ctrl := vco_model.io.prop_gain_ctrl
        val freq_writer = Module(new FWriteReal("csvs", "vco_freq_fd.csv"))
        freq_writer.io.clk  := refClockGen.io.clock
        freq_writer.io.en   := !io.finished
        freq_writer.io.data <> vco_freq.io.Fvco
    }
    else if (mode == 4) { // Connect PD, disconnect FD
        // Clock connections
        divClk  := vcoClkDiv.io.clko.asUInt().toBool()   // Connect divClk to VCO's divided clock output
        // cntrClk := dut.io.ref_clk_div.asUInt().toBool()  // Count by refClkDiv (how often FD updates)

        num_cycles          := 10000.U
        dut.io.init_ovrd    := Cat(8.asUInt(c.coarseWidth.W), 6.asUInt(c.fineWidth.W), 37.asUInt(c.intWidth.W), 1.U(1.W), 0.U((droppedWidth - 1).W))
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        dut.io.freq.ovrd_en := false.B
        dut.io.int_gain     := (1 << droppedWidth).U//1.U << (droppedWidth - 5)
        vco_model.io.prop_gain_ctrl := 1.U
        
        val int_prop_code = Cat(dut.io.int_band, vco_model.io.prop_val)
        val freq_band_writer = Module(new FWriteBits("csvs", "code_int_prop.csv", c.intWidth + 1))
        freq_band_writer.io.clk  := refClockGen.io.clock
        freq_band_writer.io.en   := !io.finished
        freq_band_writer.io.data := int_prop_code
        
        val vco_freq = Module(new VCO_Freq)
        vco_freq.io.coarse_tune    := vco_model.io.coarse_tune
        vco_freq.io.fine_tune      := vco_model.io.fine_tune
        vco_freq.io.int_val        := vco_model.io.int_val
        vco_freq.io.prop_val       := vco_model.io.prop_val
        vco_freq.io.prop_gain_ctrl := vco_model.io.prop_gain_ctrl
        val freq_writer = Module(new FWriteReal("csvs", "vco_freq_int_prop.csv"))
        freq_writer.io.clk  := refClockGen.io.clock
        freq_writer.io.en   := !io.finished
        freq_writer.io.data <> vco_freq.io.Fvco
    }
    else if (mode == 5) {
        // Clock connections
        divClk  := vcoClkDiv.io.clko.asUInt().toBool()   // Connect divClk to VCO's divided clock output
        cntrClk := dut.io.ref_clk_div.asUInt().toBool()  // Count by refClkDiv (how often FD updates)

        num_cycles          := 300.U
        dut.io.init_ovrd    := Cat(7.asUInt(c.coarseWidth.W), 32.asUInt(c.fineWidth.W), 8.asUInt(c.intWidth.W), 1.U(1.W), 0.U((droppedWidth - 1).W))
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        dut.io.freq.ovrd_en := false.B
        dut.io.int_gain     := 1.U//1.U << (droppedWidth - 7)//(1 << (droppedWidth - 7)).U
        dut.io.freq_gain    := (1 << (droppedWidth + c.intWidth)).U//1.U << (droppedWidth + c.intWidth)
        vco_model.io.prop_gain_ctrl := 1.U
        
        val code = Cat(freq_band, vco_model.io.prop_val)
        val code_writer = Module(new FWriteBits("csvs", "code_system.csv", c.coarseWidth + c.fineWidth + c.intWidth + 1))
        code_writer.io.clk  := refClockGen.io.clock
        code_writer.io.en   := !io.finished
        code_writer.io.data := code
        
        val vco_freq = Module(new VCO_Freq)
        vco_freq.io.coarse_tune    := vco_model.io.coarse_tune
        vco_freq.io.fine_tune      := vco_model.io.fine_tune
        vco_freq.io.int_val        := vco_model.io.int_val
        vco_freq.io.prop_val       := vco_model.io.prop_val
        vco_freq.io.prop_gain_ctrl := vco_model.io.prop_gain_ctrl
        val freq_writer = Module(new FWriteReal("csvs", "vco_freq_system.csv"))
        freq_writer.io.clk  := refClockGen.io.clock
        freq_writer.io.en   := !io.finished
        freq_writer.io.data <> vco_freq.io.Fvco
    }
    else if (mode == 6) {
        // Clock connections
        divClk  := vcoClkDiv.io.clko.asUInt().toBool()   // Connect divClk to VCO's divided clock output
        cntrClk := dut.io.ref_clk_div.asUInt().toBool()  // Count by refClkDiv (how often FD updates)

        num_cycles          := 300.U
        dut.io.init_ovrd    := Cat(7.asUInt(c.coarseWidth.W), 32.asUInt(c.fineWidth.W), 8.asUInt(c.intWidth.W), 1.U(1.W), 0.U((droppedWidth - 1).W))
        dut.io.init_ovrd_en := RegNext(false.B, init=true.B)
        dut.io.freq.ovrd_en := false.B
        dut.io.int_gain     := (1 << droppedWidth).U//1.U << (droppedWidth - 5)
        vco_model.io.prop_gain_ctrl := 1.U
        
        val code = Cat(freq_band, vco_model.io.prop_val)
        val code_writer = Module(new FWriteBits("csvs", "code_int_prop.csv", c.coarseWidth + c.fineWidth + c.intWidth + 1))
        code_writer.io.clk  := refClockGen.io.clock
        code_writer.io.en   := !io.finished
        code_writer.io.data := code
        
        val vco_freq = Module(new VCO_Freq)
        vco_freq.io.coarse_tune    := vco_model.io.coarse_tune
        vco_freq.io.fine_tune      := vco_model.io.fine_tune
        vco_freq.io.int_val        := vco_model.io.int_val
        vco_freq.io.prop_val       := vco_model.io.prop_val
        vco_freq.io.prop_gain_ctrl := vco_model.io.prop_gain_ctrl
        val freq_writer = Module(new FWriteReal("csvs", "vco_freq_int_prop.csv"))
        freq_writer.io.clk  := refClockGen.io.clock
        freq_writer.io.en   := !io.finished
        freq_writer.io.data <> vco_freq.io.Fvco
    }

}

object PLLTests {
    val modes = (0 to 6).toList
    // val modes = List(0, 1, 2, 5)
    def apply(timeout: Int = 1000000):Seq[Module] = for (m <- modes) yield Module(new PLLTest(m, timeout))

    // This needs to be a Seq so you can append them with ++
    // def apply() = Seq(Module(new PLLTest))

}

object PLLTest extends App {
//   chisel3.Driver.execute(Array[String](), () => new PLLTest)
  chisel3.Driver.execute(args, () => new PLLTest(0, 10000))
}

