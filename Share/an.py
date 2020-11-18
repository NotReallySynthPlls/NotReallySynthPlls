import numpy as np
from ruamel import yaml
from dataclasses import dataclass


@dataclass
class Stats:
    mean: float
    std: float
    min: float
    max: float

def period_stats(fname: str) -> (np.ndarray, np.ndarray, Stats):
    y = yaml.safe_load(open(fname, "r"))
    ts = y['timescale']
    edges = np.array(y["edges"]) * ts
    periods = np.diff(edges)
    stats = Stats(
        mean=np.mean(periods),
        std=np.std(periods),
        min=np.min(periods),
        max=np.max(periods),
    )
    return (edges, periods, stats)

