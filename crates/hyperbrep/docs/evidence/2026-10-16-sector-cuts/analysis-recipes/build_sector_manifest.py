"""Summarize retained commands and samples after the measured work finishes."""
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-sector-cuts'
sys.path.insert(0, str(OUT))
from check import hashes
from inherited_scalar import COMPLETE_LABELS, unchanged_subject, verify_baseline, verify_complete_failure

read = lambda name: json.loads((OUT / name).read_text())
write = lambda name, data: (OUT / name).write_text(json.dumps(data, indent=2) + '\n')
source = hashes()
identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
write('final-source.json', source)
attempts = read('attempts.json')
for row in attempts:
    prior = read(row['source'])
    row['source_differences_from_final'] = sorted(p for p in prior.keys() | source.keys()
                                                if prior.get(p) != source.get(p))
labels = [*COMPLETE_LABELS, 'scalar-clippy', 'predicate-consumer', 'curve-consumer',
          'native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
          'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
          'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
          'wasm-runtime', 'fmt', 'diff-check', 'final-frontier', 'benchmark-build',
          'scalar-candidate-build', 'benchmarks', 'new-sector-benchmarks', 'scalar-benchmarks']
assert len(labels) == 29
qualification = [[row for row in attempts if row['label'] == label][-1] for label in labels]
baseline_rows = verify_baseline()
for row in qualification:
    assert row['source_unchanged']
    unchanged_subject(read(row['source']), source)
    if row['label'] in COMPLETE_LABELS:
        verify_complete_failure(row)
    else:
        assert row['exit_code'] == 0, row

test_counts = {}
for row in qualification:
    if row['command'][:2] != ['cargo', 'test']:
        continue
    text = (OUT / row['log']).read_text()
    groups = re.findall(r'^test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', text, re.M)
    test_counts[row['label']] = dict(zip(['passed', 'failed', 'ignored'],
                                       [sum(int(x[i]) for x in groups) for i in range(3)]))

