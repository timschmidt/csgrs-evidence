"""Source-bound qualification and cost ledger for the native image repair."""
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
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
          'native-minimal-clippy', 'native-docs', 'circular-example', 'fuzz-check',
          'wasm-build', 'wasm-runtime', 'fmt', 'benchmark-build', 'benchmarks', 'new-query-benchmarks']
qualification = [next(row for row in reversed(records) if row['label'] == label) for label in labels]
assert all(row['exit_code'] == 0 and row['source_unchanged']
           and not row['source_differences_from_final'] for row in qualification)

directory = 'benchmark-v1'
commands = read(directory + '/commands.json')
executables = read(directory + '/executables.json')
assert read(directory + '/source.json') == source
assert len(commands) == 36 and all(row['exit_code'] == 0 for row in commands)
expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6)
summary = []
for kind, count in expected.items():
    costs = read(f'{directory}/{kind}-costs.json')
    assert len(costs) == count
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
new = read('new-query-costs/summary.json')
assert read('new-query-costs/source.json') == source
manifest = dict(
    baseline='3e8b078251a12b1fb4e029ec70a9de7aedb4dc08',
    upstream='362e157c1dfb39701749ed2c154b0edff717fec0',
    source='final-source.json',
    contract='contract.md',
    decision='Keep the complete circle image proof and model-scoped read-only query. Reject the first phase-normalization candidate for losing two existing strict STEP successes. No work-package or release gate closes here.',
    ideas=[
        dict(idea='Complete shared circle frames instead of a center/tangent test', decision='kept', evidence='Six reproduced false positives; final local and downstream checks pass.'),
        dict(idea='Use only the prior global phase normalization for the new iso checks', decision='rejected', evidence='Two existing STEP cases become undecided in all three native configurations; WASM traps.'),
        dict(idea='Anchor at the common domain start and retain the prior exact form as an unresolved fallback', decision='kept', evidence='All original STEP cases restored without changing policy, fixtures or surrounding crates.'),
        dict(idea='Expose native whole-image validation to exchange callers', decision='kept', evidence='Model-scoped read-only public query, owner/failure controls and actual WASM execution.'),
    ],
    mathematical_claim='For an affine angular circle image, equal centers/radii, signed span, and radial plus signed tangent frames at a shared parameter prove equality over the complete trim interval. The prior direct-domain frame remains an alternate exact proof if the anchored frame is unresolved.',
    reproduced_failures=dict(
        original=['baseline-image-control-1.log', 'baseline-image-control-2.log'],
        original_scope='The second baseline attempt executes all six wrong-phase/tilted-plane controls across cylinder, sphere and cone. All return Ok incorrectly; independent exact point assertions establish the mismatch.',
        rejected_candidate=['candidate-v1.patch', 'candidate-v1-new-files'],
        rejected_checks=[row['log'] for row in records if row['attempt'] == 1 and row['label'] in ['native-debug', 'native-release', 'native-minimal', 'wasm-runtime']],
        rejection='Full native configurations lose two unchanged STEP circle successes to PredicateUnresolved; the corresponding WASM run traps. Preserve these failures and source; they are not admitted results.',
    ),
    qualification=qualification,
    all_attempts=records,
    count_scope='Feature configurations overlap. Counts include inherited unit/integration/doc tests. The public circle matrix has seven iso families times 16 direction/frame/trim combinations (112), each checked twice and independently evaluated at five parameters. Neither those samples nor counts alone establish the full-interval proof.',
    wasm=read(next(row['log'] for row in qualification if row['label'] == 'wasm-runtime')),
    benchmark=dict(directory=directory, cases=expected, completed_processes=len(commands), summary=summary,
                   scope='Three alternating CPU-0 pairs over complete preserved BREP/STEP/arc corpora; identical required receipts and fixture facts. Output comparisons supplement independent semantic tests. Shared-host descriptive observations, not a general speedup or total-resource bound.'),
    new_query_costs=new,
    documentation='audit.json',
    measurement_support_sha256={str(path.relative_to(OUT.parent)): hashlib.sha256(path.read_bytes()).hexdigest()
                                for path in [OUT.parent/'2026-10-15-step-faceted/measure.c',
                                             OUT.parent/'2026-10-15-closed-edges/receipts.py']},
    historical_limits=['Earlier archive-admission and short cached-arc timing exceptions retain their original scope.',
                       'External timeouts and allocator requested-byte counters do not establish complete retained-memory, cancellation or total-work admission.'],
    open_gates=['All 28 work packages; supplied curved STEP pcurve/seam mapping still needs implementation',
                'Full operation receipts/provenance and complete resource contracts',
                'Clean documented-package/MSRV and actual C/C++/Python/JavaScript consumers',
                'Runtime fuzz/ASan/lexicase, coverage and executable formal proofs',
                'Complete repository pre-push matrix; no push'],
    driver_sha256={path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in sorted(OUT.glob('*.py'))},
)
write('manifest.json', manifest)
print(json.dumps(dict(qualification=[(row['label'], row['exit_code']) for row in qualification],
                     benchmark=[{key: row[key] for key in ['kind', 'median_ratio', 'maximum_ratio']} for row in summary],
                     new_costs=new['costs']), indent=2))
