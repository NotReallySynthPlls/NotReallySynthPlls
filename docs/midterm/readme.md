---
abstract: |
  Adaptive clock generation techniques have emerged in recent
  generations of high-performance SoCs to mitigate timing failure due to
  supply voltage droops. Resilient techniques vary from analog voltage
  mixing to digital sensing and clock actuation. This work identifies a
  taxonomy for adaptive clock generation systems: adaptive clock
  distribution (ACD) and adaptive PLL-based schemes. Reported
  realizations in state-of-the-art processor SoCs are reviewed and key
  performance metrics for comparisons are identified. An evaluation plan
  is also proposed to compare such systems in a predictive 7nm CMOS
  technology.
author:
- 'Dan Fritchman, and Wahid Rahman, [^1] [^2] [^3]'
bibliography:
- references.bib
title: Adaptive Clocking Techniques for SoC Supply Droop Response in
  Predictive 7nm CMOS
---

Adaptive clocking, adaptive frequency, power efficiency, supply-droop
mitigation, supply-voltage droop.

Introduction
============

Power management techniques in modern system-on-chips (SoCs) are
critical for energy-efficient processors ranging from data servers to
mobile devices. SoC thermal dissipation constraints and energy-saving
modes necessitate system-level power management to decrease the power
supply or reduce the number of active processing cores. Such techniques
exhibit a decrease (i.e. droop) in the SoC supply voltage ($V_{DD}$) due
to: the controlled decrease of $V_{DD}$ from a supply regulator or DC-DC
converter; and the transient $L \frac{di}{dt}$ supply voltage ripple due
to sudden current changes through package inductances when dynamically
enabling or disabling on-chip processing cores. To maximize processing
throughput, SoCs are designed to operate close to the maximum possible
clock frequency ($f_{MAX}$) for the target ($V_{DD}$) with minimal
guardbanding. Decreasing $V_{DD}$ reduces the drain currents of CMOS
transistors, thereby increasing propagation delays in the critical paths
of digital logic. If sufficient timing margin is not available in the
design, these critical paths can fail to meet timing and cause
unrecoverable errors.

![Reduction of $V_{DD}$ and corresponding reduction in $f_{MAX}$
(adapted from [@ahmad2017]).](fig_fmax.png){#fig:fmax
width="0.85\\columnwidth"}

![Supply droop transients due to package inductances and load current
(adapted from [@hashimoto2018]).](fig_droop_schem.png "fig:"){#fig:droop
width="0.85\\columnwidth"} ![Supply droop transients due to package
inductances and load current (adapted from
[@hashimoto2018]).](fig_droop.png "fig:"){#fig:droop
width="0.85\\columnwidth"}

To mitigate such failures, adaptive clock generation techniques have
emerged in recent generations of high-performance
SoCs[@ahmad2017; @hashimoto2018; @wilcox2015; @floyd2017; @bowman2016].
Adaptive-clock systems detect transient supply events and dynamically
adjust clock frequencies to not exceed a changing $f_{MAX}$ as $V_{DD}$
decreases. As Fig. [1](#fig:fmax){reference-type="ref"
reference="fig:fmax"} illustrates, a decrease from high to low $V_{DD}$
to save power corresponds to a decrease in $f_{MAX}$, and the SoC clock
frequency ($f_{CLK}$) must track this change without exceeding the
correct $f_{MAX}$ (overclocking) and with minimal guardbanding
(underclocking) to minimize processing throughput loss during this
change[@ahmad2017].

Transient response of adaptive clock techniques is also vital. The
external package routes supplying power to the SoC impact supply voltage
settling during changes to on-chip core utilization [@hashimoto2018], as
illustrated in Fig. [3](#fig:droop){reference-type="ref"
reference="fig:droop"}. The range of inductances & capacitances in this
network induces a medley of fast and slow time constants. Resilient
adaptive clock generation circuits react quickly to fast ripples in
$V_{DD}$ ranging from 50-100MHz [@hashimoto2018; @wilcox2015] while also
tracking slower transient settling at 1MHz and below
[@hashimoto2018; @bowman2016; @wilcox2015].