frontier_log = (OUT / [r for r in qualification if r['label'] == 'final-frontier'][0]['log']).read_text()
frontier = [dict(fixture=name, operation=operation, bodies=int(count))
            for name, operation, count in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', frontier_log, re.M)]
assert len(frontier) == 15 and 'Err(' not in frontier_log
write('continuation-frontier.json', dict(rows=frontier,
      scope='Native successful results and validated body counts only; independent set expectations are in the acceptance corpus.'))

benchmark_path = OUT / 'benchmark-v1'
costs = [dict(corpus=p.name.removesuffix('-costs.json'), **row)
         for p in sorted(benchmark_path.glob('*-costs.json')) for row in json.loads(p.read_text())]
assert len(costs) == 149
commands = json.loads((benchmark_path / 'commands.json').read_text())
assert len(commands) == 78 and all(row['exit_code'] == 0 for row in commands)
over_budget = [row for row in costs if row['ratio'] > 1.1]
allocation_changes = [row for row in costs if row.get('baseline_allocation_per_iteration') != row.get('candidate_allocation_per_iteration')]
benchmark = dict(cases=149, processes=78, receipts='Every old receipt agrees; no byte/hash waiver.',
                 maximum_case_median_ratio=max(row['ratio'] for row in costs),
                 over_ten_percent=over_budget, allocation_changes=allocation_changes,
                 costs=costs, executables=read('benchmark-v1/executables.json'),
                 scope='Three alternating CPU-0 pairs, all original cases and iterations. Shared-host observations, not controlled-host or statistical admission.')
write('benchmark-summary.json', benchmark)
new_costs = read('new-sector-costs/summary.json')
scalar_costs = read('scalar-costs/summary.json')

prior = OUT.parent / '2026-10-16-curved-coplanar'
step = []
for directory in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        old = prior / directory / path.name
        same = path.read_bytes() == old.read_bytes()
        assert same, path
        step.append(dict(path=str(path.relative_to(OUT)), bytes=path.stat().st_size,
                         sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=True))
assert len(step) == 22
wasm_row = [row for row in qualification if row['label'] == 'wasm-runtime'][0]
wasm = json.loads((OUT / wasm_row['log']).read_text())
assert wasm['probe_groups'] == 66 and wasm['imports'] == 0

validation = (
    'BREP/IO all-feature debug and release each pass 491 tests; minimal release passes 483, with no ignored cases. '
    'Both strict all-target Clippy configurations, scalar Clippy, warning-denied docs, six examples, '
    'eleven independent OCCT topology/floating-point mass checks, fuzz-target compilation and 66 zero-import '
    'WASM groups pass. Predicate tests pass 365; curve tests pass 2,475 with 33 existing ignored cases. '
    'Complete scalar runs use --no-fail-fast: default passes 958 with one failure, all features passes 1,072 '
    'with that same failure. The zero-factor assertion is independently reproduced on untouched baseline '
    'source in both configurations. It remains a failed whole-scalar gate and is not repaired here. '
    'All tested production sources, tests, manifests, READMEs and probes match final source; three '
    'post-check controller-only differences are listed rather than hidden. '
    'Five original and thirty exact similarity configurations exercise 175 nonempty outputs and 35 canonical '
    'empty results, with independently derived exact measures and point tables including 1e-12 offsets, '
    'opposite paired uses, deterministic replay, shared-edge subdivision, reflected rescaling, both applicable '
    'operand orders and complementary reconstruction. Annular partitions preserve source trace/model identity; '
    'cross-hole bridges, invalid angular cells and near gaps have negative controls. Ten new torus/cone STEP '
    'attempts preserve typed family/body/entity blockers followed by supported same-context recovery. '
    'All fifteen original continuation diagnostics now return native results; their counts are distinct '
    'from independent set proofs. All 22 preceding STEP artifacts remain byte-identical.'
)
cost_evidence = (
    f'The complete 78-process campaign compares all 149 preserved cases across thirteen corpora, with no '
    f'receipt waiver. The largest case-median candidate/baseline ratio is {benchmark["maximum_case_median_ratio"]}; '
    f'{len(over_budget)} rows exceed 10%, and {len(allocation_changes)} rows change allocator observations. '
    'Every timing sample, allocator request, process resource and executable size is retained. '
    'Seven new successful workflows have separate absolute costs across three processes, including full '
    'materialization, exact checks, replay and the thirty-configuration matrix. '
    f'The affected inverse-trigonometric corpus has {len(scalar_costs["costs"])} cases and '
    f'{scalar_costs["processes"]} alternating baseline/candidate processes with raw Criterion samples. '
    'Scalar costs retain their original construction/approximation boundaries; they are not topology receipts. '
    'No failed operation is used as a speedup baseline. Shared-host observations do not close controlled-host '
    'or statistical performance admission. Prior spline, archive and cached-arc timing exceptions remain open.'
)
migration = (
    'No public compatibility shim or archive schema change is added. A private clipping carrier is replaced '
    'by the existing materialized correspondence. Iso coefficients and area expressions consume existing exact '
    'scalar proofs; one necessary scalar certificate preserves acos(±1/2) as exact multiples of pi. '
    'The complete old benchmark receipts and all 22 STEP artifacts remain unchanged. Rejected split-parameter, '
    'reflection and boundary-contact compaction trials are removed and their failures retained.'
)
limits = (
    'All 28 work-package gates remain open. This finite convex-sector/native-grid domain does not establish '
    'general Boolean closure, arbitrary-angle completion, nonlinear coincidence or general curved-shell '
    'embedding. Complete operation receipts and downstream provenance/certainty delivery remain open. '
    'Torus/cone STEP export remains typed UnsupportedSurface. The scalar zero-factor gate remains failed; '
    'pre-push verification is not waived. Existing periodic and archive limits are unchanged. No total-work, '
    'retained-heap, expression-growth or cancellation bound is claimed; external watchdogs contain checks. '
    'WASM uses workspace paths, not a shipped JS/package consumer. Runtime fuzz/ASan, lexicase, instrumented '
    'coverage, machine-checked proofs, package/MSRV and actual C/Python/JS release gates remain open. '
    'OCCT is an optional floating-point interoperability oracle, never exact authority or a production dependency. '
    'No full-workspace/pre-push matrix or push. Surrounding source changes are limited to the seven-line '
    'acos-half certificate and its focused regression; only BREP is updated in the shared property ledger.'
)
manifest = dict(
    baseline='5de4ffad7613cce1957319ff2e317526c69ecffb',
    upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
    source='final-source.json', source_identity=identity, contract='contract.md',
    qualification=qualification, all_attempts=attempts, test_counts=test_counts,
    inherited_scalar_baseline=baseline_rows,
    decision='Retain the scoped exact completion/correctness extension with all costs visible. Whole-scalar, performance and broader release gates remain open.',
    validation=validation, cost_evidence=cost_evidence, migration=migration, limits=limits,
    source_files=['../src/geometry.rs', '../src/boolean_kernel.rs', '../src/boolean_kernel/circle_traces.rs',
                  '../src/topology/edit/partition.rs', '../src/topology/measure.rs', '../src/topology/mod.rs',
                  '../src/topology/query.rs', '../src/topology/transform.rs',
                  '../src/topology/validation/sector.rs', '../src/topology/validation/cone.rs',
                  '../src/topology/validation/torus.rs', '../src/topology/validation/wire.rs',
                  '../tests/support/sectors.rs', '../benches/sectors.rs',
                  '../../hyperbrep-io/tests/support/sector_export.rs',
                  '../../hyperreal/src/computable/node/roots_inverse_hyperbolic.rs',
                  '../../hyperreal/src/computable/node/tests.rs'],
    composition=dict(original=5, transformed=30, nonempty_outputs=175, canonical_empty_results=35),
    frontier='continuation-frontier.json', wasm=wasm, benchmark_summary='benchmark-summary.json',
    new_costs=new_costs, scalar_costs=scalar_costs, step_artifacts=step,
    failed_attempts=[row for row in attempts if row['exit_code']],
    ideas=dict(kept=['annular bridge validation and original-index mapping', 'mixed connected circle intervals',
                     'complete native sector/band occupancy certificates', 'actual clipping correspondences',
                     'native spatial area integral with retained conic origin', 'bounded scalar reduction before iso interpolation',
                     'shared scalar acos-half certificate for the reproduced BREP blocker'],
               rejected=['split-parameter-only compaction', 'reflection-coefficient compaction', 'boundary-contact-only compaction'],
               already_satisfied=['native line splitting preserves a structurally constant coordinate',
                                  'the minimized translated circular-area fixture already passed before the origin correction'],
               architecture_inapplicable=['floating sampling for authoritative topology', 'larger scalar recognition or archive limits',
                                          'unrelated dependency repairs in the BREP thread']),
)
write('manifest.json', manifest)
assert hashes() == source
print(json.dumps(dict(qualification=len(qualification), tests=test_counts,
                      cases=len(costs), over_budget=len(over_budget), allocation_changes=len(allocation_changes),
                      max_ratio=benchmark['maximum_case_median_ratio']), indent=2))
