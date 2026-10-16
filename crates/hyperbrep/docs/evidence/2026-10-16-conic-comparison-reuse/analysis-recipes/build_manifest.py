"""Summarize one BREP comparison-reuse candidate after complete qualification."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-conic-comparison-reuse'
OLD = OUT.parent / '2026-10-16-upstream-native-integration'
BASELINE = 'f2039ae4e42d93df1493fad17965e345b8d5dbfb'
sys.path.insert(0, str(OUT))
from check import hashes

read = lambda name: json.loads((OUT / name).read_text())
write = lambda name, value: (OUT / name).write_text(json.dumps(value, indent=2) + '\n')
source = hashes()
attempts = read('attempts.json')
latest = lambda label: [row for row in attempts if row['label'] == label][-1]
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
          'native-minimal-clippy', 'rustdoc', 'analytic-example', 'faceted-example',
          'advanced-example', 'supplied-example', 'circular-example', 'similarity-example',
          'occt-reader', 'fuzz-check', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check']
families = ['cylinder', 'cone', 'torus']
rotations = ['identity', 'diagonal', 'rational']
labels += [f'final-{family}-{rotation}' for family in families for rotation in rotations]
labels += ['preceding-frontier', 'benchmark-build', 'benchmarks']
failed_labels = ['inherited-zero-factor', 'inherited-zero-factor-all-features']
qualification = [latest(label) for label in labels + failed_labels]
assert len(qualification) == 32
preliminary = [latest('focused-conics'), latest('focused-step'),
               next(row for row in attempts if row['label'] == 'benchmark-build'),
               latest('focused-benchmark')]
counts = {}
for row in qualification + preliminary:
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
                      ('focused-conics', 3), ('focused-step', 13)]:
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
prior = json.loads((OLD / 'continuation-frontier.json').read_text())['rows']
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
      previous='../2026-10-16-upstream-native-integration/continuation-frontier.json'))
text = (OUT / latest('preceding-frontier')['log']).read_text()
previous_rows = [dict(fixture=a, operation=b, bodies=int(c))
                 for a, b, c in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', text, re.M)]
assert len(previous_rows) == 15 and 'Err(' not in text

costs = [dict(corpus=path.name.removesuffix('-costs.json'), **row)
         for path in sorted((OUT / 'benchmark-v1').glob('*-costs.json')) for row in json.loads(path.read_text())]
commands = read('benchmark-v1/commands.json')
assert len(costs) == 159 and len(commands) == 90 and all(row['exit_code'] == 0 for row in commands)
assert read('benchmark-v1/source.json') == source
focus = read('focused-v1/pcurves-costs.json')
focused_commands = read('focused-v1/commands.json')
assert len(focus) == 6 and len(focused_commands) == 6
assert all(row['exit_code'] == 0 for row in focused_commands)
assert read('focused-v1/source.json') == source

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
old_environment = json.loads((OLD / 'benchmark-v1/environment.json').read_text())
new_environment = read('benchmark-v1/environment.json')
settings = ['rustc', 'cargo', 'optional_build_environment', 'measured_cpu']
assert all(old_environment[key] == new_environment[key] for key in settings)
write('configuration-comparison.json', dict(
      baseline_log='../2026-10-16-upstream-native-integration/benchmark-build-1.log',
      candidate_log=latest('benchmark-build')['log'],
      non_benchmark_artifact_features=baseline_features, equal=True,
      matched_environment={key: new_environment[key] for key in settings},
      scope='Recorded non-benchmark compiler artifact features, compiler/Cargo versions, optional build flags and measured CPU agree. The benchmark controller compares every benchmark target feature set.'))
adverse = [row for row in costs if row['ratio'] > 1.1]
allocations = [row for row in costs if row.get('baseline_allocation_per_iteration') != row.get('candidate_allocation_per_iteration')]
allocation_increases = [row for row in allocations if any(
    row['candidate_allocation_per_iteration'][field] > row['baseline_allocation_per_iteration'][field]
    for field in ['calls', 'requested_bytes'])]
benchmark = dict(cases=159, processes=90, costs=costs, over_ten_percent=adverse,
                 allocation_changes=allocations, allocation_increases=allocation_increases,
                 maximum_case_median_ratio=max(row['ratio'] for row in costs),
                 focused_probe=focus,
                 scope='Three alternating CPU-0 pairs per complete preserved corpus. All original receipt/iteration/output contracts; shared-host observations only.')
write('benchmark-summary.json', benchmark)
wasm = json.loads((OUT / latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 71 and wasm['imports'] == 0
executables = read('benchmark-v1/executables.json')
size_rows = [dict(corpus=name, baseline_bytes=executables['baseline'][name]['bytes'],
                  candidate_bytes=executables['candidate'][name]['bytes'],
                  delta_bytes=executables['candidate'][name]['bytes'] - executables['baseline'][name]['bytes'])
             for name in sorted(executables['baseline'])]
old_wasm = json.loads((OLD / 'wasm-runtime-1.log').read_text())
size_evidence = dict(native_harnesses=size_rows, wasm=dict(
    baseline_bytes=old_wasm['wasm_bytes'], candidate_bytes=wasm['wasm_bytes'],
    delta_bytes=wasm['wasm_bytes'] - old_wasm['wasm_bytes']),
    scope='Measured executable sizes for these source-path test harnesses, not package or production distribution sizes.')
write('binary-size-comparison.json', size_evidence)
step = []
for directory in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        assert path.read_bytes() == (OLD / directory / path.name).read_bytes(), path
        step.append(dict(path=str(path.relative_to(OUT)), bytes=path.stat().st_size,
                         sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=True))
assert len(step) == 22

validation = ('BREP/IO debug and release each pass 496 all-feature tests; minimal release '
              'passes 488, with no ignored cases. Both warning-denied all-target Clippy configurations, '
              'rustdoc, six examples, eleven optional OCCT reader checks, fuzz-target compilation '
              'and 71 zero-import source-path WASM groups pass. The earlier focused conic/oblique '
              'and STEP circle/pcurve regressions pass 3 and 13 tests. Independent exact expectations '
              'and the original full-size fixtures are unchanged. All fifteen preceding continuation '
              f'diagnostics succeed; the nine-fixture frontier records {frontier_counts.get("native_result", 0)} '
              f'native results, {frontier_counts.get("undecided", 0)} undecided, '
              f'{frontier_counts.get("unsupported", 0)} unsupported and '
              f'{frontier_counts.get("not_attempted_after_prerequisite_failure", 0)} '
              'unavailable dependent steps, separately from semantic admission. '
              'All 22 previous STEP artifacts remain byte-identical. Both targeted scalar zero-factor '
              'reproductions still fail with FACTORS > 0; they remain failed gates, not pre-push exemptions.')
cost_evidence = (f'The full 90-process campaign preserves all receipts across 159 cases and fifteen '
                 f'corpora. Maximum case-median candidate/baseline latency is '
                 f'{benchmark["maximum_case_median_ratio"]:.6f}; {len(adverse)} rows exceed 10%, '
                 f'and {len(allocations)} rows change allocation observations, including '
                 f'{len(allocation_increases)} with increased calls or requested bytes. All raw samples, '
                 'allocation requests, process resources, executable sizes and adverse rows are retained. '
                 'The six-case focused probe is preserved separately. Shared-host observations do not '
                 'establish a controlled-host speedup, total-resource bound or closure of prior cost gates.')
cost_evidence += (f' Native harness size changes range from {min(row["delta_bytes"] for row in size_rows)} '
                  f'to {max(row["delta_bytes"] for row in size_rows)} bytes; '
                  f'the WASM probe grows {size_evidence["wasm"]["delta_bytes"]} bytes. '
                  'These are harness sizes, not shipped-package measurements.')
limits = ('Only the BREP periodic conic helper changes in production. No persistent cache, '
          'dependency implementation, public API, archive schema, predicate policy or input domain changes. '
          'All 28 work packages remain open. General oblique closure, curved-shell embedding, '
          'cone/torus STEP, operation-wide provenance/certainty and internal work/heap/cancellation '
          'contracts remain open. The stronger diagonal-cone diagnostics inherited from upstream are '
          'not promoted to semantic admission here. WASM uses workspace paths. Package/MSRV, actual '
          'C/Python/JS consumers, coverage, machine-checked proofs, runtime fuzz/ASan, lexicase and '
          'full-workspace/pre-push gates remain open. No push was performed.')
write('final-source.json', source)
write('manifest.json', dict(
    baseline=BASELINE, upstream='73472622dd4034b8b8777cb2a116c4020f6bb328',
    source='final-source.json', source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    contract='contract.md', qualification=qualification, preliminary=preliminary,
    all_attempts='attempts.json', test_counts=counts, frontier='continuation-frontier.json',
    preceding_frontier=previous_rows, wasm=wasm, step_artifacts=step,
    benchmark_summary='benchmark-summary.json', configuration_comparison='configuration-comparison.json',
    binary_size_comparison='binary-size-comparison.json',
    validation=validation, cost_evidence=cost_evidence, limits=limits,
    decision='kept',
    retention_rationale=(
        'Retained after the complete preserved correctness and cost campaign. The helper '
        'reuses strict decided orderings for the same immutable value/domain and changes no '
        'accepted geometry, endpoint identity or deterministic output contract. Both partial '
        'pcurve cases remove 656 allocation calls and 45,904 requested bytes per operation; '
        'their observed full-campaign time ratios are 0.971130 and 0.977347. All 159 cases '
        'preserve their receipts and no case-median time ratio exceeds 1.035024. The two '
        'similarity matrices with increased allocation observations remain visible; each '
        'increase is less than 0.075% of its corresponding baseline. Native harness growth '
        'of up to 1,208 bytes and WASM growth of 275 bytes are retained as adverse size '
        'observations. These shared-host samples justify this limited local reuse; they do '
        'not establish a general speedup, universal allocation reduction or closure of '
        'earlier performance, resource, correctness or release gates.'),
    migration='No public API, archive schema or deterministic artifact migration.',
    source_reconstruction='source-reconstruction.json',
    analysis_recipes={str(path.relative_to(OUT)): hashlib.sha256(path.read_bytes()).hexdigest()
                      for path in sorted((OUT / 'analysis-recipes').glob('*.py'))},
    analysis_recipe_scope='Post-measurement analysis/documentation only; documentation recipes apply to the pinned baseline.',
    ideas=dict(kept=['reuse certified interval-bound orderings within one helper call'],
               rejected=[], already_satisfied=['structural endpoint equality is certified by the existing ordering cascade'],
               architecture_inapplicable=['new persistent proof cache', 'dependency implementation changes',
                                         'attributing separately pending upstream optimization results to this helper'])))
assert hashes() == source
print(json.dumps(dict(checks=len(qualification), tests=counts, frontier=frontier_counts,
                      cases=len(costs), adverse=len(adverse), allocation_changes=len(allocations)), indent=2))
