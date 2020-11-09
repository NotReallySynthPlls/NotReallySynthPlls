import numpy as np
from ruamel import yaml
from dataclasses import dataclass

@dataclass
class Stats:
	min: float
	max: float
	std: float

y = yaml.safe_load(open('sim/dco_clock.yml', 'r'))
edges = y['edges']
periods = [edges[k+1]-edges[k] for k in range(100, len(edges)-1)]

s = Stats(
	std= np.std(periods),
	min= np.min(periods),
	max= np.max(periods),
)
print(s)

