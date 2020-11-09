package eagle.clocking

import chisel3._
import chisel3.util._
import chisel3.experimental.{Analog, withClock, withClockAndReset, MultiIOModule}
import chisel3.core.{IntParam, Reset}

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.util.ResetCatchAndSync

case class EaglePLLParams(
    address: Int,
    outDivisorBits: Int = 5,
    rowSelectBits: Int = 16,
    colSelectBits: Int = 14,
    constantBits: Int = 8,
    fractionalBits: Int = 7,
    evenDivisorBits: Int = 4,
    lfsrBits: Int = 16,
    prndModBits: Int = 9,
    regulatorDacBits: Int = 8
)

class EagleDCO(c: EaglePLLParams) extends BlackBox {

    val io = IO(new Bundle {
        val row_sel_b = Input(UInt(c.rowSelectBits.W))
        val col_sel_b = Input(UInt(c.colSelectBits.W))
        val sleep_b = Input(Bool())
        val clock = Output(Clock())
        val dither = Input(Bool())
        val code_regulator = Input(UInt(c.regulatorDacBits.W))
    })

    override def desiredName = "eagle_dco"

}

class BBPLLLoop(c: EaglePLLParams) extends BlackBox(Map(
    "NUM_DCO_MATRIX_ROWS" -> IntParam(c.rowSelectBits + 1),
    "NUM_DCO_MATRIX_COLUMNS" -> IntParam(c.colSelectBits + 1),
    "NUM_DCO_CONTROL_BITS_INT" -> IntParam(c.constantBits),
    "NUM_DCO_CONTROL_BITS_FRC" -> IntParam(c.fractionalBits),
    "NUM_EVEN_DIVISOR_BITS" -> IntParam(c.evenDivisorBits),
    "NUM_LFSR_BITS" -> IntParam(c.lfsrBits),
    "NUM_PRND_MOD_BITS" -> IntParam(c.prndModBits)
)) {

    val io = IO(new Bundle {
        val reset                = Input(Bool())
        val referenceClock       = Input(Clock())
        val outputClock          = Input(Clock())
        val freqAcqEnable        = Input(Bool())
        val phaseAcqEnable       = Input(Bool())
        val prndGeneratorEnable  = Input(Bool())
        val prndDitheringEnable  = Input(Bool())
        val dcoCtrlCodeOverride  = Input(Bool())
        val ldDivideEnable       = Input(Bool())
        val lockThreshold        = Input(UInt(3.W))
        val dcoColSelectOverride = Input(UInt(c.colSelectBits.W))
        val dcoRowSelectOverride = Input(UInt(c.rowSelectBits.W))
        val divisor              = Input(UInt(c.evenDivisorBits.W))
        val integralConstant     = Input(UInt(c.fractionalBits.W))
        val proportionalConstant = Input(UInt(c.fractionalBits.W))
        val dcoRowSelect         = Output(UInt(c.rowSelectBits.W))
        val dcoColumnSelect      = Output(UInt(c.colSelectBits.W))
        val dcoDither            = Output(Bool())
        val locked               = Output(Bool())
    })

    override def desiredName = "bbpllDFE"

}

trait HasEaglePLLTopBundleContents extends Bundle {
    val clockRef    = Input(Clock())
    val clockOut    = Output(Clock())
    val clockOutDiv = Output(Clock())
}

trait HasEaglePLL {
    def params: EaglePLLParams
    val reset: Reset
    def c = params

    def clockRef: Clock

    val dco = Module(new EagleDCO(c))
    val syncReset = ResetCatchAndSync(dco.io.clock, this.reset.toBool)
    val outDivider = withClockAndReset(dco.io.clock, syncReset) { Module(new ClockDivider(c.outDivisorBits)) }
    val loop = Module(new BBPLLLoop(c))

