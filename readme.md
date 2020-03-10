
## Adaptive Clock Generation PLL and Clock Distribution 

* @dan-fritchman
* @wrahman91


### Abstract 

*Adaptive clock generation* techniques have emerged in recent generations of high-performance SoCs for mitigation of timing failures due to transient supply voltage droops. Rather than design-in timing margin via either (a) increased supply voltage, (b) improved supply-distribution, or (c) reduced supply noise, adaptive-clock systems instead detect transient supply events and temporarily reduce their clock frequency. 

Works such as [4], [5], and [6] include a discrete *adaptive clock distribution* (ACD) circuit, inserted in-line after a typical PLL. Other works such as [1], [2], and [3] instead utilize *adaptive PLLs*, which directly update their oscillator frequency following supply-droop events. While adaptive clocking has been shown possible for analog PLLs in [1], its cost of implementation is far lower for digital PLLs such as [2] and [3]. Such all-digital PLLs are further desirable for their small area, portability, and streamlined circuit design process. 

This work compares ACD and PLL-based means of adapting digital clock frequency to transient supply-voltage droops, using [1] and [4] as seminal examples of each. Finally we present the design of an adaptive all-digital PLL with sub-cycle reaction time which avoids many of the trade-offs cited in prior works [4], [5], and [6].


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
