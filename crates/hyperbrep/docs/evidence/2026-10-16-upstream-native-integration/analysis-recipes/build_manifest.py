"""Summarize merged-source BREP qualification without promoting inherited failed gates."""
import hashlib
import json
from pathlib import Path
import re
import sys
from collections import Counter

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-upstream-native-integration'
OLD = OUT.parent / '2026-10-16-oblique-cuts'
sys.path.insert(0, str(OUT))
from check import hashes

read = lambda name: json.loads((OUT / name).read_text())
write = lambda name, data: (OUT / name).write_text(json.dumps(data, indent=2) + '\n')
source = hashes()
attempts = read('attempts.json')
latest = lambda label: [r for r in attempts if r['label'] == label][-1]
labels = ['upstream-root-squares', 'upstream-eighth-angles', 'triangulation-consumer', 'triangulation-clippy',
          'native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
          'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
          'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
          'wasm-runtime', 'fmt', 'diff-check']
families = ['cylinder', 'cone', 'torus']
rotations = ['identity', 'diagonal', 'rational']
labels += [f'final-{family}-{rotation}' for family in families for rotation in rotations]
labels += ['preceding-frontier', 'benchmark-build', 'benchmarks']
failed_labels = ['inherited-zero-factor', 'inherited-zero-factor-all-features']
qualification = [latest(label) for label in labels + failed_labels]
assert len(qualification) == 36
counts = {}
for row in qualification:
    assert row['source_unchanged'] and read(row['source']) == source, row
    text = (OUT / row['log']).read_text()
    if row['label'] in failed_labels:
        assert row['exit_code'] == 101 and 'assertion failed: FACTORS > 0' in text, row
        assert '0 passed; 1 failed;' in text
    else:
        assert row['exit_code'] == 0, row
    if row['command'][:2] == ['cargo', 'test']:
        groups = re.findall(r'^test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', text, re.M)
        counts[row['label']] = dict(zip(['passed', 'failed', 'ignored'],
                                       [sum(int(x[i]) for x in groups) for i in range(3)]))
for label, passed in [('native-debug', 496), ('native-release', 496), ('native-minimal', 488),
                      ('upstream-root-squares', 3), ('upstream-eighth-angles', 3), ('triangulation-consumer', 60)]:
    assert counts[label] == dict(passed=passed, failed=0, ignored=0), counts[label]

operations = ['intersection', 'swapped', 'difference', 'recut', 'clear', 'band', 'sector', 'restore', 'restore-swapped']
frontier = []
for family in families:
    for rotation in rotations:
        row = latest(f'final-{family}-{rotation}')
        text = (OUT / row['log']).read_text()
        bodies = dict(re.findall(r'^(\S+): bodies=(\d+)$', text, re.M))
        errors = dict(re.findall(r'^(\S+): error=(.*)$', text, re.M))
        replays = dict(re.findall(r'^(\S+): replay=(.*)$', text, re.M))
        for operation in operations:
            item = dict(family=family, rotation=rotation, operation=operation, log=row['log'])
            if operation in bodies:
                assert replays[operation].startswith('Ok('), item
                item.update(outcome='native_result', bodies=int(bodies[operation]), replay=replays[operation])
            elif operation in errors:
                error = errors[operation]
                outcome = ('undecided' if any(t in error for t in ['PredicateUnresolved', 'RealSign'])
                           else 'construction_rejected' if 'NonManifoldSolidEdge' in error else 'unsupported')
                item.update(outcome=outcome, error=error)
            else:
                item['outcome'] = 'not_attempted_after_prerequisite_failure'
            frontier.append(item)
prior = json.loads((OLD / 'continuation-frontier.json').read_text())['final']['rows']
assert len(prior) == len(frontier) == 81
transitions = []
for before, after in zip(prior, frontier):
    assert all(before[k] == after[k] for k in ['family', 'rotation', 'operation'])
    if before['outcome'] == 'native_result':
        assert after['outcome'] == 'native_result' and before['bodies'] == after['bodies'], (before, after)
    if before['outcome'] != after['outcome']:
        transitions.append(dict(family=after['family'], rotation=after['rotation'],
                                operation=after['operation'], before=before['outcome'],
                                after=after['outcome'], previous_error=before.get('error'),
                                current_log=after['log']))
