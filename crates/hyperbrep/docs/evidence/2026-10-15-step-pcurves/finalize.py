"""Bind the supplied-pcurve qualification and every attempt to final source."""
import hashlib
import json
import re
import statistics

from check import OUT, hashes


def read(name):
    return json.loads((OUT / name).read_text())


def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


source = hashes()
write('final-source.json', source)
records = []
for row in read('attempts.json'):
    snapshot = read(row['source'])
    row = row | {'source_differences_from_final': [
        path for path in sorted(source.keys() | snapshot.keys())
        if source.get(path) != snapshot.get(path)
    ]}
    counts = re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                        (OUT / row['log']).read_text())
    if counts:
        row['test_totals'] = {label: sum(int(x[i]) for x in counts)
                              for i, label in enumerate(['passed', 'failed', 'ignored'])}
    records.append(row)
labels = [
    'occt-reader', 'scalar-all', 'scalar-minimal', 'predicates-all', 'predicates-minimal',
    'native-debug', 'native-release', 'native-minimal', 'curve-release',
    'solver-release', 'root-acceptance', 'scalar-clippy', 'predicates-clippy',
    'native-curve-clippy', 'native-minimal-clippy', 'root-curve-clippy',
    'rustdoc', 'supplied-example', 'circular-example', 'allocation-example', 'fuzz-check',
    'wasm-build', 'wasm-runtime', 'fmt', 'diff-check', 'benchmark-build',
    'benchmarks', 'new-pcurve-benchmarks',
]
qualification = [next(row for row in reversed(records) if row['label'] == label) for label in labels]
assert all(row['exit_code'] == 0 and row['source_unchanged']
           and not row['source_differences_from_final'] for row in qualification)

directory = 'benchmark-v1'
commands = read(directory + '/commands.json')
executables = read(directory + '/executables.json')
assert read(directory + '/source.json') == source
assert len(commands) == 48 and all(row['exit_code'] == 0 for row in commands)
expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6,
                scalar_micro=134, numerical_micro=124)
summary = []
for kind, count in expected.items():
    costs = read(f'{directory}/{kind}-costs.json')
    assert len(costs) == count, (kind, len(costs), count)
    old, new = (executables[side][kind] for side in ['baseline', 'candidate'])
    assert old['features'] == new['features']
    summary.append(dict(
        kind=kind, cases=count,
        median_ratio=statistics.median(row['ratio'] for row in costs),
        maximum_ratio=max(row['ratio'] for row in costs),
        identical_executable=old['sha256'] == new['sha256'],
        over_ten_percent=[row for row in costs if row['ratio'] > 1.1],
        executable_bytes=dict(baseline=old['bytes'], candidate=new['bytes'], ratio=new['bytes']/old['bytes']),
        allocation_changes=[row for row in costs if row.get('baseline_allocation_per_iteration') != row.get('candidate_allocation_per_iteration')],
        costs=f'{directory}/{kind}-costs.json',
    ))
