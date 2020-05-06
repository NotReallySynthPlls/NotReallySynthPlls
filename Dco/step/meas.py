
meas = 'simulator lang=spice \n'
meas += '.option measdgt 12 \n'

for n in 'wck_out vco.wclk0 vco.wclk1 vco.wclk2 vco.wclk3'.split():
    sn = n.split('.')[-1]
    for k in range(250):
        meas += f'.meas tran cross_{sn}_{k} when v({n})=0.35 cross={k} \n'

meas += 'simulator lang=spectre \n'

open('meas.sp', 'w').write(meas)

    