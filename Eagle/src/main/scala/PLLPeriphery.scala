package eagle.clocking

import chisel3._
import chisel3.experimental.{Analog, withClock}
import freechips.rocketchip.config.Field
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}
import freechips.rocketchip.subsystem.{BaseSubsystem, PeripheryBusKey}
import freechips.rocketchip.tilelink.{TLBuffer}

case object PeripheryEaglePLLKey extends Field[Seq[EaglePLLParams]]

trait HasPeripheryEaglePLL {
    this: BaseSubsystem =>
    val unclusterPLLParams = p(PeripheryEaglePLLKey).head
    val clusterPLLParams = p(PeripheryEaglePLLKey).tail
    val clusterPLLs = clusterPLLParams.zipWithIndex.map { case (params, i) =>
        val name = Some(s"cluster_pll_$i")
        val pll = LazyModule(new TLEaglePLL(pbus.beatBytes, params)).suggestName(name)
        pbus.toVariableWidthSlave(name) { pll.node := TLBuffer.chainNodeSingle(5) }
        pll
    }
    val unclusterPLL = LazyModule(new TLEaglePLL(pbus.beatBytes, unclusterPLLParams)).suggestName(Some("uncluster_pll"))
    pbus.toVariableWidthSlave(Some("uncluster_pll")) { unclusterPLL.node := TLBuffer.chainNodeSingle(5) }
}

trait HasPeripheryEaglePLLBundle {
    val pllRefClock: Clock
    val unclusterClockOut: Clock
}

trait HasPeripheryEaglePLLModuleImp extends LazyModuleImp with HasPeripheryEaglePLLBundle {
    val outer: HasPeripheryEaglePLL
    val pllRefClock = IO(Input(Clock()))

    (outer.clusterPLLs ++ Seq(outer.unclusterPLL)).foreach(_.module.io.clockRef := pllRefClock)
    outer.clusterPLLs.foreach { pll => pll.module.io.clockRef := pllRefClock }
    outer.unclusterPLL.module.io.clockRef := pllRefClock

}
