"""Compare complete compiler-reported library features and profiles for timing."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT

read = lambda p: json.loads(p.read_text())
old = OUT.parent / '2026-10-16-torus-exchange'
baseline = read(OUT / 'baseline-binaries.json')['build']
candidate = next(r for r in reversed(read(OUT / 'attempts.json'))
                 if r['label'] == 'benchmark-build' and r['exit_code'] == 0)
assert baseline['command'] == candidate['command']
graphs = {}
for side, directory, row in [('baseline', old, baseline), ('candidate', OUT, candidate)]:
    assert row['source_unchanged']
    graph = set()
    for line in (directory / row['log']).read_text().splitlines():
        if not line.startswith('{'):
            continue
        item = json.loads(line)
        if item.get('reason') != 'compiler-artifact' or 'bench' in item['target']['kind']:
            continue
        graph.add(json.dumps({k: item[k] for k in ['package_id', 'target', 'profile', 'features']}, sort_keys=True))
    graphs[side] = graph
before, after = graphs['baseline'], graphs['candidate']
result = dict(passed=before == after, builds=dict(baseline=baseline, candidate=candidate),
    baseline_only=[json.loads(r) for r in sorted(before-after)],
    candidate_only=[json.loads(r) for r in sorted(after-before)],
    common=[json.loads(r) for r in sorted(before & after)],
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Same complete compiler-reported package, library target, profile and features, identical build flags and lockfile. The sector executable adds two absolute-cost cases; its whole-process resources and size are not matched workloads.')
micro = {}
for name, directory, metadata, label in [
    ('scalar-predicate', old, 'baseline-dependency-binaries.json', 'dependency-build'),
    ('rounding', OUT, 'baseline-rounding-binary.json', 'rounding-build'),
]:
    a = read(OUT / metadata)['build']
    b = next(r for r in reversed(read(OUT / 'attempts.json')) if r['label'] == label and r['exit_code'] == 0)
    assert a['command'] == b['command'] and a['source_unchanged'] and b['source_unchanged']
    records = []
    for folder, row in [(directory, a), (OUT, b)]:
        graph = set()
        for line in (folder / row['log']).read_text().splitlines():
            if not line.startswith('{'):
                continue
            item = json.loads(line)
            if item.get('reason') == 'compiler-artifact' and 'bench' not in item['target']['kind']:
                graph.add(json.dumps({k: item[k] for k in ['package_id', 'target', 'profile', 'features']}, sort_keys=True))
        records.append(graph)
    left, right = records
    micro[name] = dict(passed=left == right, builds=dict(baseline=a, candidate=b),
        baseline_only=[json.loads(r) for r in sorted(left-right)],
        candidate_only=[json.loads(r) for r in sorted(right-left)],
        common=[json.loads(r) for r in sorted(left & right)])
result['microcost_graphs'] = micro
result['passed'] = result['passed'] and all(r['passed'] for r in micro.values())
(OUT / 'feature-graph-admission.json').write_text(json.dumps(result, indent=2) + '\n')
assert result['passed'], 'timed dependency graph differs'
print('matched dependency build records:', len(before))
