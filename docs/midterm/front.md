
---
title: Adaptive Clock Generation PLL and Clock Distribution
author:
  - name: Dan Fritchman \& Wahid Rahman
    affiliation: University of California, Berkeley
    location: Berkeley, Ca
    email: \{dan_fritchman,wahid.rahman\}\@berkeley.edu
numbersections: yes
lang: en
abstract: |
    (This is worded more like an intro, probably make it more concise for the abstract.) Adaptive clock generation techniques have emerged in recent generations of high-performance SoCs for mitigation of timing failures due to transient supply voltage droops. Rather than design-in timing margin via either (a) increased supply voltage, (b) improved supply-distribution, or (c) reduced supply noise, adaptive-clock systems instead detect transient supply events and temporarily reduce their clock frequency. Works such as [4], [5], and [6] include a discrete adaptive clock distribution (ACD) circuit, inserted in-line after a typical PLL. Other works such as [1], [2], and [3] instead utilize adaptive PLLs, which directly update their oscillator frequency following supply-droop events. While adaptive clocking has been shown possible for analog PLLs in [3], its cost of implementation is far lower for digital PLLs such as [1] and [2]. Such all-digital PLLs are further desirable for their small area, portability, and streamlined circuit design process. This work compares ACD and PLL-based means of adapting digital clock frequency to transient supply-voltage droops, using [1] and [4] as seminal examples of each. Finally we present the design of an adaptive all-digital PLL with sub-cycle reaction time which avoids many of the trade-offs cited in prior works [4], [5], and [6].
header-includes: |
  \usepackage{booktabs}

...

---

