package pll

import chisel3._
import chisel3.util._


class ClkDivIO(divRatioWidth: Int) extends Bundle {
    val divRatio = Input(UInt(divRatioWidth.W))
    val output   = Output(Clock())
}
class SimpleRegIO(val w: Int) extends Bundle{
  val d = Input(UInt(w.W))
  val q = Output(UInt(w.W))
  val en = Input(Bool())
}

class AsyncResetRegVec(val w: Int, val init: BigInt) extends Module {
  override def desiredName = s"AsyncResetRegVec_w${w}_i${init}"

  val io = IO(new SimpleRegIO(w))

  val reg = withReset(reset.asAsyncReset)(RegInit(init.U(w.W)))
  when (io.en) {
    reg := io.d
  }
  io.q := reg
}


class ClkDiv(divRatioWidth: Int) extends Module {
    val io = IO(new ClkDivIO(divRatioWidth))
    val cntr = Module(new AsyncResetRegVec(divRatioWidth, 0))
    val rst_cntr = cntr.io.q === io.divRatio - 1.U
    cntr.io.en := true.B
    cntr.io.d  := Mux(rst_cntr, 0.U, cntr.io.q + 1.U)
    io.output  := rst_cntr.asClock()
}
