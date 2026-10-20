"""Compare the complete compiler-reported library features and build profiles."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT

read = lambda p: json.loads(p.read_text())
old = OUT.parent / '2026-10-17-cone-continuation'
attempts = read(OUT / 'attempts.json')
latest = lambda label: next(r for r in reversed(attempts) if r['label'] == label)


def graph(folder, row):
    assert row['exit_code'] == 0 and row['source_unchanged']
    result = set()
    for line in (folder / row['log']).read_text().splitlines():
        if not line.startswith('{'):
            continue
        item = json.loads(line)
        if item.get('reason') == 'compiler-artifact' and 'bench' not in item['target']['kind']:
            result.add(json.dumps({k: item[k] for k in ['package_id', 'target', 'profile', 'features']}, sort_keys=True))
    assert result
    return result


def compare(a, b):
    expected = list(a['command'])
    if b['label'] == 'benchmark-build':
        expected[-1:-1] = ['--bench', 'cone_exchange']
    assert expected == b['command'], (expected,b['command'])
    left, right = graph(old, a), graph(OUT, b)
    return dict(passed=left == right, builds=dict(baseline=a, candidate=b),
        baseline_only=[json.loads(r) for r in sorted(left-right)],
        candidate_only=[json.loads(r) for r in sorted(right-left)],
        common=[json.loads(r) for r in sorted(left & right)])


main = compare(read(old / 'benchmark-v1/executables.json')['build'], latest('benchmark-build'))
base = read(OUT / 'baseline-dependency-binaries.json')['executables']
micro = {
    'scalar-predicate': compare(base['scalar_micro']['build'], latest('dependency-build')),
    'rounding': compare(base['library_perf']['build'], latest('rounding-build')),
}
result = dict(passed=main['passed'] and all(row['passed'] for row in micro.values()),
    main=main, microcost_graphs=micro,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Same compiler-reported package, library target, profile and features. The main Cargo command only adds the new cone_exchange benchmark; existing targets and dependency commands are unchanged. Existing cases retain their semantic assertions; source maps add provenance and analytic graph evaluation has been extended for conical supports. Measurements include that consumer work. The new successful workflow has absolute cost only.')
(OUT / 'feature-graph-admission.json').write_text(json.dumps(result, indent=2)+'\n')
assert result['passed'], 'timed dependency graph differs'
print('matched build graphs:', 1 + len(micro))
