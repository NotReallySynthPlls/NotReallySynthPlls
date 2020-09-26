
## Adaptive Clock Generation PLL and Clock Distribution 

* @dan-fritchman
* @wrahman91

### Abstract 

Adaptive clock generation techniques have emerged in recent generations of high-performance SoCs to mitigate timing failure due to supply voltage droops. Resilient techniques vary from analog voltage mixing to digital sensing and clock actuation. This work identifies a taxonomy for adaptive clock generation systems: adaptive clock distribution (ACD) and adaptive PLL-based schemes. Reported realizations in state-of-the-art processor SoCs are reviewed and key performance metrics for comparisons are identified. An evaluation plan is also proposed to compare such systems in a predictive 7nm CMOS technology.


* March 2020 [update report](docs/midterm) and accompanying [PDF](docs/midterm/report.pdf)
* May 2020 [final report](https://github.com/NotReallySynthPlls/FinalReport) and accompanying [PDF](https://github.com/NotReallySynthPlls/FinalReport/blob/master/conference_101719.pdf)
* May 2020 [presentation slides](https://docs.google.com/presentation/d/1W-2C1OSwi3S_zFVdiPYkahP9g4av7KUbKltE3fFuHY0)

---

### References

* [1] [An Adaptive-Clocking-Control Circuit With 7.5% Frequency Gain for SPARC Processors](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8207784)
Tetsutaro Hashimoto , Yukihito Kawabe, Michiharu Hara, Yasushi Kakimura, Kunihiko Tajiri, Shinichiro Shirota, Ryuichi Nishiyama, Hitoshi Sakurai, Hiroshi Okano, Yasumoto Tomita, Sugio Satoh, and Hideo Yamashita
* [2] [Adaptive Clocking in the POWER9 Processor for Voltage Droop Protection](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7870452)
Michael S. Floyd1, Phillip J. Restle2, Michael A. Sperling3, Pawel Owczarczyk3, Eric J. Fluhr1, Joshua Friedrich1, Paul Muench3, Timothy Diemoz3, Pierce Chuang2, Christos Vezyrtzis2
* [3] [Next Generation Intel® Core™ Micro-Architecture (Nehalem) Clocking](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4804981)
Nasser Kurd, Member, IEEE, Praveen Mosalikanti, Mark Neidengard, Member, IEEE, Jonathan Douglas, and Rajesh Kumar
* [4] [Steamroller Module and Adaptive Clocking System
in 28 nm CMOS](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6926864)
Kathryn Wilcox, Member, IEEE, Robert Cole, Harry R. Fair III, Member, IEEE, Kevin Gillespie, Member, IEEE, Aaron Grenat, Member, IEEE, Carson Henrion, Member, IEEE, Ravi Jotwani, Member, IEEE, Stephen Kosonocky, Senior Member, IEEE, Benjamin Munger, Member, IEEE, Samuel Naffziger, Fellow, IEEE, Robert S. Orefice, Member, IEEE, Sanjay Pant, Member, IEEE,
Donald A. Priore, Ravinder Rachala, and Jonathan White, Member, IEEE
* [5] [A 16 nm All-Digital Auto-Calibrating Adaptive Clock Distribution for Supply Voltage Droop Tolerance Across a Wide Operating Range](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7274370)
Keith A. Bowman, Member, IEEE, Sarthak Raina, J. Todd Bridges, Member, IEEE, Daniel J. Yingling,
Hoan H. Nguyen, Brad R. Appel, Yesh N. Kolla, Jihoon Jeong, Member, IEEE, Francois I. Atallah, Member, IEEE, and David W. Hansquine
* [6] [A 22 nm All-Digital Dynamically Adaptive Clock Distribution for Supply Voltage Droop Tolerance](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6422331)
Keith A. Bowman, Member, IEEE, Carlos Tokunaga, Member, IEEE, Tanay Karnik, Senior Member, IEEE, Vivek K. De, Fellow, IEEE, and James W. Tschanz, Member, IEEE

### Background 

* [11] [J. Tierno, A. Rylyakov, and D. Friedman, “A Wide Power Supply Range, Wide Tuning Range, All Static
CMOS All Digital PLL in 65nm SOI,” IEEE JSSC, vol. 43, no.1, Jan. 2008, pp. 42-51](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4242320&tag=1)
  * Uses only static CMOS for ADPLL
* [12] [W. Deng et al., “A Fully Synthesizable All-Digital PLL with Interpolative Phase Coupled Oscillator,
Current-Output DAC, and Fine-Resolution Digital Varactor using Gated Edge Injection Technique,” IEEE
JSSC 2015, vol. 50, no. 1, Jan. 2015, pp. 68-80](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6891375)
  * Fully P&R
* [13] [R. Staszewski and P. Balsara, “All-Digital PLL with Ultra Fast Settling”, IEEE Trans. Circuits and Systems
II, vol. 54, no. 2, Feb. 2007](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4100882) 
  * Gear shifting, <50us
* [14] [T. Anand et al., “A 7 Gb/s Embedded Clock Transceiver for Energy Proportional Links,” IEEE JSSC, vol.
50, no. 12, Dec. 2015, pp. 3101-3119](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7265108)
  * Initial conditions, fast lock <1ns
* [15] A. Santiccioli et al, “A 66fsRMS Jitter 12.8-to-15.2GHz Fractional-N Bang-Bang PLL with Digital
Frequency-Error Recovery for Fast Locking”, ISSCC 2020 Dig. Tech. Papers, Feb. 2020, pp. 268-269. 
  * auxiliary PD + pulse gen, <18.55us (1GHz hop)


