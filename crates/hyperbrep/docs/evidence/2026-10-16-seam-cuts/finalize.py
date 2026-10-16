"""Bind seam-cut qualification, rejected prototypes and costs to final source."""
import gzip
import hashlib
import json
import re
import statistics
from pathlib import Path

from check import OUT, ROOT, hashes


def read(name):
    return json.loads((OUT / name).read_text())


def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


source = hashes()
write('final-source.json', source)
attempts = []
for original in read('attempts.json'):
    before = read(original['source'])
    row = original | {'source_differences_from_final': [p for p in sorted(source.keys() | before.keys())
                                                     if source.get(p) != before.get(p)]}
    counts = re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                        (OUT / row['log']).read_text())
    if counts:
        row['test_totals'] = {key: sum(int(x[i]) for x in counts)
                              for i, key in enumerate(['passed', 'failed', 'ignored'])}
    attempts.append(row)
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
          'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
          'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
          'wasm-runtime', 'fmt', 'diff-check', 'final-continuation', 'final-cone-size',
          'benchmark-build', 'benchmarks', 'new-seam-benchmarks',
          'receipt-baseline', 'receipt-candidate', 'receipt-equality']
qualification = [next(row for row in reversed(attempts) if row['label'] == label) for label in labels]
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'] and not row['source_differences_from_final'], row
checks = {row['label']: row for row in qualification}
for label, count in [('native-debug', 444), ('native-release', 444), ('native-minimal', 436)]:
    assert checks[label]['test_totals'] == dict(passed=count, failed=0, ignored=0)
assert read(checks['wasm-runtime']['log'])['probe_groups'] == 44

expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6,
                export=6, pcurves=6, edge_images=3, analytic_export=8, analytic_similarity=9)
commands = read('benchmark-v2/commands.json')
binaries = read('benchmark-v2/executables.json')
assert len(commands) == 66 and all(row['exit_code'] == 0 for row in commands)
assert read('benchmark-v2/source.json') == source
cost_summary = []
for kind, count in expected.items():
    rows = read(f'benchmark-v2/{kind}-costs.json')
    assert len(rows) == count
    old, new = (binaries[side][kind] for side in ['baseline', 'candidate'])
    assert old['features'] == new['features']
    cost_summary.append(dict(kind=kind, cases=count, binary_identical=old['sha256'] == new['sha256'],
        median_ratio=statistics.median(row['ratio'] for row in rows),
        maximum_ratio=max(row['ratio'] for row in rows),
        over_ten_percent=[row for row in rows if row['ratio'] > 1.1],
        allocation_changes=[row for row in rows if row.get('baseline_allocation_per_iteration')
                            != row.get('candidate_allocation_per_iteration')],
        executable_bytes=dict(baseline=old['bytes'], candidate=new['bytes'], ratio=new['bytes']/old['bytes']),
        costs=f'benchmark-v2/{kind}-costs.json'))
new = read('new-seam-costs/summary.json')
assert read('new-seam-costs/source.json') == source
assert new['completed_processes'] == 3 and len(new['costs']) == 6

