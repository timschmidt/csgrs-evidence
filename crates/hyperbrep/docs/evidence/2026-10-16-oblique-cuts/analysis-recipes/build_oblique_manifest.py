"""Summarize the completed checks; never infer semantic equality from diagnostics."""
import hashlib
import json
from pathlib import Path
import re
import sys
from collections import Counter

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-oblique-cuts'
sys.path.insert(0, str(OUT))
from check import hashes

BASE = 'c4533cf7a8a9134f75a69a0adee0522ea6b8883c'
read = lambda name: json.loads((OUT / name).read_text())
write = lambda name, data: (OUT / name).write_text(json.dumps(data, indent=2) + '\n')
source = hashes()
identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
attempts = read('attempts.json')
latest = lambda label: [r for r in attempts if r['label'] == label][-1]
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
          'native-minimal-clippy', 'rustdoc', 'analytic-example', 'faceted-example',
          'advanced-example', 'supplied-example', 'circular-example', 'similarity-example',
          'occt-reader', 'fuzz-check', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check']
families = ['cylinder', 'cone', 'torus']
rotations = ['identity', 'diagonal', 'rational']
labels += [f'final-{family}-{rotation}' for family in families for rotation in rotations]
labels += ['preceding-frontier', 'benchmark-build', 'benchmarks', 'new-oblique-benchmarks']
qualification = [latest(label) for label in labels]
assert len(qualification) == 31
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert read(row['source']) == source, row['label']
counts = {}
for row in qualification:
    if row['command'][:2] == ['cargo', 'test']:
        results = re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                             (OUT / row['log']).read_text(), re.M)
        counts[row['label']] = dict(zip(['passed', 'failed', 'ignored'],
                                       [sum(int(x[i]) for x in results) for i in range(3)]))
assert counts == {'native-debug': dict(passed=496, failed=0, ignored=0),
                  'native-release': dict(passed=496, failed=0, ignored=0),
                  'native-minimal': dict(passed=488, failed=0, ignored=0)}, counts

operations = ['intersection', 'swapped', 'difference', 'recut', 'clear', 'band',
              'sector', 'restore', 'restore-swapped']
frontier = {}
for stage in ['baseline', 'final']:
    rows = []
    for family in families:
        for rotation in rotations:
            attempt = latest(f'{stage}-{family}-{rotation}')
            assert attempt['exit_code'] == 0 and attempt['source_unchanged']
            text = (OUT / attempt['log']).read_text()
            values = dict(re.findall(r'^(\S+): bodies=(\d+)$', text, re.M))
            errors = dict(re.findall(r'^(\S+): error=(.*)$', text, re.M))
            replays = dict(re.findall(r'^(\S+): replay=(.*)$', text, re.M))
            for operation in operations:
                row = dict(family=family, rotation=rotation, operation=operation,
                           log=attempt['log'], source=attempt['source'])
                if operation in values:
                    assert replays[operation].startswith('Ok('), row
                    row.update(outcome='native_result', bodies=int(values[operation]),
                               replay=replays[operation])
                elif operation in errors:
                    error = errors[operation]
                    outcome = ('undecided' if any(s in error for s in ['PredicateUnresolved', 'RealSign'])
                               else 'construction_rejected' if 'NonManifoldSolidEdge' in error
                               else 'unsupported')
                    row.update(outcome=outcome, error=error)
                else:
                    row.update(outcome='not_attempted_after_prerequisite_failure')
                rows.append(row)
    frontier[stage] = dict(rows=rows, counts=dict(Counter(r['outcome'] for r in rows)))
assert frontier['baseline']['counts']['native_result'] == 53
for before, after in zip(frontier['baseline']['rows'], frontier['final']['rows']):
    if before['outcome'] == 'native_result':
        assert after['outcome'] == 'native_result' and before['bodies'] == after['bodies'], (before, after)
frontier['scope'] = ('All 81 named operation slots across nine full-size fixtures, including dependent '
                     'operations unavailable after an earlier failure. Native results and successful '
                     'archive replay are diagnostic observations, not independent semantic proofs. '
                     'Nonmanifold construction rejection on these valid operands is a kernel defect, '
                     'not invalid user input. Exact independent expectations cover the admitted torus '
                     'continuation in tests/support/oblique.rs, separately from this frontier.')
