
mkdir -p sim && \
  cd sim &&  \
  vcs -full64 +lint=all +v2k +systemverilogext+sv \
  ../tb.sv ../../../Share/*v \
  -top tb && \
  ./simv

