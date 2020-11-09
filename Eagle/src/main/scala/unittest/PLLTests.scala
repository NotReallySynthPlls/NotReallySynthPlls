package eagle.clocking

import hbwif._
import chisel3._
import chisel3.core.IntParam
import chisel3.util._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.unittest._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.CacheBlockBytes


class PLLTest(divisor: Int, cfg: EaglePLLParams, timeout: Int = 500000) extends UnitTest(timeout) with HasEaglePLL {
    def params = cfg

    def clockRef = this.clock

    io.finished := false.B

}

object PLLTests {

    val address = 0xc000 // This doesn't matter

    val divisors = List(1, 5) // TODO more
    // TODO add more things to test here
    // for (d <- divisors; x <- somethingelse; y <- somethingelse)

    def apply(): Seq[UnitTest] = for (d <- divisors) yield Module(new PLLTest(d, EaglePLLParams(address)))

}