new = read('new-pcurve-costs/summary.json')
assert read('new-pcurve-costs/source.json') == source
manifest = dict(
    baseline='a9ee2a2863539a1ec330056e108da04090a1e488',
    upstream='362e157c1dfb39701749ed2c154b0edff717fec0',
    source='final-source.json',
    contract='contract.md',
    decision='Retain the exact supplied analytic pcurve extension and the narrowly reproduced scalar source-map repair. Keep failed attempts, all adverse cost observations and every broader gate. No general speedup or complete timing-gate admission is claimed.',
    ideas=[
        dict(idea='Use native whole-image admission for every new curved 3D/UV tuple', decision='kept', evidence='All supplied representations are checked independent of master selection; final topology is validated separately.'),
        dict(idea='Preserve the existing planar-line affine proof', decision='already-satisfied', evidence='Retain its source maps and exact oriented infinite-line certificate; no native carrier or adapter added.'),
        dict(idea='Normalize importer periodic parameters to resolve independent source-map coordinates', decision='rejected', evidence='Two normalization attempts leave the same partial-arc equality unresolved. Removed and retained as source patches.'),
        dict(idea='Extend the scalar bounded atan certificate to odd multiples of pi/4', decision='kept', evidence='Direct scalar regression reproduces the BREP blocker; exact identities repair it without importer-specific formulas or approximate equality.'),
        dict(idea='Treat a finite decimal near tau as an exact seam period', decision='rejected', evidence='Exact image and opposite-bound controls reject it even under an ambient approximate scope; no implicit healing.'),
        dict(idea='Claim completed general seam or spline import from these controls', decision='rejected', evidence='This subset does not establish that domain; its capability gates stay open.'),
    ],
    mathematical_claim='For the admitted spatial LINE/CIRCLE and planar/cylindrical PCURVE tuples, the native complete-image certificate proves the trimmed composed image. Directed source parameters retain every alternate and master representation. Odd integer pi/4 rotations of +/-atan(x) use exact addition identities with positive denominator sqrt(2*(1+x*x)); the bounded recognizer rejects extra constants, coefficients and unrecognized forms.',
    failed_attempts=dict(
        baseline=['baseline-pcurves-1.log', 'baseline-pcurves-2.log', 'test-support-v1.rs', 'baseline-test-support.rs'],
        importer=['pcurve-tests-1.log', 'pcurve-tests-2.log', 'pcurve-tests-3.log', 'candidate-v1.patch', 'candidate-v3.patch', 'pcurves-v1.rs', 'pcurves-v2.rs', 'pcurves-v3.rs'],
        scalar=['scalar-blocker-1.log', 'scalar-candidate-v1.patch', 'scalar-diagonal-node-1.log'],
        source_guard='initial-native-1.log ran during formatting. source_unchanged is false, so it is not credited. The final qualification uses unchanged complete source snapshots.',
        test_correction='The first private scalar test incorrectly demanded a rational leaf for a composed quadratic square. The final test requires the same exact rational value through bounded_laurent_rational(64), preserves sign and no-refinement assertions, and does not change the original BREP fixture or expected geometry.',
    ),
    qualification=qualification,
    all_attempts=records,
    count_scope='Feature configurations overlap. Counts include inherited unit/integration/doc tests. Five supplied-pcurve groups contain master, sense, representation, unit, map, composition and failure matrices; exact sample checks supplement the native whole-image proof.',
    wasm=read(next(row['log'] for row in qualification if row['label'] == 'wasm-runtime')),
    independent_reader=read(next(row['log'] for row in qualification if row['label'] == 'occt-reader')),
    benchmark=dict(directory=directory, cases=expected, completed_processes=len(commands), summary=summary,
                   scope='Three alternating CPU-0 pairs over the complete preserved BREP/STEP/arc corpora and selected scalar groups. All required geometry receipts and fixture facts agree. Scalar Criterion groups are short probes. Shared-host descriptive observations, not a general speedup or a complete work/memory bound.'),
    new_pcurve_costs=new,
    documentation='audit.json',
    measurement_support_sha256={str(path.relative_to(OUT.parent)): hashlib.sha256(path.read_bytes()).hexdigest()
                                for path in [OUT.parent/'2026-10-15-step-faceted/measure.c',
                                             OUT.parent/'2026-10-15-closed-edges/receipts.py']},
    historical_limits=['Earlier archive-admission and cached-arc timing exceptions retain their original scope.',
                       'External timeouts, precision limits and allocator requested-byte counters do not establish complete retained-memory, cancellation or total-work admission.'],
    open_gates=['All 28 work packages; successful exact general seams, other analytic/spline/trimmed pcurve and assembly mappings, curved STEP export',
                'Complete operation receipts/provenance and resource contracts',
                'Clean documented-package/MSRV and actual C/C++/Python/JavaScript consumers',
                'Runtime fuzz/ASan/lexicase, coverage and executable formal proofs',
                'Complete repository pre-push matrix; no push'],
    driver_sha256={path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in sorted(OUT.glob('*.py'))},
)
write('manifest.json', manifest)
print(json.dumps(dict(qualification=[(row['label'], row['exit_code'], row.get('test_totals')) for row in qualification],
                     benchmark=[{key: row[key] for key in ['kind', 'cases', 'median_ratio', 'maximum_ratio']} for row in summary],
                     new_costs=new['costs']), indent=2))
