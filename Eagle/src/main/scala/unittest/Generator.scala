package eagle.clocking

object Generator extends freechips.rocketchip.util.GeneratorApp {
    val longName = names.topModuleProject + "." + names.configs
    generateFirrtl
    generateAnno
}
