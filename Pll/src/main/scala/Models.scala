package pll

import chisel3._
import chisel3.util._
import chisel3.experimental.{Analog, IntParam, DoubleParam, StringParam}


class ClockGen(periodps: Double) extends BlackBox(Map("periodps" -> DoubleParam(periodps))) {
   val io = IO(new Bundle{ val clock = Output(Clock()) })
}

case class VCOModelConfig(
    coarseWidth       : Int = 4,
    fineWidth         : Int = 6,
    intWidth          : Int = 6,
    propWidth         : Int = 1,
    propGainCtrlWidth : Int = 3,
    fCent             : Double = 14e9,
    fRangeFrac        : Double = 0.1,
    coarseOvlap       : Double = 0.2,
    fineOvlap         : Double = 0.2,
    fPropRange        : Double = 50e6,
    VCOJitter         : Double = 40.0,
    scaleVtime        : Double = 1000.0,
    flick3Corner      : Double = 0.0
)

class vco()(implicit val c: VCOModelConfig) extends BlackBox(Map(
        "NUM_COARSE_BITS"         -> IntParam(c.coarseWidth),
        "NUM_FINE_BITS"           -> IntParam(c.fineWidth),
        "NUM_INT_BITS"            -> IntParam(c.intWidth),
        "NUM_PROP_BITS"           -> IntParam(c.propWidth),
        "NUM_PROP_GAIN_CTRL_BITS" -> IntParam(c.propGainCtrlWidth),

        "F_CENT"                  -> DoubleParam(c.fCent),
        "F_RANGE_FRAC"            -> DoubleParam(c.fRangeFrac),
        "COARSE_OVLAP"            -> DoubleParam(c.coarseOvlap),
        "FINE_OVLAP"              -> DoubleParam(c.fineOvlap),
        "F_PROP_RANGE"            -> DoubleParam(c.fPropRange),
        "VCO_JITTER"              -> DoubleParam(c.VCOJitter),
        "SCALE_VTIME"             -> DoubleParam(c.scaleVtime),
        "FLICK3_CORNER"           -> DoubleParam(c.flick3Corner)
    )) {
    val io = IO(new Bundle{
        val vco            = Output(Clock())
        val en             = Input(Bool())
        val coarse_tune    = Input(UInt(c.coarseWidth.W))
        val fine_tune      = Input(UInt(c.fineWidth.W))
        val int_val        = Input(UInt(c.intWidth.W))
        val prop_val       = Input(UInt(c.propWidth.W))
        val prop_gain_ctrl = Input(UInt(c.propGainCtrlWidth.W))
    })
}

class VCO_Freq()(implicit val c: VCOModelConfig) extends BlackBox(Map(
        "NUM_COARSE_BITS"         -> IntParam(c.coarseWidth),
        "NUM_FINE_BITS"           -> IntParam(c.fineWidth),
        "NUM_INT_BITS"            -> IntParam(c.intWidth),
        "NUM_PROP_BITS"           -> IntParam(c.propWidth),
        "NUM_PROP_GAIN_CTRL_BITS" -> IntParam(c.propGainCtrlWidth),

        "F_CENT"                  -> DoubleParam(c.fCent),
        "F_RANGE_FRAC"            -> DoubleParam(c.fRangeFrac),
        "COARSE_OVLAP"            -> DoubleParam(c.coarseOvlap),
        "FINE_OVLAP"              -> DoubleParam(c.fineOvlap),
        "F_PROP_RANGE"            -> DoubleParam(c.fPropRange)
    )) {
    val io = IO(new Bundle{
        val Fvco           = Analog(64.W)
        val coarse_tune    = Input(UInt(c.coarseWidth.W))
        val fine_tune      = Input(UInt(c.fineWidth.W))
        val int_val        = Input(UInt(c.intWidth.W))
        val prop_val       = Input(UInt(c.propWidth.W))
        val prop_gain_ctrl = Input(UInt(c.propGainCtrlWidth.W))
    })
}


class clkdivbbox(divratio: Int, jitter: Double, delay: Double) extends BlackBox(Map(
        "DIV_RATIO" -> IntParam(divratio),
        "JITTER"    -> DoubleParam(jitter),
        "DELAY"     -> DoubleParam(delay))) {
    val io = IO(new Bundle{
        val clko   = Output(Clock())
        val clko_b = Output(Clock())
        val clk    = Input(Clock())
        val rst    = Input(Bool())
    })
}

class FWriteBits(path: String, fname: String, width: Int) extends BlackBox(Map(
        "PATH"  -> StringParam(path),
        "FNAME" -> StringParam(fname),
        "WIDTH" -> IntParam(width))) {
    val io = IO(new Bundle{
        val clk  = Input(Clock())
        val en   = Input(Bool())
        val data = Input(UInt(width.W))
    })
}

class FWriteReal(path: String, fname: String) extends BlackBox(Map(
        "PATH"  -> StringParam(path),
        "FNAME" -> StringParam(fname))) {
    val io = IO(new Bundle{
        val clk  = Input(Clock())
        val en   = Input(Bool())
        val data = Analog(64.W)
    })
}

class Delay(delay: Double, width: Int) extends BlackBox(Map(
        "DELAY" -> DoubleParam(delay),
        "WIDTH" -> IntParam(width))) {
    val io = IO(new Bundle{
        val in  = Input(UInt(width.W))
        val out = Output(UInt(width.W))
    })
}
