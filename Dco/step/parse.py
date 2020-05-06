
nsig = 5
nmeas = 250
sigs = [list()]

fname = 'tb_step_sch_meas.mt0'
with open(fname, 'r') as f:
    nread = 0 
    nsig = 0
    line = f.readline()
    while 'alter' not in line.lower():
        line = f.readline()
    line = f.readline()
    while line:
        data = line.split()
        for entry in data:
            try: 
                num = float(entry)
            except: 
                pass
            else:
                sigs[nsig].append(num)
            nread += 1
            if nread >= nmeas:
                nsig += 1
                sigs.append(list())
                print(f'Starting to Read Signal {nsig}')
                nread = 0
        line = f.readline()

print(sigs)

