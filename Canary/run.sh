
mkdir -p sim && \
  cd sim &&  \
  vcs +lint=all +v2k +systemverilogext+sv \
  ../src/params.sv ../src/tb.sv ../src/pll.sv ../src/dco.sv ../src/tdc.sv \
  -top tb && \
  ./simv

