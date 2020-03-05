package pll

import chisel3._
import chisel3.util._


case class FDConfig(
    freqDivRatioWidth : Int = 16,
    freqCntrWidth     : Int = 16
)

class FDIO()(implicit val c: FDConfig) extends Bundle with FDTopLevelSignals {
    // Implicit clock should be ref_clk for PLL and div_clk for CDR
    val samp_clk     = Input(Clock())    // sampled clock. Should be div_clk for PLL and ref_clk for CDR

    // Outputs
    val output       = Output(UInt(2.W)) // Actual FD output
    val clock_div    = Output(Clock())   // Disconnect in top level. Used in unittest. Divided implicit clock
}

trait FDTopLevelSignals extends Bundle { // All IO's that are pins at the top level
    implicit val c: FDConfig
    val div_ratio    = Input(UInt(c.freqDivRatioWidth.W)) // implicit clk div ratio

    // Override controls
    val ovrd_b1 = Input(UInt(1.W))
    val ovrd_b0 = Input(UInt(1.W))
    val ovrd_en = Input(Bool())

    // Other control signals
    val flip         = Input(Bool())                        // invert FD output bits
    val th_low       = Input(UInt(c.freqCntrWidth.W))     // freq thresh to output 00 (before flip)
    val th_high      = Input(UInt(c.freqCntrWidth.W))    // freq thresh to output 11 (before flip)

    // Outputs
    val cntr_flopped = Output(Vec(2, UInt(c.freqCntrWidth.W)))
}

class FDTopLevelSignalIO()(implicit val c: FDConfig) extends Bundle with FDTopLevelSignals {
    override def cloneType = new FDTopLevelSignalIO()(c).asInstanceOf[this.type]
}

class FD()(implicit val c: FDConfig) extends Module {
    def bin2gray(bin: UInt) = bin ^ (bin >> 1.U)
    def gray2bin(width: Int, gray: UInt): UInt = {
        val bin = Wire(Vec(width, UInt(1.W)))
        bin(width-1) := gray(width-1)
        for (idx <- width-2 to 0 by -1) {
            bin(idx) := bin(idx+1) ^ gray(idx)
        }
        bin.asUInt
    }

    val io = IO(new FDIO)

    // Implicit clock is the clock domain for most of this block.
    val clkDiv = Module(new ClkDiv(c.freqDivRatioWidth))
    clkDiv.io.divRatio := io.div_ratio

    // The sampled clock is used for the counter and corresponding gray-coded value.
    val (freq_cntr, freq_cntr_gray) = withClock(io.samp_clk) {
        (Module(new AsyncResetRegVec(c.freqCntrWidth, 0)),
         Module(new AsyncResetRegVec(c.freqCntrWidth, 0)))
    }
    freq_cntr.io.en      := true.B
    freq_cntr_gray.io.en := true.B
    freq_cntr.io.d       := freq_cntr.io.q + 1.U
    freq_cntr_gray.io.d  := bin2gray(freq_cntr.io.q)

    val cntr_flopped_gray     = Module(new AsyncResetRegVec(c.freqCntrWidth, 0)) //RegInit(0.U(c.freqCntrWidth.W))
    cntr_flopped_gray.io.en  := clkDiv.io.output.asUInt().toBool()
    cntr_flopped_gray.io.d   := freq_cntr_gray.io.q
    val cntr_flopped_bin_1    = gray2bin(c.freqCntrWidth, cntr_flopped_gray.io.q)
    val cntr_flopped_bin_2    = Module(new AsyncResetRegVec(c.freqCntrWidth, 0))
    cntr_flopped_bin_2.io.en := clkDiv.io.output.asUInt().toBool()
    cntr_flopped_bin_2.io.d  := cntr_flopped_bin_1

    val cntr_diff    = cntr_flopped_bin_1 - cntr_flopped_bin_2.io.q
    val out_pre_flip = MuxCase(1.U, Array((cntr_diff < io.th_low) -> "b11".U, (cntr_diff > io.th_high) -> 0.U))
    val out_pre_ovrd = Mux(io.flip, ~out_pre_flip, out_pre_flip)
    val out_asserted = Mux(io.ovrd_en, Cat(io.ovrd_b1, io.ovrd_b0), out_pre_ovrd)

    io.clock_div       := clkDiv.io.output
    io.cntr_flopped(0) := cntr_flopped_bin_1
    io.cntr_flopped(1) := cntr_flopped_bin_2.io.q
    io.output          := Mux(clkDiv.io.output.asUInt().toBool(), out_asserted, 1.U)
}
