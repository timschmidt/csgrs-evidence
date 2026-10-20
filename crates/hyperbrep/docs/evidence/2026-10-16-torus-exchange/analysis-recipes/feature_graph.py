"""Compare complete compiler-reported library features and profiles for timing."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT

attempts = json.loads((OUT / 'attempts.json').read_text())
graphs = {}
builds = {}
for side, label in [('baseline', 'baseline-build'), ('candidate', 'benchmark-build')]:
    row = [r for r in attempts if r['label'] == label and r['exit_code'] == 0][-1]
    assert row['source_unchanged']
    graph = set()
    for line in (OUT / row['log']).read_text().splitlines():
        if not line.startswith('{'):
            continue
        item = json.loads(line)
        if item.get('reason') != 'compiler-artifact' or 'bench' in item['target']['kind']:
            continue
        graph.add(json.dumps({k: item[k] for k in ['package_id', 'target', 'profile', 'features']}, sort_keys=True))
    graphs[side] = graph
    builds[side] = row
before, after = graphs['baseline'], graphs['candidate']
result = dict(passed=before == after, builds=builds,
    baseline_only=[json.loads(r) for r in sorted(before-after)],
    candidate_only=[json.loads(r) for r in sorted(after-before)],
    common=[json.loads(r) for r in sorted(before & after)],
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Compiler-reported package, target, profile and feature records excluding the benchmark targets; same recorded build flags and lockfile. Additional torus benchmark is an absolute-cost workload.')
(OUT / 'feature-graph-admission.json').write_text(json.dumps(result, indent=2) + '\n')
assert result['passed'], 'timed dependency graph differs'
print('matched dependency build records:', len(before))
