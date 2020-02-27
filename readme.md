
# (Not Really) Synthesizable PLLs

A project-based investigation of "fully" synthesizable fast-locking digital PLLs.

* @dan-fritchman
* @wrahman91

## Abstract 

Digital PLLs (ADPLLs) have proliferated recently due to small loop filter area, portability, and minimizing
complex analog circuit design in FinFET nodes. Publications such as [1] have shown that PLLs can be
designed with only static CMOS logic, and others like [2] demonstrate ADPLLs that have been fully
synthesized using only digital standard cells and automated place-and-route with reasonable FOM. An
important feature of PLLs is fast-locking time for rapid-on/off applications in low-power SoCs, and works
have exploited digital capabilities in ADPLLs using gear-shifting [3], initial condition programming [4],
and digital frequency-error recovery [5] to achieve fast-on-lock times down to 1ns. Our goal in this
course project is divided in two phases: Phase 1 is to analyze and compare synthesizable ADPLLs
particularly with fast locking; Phase 2 is to show feasibility of one such design from the cited works.

## References

* [1] [J. Tierno, A. Rylyakov, and D. Friedman, “A Wide Power Supply Range, Wide Tuning Range, All Static
CMOS All Digital PLL in 65nm SOI,” IEEE JSSC, vol. 43, no.1, Jan. 2008, pp. 42-51](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4242320&tag=1)
  * Uses only static CMOS for ADPLL
* [2] [W. Deng et al., “A Fully Synthesizable All-Digital PLL with Interpolative Phase Coupled Oscillator,
Current-Output DAC, and Fine-Resolution Digital Varactor using Gated Edge Injection Technique,” IEEE
JSSC 2015, vol. 50, no. 1, Jan. 2015, pp. 68-80](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6891375)
  * Fully P&R
* [3] [R. Staszewski and P. Balsara, “All-Digital PLL with Ultra Fast Settling”, IEEE Trans. Circuits and Systems
II, vol. 54, no. 2, Feb. 2007](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4100882) 
  * Gear shifting, <50us
* [4] [T. Anand et al., “A 7 Gb/s Embedded Clock Transceiver for Energy Proportional Links,” IEEE JSSC, vol.
50, no. 12, Dec. 2015, pp. 3101-3119](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7265108)
  * Initial conditions, fast lock <1ns
* [5] A. Santiccioli et al, “A 66fsRMS Jitter 12.8-to-15.2GHz Fractional-N Bang-Bang PLL with Digital
Frequency-Error Recovery for Fast Locking”, ISSCC 2020 Dig. Tech. Papers, Feb. 2020, pp. 268-269. 
  * auxiliary PD + pulse gen, <18.55us (1GHz hop)