write('continuation-frontier.json', frontier)
previous = (OUT / latest('preceding-frontier')['log']).read_text()
previous_rows = [dict(fixture=a, operation=b, bodies=int(c))
                 for a, b, c in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', previous, re.M)]
assert len(previous_rows) == 15 and 'Err(' not in previous

costs = [dict(corpus=p.name.removesuffix('-costs.json'), **row)
         for p in sorted((OUT / 'benchmark-v1').glob('*-costs.json'))
         for row in json.loads(p.read_text())]
commands = read('benchmark-v1/commands.json')
assert len(costs) == 156 and len(commands) == 84 and all(r['exit_code'] == 0 for r in commands)
assert read('benchmark-v1/source.json') == source
assert read('new-oblique-costs/source.json') == source
adverse = [r for r in costs if r['ratio'] > 1.1]
allocations = [r for r in costs if r.get('baseline_allocation_per_iteration') != r.get('candidate_allocation_per_iteration')]
benchmark = dict(cases=156, processes=84, costs=costs, over_ten_percent=adverse,
                 allocation_changes=allocations, maximum_case_median_ratio=max(r['ratio'] for r in costs),
                 receipts='Every preserved case receipt agrees, without byte/hash waiver.',
                 scope='Three alternating CPU-0 pairs per complete corpus. Shared-host observations; controlled-host and statistical gates remain open.')
write('benchmark-summary.json', benchmark)
new_costs = read('new-oblique-costs/summary.json')
assert new_costs['completed_processes'] == 3 and len(new_costs['costs']) == 3
wasm = json.loads((OUT / latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 71 and wasm['imports'] == 0
step = []
for directory in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        assert path.read_bytes() == (OUT.parent / '2026-10-16-sector-cuts' / directory / path.name).read_bytes()
        step.append(dict(path=str(path.relative_to(OUT)), bytes=path.stat().st_size,
                         sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=True))
assert len(step) == 22

validation = ('BREP/IO all-feature debug and release each pass 496 tests; minimal release passes 488, '
              'with no ignored cases. Both warning-denied all-target Clippy configurations, rustdoc, '
              'six examples, eleven independent OCCT checks, fuzz-target compilation and 71 zero-import '
              'WASM groups pass. All 31 final qualification/diagnostic/measurement commands use the '
              'same final source hashes. Circle/ellipse query controls cover seven distant charts, '
              'both traversal directions, restriction, full-period seams and exact 1e-12 gaps. '
              'The oblique torus band has three global configurations, 18 nonempty outputs and three '
              'canonical empty results; independent exact volume/area and point tables, paired opposite '
              'incidence, subdivision, reflected rescaling, deterministic archive replay, both '
              'intersection orders and complementary reconstruction are checked. Four STEP attempts '
              'retain typed torus/body/entity rejection and same-context cylinder export recovers. '
              'All fifteen preceding continuation diagnostics succeed, and all 22 prior STEP artifacts '
              'remain byte-identical. The wider nine-fixture frontier remains separately recorded '
              'with its typed failures and dependent operations that could not be attempted.')
cost_evidence = (f'The full 84-process campaign compares 156 preserved cases in fourteen corpora; '
                 f'every receipt agrees. The largest case-median candidate/baseline ratio is '
                 f'{benchmark["maximum_case_median_ratio"]:.6f}; {len(adverse)} rows exceed 10%, and '
                 f'{len(allocations)} rows change allocator observations. Every adverse row, raw sample, '
                 'allocation request, process resource and executable size is retained. Three newly '
                 'successful torus continuation workloads have separate absolute costs across three '
                 'processes, with exact checks and full output materialization inside timing. No '
                 'failed operation serves as a speedup baseline. Shared-host measurements do not '
                 'close controlled-host/statistical gates or earlier timing exceptions.')
limits = ('All 28 work packages remain open. This increment does not establish general oblique '
          'Boolean closure, nonlinear coincidence, general curved-shell embedding or operation-wide '
          'provenance/certainty delivery. Cone/torus STEP remains typed UnsupportedSurface. Scalar, '
          'predicate, curve and mesh implementations are unchanged in this increment; the preceding '
          'whole-scalar zero-factor failure remains an inherited failed gate, not a pre-push waiver. '
          'Periodic/archive limits and strict predicate policies are unchanged. No total-work, retained-heap, '
          'expression-growth or cancellation bound is claimed; watchdogs provide external containment '
          'only. WASM uses local workspace paths, not a shipped package/JS consumer. Runtime fuzz/ASan, '
          'lexicase, coverage, machine-checked proofs, package/MSRV and C/Python/JS release gates remain '
          'open. No complete workspace/pre-push matrix or push was performed.')
write('final-source.json', source)
manifest = dict(baseline=BASE, upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
                source='final-source.json', source_identity=identity, contract='contract.md',
                source_reconstruction='source-reconstruction.json',
                analysis_recipe_scope='Post-measurement analysis/documentation recipes, excluded from measured workloads. Apply the documentation recipe to baseline documentation only.',
                analysis_recipes={str(p.relative_to(OUT)): hashlib.sha256(p.read_bytes()).hexdigest()
                                  for p in sorted((OUT / 'analysis-recipes').glob('*.py'))},
                upstream_checkpoint='upstream-checkpoint.json',
                upstream_after_qualification=read('upstream-checkpoint-final.json'),
                upstream_integration='Six newer upstream commits were fetched after this qualification; merge and requalify separately after committing this source-bound increment.',
                qualification=qualification, all_attempts='attempts.json', test_counts=counts,
                validation=validation, cost_evidence=cost_evidence, limits=limits,
                decision='Retain the exact correctness/completion extension with all measured costs and open gates visible.',
                migration='No public API, compatibility shim or archive schema migration. Existing exact receipts and STEP bytes are preserved.',
                source_file_paths_relative_to='crates/hyperbrep/docs',
                source_files=['../src/geometry.rs', '../src/geometry/location.rs', '../src/boolean_kernel.rs',
                              '../src/boolean_kernel/coincident.rs', '../src/boolean_kernel/seam_tests.rs',
                              '../tests/oblique.rs', '../tests/support/oblique.rs', '../benches/oblique.rs',
                              '../../hyperbrep-io/tests/oblique_export.rs', '../../hyperbrep-io/tests/support/oblique_export.rs'],
                frontier='continuation-frontier.json', preceding_frontier=previous_rows,
                composition=dict(configurations=3, nonempty_outputs=18, canonical_empty_results=3),
                conic_queries=dict(turns=[-1000000000000, -7, -1, 0, 1, 7, 1000000000000],
                                   families=['CircleArc', 'EllipseArc'], shape_reversal_restriction_cases=56,
                                   inverse_calls=210, plane_contact_calls=56),
                wasm=wasm, step_artifacts=step, benchmark_summary='benchmark-summary.json', new_costs=new_costs,
                inherited_scalar=dict(evidence='../2026-10-16-sector-cuts/manifest.json',
                                      status='failed, unchanged source; not re-executed in this BREP-only increment',
                                      test='determinant_product_cancellation::other_arities_keep_their_mathematical_values'),
                ideas=dict(kept=['certified periodic conic parameter lifting shared by inverse/contact/atomization',
                                  'reuse a unique retained clipping preimage only on a certified equal full parameterization'],
                           rejected=['one-turn-only angle normalization', 'reconstructing every retained clipping preimage through expanded coordinates'],
                           already_satisfied=['three near-axis public inverse probes return typed uncertainty before the candidate-quadrant path; this is not a proof of that path'],
                           architecture_inapplicable=['float fitting or nearest-point selection for exact topology',
                                                     'unrelated dependency repairs or budget increases to hide evidence loss']))
write('manifest.json', manifest)
assert hashes() == source
print(json.dumps(dict(checks=len(qualification), tests=counts, frontier=frontier['final']['counts'],
                      cases=len(costs), over_ten_percent=len(adverse), allocation_changes=len(allocations),
                      maximum_ratio=benchmark['maximum_case_median_ratio']), indent=2))
