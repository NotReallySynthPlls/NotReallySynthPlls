package pll

import chisel3._
import chisel3.util._


case class PLLDigConfig(
    bufWidth           : Int = 4,
    coarseWidth        : Int = 4,
    fineWidth          : Int = 6,
    intWidth           : Int = 8,
    intGainCtrlWidth   : Int = 16,
    freqGainCtrlWidth  : Int = 16,
    freqAccumWidth     : Int = 24
)

class PLLDigIO()(implicit val pllcfg: PLLDigConfig, implicit val fdcfg: FDConfig) extends Bundle {
    val freq      = new FDTopLevelSignalIO
    val ref_clk   = Input(Clock())                          // implicit clock is div_clk
    val pd_out    = Output(Bool())

    // External/override controls
    val int_gain  = Input(UInt(pllcfg.intGainCtrlWidth.W))
    val int_flip  = Input(Bool())
    val prop_flip  = Input(Bool())
    val freq_gain = Input(UInt(pllcfg.freqGainCtrlWidth.W))
    val pd_ovrd             = Input(UInt(1.W))
    val init_ovrd           = Input(UInt(pllcfg.freqAccumWidth.W))
    val int_ovrd            = Input(UInt(pllcfg.intWidth.W))
    val coarse_band_ovrd    = Input(UInt(pllcfg.coarseWidth.W))
    val fine_band_ovrd      = Input(UInt(pllcfg.fineWidth.W))
    val pd_ovrd_en          = Input(Bool())
    val init_ovrd_en        = Input(Bool())
    val int_ovrd_en         = Input(Bool())
    val coarse_band_ovrd_en = Input(Bool())
    val fine_band_ovrd_en   = Input(Bool())

    // Outputs to VCO; proportional path inputs are in Analog
    val coarse_band = Output(UInt(pllcfg.coarseWidth.W))
    val fine_band   = Output(UInt(pllcfg.fineWidth.W))
    val int_band    = Output(UInt(pllcfg.intWidth.W))

    val ref_clk_div = Output(Clock()) // Disconnect in top level. Used in unittest. Divided reference clock
    val freq_accum  = Output(UInt(pllcfg.freqAccumWidth.W))
}

class PLLDig()(implicit val c: PLLDigConfig, implicit val fdcfg: FDConfig) extends Module {
    val io = IO(new PLLDigIO)
    val fd = withClock(io.ref_clk) { Module(new FD()) }
    fd.io.samp_clk  := clock
    fd.io.div_ratio := io.freq.div_ratio
    fd.io.ovrd_b1   := io.freq.ovrd_b1
    fd.io.ovrd_b0   := io.freq.ovrd_b0
    fd.io.ovrd_en   := io.freq.ovrd_en
    fd.io.flip      := io.freq.flip
    fd.io.th_low    := io.freq.th_low
    fd.io.th_high   := io.freq.th_high

    val pd = Module(new PLLPD)
    pd.io.refClk := io.ref_clk

    io.pd_out := Mux(io.prop_flip, ~pd.io.output, pd.io.output)

    // Override PD output if necessary
    val pd_output = Mux(io.pd_ovrd_en, io.pd_ovrd, pd.io.output)
    val pd_output_mapped = Mux(pd_output.toBool(), 1.S, -1.S)

    val (coarse_band, fine_band, int_band, freq_accum) = (0.U, 0.U, 0.U, 0.U) // FIXME! withClock(io.ref_clk) {
    //     CDRUtil.calc_freq_codes(pd_output_mapped, fd.io.output, io.init_ovrd_en, io.init_ovrd,
    //     io.int_flip, io.int_gain, io.freq_gain,
    //     io.coarse_band_ovrd   , io.fine_band_ovrd   , io.int_ovrd   ,
    //     io.coarse_band_ovrd_en, io.fine_band_ovrd_en, io.int_ovrd_en)
    // }
    io.coarse_band := coarse_band
    io.fine_band   := fine_band
    io.int_band    := int_band

    // Debugging outputs
    io.freq_accum        := freq_accum
    io.ref_clk_div       := fd.io.clock_div
    io.freq.cntr_flopped := fd.io.cntr_flopped
}

class PLLPD() extends Module {

    val io = IO(new Bundle {
        val output = Output(UInt(1.W))
        val refClk = Input(Clock())
    })
    val dff = withClock (io.refClk) { RegNext(clock.asUInt()) }
    io.output := dff

}