    val freqAcqEnable = RegInit(true.B)
    val phaseAcqEnable = RegInit(true.B)
    val prndGeneratorEnable = RegInit(true.B)
    val prndDitheringEnable = RegInit(true.B)
    val dcoCtrlCodeOverride = RegInit(true.B)
    val ldDivideEnable = RegInit(true.B)
    val lockThreshold = RegInit(1.U(3.W))
    val dcoColSelectOverride = Reg(UInt(c.colSelectBits.W))
    val dcoRowSelectOverride = Reg(UInt(c.rowSelectBits.W))
    val fbDivisor = RegInit(1.U(c.evenDivisorBits.W))
    val integralConstant = RegInit(8.U(c.constantBits.W))
    val proportionalConstant = RegInit(32.U(c.constantBits.W))
    val outDivisor = RegInit(0.U(c.outDivisorBits.W))
    val regulatorDacCode = RegInit(0.U(c.regulatorDacBits.W))
    val outputEnable = RegInit(true.B)

    loop.io.reset := this.reset
    loop.io.referenceClock := clockRef
    loop.io.outputClock := dco.io.clock
    loop.io.freqAcqEnable := freqAcqEnable
    loop.io.phaseAcqEnable := phaseAcqEnable
    loop.io.prndGeneratorEnable := prndGeneratorEnable
    loop.io.prndDitheringEnable := prndDitheringEnable
    loop.io.ldDivideEnable := ldDivideEnable
    loop.io.lockThreshold := lockThreshold
    loop.io.dcoColSelectOverride := dcoColSelectOverride
    loop.io.dcoRowSelectOverride := dcoRowSelectOverride
    loop.io.integralConstant := integralConstant
    loop.io.proportionalConstant := proportionalConstant
    dco.io.row_sel_b := loop.io.dcoRowSelect
    dco.io.col_sel_b := loop.io.dcoColumnSelect
    dco.io.dither := loop.io.dcoDither
    dco.io.code_regulator := regulatorDacCode
    dco.io.sleep_b := outputEnable

    outDivider.io.divisor := outDivisor
}

trait HasEaglePLLTopModuleContents extends MultiIOModule with HasEaglePLL with HasRegMap {
    implicit val p: Parameters
    val io: HasEaglePLLTopBundleContents

    def clockRef = io.clockRef

    io.clockOut    := dco.io.clock
    io.clockOutDiv := outDivider.io.clockOut

    regmap(
        0x00 -> Seq(RegField(1, freqAcqEnable),
                    RegField(1, phaseAcqEnable),
                    RegField(1, prndGeneratorEnable),
                    RegField(1, prndDitheringEnable),
                    RegField(1, ldDivideEnable)),
        0x04 -> Seq(RegField(1, dcoCtrlCodeOverride)),
        0x08 -> Seq(RegField(3, lockThreshold)),
        0x0c -> Seq(RegField(c.colSelectBits, dcoColSelectOverride)),
        0x10 -> Seq(RegField(c.rowSelectBits, dcoRowSelectOverride)),
        0x14 -> Seq(RegField(c.evenDivisorBits, fbDivisor)),
        0x18 -> Seq(RegField(c.constantBits, integralConstant)),
        0x1c -> Seq(RegField(c.constantBits, proportionalConstant)),
        0x20 -> Seq(RegField(c.outDivisorBits, outDivisor)),
        0x24 -> Seq(RegField(c.regulatorDacBits, regulatorDacCode)),
        0x28 -> Seq(RegField(1, outputEnable)),
        0x2c -> Seq(RegField.r(1, loop.io.locked))
    )
}

class TLEaglePLL(w: Int, c: EaglePLLParams)(implicit p: Parameters)
    extends TLRegisterRouter(c.address, "pll", Seq("ucb-bar,pll0"), interrupts = 0, beatBytes = w)(
       new TLRegBundle(c, _)    with HasEaglePLLTopBundleContents)(
    new TLRegModule(c, _, _) with HasEaglePLLTopModuleContents)

