"""Retain both full series and their pooled observation, without dropping trials."""
import json
import statistics
import sys
from check import OUT, hashes

sys.path.insert(0, str(OUT.parent / '2026-10-15-closed-edges'))
import receipts

directories = [OUT / 'benchmark-v2', OUT / 'benchmark-v2-repeat']
for directory in directories:
    assert json.loads((directory / 'source.json').read_text()) == hashes()

summary = []
for kind in ['kernel', 'arc', 'closed_edges']:
    trials = {side: [] for side in ['baseline', 'candidate']}
    for directory in directories:
        for number in range(1, 4):
            for side in trials:
                rows = receipts.read(kind, (directory / f'{kind}-{side}-{number}.log').read_text())
                if trials['baseline']:
                    receipts.compare(trials['baseline'][0], rows)
                trials[side].append(rows)
    costs = []
    for index, row in enumerate(trials['baseline'][0]):
        samples = {side: [trial[index]['elapsed_ns'] / row['iterations'] for trial in values]
                   for side, values in trials.items()}
        baseline = statistics.median(samples['baseline'])
        candidate = statistics.median(samples['candidate'])
        costs.append(dict(
            case=row['name'], iterations=row['iterations'],
            baseline_samples_ns=samples['baseline'], candidate_samples_ns=samples['candidate'],
            baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate/baseline,
            paired_ratio_median=statistics.median(c/b for b, c in zip(samples['baseline'], samples['candidate'])),
        ))
    first = json.loads((directories[0] / f'{kind}-costs.json').read_text())
    repeat = json.loads((directories[1] / f'{kind}-costs.json').read_text())
    describe = lambda rows: dict(median_ratio=statistics.median(x['ratio'] for x in rows),
                                maximum_ratio=max(x['ratio'] for x in rows),
                                over_ten_percent=[x['case'] for x in rows if x['ratio'] > 1.1])
    summary.append(dict(kind=kind, cases=len(costs), initial=describe(first), repeat=describe(repeat),
                        pooled=describe(costs), costs=costs))
(OUT / 'pooled-geometry.json').write_text(json.dumps(dict(
    directories=[p.name for p in directories],
    scope='One predefined complete replication after a common raw timing shift; all six trials per side retained. Pooled ratios and paired statistics are descriptive, not significance or controlled-host qualification. Initial failures are not erased.',
    results=summary,
), indent=2) + '\n')
print(json.dumps([{k: v for k, v in row.items() if k != 'costs'} for row in summary], indent=2))
