
mkdir -p sim && \
  cd sim &&  \
  vcs -full64 +lint=all +v2k +systemverilogext+sv \
  ../src/params.sv ../src/tb.sv ../src/droop_mgr.sv ../src/pll.sv ../src/tdc.sv ../../Share/*v \
  -top tb && \
  ./simv