frontier_counts = dict(Counter(row['outcome'] for row in frontier))
write('continuation-frontier.json', dict(rows=frontier, counts=frontier_counts,
      previous_counts=dict(Counter(row['outcome'] for row in prior)), transitions=transitions,
      scope='All 81 operation slots retained. Native results/replay and body counts are diagnostics, not independent set proofs or broader capability admission.',
      previous='../2026-10-16-oblique-cuts/continuation-frontier.json'))
text = (OUT / latest('preceding-frontier')['log']).read_text()
previous_rows = [dict(fixture=a, operation=b, bodies=int(c))
                 for a, b, c in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', text, re.M)]
assert len(previous_rows) == 15 and 'Err(' not in text

costs = [dict(corpus=p.name.removesuffix('-costs.json'), **r)
         for p in sorted((OUT / 'benchmark-v1').glob('*-costs.json')) for r in json.loads(p.read_text())]
commands = read('benchmark-v1/commands.json')
assert len(costs) == 159 and len(commands) == 90 and all(r['exit_code'] == 0 for r in commands)
assert read('benchmark-v1/source.json') == source
def feature_graph(path):
    graph = {}
    for line in path.read_text().splitlines():
        if not line.startswith('{'):
            continue
        row = json.loads(line)
        if row.get('reason') != 'compiler-artifact' or row['target']['kind'] == ['bench']:
            continue
        key = '|'.join([row['package_id'], row['target']['name'], ','.join(row['target']['kind'])])
        graph.setdefault(key, set()).add(tuple(row['features']))
    return {key: [list(configuration) for configuration in sorted(configurations)]
            for key, configurations in sorted(graph.items())}
baseline_features = feature_graph(OLD / 'benchmark-build-1.log')
candidate_features = feature_graph(OUT / latest('benchmark-build')['log'])
assert baseline_features == candidate_features
write('feature-graph-comparison.json', dict(
      baseline_log='../2026-10-16-oblique-cuts/benchmark-build-1.log',
      candidate_log=latest('benchmark-build')['log'],
      non_benchmark_artifact_features=baseline_features, equal=True,
      scope='Compare recorded features for every non-benchmark compiler artifact; benchmark target features are compared by the measurement controller. Source/dependency changes remain pinned separately.'))
adverse = [r for r in costs if r['ratio'] > 1.1]
allocations = [r for r in costs if r.get('baseline_allocation_per_iteration') != r.get('candidate_allocation_per_iteration')]
benchmark = dict(cases=159, processes=90, costs=costs, over_ten_percent=adverse,
                 allocation_changes=allocations, maximum_case_median_ratio=max(r['ratio'] for r in costs),
                 scope='Three alternating CPU-0 pairs per complete preserved corpus. All original receipt/iteration/output contracts; shared-host observations only.')
write('benchmark-summary.json', benchmark)
wasm = json.loads((OUT / latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 71 and wasm['imports'] == 0
step = []
for directory in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        assert path.read_bytes() == (OLD / directory / path.name).read_bytes(), path
        step.append(dict(path=str(path.relative_to(OUT)), bytes=path.stat().st_size,
                         sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=True))
assert len(step) == 22

validation = ('Merged-source BREP/IO debug and release each pass 496 all-feature tests; minimal release '
              'passes 488, with no ignored cases. Both warning-denied all-target Clippy configurations, '
              'rustdoc, six examples, eleven optional independent OCCT checks, fuzz-target compilation '
              'and 71 zero-import WASM groups pass. The incoming root-square and eighth-angle regressions '
              'pass three tests each; the consumed earcut configuration passes 60 tests and all-target '
              'Clippy. All fifteen preceding continuation diagnostics succeed; the full nine-fixture '
              f'oblique frontier records {frontier_counts.get("native_result", 0)} native results, '
              f'{frontier_counts.get("undecided", 0)} undecided, '
              f'{frontier_counts.get("unsupported", 0)} unsupported and '
              f'{frontier_counts.get("not_attempted_after_prerequisite_failure", 0)} '
              'unavailable dependent steps. Both diagonal-cone reconstruction orders now return '
              'native results; their diagnostic counts/replay do not establish independent set '
              'equality or broaden semantic admission. '
              'All 22 previous STEP artifacts remain byte-identical. Both targeted scalar zero-factor '
              'reproductions still fail with the original FACTORS > 0 assertion. They are failed gates, '
              'not passing expected-failure tests; no full scalar/workspace qualification is claimed.')
cost_evidence = (f'The full 90-process campaign preserves all receipts across 159 cases and fifteen '
                 f'corpora. Maximum case-median candidate/baseline latency is '
                 f'{benchmark["maximum_case_median_ratio"]:.6f}; {len(adverse)} rows exceed 10%, '
                 f'and {len(allocations)} rows change allocation observations. All raw samples, '
                 'allocation requests, process resources, executable sizes and adverse rows are retained. '
                 'These shared-host observations do not establish a statistical speedup, total-resource '
                 'bound or closure of prior performance gates.')
limits = ('BREP/IO implementation and tests are unchanged by this merge; incoming production changes '
          'retain upstream ownership. The separately pending 35-file native workload is not imported '
          'or admitted. All 28 BREP work packages remain open. General oblique closure, curved-shell '
          'embedding, cone/torus STEP, operation-wide provenance/certainty and internal work/heap/'
          'cancellation contracts remain open. WASM uses workspace paths. Package/MSRV, actual '
          'C/Python/JS consumers, coverage, machine-checked proofs, runtime fuzz/ASan, lexicase and '
          'full-workspace/pre-push gates are not closed. No push was performed.')
write('final-source.json', source)
m = dict(baseline='8f615970f35121bc169b7fa01fb1d0533e79a949',
         merge='3bb56dd9c945c83213d74ea7fd6b6b2c16529d03', upstream='73472622dd4034b8b8777cb2a116c4020f6bb328',
         source='final-source.json', source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
         integration='integration.json', contract='contract.md', qualification=qualification,
         all_attempts='attempts.json', test_counts=counts, frontier='continuation-frontier.json',
         preceding_frontier=previous_rows, wasm=wasm, step_artifacts=step,
         benchmark_summary='benchmark-summary.json', validation=validation, cost_evidence=cost_evidence, limits=limits,
         feature_comparison='feature-graph-comparison.json',
         decision='Retain the requested upstream integration with scoped BREP qualification and all inherited/current adverse evidence visible.',
         migration='The upstream TrueType outline and protected-cell triangulation migrations are explicit in upstream docs. The tested BREP receipts and STEP artifacts remain unchanged.',
         source_reconstruction='source-reconstruction.json',
         analysis_recipes={str(p.relative_to(OUT)): hashlib.sha256(p.read_bytes()).hexdigest()
                           for p in sorted((OUT / 'analysis-recipes').glob('*.py'))},
         analysis_recipe_scope='Post-measurement analysis/documentation only; documentation recipes apply to the merge baseline.',
         ideas=dict(kept=['preserve all incoming fields and the branch BREP ledger entry',
                          'requalify unchanged BREP consumers against the incoming scalar/triangulation proofs'],
                    rejected=[], already_satisfied=['no BREP implementation or API conflict in this merge'],
                    architecture_inapplicable=['importing separately pending native overlays', 'unrelated dependency repairs',
                                              'crediting source review or a merged revision as release admission']))
write('manifest.json', m)
assert hashes() == source
print(json.dumps(dict(checks=len(qualification), tests=counts, frontier=frontier_counts,
                      cases=len(costs), adverse=len(adverse), allocation_changes=len(allocations)), indent=2))
