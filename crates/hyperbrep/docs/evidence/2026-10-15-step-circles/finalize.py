"""Bind qualification and costs to final sources without erasing failed attempts."""
import hashlib
import json
from pathlib import Path
import re
from check import ROOT, OUT, hashes

attempts = json.loads((OUT / 'attempts.json').read_text())
latest = {row['label']: row for row in attempts}
source = hashes()
source_name = 'final-source.json'
(OUT / source_name).write_text(json.dumps(source, indent=2) + '\n')
labels = [
    'scalar-all', 'scalar-minimal', 'predicates-all', 'predicates-minimal',
    'native-debug', 'native-release', 'native-minimal', 'curve-release',
    'solver-release', 'root-acceptance', 'scalar-clippy', 'predicates-clippy',
    'native-curve-clippy', 'native-minimal-clippy', 'root-curve-clippy',
    'rustdoc', 'circular-example', 'allocation-example', 'fuzz-check',
    'wasm-build', 'wasm-runtime', 'fmt', 'diff-check', 'code-diff', 'benchmark-build',
]
qualification = []
for label in labels:
    row = latest[label].copy()
    assert row['source_unchanged'], label
    assert row['exit_code'] == (101 if label == 'root-acceptance' else 0), label
    log = (OUT / row['log']).read_text()
    counts = re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', log)
    if counts:
        row['test_totals'] = dict(zip(['passed', 'failed', 'ignored'], map(sum, zip(*(map(int, c) for c in counts)))))
    old = json.loads((OUT / row['source']).read_text())
    changed = sorted(p for p in set(old) | set(source) if old.get(p) != source.get(p))
    row['source_differences_from_final'] = changed
    # Older long-running downstream suites predate additional acceptance tests
    # and the allocation example repair, but must exercise the same library code.
    assert not any('/src/' in p or '/benches/' in p for p in changed), (label, changed)
    qualification.append(row)

bench = OUT / 'benchmark-v2'
assert json.loads((bench / 'source.json').read_text()) == source
commands = json.loads((bench / 'commands.json').read_text())
assert len(commands) == 45 and all(row['exit_code'] == 0 for row in commands)
costs = {p.stem.removesuffix('-costs'): json.loads(p.read_text()) for p in sorted(bench.glob('*-costs.json'))}
assert set(costs) == {'advanced', 'faceted', 'kernel', 'arc', 'closed_edges', 'circles', 'scalar_micro', 'numerical_micro'}
repeat = OUT / 'benchmark-v2-repeat'
assert json.loads((repeat / 'source.json').read_text()) == source
repeat_commands = json.loads((repeat / 'commands.json').read_text())
assert len(repeat_commands) == 18 and all(row['exit_code'] == 0 for row in repeat_commands)
pooled = json.loads((OUT / 'pooled-geometry.json').read_text())

fixtures = ROOT / 'crates/hyperbrep-io/tests/fixtures'
for p in (OUT / 'axis-fixtures').glob('*.step'):
    assert p.read_bytes() == (fixtures / p.name).read_bytes(), p.name
original = OUT.parent / '2026-10-15-periodic-cylinder/research/occt-cylinder.step'
assert original.read_bytes() == (fixtures / 'occt-cylinder-off-carrier.step').read_bytes()

result = dict(
    baseline='6ca4b653115821c5000e52032621ae30892d6e5e',
    integrated_upstream='7cf9d82acee6f152047eb37e5ff2e6dcece51a0d',
    source=source_name,
    driver_sha256={p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(OUT.glob('*.py'))},
    contract='Selected direct CIRCLE/LINE edges on native PLANE/CYLINDRICAL_SURFACE carriers; strict exact source incidence, directed parameters, native validation/replay and supported downstream composition. No healing or curved STEP export.',
    decision='Kept as an exact composition/domain extension and new feature baseline, not as an optimization or universal timing-gate pass. The pooled cached 256-arc query costs 39.2 to 43.25 ns (1.103316); initial and repeated over-budget observations remain. Controlled-host performance qualification stays open.',
    qualification=qualification,
    test_count_note='Counts overlap across feature configurations. Older downstream checks use identical library/benchmark code; later acceptance-test/example/document changes are enumerated explicitly.',
    original_occt_fixture=dict(path=str(original.relative_to(ROOT)), sha256=hashlib.sha256(original.read_bytes()).hexdigest(), disposition='Byte-identical package-local copy; exact off-carrier import rejection retained.'),
    independent_reader=['occt-read.json', 'axis-occt-read.json'],
    documentation='documentation-audit.json',
    raw_data_formatting='preserved-data-whitespace.json; unrestricted staged diff check exits 2 for original raw logs, saved patch context and the byte-identical OCCT fixture. All diagnostics are classified; code/documentation diff checks pass. Source/evidence bytes are preserved.',
    benchmark=dict(directory='benchmark-v2', completed_processes=len(commands), cases={name: len(rows) for name, rows in costs.items()}, repeat_directory='benchmark-v2-repeat', repeat_processes=len(repeat_commands), pooled='pooled-geometry.json', pooled_summary=[{k: v for k, v in row.items() if k != 'costs'} for row in pooled['results']], scope='Three alternating CPU-0 pairs for complete established geometry corpora and selected affected scalar groups; three absolute new-domain processes. One predefined complete three-pair geometry replication follows a common observed timing shift. All initial and repeat observations, raw samples, receipts, allocations, executable sizes and process RSS retained. No controlled-host significance or total-resource-bound claim.'),
    rejected=['Source-anchored circle frames (focused-5.log)', 'Broad per-Multiply Laurent coefficient recognition (benchmark-v1, candidate.patch and new-files retained)', 'Interrupted unrelated full scalar baseline catalogue (no candidate comparison credited)'],
    known_failures=dict(root_acceptance='The same two strict drill 16/32 composition cases return PredicateUndecided; 141 other tests pass. No policy/fixture change, no full-workspace green claim.', timing='Pooled cached 256-arc query exceeds the default 10% budget at 1.103316; initial and repeat timing-gate failures are retained.', historical='Earlier archive-admission and closed-edge performance observations remain open and are not discharged by this increment.'),
    open_gates=['All 28 work packages', 'Curved supplied SURFACE_CURVE/SEAM_CURVE and other analytic/spline/assembly mappings', 'Curved exact STEP export and explicit healing/approximation', 'Complete operation provenance and certainty receipts', 'Internal total-work, retained-byte and cancellation bounds', 'Clean published-package, MSRV and C/Python/JS binding consumers', 'Coverage, Verus, runtime fuzz/ASan/lexicase campaigns', 'Full pre-push workflow matrix; no push performed'],
)
(OUT / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(dict(qualified_commands=len(qualification), benchmark_processes=len(commands)+len(repeat_commands), cases=result['benchmark']['cases'], all_work_packages_open=True), indent=2))
