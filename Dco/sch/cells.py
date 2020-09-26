"""
Figure out what standard cells ASAP7 offers
"""

import glob 

cells = set()
logics = set()

for fn in glob.glob("/home/ff/ee241/spring20-labs/asap7libs_24/cdl/lvs/*cdl"):
	with open(fn, 'r') as f:
		for line in f:
			if '.SUBCKT' in line: 
				# Chop up the cell-name into fields we care about 
				cellname = line.split()[1]
				s = cellname.split('_ASAP7_75t_')
				pred = s[0] 
				vt = s[-1]
				s = pred.split('x')
				logic, drv = (s[0], s[-1])
				
				# Strip out the logic-function versus input/outputs
				# Is there a regex for this? Sure. But then we'd have two problems. 
				ni = len(logic)-1
				for c in logic[::-1]:
					if not c.isdigit(): break 
					else: ni -= 1
				logic_func = logic[:ni+1]
				io = logic[ni+1:]

				logics.add(logic_func) 
				cells.add((logic_func, io, drv, vt))

##for cell in cells: print(cell)
##for l in logics: print(l)
for l in sorted(list(logics)): print(l)


