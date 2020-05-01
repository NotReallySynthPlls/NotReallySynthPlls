
# Synthesis Trials

Based on EE241 labs

Notes & tricks:

* Much of the environment-setup is for `eda` machines, including (a) inst-env.yml, and (b) location of `hammer-plugins`, (c) `sourceme.sh`
* Requires *running* synthesis, largely for Hammers non-gates collateral, and then *copying over* resultant gate-level Verilog
* Verilog understood by PnR doesnt support arrayed instances
* Dummy DFF in design gets PnR to behave, prevents clock errors

To build:

```
source sourceme.sh
make syn
cp src/dco.v build/syn-rundir/dco.mapped.v
make par
```

To view layout:

```
cd build/par-rundir/generated-scripts
./open_chip
```