step_artifacts = []
for directory in ['exports', 'scaled-exports', 'faceted-exports', 'advanced-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        previous = OUT.parent / '2026-10-16-analytic-similarity' / directory / path.name
        step_artifacts.append(dict(name=f'{directory}/{path.name}', bytes=path.stat().st_size,
            sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=path.read_bytes() == previous.read_bytes()))
assert step_artifacts and all(row['unchanged'] for row in step_artifacts)
archives = []
for name in ['source', 'cutter', 'intersection', 'swapped', 'difference']:
    data = (Path('/tmp') / f'seam-cone-size-{name}.json').read_bytes()
    target = OUT / f'final-cone-size-{name}.json.gz'
    with target.open('wb') as raw, gzip.GzipFile(filename='', fileobj=raw, mode='wb', mtime=0) as output:
        output.write(data)
    archives.append(dict(case=name, archive=target.name, bytes=len(data),
                         sha256=hashlib.sha256(data).hexdigest()))
assert next(row['bytes'] for row in archives if row['case'] == 'swapped') == 46077
write('final-cone-size-archives.json', archives)

frontier_log = (OUT / checks['final-continuation']['log']).read_text()
frontier = []
for family, operation, outcome in re.findall(r'^(torus-axial|torus-long|cone-long) (\w+): (.+)$', frontier_log, re.M):
    frontier.append(dict(family=family, operation=operation, outcome=outcome))
assert len(frontier) == 15 and sum(row['outcome'].startswith('Ok(') for row in frontier) == 3
write('continuation-frontier.json', dict(cases=frontier, scope='Diagnostic outcomes on final source. Three native operations return validated results; this probe records counts and typed blockers, not independent set/area checks or fifteen completed workflows.'))
reconstruction = read('source-reconstruction.json')
final_identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
assert next(row for row in reconstruction['sources'] if row['snapshot'] == f'source-{final_identity}.json')['completely_reconstructible']

manifest = dict(
    baseline='e8c1b6e14daf0a93350bb421dfe76b8bbc684787', upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
    source='final-source.json', contract='contract.md', qualification=qualification, all_attempts=attempts,
    qualification_scope='All 26 final scoped commands match the complete final source snapshot. Two earlier 18-command qualifications remain, preceding the periodic-bounds guard/closed-boundary test and then the native-line representation precheck. The first 66-process campaign retains its failed byte comparison and five over-budget spline observations; its one scalar-expression migration is independently reconciled. Final-continuation is a diagnostic with twelve retained typed blockers; process success is not Boolean completion.',
    decision='Keep the exact seam-cut domain and the reproduced BREP-owned replay/measurement dependencies as a completeness extension. Preserve prior required receipts, all failed candidates and adverse costs. No surrounding implementation change, speedup or release-wide acceptance claim.',
    ideas=[
        dict(idea='Retain Hypercurve closed-set boundary intervals instead of midpoint-discarding them', decision='kept', evidence='The original three complete seam cuts now validate; existing four cylinder/cone interior traces remain, with eight independently checked cap incidences.'),
        dict(idea='Prove whole boundary coverage and retain paired overlap/source identity as a partition no-op', decision='kept', evidence='Split/reversed/subinterval/hole/closed boundary controls, gaps and near-lines, plus forged spatial-interior rejection and unchanged source/recovery.'),
        dict(idea='Deduplicate identical spatial circle traces while retaining graph face incidences', decision='kept', evidence='Native complete-parameterization proof removes duplicate caps; support/endpoints alone do not identify a trace.'),
        dict(idea='Separate torus integral coefficients and use product sums', decision='rejected', evidence='similarity-matrix-2 regresses the unchanged original exact area expectations.'),
        dict(idea='Consume a strict sign at the torus/cone signed-area magnitude boundary', decision='kept', evidence='Original Green integrals retained; compact_pi_laurent and strict sign prevent opaque sqrt(area^2), while unavailable proofs keep exact abs().'),
        dict(idea='Exclude unsupported infinite carrier pairs using a strict finite-face plane/AABB proof', decision='kept', evidence='Rotated cone far-face reproduction completes; touching/overlap and an asserted native Unknown are not excluded.'),
        dict(idea='Repair the reflection solely by matching equivalent circles', decision='rejected', evidence='reflected-stages-1 has zero retained traces and no cap, before edge matching.'),
        dict(idea='Lift native iso pcurves by exact whole periods into the authored face chart', decision='kept', evidence='Reflected scaled cuts and million-period shifts retain exact spatial images. At most three shifts per periodic axis; undecided chart bounds propagate their blocker.'),
        dict(idea='Combine chart lifting with complete circle-image matching and both closed-edge directions', decision='kept', evidence='reflected-stages-2 restores caps but still fails stitching; the existing circle proof plus chart-origin translation then completes. Complementary half arcs and wrong supports remain distinct.'),
        dict(idea='Compact reflection-specific pcurves or replace planar area magnitude broadly', decision='rejected', evidence='Retained area probes localize the repeated replay failure to shared planar projection. Both unsuccessful broader changes are removed.'),
        dict(idea='Compact shared planar projections and axial line directions before repeated construction', decision='kept', evidence='Exact repeated split/reflection/replay and torus area now pass; runtime and persistence share the same native projection rather than duplicate formulas.'),
        dict(idea='Compact every axial map coefficient/offset to fix the archive growth', decision='rejected', evidence='cone-size-probe-1 still emits a 70,176,397-byte swapped result; 70,144,691 bytes belong to three spatial line carriers.'),
        dict(idea='Compact exact line endpoints at the native Curve3::line construction boundary', decision='kept', evidence='The same complete swapped cone emits 46,077 bytes and revalidates under the unchanged 16 MiB limit; full old/new archives and all preserved corpus costs remain.'),
        dict(idea='Use a cancelled rational as an Unknown plane-separation fixture', decision='rejected', evidence='extended-release-1 shows a legitimate structural rational proof. The replacement fixture first asserts native Unknown using a 2048-bit pi-enclosure midpoint; production policy is unchanged.'),
        dict(idea='Change closed-edge construction for full boundary no-op proofs', decision='already-satisfied', evidence='closed-boundary-1 passes both directions before any such production change; no speculative repair is made.'),
        dict(idea='Skip complete-boundary probes before materializing non-line pcurve representations', decision='kept', evidence='The first complete campaign has five over-budget spline rows (maximum 1.241371). Native mapping tags identify the supported line proof domain before any nonlinear reconstruction; full final correctness and all preserved corpora are repeated, with both campaigns retained.'),
        dict(idea='Repair scalar, predicate or planar-curve implementations in this increment', decision='architecture-inapplicable', evidence='Every admitted repair has a BREP owner and consumes existing native proofs/reducers; surrounding implementation remains concurrent upstream work.'),
    ],
    migration='Public face partitions now expose complete boundary no-op records through FaceTracePartitionRef::boundary, retaining the source revision and paired normalized trace/boundary ranges. Interior traces retain canonical ordering; boundary records follow in input order with original source indices. Graphs retain previously omitted positive-length boundary incidences; exact_disjoint_pairs also includes finite plane/bound separation. Exact line/projection canonical expression bytes may change, but archive schema version 9, represented values, strict validation, and resource limits remain unchanged. No compatibility adapters. All prior benchmark receipts and STEP bytes are compared separately. The radical-cylinder receipt changes from 12388334409500861793 to 16708383019185231957: all 32 changed pcurve endpoint scalars prove equal, every non-scalar field is identical and both complete archives validate. Only this named receipt pair has an explicit migration.',
    coverage=dict(completed_seam_workflows=63, boundary_provenance_cases=16, closed_boundary_directions=2,
                  scale_factors=['1/1000', '127/5000', 'sqrt(2)'],
                  operations=['intersection in both operand orders', 'source minus cutter'],
                  continuation='Each complete result passes exact volume/area, nine classifications including boundary and 1e-12 offsets, manifold incidence, deterministic untrusted replay, edge split, reflected 1/1000 rescale and further replay. Matrices overlap native configurations; not an infinite-domain proof.'),
    wasm=read(checks['wasm-runtime']['log']), independent_reader=read(checks['occt-reader']['log']),
    preserved_step_artifacts=step_artifacts, benchmark_cases=expected, benchmark_summary=cost_summary,
    first_campaign='benchmark-v1/migration-reconciliation.json', receipt_migration=read('receipt-migration.json'),
    semantic_timing_exception=dict(
        contract='../../../PERFORMANCE.md',
        reason='Retain the new exact seam-cut domain, full boundary provenance and replay dependencies as the next feature baseline. Completeness precedes performance. The remaining native NURBS Mobius inverse pcurve partition row exceeds the 10% default budget; its cause is not isolated and no all-cohort timing pass is claimed. Four of the first five adverse spline rows return within budget after the representation precheck; all raw samples remain.',
        retained_rows=[row for corpus in cost_summary for row in corpus['over_ten_percent']]),
    new_seam_costs=new, continuation_frontier='continuation-frontier.json',
    source_reconstruction='source-reconstruction.json', final_cone_archives='final-cone-size-archives.json',
    benchmark_scope='Three alternating CPU-0 pairs per complete corpus on a shared host: 66 processes, 132 cases: 131 unchanged receipts and one independently proved exact-expression migration. Three additional processes measure six new complete workflows, including exact checks and full archive materialization/revalidation. Timing, allocation requests, requested bytes, process resources and binary sizes are observations, not total-work/heap bounds or statistical speedup claims. No simultaneous compilation/tests.',
    cache_and_resource_contract='Boundary proofs own immutable source snapshots. Periodic enumeration is limited to three shifts per axis, nine lifts per face and at most 81 face-pair combinations, independent of the integer period offset; larger spans fail typed. Existing scalar normalization bounds and default archive limits are unchanged. No new global cache, general scalar/geometry total-work bound, retained-byte budget or cancellation admission.',
    failures='All attempts and actual source hashes/logs are retained, including compile failures, the failed first existing suite, rejected formulas, invalid Unknown fixture, archive overflow, and the initial Clippy lint. boundary-retention-1 changed source while running and earns no acceptance credit. Early missing source bytes are explicitly listed in source-reconstruction.json; no complete reconstruction claim is made for those preliminary snapshots.',
    limits=['All 28 work-package gates remain open.',
            'The fifteen repeated-Boolean diagnostic attempts retain twelve typed blockers: coincident curved-cap partition, general angular/axial shell validation, and unresolved classification/line-intersection work. They are not silently converted to empties or claimed complete.',
            'General periodic gluing, nonlinear axial pcurves, nonsimilar analytic promotion, general CAD/STEP/spline/void/assembly coverage, full operation provenance and resource/cancellation contracts remain open.',
            'Torus/cone STEP export is still typed UnsupportedSurface with recovery checked; native success does not invent an exchange mapping.',
            'No runtime fuzz/ASan/lexicase, instrumented coverage or formal proof; fuzz targets compile. WASM uses source paths, not a shipped JS/package consumer. Package/MSRV and actual C/Python/JS release gates remain open.',
            'The native NURBS Mobius inverse pcurve partition timing row remains above the default 10% budget; retain the exact extension as a new feature baseline under the recorded semantic exception, with performance admission open.',
            'No full workspace/pre-push campaign and no push. Shared-host observations do not close statistical or controlled-host performance admission.'])
write('manifest.json', manifest)
rows = '\n'.join(f"| {row['kind']} | {row['cases']} | {row['median_ratio']:.6f} | {row['maximum_ratio']:.6f} |" for row in cost_summary)
new_rows = '\n'.join(f"| {row['case']} | {row['median_ns']/1e6:.6f} | {row['allocation_calls_per_iteration']:.1f} | {row['requested_bytes_per_iteration']:.1f} |" for row in new['costs'])
(OUT / 'README.md').write_text(f'''# Seam-aligned analytic cuts

Qualified on `e8c1b6e14daf0a93350bb421dfe76b8bbc684787` plus this increment,
containing upstream `72cd216cc`. Changes stay in BREP and its IO test consumers.
The [contract](contract.md), [manifest](manifest.json), [source hashes](final-source.json)
and [attempt ledger](attempts.json) retain the complete inputs, failures and costs.

The original torus axial/longitudinal halves and cone longitudinal half now
complete strict intersection in both orders and directed subtraction. The same
40-unit cutters are retained. Exact transforms, reflections and three scales
extend this to **63 workflows**. Each checks independent volume/area formulas,
nine classifications, opposite paired edge uses, complete untrusted replay,
subdivision, reflected rescaling and further deterministic replay.

Closed-set trace retention, full boundary overlap proofs, periodic iso-chart
lifts and complete circle-image stitching repair the native graph/partition
path. Public boundary partition records retain their source revision and paired
parameter ranges. Native planar projection, axial line transport, signed analytic
area and line construction reuse existing scalar proofs to preserve replay.
The complete swapped cone archive shrinks from 70,176,397 bytes in the retained
failed candidate to 46,077 bytes, without raising the 16 MiB admission limit.
Both [failed archives](cone-reconstruction-archives.json) and
[final archives](final-cone-size-archives.json) remain; this is a completion and
expression-growth observation, not a general memory bound or timing comparison.

## Qualification

All **26 final scoped commands** match the complete final source snapshot.
All-feature debug/release each pass **444 tests**, minimal release **436**.
Both all-target strict Clippy configurations, warning-denied docs, six examples,
fuzz-target compilation, formatting and **44 zero-import WASM groups** pass.
Independent OCCT reads eleven complete STEP files with expected topology and
floating-point volume/area. Every retained generated STEP artifact remains
byte-identical. The torus/cone results still reject STEP export explicitly;
recovery through a supported cylinder export is checked. These are scoped
native/interoperability checks, not full format conformance or shipped delivery.

Both earlier complete qualifications remain recorded. Final review repaired
the conservative periodic-bounds failure path and added an already-satisfied
closed-boundary composition. The first complete cost campaign then exposed five
spline regressions. A native mapping check removes redundant nonlinear
materialization from this line-only proof; complete
correctness and all preserved corpora were repeated after that change. Wrong spatial
interiors, gapped/partial overlaps, near-lines, complementary half arcs and
uncertain plane separation remain negative controls. The two old graph tests
retain their four interior traces and add eight independently checked boundary
incidences; their original geometry and policies are preserved.

## Completed-work costs

[Sixty-six alternating processes](benchmark-v2/commands.json) compare all
**132 prior cases** with unchanged fixtures and iterations. 131 receipts agree.
The radical-cylinder archive has an explicit [migration](receipt-migration.json):
32 exact scalar encodings change, each proves equal, all non-scalar fields agree,
and both complete archives validate. Its bytes change from 75,603 to 57,195.
The failed first byte comparison and all [first-campaign costs](benchmark-v1/migration-reconciliation.json)
remain, including five spline ratios of 1.135–1.241. Only this exact named
receipt pair is migrated; no other discrepancy is waived.
The manifest retains every adverse ratio, allocator change, executable size and
raw process-resource record. These are shared-host observations; a passing
receipt or favorable timer sample does not establish performance admission.

| Corpus | Cases | Median candidate/baseline ratio | Largest ratio |
| --- | ---: | ---: | ---: |
{rows}

[Three absolute new-domain trials](new-seam-costs/summary.json) retain exact
checks and full archive materialization/revalidation inside each measurement.
The three cut cases hash the full replayed JSON; matrix cases count completed
workflows and assert exact semantics/provenance internally. Every case has an
untimed warmup; scalar caches are not globally reset.

| Workflow | Median ms | Allocation requests | Requested bytes |
| --- | ---: | ---: | ---: |
{new_rows}

The final `native_nurbs_mobius_inverse_pcurve_partition` row remains above the
10% budget (ratio 1.150828). Four of the first five adverse spline rows are now
within budget. The cause of the remaining overhead is not isolated. Retain the
new exact domain as the next feature baseline under the existing recorded
semantic-exception rule; the all-cohort performance gate remains open.
No speedup is claimed against the previously failing seam cuts. Requested bytes
are cumulative allocation traffic, not retained memory or a heap bound.

## Preserved frontier and evidence limits

The [final continuation diagnostic](continuation-frontier.json) retains all
fifteen repeated-Boolean attempts. Three return native validated results; twelve
still report typed partition, shell or unresolved predicate blockers. The probe
does not independently certify the represented set of the three outputs.
General curved-cap coincidence, repeated cuts and mixed shell validation remain
implementation work; none is replaced by an easier fixture or successful empty.

[Source reconstruction](source-reconstruction.json) identifies the pinned
baseline and byte-preserved compressed overlays for final and intermediate
candidates. Three early preliminary snapshots have missing source bytes, listed
explicitly; their available hashes/logs remain. The source-raced first boundary
attempt is excluded from correctness evidence. Rejected prototypes and all
unfavorable observations remain in the manifest's idea and attempt ledgers.

Archive schema version 9 is unchanged; exact canonical expression bytes and
boundary incidence observations can intentionally change as documented in the
manifest. No adapters or surrounding implementation edits. General periodic
gluing, CAD/STEP families, full provenance/resources/cancellation, packages/MSRV,
bindings, runtime fuzz/ASan/lexicase, coverage and formal proof remain open.
The [audit](audit.json) checks local links, JSON, source identity and BREP scope.
All **28 work-package gates remain open**. No push.
''')
print('Recorded source-bound checks, every attempt, retained costs and typed frontier.')
