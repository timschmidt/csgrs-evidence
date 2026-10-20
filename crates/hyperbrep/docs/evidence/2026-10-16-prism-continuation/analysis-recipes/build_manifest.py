"""Summarize completed checks without admitting unfinished or unrelated gates."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
OLD = OUT.parent / '2026-10-16-conic-comparison-reuse'
sys.path.insert(0, str(OUT))
from check import hashes

read = lambda name: json.loads((OUT / name).read_text())
write = lambda name, value: (OUT / name).write_text(json.dumps(value, indent=2) + '\n')
source = hashes()
attempts = read('attempts.json')
latest = lambda label: [row for row in attempts if row['label'] == label][-1]
labels = ['storage-identity', 'scalar-atan', 'scalar-release', 'scalar-minimal',
          'scalar-clippy', 'scalar-consumers', 'native-debug', 'native-release',
          'native-minimal', 'native-clippy', 'native-minimal-clippy', 'rustdoc',
          'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
          'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check',
          'wasm-build', 'wasm-runtime', 'fmt', 'diff-check', 'artifact-check',
          'preceding-frontier', 'prism-frontier', 'prism-occt', 'benchmark-build',
          'receipt-review', 'receipt-baseline-lock', 'receipt-candidate-lock',
          'receipt-baseline-emit', 'receipt-candidate-emit', 'receipt-archive-equality',
          'receipt-artifact-binding']
labels += [f'final-{family}-{rotation}' for family in ['cylinder', 'cone', 'torus']
           for rotation in ['identity', 'diagonal', 'rational']]
prism_labels = sorted({r['label'] for r in attempts if r['label'].startswith('final-prism-')})
assert len(prism_labels) == 25, prism_labels
labels += prism_labels
qualification = [latest(label) for label in labels]
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert read(row['source']) == source, row['label']
inherited = [latest(label) for label in ['inherited-zero-factor', 'inherited-zero-factor-all-features']]
for row in inherited:
    assert row['exit_code'] == 101 and row['source_unchanged'], row
    assert read(row['source']) == source, row['label']
    assert 'assertion failed: FACTORS > 0' in (OUT / row['log']).read_text()
counts = {}
for row in qualification:
    if row['command'][:2] == ['cargo', 'test']:
        groups = re.findall(r'^test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                            (OUT / row['log']).read_text(), re.M)
        counts[row['label']] = dict(zip(['passed', 'failed', 'ignored'],
                                       [sum(int(x[i]) for x in groups) for i in range(3)]))
for label, passed in [('native-debug', 512), ('native-release', 512), ('native-minimal', 504),
                      ('scalar-atan', 45), ('scalar-release', 908), ('scalar-minimal', 837)]:
    assert counts[label] == dict(passed=passed, failed=0, ignored=0), (label, counts[label])
assert counts['scalar-consumers']['failed'] == 0

# Keep the original operation inventory, independent of which prerequisites succeed.
prior = json.loads((OLD / 'continuation-frontier.json').read_text())['rows']
frontier = []
for before in prior:
    label = f"final-{before['family']}-{before['rotation']}"
    row = latest(label)
    text = (OUT / row['log']).read_text()
    operation = before['operation']
    bodies = dict(re.findall(r'^(\S+): bodies=(\d+)$', text, re.M))
    errors = dict(re.findall(r'^(\S+): error=(.*)$', text, re.M))
    replays = dict(re.findall(r'^(\S+): replay=(.*)$', text, re.M))
    item = {key: before[key] for key in ['family', 'rotation', 'operation']}
    item['log'] = row['log']
    if operation in bodies:
        assert replays[operation].startswith('Ok('), item
        item.update(outcome='native_result', bodies=int(bodies[operation]), replay=replays[operation])
    elif operation in errors:
        error = errors[operation]
        item.update(outcome=('resource_exhaustion' if 'Exhausted' in error
                             else 'undecided' if any(t in error for t in ['PredicateUnresolved', 'RealSign'])
                             else 'construction_rejected' if 'NonManifoldSolidEdge' in error else 'unsupported'), error=error)
    else:
        item['outcome'] = 'not_attempted_after_prerequisite_failure'
    if before['outcome'] == 'native_result':
        assert item['outcome'] == 'native_result' and before['bodies'] == item['bodies'], (before, item)
    frontier.append(item)
assert len(frontier) == 81
frontier_report = dict(rows=frontier, counts=dict(Counter(x['outcome'] for x in frontier)),
    previous_counts=dict(Counter(x['outcome'] for x in prior)),
    transitions=[dict(before=a, after=b) for a, b in zip(prior, frontier) if a['outcome'] != b['outcome']],
    scope='All original 81 diagnostic slots and full-size inputs. Native result/replay is not an independent set proof or general capability admission.')
write('continuation-frontier.json', frontier_report)
text = (OUT / latest('preceding-frontier')['log']).read_text()
preceding = [dict(fixture=a, operation=b, bodies=int(c))
             for a, b, c in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', text, re.M)]
assert len(preceding) == 15 and 'Err(' not in text

prisms = []
for label in prism_labels:
    if label == 'final-prism-build':
        continue
    row = latest(label)
    text = (OUT / row['log']).read_text()
    fixture = re.search(r'^fixture=(.*)$', text, re.M)[1]
    item = dict(fixture=fixture, log=row['log'])
    error = re.search(r'^error=(.*)$', text, re.M)
    if error:
        item.update(outcome='unsupported', error=error[1])
    else:
        item.update(outcome='native_result', bodies=int(re.search(r'^bodies=(\d+)$', text, re.M)[1]))
        assert re.search(r'^replay=Ok\(', text, re.M), item
        export = re.search(r'^step_bytes=(\d+)$', text, re.M)
        blocker = re.search(r'^step_error=(.*)$', text, re.M)
        item['step'] = ('exported' if export else 'unsupported' if blocker else 'canonical_empty')
        if export:
            item['step_bytes'] = int(export[1])
        if blocker:
            item['step_error'] = blocker[1]
    prisms.append(item)
assert len(prisms) == 24
prism_report = dict(rows=prisms, counts=dict(Counter(x['outcome'] for x in prisms)),
                    scope='Complete retained diagnostic corpus, separate from exact acceptance assertions.')
write('prism-frontier.json', prism_report)

costs = [dict(corpus=path.name.removesuffix('-costs.json'), **row)
         for path in sorted((OUT / 'benchmark-v1').glob('*-costs.json')) for row in json.loads(path.read_text())]
commands = read('benchmark-v1/commands.json')
assert len(costs) == 167 and len(commands) == 96 and all(row['exit_code'] == 0 for row in commands)
assert read('benchmark-v1/source.json') == source
assert read('receipt-review.json')['passed']
measured = latest('benchmarks')
assert measured['source_unchanged'] and read(measured['source']) == source
assert measured['exit_code'] in [0, 1]
if measured['exit_code']:
    assert 'unreviewed exact receipt changes; all measurements and observations retained' in (OUT / measured['log']).read_text()

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

old_builds = [r for r in json.loads((OLD / 'attempts.json').read_text())
              if r['label'] == 'benchmark-build' and r['exit_code'] == 0]
before = feature_graph(OLD / old_builds[-1]['log'])
after = feature_graph(OUT / latest('benchmark-build')['log'])
assert before == after
old_environment = json.loads((OLD / 'benchmark-v1/environment.json').read_text())
environment = read('benchmark-v1/environment.json')
settings = ['rustc', 'cargo', 'optional_build_environment', 'measured_cpu']
assert all(old_environment[key] == environment[key] for key in settings)
write('configuration-comparison.json', dict(non_benchmark_artifact_features=after, equal=True,
      matched_environment={key: environment[key] for key in settings},
      baseline_log=str((OLD / old_builds[-1]['log']).relative_to(ROOT)),
      candidate_log=latest('benchmark-build')['log'],
      scope='Matching compiler, Cargo, build settings, measured CPU and transitive feature configurations. Benchmark target features are also checked by the campaign.'))
matched = [row for row in costs if 'ratio' in row]
assert len(matched) == 159
allocations = [row for row in matched if row.get('baseline_allocation_per_iteration') != row.get('candidate_allocation_per_iteration')]
increases = [row for row in allocations if any(row['candidate_allocation_per_iteration'][key] > row['baseline_allocation_per_iteration'][key]
                                              for key in ['calls', 'requested_bytes'])]
benchmark = dict(cases=167, matched_cases=159, new_completed_cases=8, processes=96, costs=costs,
                 maximum_case_median_ratio=max(row['ratio'] for row in matched),
                 over_ten_percent=[row for row in matched if row['ratio'] > 1.1],
                 allocation_changes=allocations, allocation_increases=increases,
                 receipt_migrations=read('approved-receipt-migrations.json'),
                 scope='Three alternating CPU-0 pairs for all 159 preserved cases; three absolute trials for eight new completed workflows. Shared host; no general speedup or internal resource-bound claim.')
write('benchmark-summary.json', benchmark)
wasm = json.loads((OUT / latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 83 and wasm['preserved_groups'] == 71 and wasm['prism_groups'] == 12 and wasm['imports'] == 0
executables = read('benchmark-v1/executables.json')
size = dict(native_harnesses=[dict(corpus=name, baseline_bytes=item['bytes'],
                candidate_bytes=executables['candidate'][name]['bytes'],
                delta_bytes=executables['candidate'][name]['bytes'] - item['bytes'])
            for name, item in sorted(executables['baseline'].items())],
            new_harnesses={name:item for name,item in executables['candidate'].items() if name not in executables['baseline']},
            wasm=dict(baseline=read('baseline-wasm.json'), candidate=wasm,
                      delta_bytes=wasm['wasm_bytes'] - read('baseline-wasm.json')['bytes']),
            scope='Test/benchmark harness sizes. WASM additionally includes twelve new test groups; not shipped artifact sizes or isolated production-code growth.')
write('binary-size-comparison.json', size)
step = read('preserved-step-artifacts.json')
assert len(step) == 22 and all(row['unchanged'] for row in step)
oracle = read('prism-occt.json')
assert oracle['passed'] == 14 and oracle['failed'] == 0
representations = read('representation-migrations.json')
assert len(representations['rows']) == 10 and representations['unchanged'] == 3
assert representations['explicit_migrations'] == 7
for row in representations['rows']:
    for side in ['baseline', 'candidate']:
        item = row[side]
        data = (OUT / item['path']).read_bytes()
        assert len(data) == item['bytes'] and hashlib.sha256(data).hexdigest() == item['sha256']
archive_migrations = read('receipt-archive-equality.json')
assert len(archive_migrations['archives']) == 4
assert all(row['non_scalar_changes'] == 0 and row['both_archives_strictly_validate']
           and row['changed_exact_scalars'] for row in archive_migrations['archives'])
for path, expected in read('receipt-probe-inputs.json')['files'].items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == expected
binding = read('receipt-artifact-binding.json')
assert binding['passed'] and len(binding['artifacts']) == 8
for item in binding['artifacts']:
    data = (OUT / item['path']).read_bytes()
    assert len(data) == item['bytes'] and hashlib.sha256(data).hexdigest() == item['sha256']
for item in read('receipt-probe-binaries.json').values():
    path = Path(item['path'])
    assert path.stat().st_size == item['bytes']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == item['sha256']
write('final-source.json', source)
manifest = dict(baseline='90a5c258eb2387d6a2f84fcf1e6ed420da1c4622',
    implementation_baseline='5495a63e07abee7c769969330975a4332d7c1cf4',
    upstream='3b69af324a9642d1f71b9cc38de58b59a236f740', source='final-source.json',
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    contract='contract.md', qualification=qualification, inherited_failed_gates=inherited,
    all_attempts='attempts.json', test_counts=counts, frontier=frontier_report,
    prism_frontier=prism_report, preceding_frontier=preceding, wasm=wasm,
    step_artifacts=step, prism_oracle='prism-occt.json', storage_identity='storage-identity.json',
    benchmark_summary='benchmark-summary.json', measured_campaign=measured,
    configuration_comparison='configuration-comparison.json',
    binary_size_comparison='binary-size-comparison.json', source_reconstruction='source-reconstruction.json',
    representation_migrations='representation-migrations.json',
    archive_expression_migrations='receipt-archive-equality.json',
    archive_expression_probe_inputs='receipt-probe-inputs.json',
    archive_expression_artifact_binding='receipt-artifact-binding.json',
    archive_expression_probe_binaries='receipt-probe-binaries.json',
    analysis_recipes={str(p.relative_to(OUT)):hashlib.sha256(p.read_bytes()).hexdigest()
                      for p in sorted((OUT / 'analysis-recipes').rglob('*'))
                      if p.is_file() and p.suffix in ['.py', '.rs', '.toml', '.lock']},
    analysis_recipe_scope='Post-run analysis is hashed separately. Product, existing tests, fixtures, benchmarks and qualification inputs are bound by final-source.json. The additional post-campaign archive-expression probe has independently retained inputs and baseline dependency sources in receipt-probe-inputs.json and receipt-baseline-source.json. These analysis recipes do not alter the qualified product or benchmark inputs.',
    decision='pending-review',
    limits='Finite BREP prism continuation domain; all 28 work packages remain open. No full scalar/workspace/pre-push, published package/MSRV, actual C/Python/JS bindings, runtime fuzz/ASan, lexicase, coverage or machine-checked proof claim. Internal total-work, retained-heap and cancellation bounds remain incomplete. Upstream nested-FUSE observations and unrelated runtime failures are not admitted. No push.')
write('manifest.json', manifest)
print(json.dumps(dict(tests=counts, frontier=frontier_report['counts'], prisms=prism_report['counts'],
                      benchmark_cases=len(costs), processes=len(commands), decision=manifest['decision']), indent=2))