Several schemes exist to realize supply-induced clock adaptation ranging
from directly controlling the clock-synthesizing phase-locked loop
(PLL)[@ahmad2017; @hashimoto2018] to modulating a tunable delay line or
phase rotator downstream in an adaptive clock distribution (ACD)
network[@bowman2016; @floyd2017; @wilcox2015]. In this work, we survey
and contrast the adaptive PLL- and ACD-based mechanisms presented in
[@hashimoto2018] and [@wilcox2015], respectively. This brief is
organized as follows: Section [2](#sec:overview){reference-type="ref"
reference="sec:overview"} provides an overview of adaptive clocking
schemes and defines the scope of this work; Section
[3](#sec:details){reference-type="ref" reference="sec:details"}
discusses the operating principles of mechanisms presented in
[@hashimoto2018] and [@wilcox2015]; Section
[4](#sec:comparison){reference-type="ref" reference="sec:comparison"}
provides a comparison of [@hashimoto2018] and [@wilcox2015]; and finally
Section [5](#sec:conclusion){reference-type="ref"
reference="sec:conclusion"} discusses planned work and concludes this
brief.

Adaptive Clocking Schemes {#sec:overview}
=========================

Adaptive clocking systems include two fundamental components:

(a) a *power-supply sensor*, which measures and reports transient droops
    in supply voltage; and

(b) a *clock period actuator*, which modulates the system clock period
    in response to reports from the power-supply sensor.

During a supply drop, low-latency sensing and actuation is crucial to
detect and adjust the clock frequency quickly to ensure error-free
operation continues throughout the event. If and when $V_{DD}$ recovers
from this event to its nominal value, additional circuitry can assist
with managing the corresponding $f_{CLK}$ recovery.

ACD- and adaptive PLL-based systems differ in their implementation of
the clock period actuator. ACD-based systems decrease the clock
frequency by extending clock periods using an ACD circuit placed between
the clock-synthesizing PLL and the global clock distribution network as
illustrated in Fig. [4](#fig:overview_acd){reference-type="ref"
reference="fig:overview_acd"}. A digital code $CTRL_{FCLK}$ from the
power supply sensor controls the ACD circuit such that it extends the
period of the synthesized clock, $CLK_{PLL}$, to the desired frequency
given the sensed change in $V_{DD}$. This lower-frequency clock,
$CLK_{SOC}$, is then distributed through the global clock network to the
SoC processing cores. Examples of this ACD circuit include
tunable-length delay [@bowman2016] and phase rotators [@wilcox2015], of
which the latter is discussed in Section
[3.2](#sec:details_acd){reference-type="ref"
reference="sec:details_acd"}.

![Adaptive clock distribution (ACD) based
system.](fig_overview_acd.png){#fig:overview_acd
width="0.7\\columnwidth"}

![Adaptive PLL-based system with possible intra-PLL control
variants.](fig_overview_pll.png){#fig:overview_pll
width="\\columnwidth"}

Adaptive PLL-based systems, in contrast, incorporate information from
the power-supply sensor to dynamically change the behaviour of PLL
sub-components. Typically, these schemes affect oscillator control on
top of the traditional PLL loop. In [@ahmad2017] for example, the
oscillator is controlled indirectly through a loop filter modified for
droop response: when a droop is detected, the traditional proportional-
and integral-loop filter switches to proportional-only to form a type-I
PLL that tunes the oscillator to frequency lock without hazardous over-
or underclocking. In [@hashimoto2018], this idea is further extended by
interrupting the PLL feedback loop to modify the oscillator directly,
reacting to a supply droop event with relatively low latency. The
feedback divider is then slowly modified to restore PLL lock. This
latter work is further discussed in Section
[3.1](#sec:details_pll){reference-type="ref"
reference="sec:details_pll"}.

The focus of this brief is to compare the design and effectiveness of
clock period actuators in ACD and PLL-based schemes. While
high-resolution power-supply sensors and their low-latency integration
are critical to the overall adaptation time of such schemes, it remains
beyond the scope of this work.

Operating principles {#sec:details}
====================

The two main works for comparison are the PLL- and ACD-based adaptive
clocking schemes in [@hashimoto2018] and [@wilcox2015] respectively. The
operating principles of each are described in this section.

PLL-based adaptive clocking {#sec:details_pll}
---------------------------

The scheme reported in [@hashimoto2018] presents a PLL-based adaptive
clocking control for three SPARC processor cores in a 20nm CMOS
testchip. A sense point placed near one of the SPARC cores transmits the
core $V_{DD}$ through low-impedance on-package (off-chip) routing to the
on-chip power-supply sensor. This sensor converts $V_{DD}$ droops into a
thermometer-coded quantized digital signal, $q[n]$, by use two
calibrated delay lines and a 8-bit time-to-digital converter (TDC).

A major contribution of [@hashimoto2018] is to use the instantaneous
value of q\[n\] to immediately reduce the PLL's oscillator frequency to
correct for high-frequency droops and use a filtered version of $q[n]$
to correct for low frequency droops and ultimately re-lock the PLL
feedback loop. As shown in
Fig. [6](#fig:detail_pll){reference-type="ref"
reference="fig:detail_pll"} and
Fig. [7](#fig:detail_pllarch){reference-type="ref"
reference="fig:detail_pllarch"}, $q[n]$ is processed by the frequency
control logic to generate two control signals: $\Delta F_{code}$ that
can instantaneously respond to changes in $q[n]$ to directly change the
digitally-controlled oscillator (DCO) frequency, and $N^{sync}_{code}$
that relies only on a filtered value of $q[n]$ to track low-frequency
droops and re-lock the PLL loop at the new frequency by changing the
feedback division value. The minimum function and the non-linear filter
together effectively construct an all-pass filter when $V_{DD}$
decreases and a low-pass filter when $V_{DD}$ increases. They allow the
loop to actuate the clock with minimal latency during a $V_{DD}$ droop
event. During droop recovery, they low-pass filter $V_{DD}$ transients
and overshoots as the voltage ultimately settles to its nominal value.

![Frequency control logic for PLL-based adaptive clocking in
[@hashimoto2018].](fig_detail_pll.png){#fig:detail_pll
width="\\columnwidth"}

![Intra-PLL control for PLL-based adaptive clocking in
[@hashimoto2018].](fig_detail_pllarch.png){#fig:detail_pllarch
width="\\columnwidth"}

A fast response to high-frequency supply droops is an important
criterion in [@hashimoto2018], significant design efforts were made to
ensure low-latency clock period actuation. The reported design target is
8$\times$ faster than the first-droop frequency of 50MHz. This permits a
time window of 2.5ns from the time $V_{DD}$ crosses the first supply
sensor threshold to the time the SoC clock frequency is corrected. This
narrow timing constraint is met by generating and propagating the
critical oscillator control signal $\Delta F_{code}$ asynchronously.
Crucially, the 8-bit thermometer-coded $\Delta F_{code}$ controls a DCO
that can tolerate asynchronous changes in its code without glitching its
output clock. The DCO reported in [@hashimoto2018] is a bank of nine
ring inverters with eight of the rings independently enabled by each
thermometer bit of $\Delta F_{code}$. Such a structure can tolerate
asynchronous arrival of $\Delta F_{code}$ when suddenly decreasing
frequency, as the case of a droop. Note that frequency increases are
restricted: the combination of non-linear filter memory with the masking
of minimum function ensures $\Delta F_{code}$ only increases one bit at
a time after droop recovery [@hashimoto2018]. This obviates
synchronization of $\Delta F_{code}$, reducing adaptation latency.

The reduction in adaptation latency directly correlates with reported
experimental results. Fast response to droops allows for tighter
guardbanding and therefore higher $f_{MAX}$. While [@hashimoto2018] does
not report the exact clock adaptation latency, the work improves
$f_{MAX}$ by 7.5%, from 4.65GHz without adaptive clocking to 5.00GHz
with the proposed scheme. This is the largest frequency gain reported in
compared works.

ACD-based adaptive clocking {#sec:details_acd}
---------------------------

The scheme reported in [@wilcox2015] presents a ACD-based adaptive
clocking control for AMD's Steamroller CPU in 28nm CMOS. The power
supply sensor consists of a DLL-based droop detector acting as a delay
line connected to the SoC core $V_{DD}$: as $V_{DD}$ changes, the DLL
phases change with respect to a regulated PLL's output clock. A
programmable threshold selects one of four DLL phases to compare against
the reference PLL phase to signal a 1-bit droop activity.

Fig. [8](#fig:detail_acd){reference-type="ref"
reference="fig:detail_acd"} illustrates the reported scheme. A DLL-based
phase rotator realizes the ACD circuit. When a droop activity is
detected and $DroopDetected$ is asserted, phase rotation between the 40
DLL phases occurs to effectively "stretch\" the clock period and reduce
the clock frequency. To ensure glitchless phase rotation, small positive
pre-programmed phase increments occur at each step, and the phase
rotator rotates through all 40 phases before continuing the cycle.
Rotation can be bypassed entirely by de-asserting $DroopEnable$.

![Frequency control logic for ACD-based adaptive clocking in
[@wilcox2015].](fig_detail_acd.png){#fig:detail_acd
width="0.7\\columnwidth"}

This scheme reports to target fast initial droops of 100MHz and slower
1-5MHz secondary droop transients by means of the programmed droop
detector threshold [@wilcox2015]. As the detector signal is binary, the
ACD-based reduces the SoC clock frequency by a fixed amount (phase
rotator steps through a fixed phase step per cycle) or does not change
the frequency at all. Voltage recovery is triggered when $V_{DD}$
crosses back beyond the detector threshold. The work reports a total
adaptation latency of 3 cycles at 3.4GHz from droop detection to clock
frequency reduction. While experimental results do not report frequency
gain as in [@hashimoto2018], silicon results demonstrated a reduction of
3-6% in $V_{MIN}$, the minimum supply voltage tolerable at a given
frequency for the SoC. No comparison was provided with prior works.

Comparison of ACD and PLL Actuators {#sec:comparison}
===================================

Comparison Scope {#sec:Scope of comparison}
----------------

As discussed in Section [2](#sec:overview){reference-type="ref"
reference="sec:overview"}, clock adaptation consist of various
sub-components and their latencies. This is illustrated in
Fig. [9](#fig:scope){reference-type="ref" reference="fig:scope"}. Design
of a complete adaptation system requires a $V_{DD}$ sense point, routing
delay, detector and actuation latencies, and finally clock propagation
delay. This comparison focuses on the detection logic, clock actuation,
and their combined actuation latency. There are indeed important
specifications beyond this when designing adaptation circuits. For
example, sensor resolution, bandwidth, and ease of design integration
with digital SoCs are important considerations: highly digital sensors
[@hashimoto2018; @wilcox2015] to custom analog voltage mixing
[@kurd2009] have their bandwidth and integration tradeoffs. However, the
scope of this comparison focuses on PLL- and ACD-based adaptive clocking
presented in [@hashimoto2018] and [@wilcox2015] respectively, agnostic
to extraneous design considerations.

![Various latencies in adaptive clock system (adapted from
[@hashimoto2018]).](fig_scope.png){#fig:scope width="\\columnwidth"}

In comparing the PLL- and ACD-based adaptive clocking schemes, key
metrics are identified: actuation latency, power/area, calibration, and
frequency gain/$V_{MIN}$ reduction. Forecasts for these metrics in the
predictive 7nm technology ASAP7 [@asap7] are also discussed.

Actuation Latency {#sec:ActuationLatency}
-----------------

Minimizing actuation latency helps reduce overall system response time.
In [@hashimoto2018], the PLL-based actuation latency varies depending on
the direction of $V_{DD}$ change due to the non-linear adaptation
filter. As previously discussed, for decreases in $V_{DD}$, the latency
is less than one clock cycle and limited by asynchronous propagation
delay through the minimum function in
Fig. [5](#fig:overview_pll){reference-type="ref"
reference="fig:overview_pll"} and the control bandwidth of the
oscillator. The control port time constant is approximately
$\frac{T_{VCO}}{2N}$ for the reported oscillator [@hashimoto2018].
Assuming the routing parasitic from the minimum logic to the oscillator
control port is negligible, this allows a latency below one clock cycle
at the reported $f_{MAX}$ = 5GHz, i.e. $t_{act} <$ 200ps.

Conversely, the ACD-based actuation latency is reported as 2 clock
cycles at 3.4 GHz [@wilcox2015], implying $t_{act} =$ 588ps. This is due
to synchronizing $DroopDetected$ to the PLL clock domain and generating
the corresponding phase rotation enable signal as was shown in
Fig. [8](#fig:detail_acd){reference-type="ref"
reference="fig:detail_acd"}.

We predict these results will be comparable in ASAP7. The actuation
latency in [@wilcox2015] will remain 2 clock cycles by design. That in
[@hashimoto2018] will remain less than one cycle again by design, with
the potential for $t_{act}$ to be reduced due to increased $f_{T}$. One
drawback may be higher resistance routing which could decrease
oscillator control bandwidth if not carefully designed.

Power/Area {#sec:power_area}
----------

While neither works report measured power and area overhead of the
actuation or overall adaptation circuits, the use of a DLL in
[@wilcox2015] is estimated to cost more. Consider phase mismatch and
jitter amplification in the DLL [@wilcox2015]. The 40-phase DLL consists
of 20 pseudo-differential delay cells, each designed as a pair of
cross-coupled inverters with tunable MOS capacitor (MOSCAP) loads. In
theory, the $k^{th}$ and $(k+20)^{th}$ phases have a standard deviation
of $\sqrt{k} \sigma_{u}$ where $\sigma_{u}$ is one stage's delay
variation. The DLL must, at a minimum, ensure phase monotonicity to
guarantee glitchless phase rotations. $\sigma_{u}$ is directly
correlates to $V_{t}$ and thereby area.

The DLL can also have power implications on the upstream PLL through
system jitter specifications. Assume the DLL nears a 2$\times$ tuning
range, similar of ring-based PLLs. Each DLL stage must achieve a min/max
delay spread of 2$\times$. Fig. [10](#fig:dllasap7){reference-type="ref"
reference="fig:dllasap7"} shows schematic simulations in ASAP7 of an
example delay stage operating at maximum $f_{CLK}=$ 3GHz. To achieve
higher delay spread per stage, higher MOSCAP sizing is needed. However,
this also decreases the RC bandwidth at each stage, increasing
deterministic jitter amplification such as duty-cycle distortion (DCD)
as also shown in Fig. [10](#fig:dllasap7){reference-type="ref"
reference="fig:dllasap7"}. To ensure jitter is not amplified through the
DLL, the overall delay chain should target jitter amplification $<$ 1.
Otherwise, power must be expended in the upstream PLL to reduce input
jitter and DCD.

![Schematic simulation of example DLL stage in
ASAP7.](fig_dllasap7.png){#fig:dllasap7 width="0.8\\columnwidth"}

Design & Calibration {#sec:calibrationoverhead}
--------------------

Design-time complexity of the PLL-based scheme in [@hashimoto2018]
involves an unconventional PLL loop, a detection filter overriding the
VCO control and the restoring of PLL lock during frequency recovery by
ramping the feedback divider value. Conversely, the ACD-based scheme in
[@wilcox2015] is a simpler design that does not require modifications to
a PLL, and instead inserts a phase rotator in the clock network between
it and the SoC. Both works report manually calibrate supply sensor
thresholds to optimize measured $f_{MAX}$ or $V_{MIN}$ margin
[@hashimoto2018; @wilcox2015]. The DLL in [@wilcox2015] incurs a further
calibration overhead: the DLL can take up to 180 PLL clock cycles to
frequency lock after start-up or during a dynamic voltage and frequency
scaling (DVFS) event. To mitigate impact of supply noise, the CPU
activity is limited during this time. In contrast, the PLL-based
approach in [@hashimoto2018] does not incur calibration overhead beyond
normal PLL locking, the dynamics of which can be particularly fine-tuned
in a digital PLL. However, to restore clock frequency after a droop
event, the non-linear filter in [@hashimoto2018] slowly adjusts the
feedback divider (once every 32 reference clock cycles) to mitigate
frequency overshoot and current surges during recovery.

Silicon Performance {#sec:performance}
-------------------

The key performance metric reported in both adaptation schemes is
reducing voltage/frequency margin. As [@hashimoto2018] claims, this is
directly proportional to adaptation latency: the shorter the adaptation
response time, the closer the SoC can operate to safety limits. Both
systems achieve similar results. In terms of $V_{MIN}$, the PLL-based
scheme achieves 5% reduction at 4.65GHz [@hashimoto2018] while the
ACD-based scheme reports up to 6% reduction [@wilcox2015] at 4GHz. The
PLL-based scheme also reports a 7.5% gain in $f_{MAX}$ to 5GHz if
$V_{DD}$ is unchanged [@hashimoto2018]. These results require
integration of the adaptation system with the complete entire SoC, which
may not be feasible in ASAP7 for this project scope: adaptation latency
will be used as a proxy.

Proposed Project Objectives {#sec:proposal}
---------------------------

While reported in planar technologies [@hashimoto2018; @wilcox2015], the
reduced actuation latency and the lack of immediate power, area, and
calibration overhead for similar reported reduction in $V_{MIN}$ suggest
the PLL-based adaptation circuit [@hashimoto2018] will be the favourable
candidate in FinFET technologies. We propose to evaluate this in ASAP7
with the following project objectives:

(a) Initial design and power/area/latency estimates of the ACD-based
    actuator in [@wilcox2015], in particular the DLL-based phase
    rotator. Estimated mismatch models may be required if not
    immediately available in ASAP7 [@asap7].

(b) Initial design and power/area/latency estimates of the PLL-based
    actuator in [@hashimoto2018], in particular the PLL loop and
    non-linear filter interaction. Estimated models of the oscillator
    may be required.

(c) (*Time-permitting*) Investigations into possible improvements in
    [@hashimoto2018], such as derivative loop filter control or
    modifications to non-linear filter to reduce frequency recovery
    time.

Conclusion {#sec:conclusion}
==========

This work compares the costs and effectiveness of ACD- and PLL-based
adaptive clocking systems [@hashimoto2018; @wilcox2015]. ACD-based
systems exchange design complexity for higher power and area, but both
systems achieve less than 2 cycle actuation latency and $V_{MIN}$
reductions by up to 6%. The PLL-based system is predicted to achieve
lower actuation latency and power/area in predictive 7nm CMOS, and
initial designs of these systems are planned to evaluate this claim.

[^1]: Date of publication .

[^2]: D. Fritchman and W. Rahman are with the Department of Electrical
    Engineering and Computer Sciences, University of California,
    Berkeley, Berkeley, CA 94720 USA (e-mail:
    dan\_fritchman\@berkeley.edu; wahid.rahman\@berkeley.edu).

[^3]: This work was supported by Professor Borivoje Nikolić.
