
mkdir -p sim && \
  cd sim &&  \
  vcs -full64 +lint=all +v2k +systemverilogext+sv \
  ../PLLtb.v ../modules/*v ../../../../../../Share/*v \
  -top pll_testbench && \
  ./simv

