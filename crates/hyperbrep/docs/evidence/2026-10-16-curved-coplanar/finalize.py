"""Bind completed curved composition, failures and all costs to final source."""
import hashlib
import json
import re
import statistics
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
          'wasm-runtime', 'fmt', 'diff-check', 'final-frontier', 'benchmark-build',
          'benchmarks', 'new-coplanar-benchmarks']
qualification = [next(row for row in reversed(attempts) if row['label'] == label) for label in labels]
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'] and not row['source_differences_from_final'], row
checks = {row['label']: row for row in qualification}
assert checks['native-debug']['test_totals'] == checks['native-release']['test_totals'] == dict(passed=468, failed=0, ignored=0)
assert checks['native-minimal']['test_totals'] == dict(passed=460, failed=0, ignored=0)
for label in ['native-debug', 'native-release', 'native-minimal']:
    assert checks[label]['test_totals']['failed'] == checks[label]['test_totals']['ignored'] == 0
assert checks['native-debug']['test_totals']['passed'] - checks['native-minimal']['test_totals']['passed'] == 8
wasm = read(checks['wasm-runtime']['log'])
assert wasm['probe_groups'] == 58 and wasm['imports'] == 0

expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6,
                export=6, pcurves=6, edge_images=3, analytic_export=8, analytic_similarity=9,
                seam_cuts=6)
commands = read('benchmark-v2/commands.json')
binaries = read('benchmark-v2/executables.json')
assert len(commands) == 72 and all(row['exit_code'] == 0 for row in commands)
assert read('benchmark-v2/source.json') == source
cost_summary = []
for kind, count in expected.items():
    rows = read(f'benchmark-v2/{kind}-costs.json')
    assert len(rows) == count
    old, new = (binaries[side][kind] for side in ['baseline', 'candidate'])
    assert old['features'] == new['features']
    resources = {}
    for side in ['baseline', 'candidate']:
        resources[side] = [read(f'benchmark-v2/{kind}-{side}-{trial}-resources.json') for trial in range(1, 4)]
    cost_summary.append(dict(kind=kind, cases=count, binary_identical=old['sha256'] == new['sha256'],
        median_ratio=statistics.median(row['ratio'] for row in rows),
        maximum_ratio=max(row['ratio'] for row in rows),
        over_ten_percent=[row for row in rows if row['ratio'] > 1.1],
        allocation_changes=[row for row in rows if row.get('baseline_allocation_per_iteration')
                            != row.get('candidate_allocation_per_iteration')],
        executable_bytes=dict(baseline=old['bytes'], candidate=new['bytes'], ratio=new['bytes']/old['bytes']),
        process_resources=resources, costs=f'benchmark-v2/{kind}-costs.json'))
new = read('new-coplanar-costs-v2/summary.json')
assert read('new-coplanar-costs-v2/source.json') == source
assert new['completed_processes'] == 3 and len(new['costs']) == 11
# The scheduling-only filter must preserve the already successful new-domain
# receipts as well as the older 138-case corpus.
original_receipts = None
for directory in ['new-coplanar-costs', 'new-coplanar-costs-v2']:
    for trial in range(1, 4):
        rows = [json.loads(line) for line in (OUT / directory / f'trial-{trial}.log').read_text().splitlines()]
        receipts = {r['case']: (r['iterations'], r['outcome'], r['receipt']) for r in rows}
        assert len(receipts) == 11
        if original_receipts is None: original_receipts = receipts
        assert receipts == original_receipts, (directory, trial)
first_new = {row['case']: row for row in read('new-coplanar-costs/summary.json')['costs']}
new_comparison = [dict(case=row['case'], initial_median_ns=first_new[row['case']]['median_ns'],
                       final_median_ns=row['median_ns'], ratio=row['median_ns']/first_new[row['case']]['median_ns'],
                       initial_allocations={key:first_new[row['case']][key] for key in ['allocation_calls_per_iteration', 'requested_bytes_per_iteration']},
                       final_allocations={key:row[key] for key in ['allocation_calls_per_iteration', 'requested_bytes_per_iteration']})
                  for row in new['costs']]
write('new-domain-cost-comparison.json', dict(cases=new_comparison, receipts_unchanged=True,
      scope='Initial successful extension candidate versus final scheduling-filter candidate, with the same eleven complete workloads and all three processes retained on each side. These are shared-host observations; the earlier unsupported branch baseline is not a speedup reference.'))

step_artifacts = []
for directory in ['exports', 'scaled-exports', 'faceted-exports', 'advanced-exports']:
    for path in sorted((OUT / directory).glob('*.step')):
        previous = OUT.parent / '2026-10-16-seam-cuts' / directory / path.name
        step_artifacts.append(dict(name=f'{directory}/{path.name}', bytes=path.stat().st_size,
            sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=path.read_bytes() == previous.read_bytes()))
assert len(step_artifacts) == 22 and all(row['unchanged'] for row in step_artifacts)
frontier_log = (OUT / checks['final-frontier']['log']).read_text()
frontier = [dict(family=family, operation=operation, outcome=outcome)
            for family, operation, outcome in re.findall(r'^(torus-axial|torus-long|cone-long) (\w+): (.+)$', frontier_log, re.M)]
assert len(frontier) == 15
completed = sum(row['outcome'].startswith('Ok(') for row in frontier)
assert completed == 10
write('continuation-frontier.json', dict(cases=frontier,
    scope='All fifteen original diagnostic attempts remain. Ten return validated native results, including the nine targeted recut/clear/restore configurations. Five retain typed blockers. This count probe does not independently establish set equivalence; the nine targeted configurations have separate exact acceptance tests and six similarity variants.'))
reconstruction = read('source-reconstruction.json')
final_identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
assert next(row for row in reconstruction['sources'] if row['snapshot'] == f'source-{final_identity}.json')['completely_reconstructible']

limits = [
    'All 28 work-package gates remain open. This is a bounded-domain completeness extension, not general Boolean closure.',
    'The original fifteen-case diagnostic retains five typed blockers in quarter/band cuts. Different cone/torus charts, general nonlinear coincidence and arbitrary curved-shell embedding still require their own proofs.',
    'Contact mapping retains native preimages, but the existing surface-contact boundary still requires represented Real values. Unsupported selected-root views remain typed blockers; no general selected-surface-image admission is claimed.',
    'The graph and boundary no-op views retain local source/contact/overlap evidence; complete operation receipts and downstream certainty/provenance delivery remain open.',
    'Existing bounded periodic chart lifting and archive admission limits remain unchanged. There is no new cache or claim of general scalar/geometry total-work, retained-byte, cancellation or expression-growth bounds. External timeouts contain checks.',
    'Torus/cone STEP export remains typed UnsupportedSurface with body/entity identity and same-context recovery tested. All 22 prior generated STEP artifacts remain byte-identical; independent OCCT is a floating-point topology/mass oracle, not an exactness proof.',
    'WASM executes source-path dependencies, not a shipped JS/package consumer. Runtime fuzz/ASan, lexicase, instrumented coverage, formal production proofs, package/MSRV and actual C/Python/JS release gates remain open.',
    'Shared-host observations retain every trial, allocator request, process resource and executable size. No speedup against failures, total-memory bound, statistical timing admission or controlled-host claim. Prior timing exceptions remain open; current over-budget rows are listed without omission.',
    'No full-workspace/pre-push validation campaign and no push. Surrounding production code is unchanged; only the BREP-owned shared-ledger entry is updated.',
]
manifest = dict(
    baseline='2c52ee7d5b68da4630e55b0a2e2c2e8e4e98cdbd', upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
    source='final-source.json', source_identity=final_identity, contract='contract.md',
    upstream_checkpoint=read('upstream-checkpoint.json'),
    qualification=qualification, all_attempts=attempts,
    decision='Retain the exact curved composition extension and the BREP-owned native parameter, overlap, cone-section and shell-carrier proofs required for supported continuation. No dependency production fix, policy weakening, fixture reduction, identity shortcut or approximation is used.',
    migration='Intentional greenfield API break: FacePairTrim::CoincidentPlanar with spatial-only traces becomes CoincidentFaces with retained SurfaceIntersectionCurve traces. BoundaryTraceOverlapRef gains native_overlap. No compatibility alias or archive schema migration is introduced. The complete preserved receipt comparison has no byte/hash waiver.',
    ideas=[
        dict(idea='Retain coincident planar circular traces and both real operand charts', decision='kept', evidence='Original full-size recut and subtraction failures resolve through native clipping; straight support-line behavior remains qualified.'),
        dict(idea='Recover circle parameters with an angular sweep fraction', decision='rejected', evidence='pcurve-inverse-1 proves the returned parameter evaluates to the wrong point; native rational parameters differ from angular fractions.'),
        dict(idea='Use an angular inverse round trip alone', decision='rejected', evidence='pcurve-inverse-2 passes locally but contact-provenance-1 still fails: prepared fragment indices are not authored BREP edge-use identity.'),
        dict(idea='Query actual source-use preimages with native point_locations', decision='kept', evidence='Forward/reversed/non-cardinal and full-circle endpoint tests, near-offset exclusion, independent cylindrical cap contact replay, and complete composition workflows.'),
        dict(idea='Extend coincidence to identical cone/torus parameterizations and affine iso boundaries', decision='kept', evidence='Full reconstruction and transformed continuation pass; altered frames/origins remain distinct and original periodic lifting bounds stay unchanged.'),
        dict(idea='Restrict circular overlap proof to arc-tagged boundary records', decision='rejected', evidence='circle-boundary-2 still fails because valid planar construction retains some circular images as rational quadratics; native complete image overlap owns the proof.'),
        dict(idea='Use complete native closed overlap coverage plus independent spatial image replay', decision='kept', evidence='Subdivided annulus, reversed holes, source-bound public parameters, near/partial/gapped curves and endpoint-preserving forged spatial-circle rejection.'),
        dict(idea='Reconstruct cone section radius through tan(semi_angle)', decision='rejected', evidence='circular-components-1 reproduces strict RealSign failure on the unchanged cone cap; existing authored meridian evaluation supplies the exact native image.'),
        dict(idea='Reuse the cone meridian section parameters in both section constructors', decision='kept', evidence='circular-components-2 and all full-size cone recut/reconstruction similarity/replay cases pass without changing scalar recognition or policies.'),
        dict(idea='Require one arena SurfaceId for all analytic shell faces', decision='rejected', evidence='carrier-replay-1 rejects independently encoded duplicate equal carrier records; identity is stronger than the exact geometric invariant.'),
        dict(idea='Prove full cone/torus parameterization equality across shell records', decision='kept', evidence='Duplicate-record replay, exact measures, split/reflection/replay and near-shift rejection pass with all old shell checks retained.'),
        dict(idea='Merge circular intervals without their angular offset or image chart', decision='rejected', evidence='The original reflected 1/1000 matrix fails on redundant traces; the adjacent-domain/same-semicircle negative control prevents a false complete circle.'),
        dict(idea='Union exact same-chart intervals; require full native coverage across other frames', decision='kept', evidence='Reflected redundant traces and complementary frames coalesce; three-quarter gaps remain partial; all 54 transformed configurations complete.'),
        dict(idea='Exclude off-line source uses with the existing strict native line classifier before inverse construction', decision='kept', evidence='Independent finite-line/endpoints/reversal/near/outside-domain control; on-line and blocked classifications still take the full native inverse. Focused 64-case receipts match and largest ratio falls from 1.295617 to 1.119734. Final complete qualification and all corpora repeat; remaining costs stay open.'),
    ],
    test_counts={label:checks[label]['test_totals'] for label in ['native-debug', 'native-release', 'native-minimal']},
    composition=dict(original_configurations=9, similarity_configurations=54,
                     continuation_outputs=126, independent_checks='Exact volume/area, nine classification probes including 1e-12 offsets, opposite paired edge uses, deterministic untrusted replay, edge subdivision, reflected rescaling and further replay for every nonempty output. Empty outputs feed union recovery. Original dimensions and cutters retained.'),
    wasm=wasm, frontier='continuation-frontier.json',
    benchmark_summary=cost_summary, preserved_cases=sum(expected.values()), benchmark_processes=len(commands),
    new_costs=new, new_receipts_unchanged_across_filter=True, new_domain_cost_comparison='new-domain-cost-comparison.json', step_artifacts=step_artifacts, source_reconstruction='source-reconstruction.json',
    preliminary_costs=dict(full_preserved='benchmark-v1/', full_absolute='new-coplanar-costs/', focused_native='contact-filter-probe/', scope='All previous costs remain. The first full campaign has six rows above 10%, including four spline cases, a sphere-trim graph and a short export rejection; the strict line-side exclusion reduces the largest native ratio from 1.295617 to 1.119734 in the focused 64-case probe, with four spline rows still above budget. Full final qualification and every preserved/new workload are repeated.'),
    preliminary_procedure='The preliminary downstream-coplanar-1 check was started before the preceding formatting session completion had been observed. Its source hashes are unchanged; no concurrent source mutation was observed, but it receives no final qualification credit. All final checks were run after formatting completed and without concurrent edits/check processes. Early external diagnostic inputs are retained as .rs.txt files; snapshot reconstruction covers the files named by each snapshot, not an unrecorded external environment.',
    failed_attempts='Every compile, assertion, typed blocker and lint failure is retained with its actual source snapshot and log. Preliminary checks receive no final-source qualification credit. Both initial Clippy configurations failed the same test-only useless_vec lint; the array fix is included in all final checks.',
    limits=limits)
write('manifest.json', manifest)
rows = '\n'.join(f"| {r['kind']} | {r['cases']} | {r['median_ratio']:.6f} | {r['maximum_ratio']:.6f} |" for r in cost_summary)
new_rows = '\n'.join(f"| {r['case']} | {r['median_ns']/1e6:.6f} | {r['allocation_calls_per_iteration']:.1f} | {r['requested_bytes_per_iteration']:.1f} |" for r in new['costs'])
over = [item for row in cost_summary for item in row['over_ten_percent']]
over_text = '\n'.join(f"- `{r['case']}`: {r['ratio']:.6f}." for r in over) or 'No current row exceeds 1.10 in this observation; prior exceptions remain open.'
(OUT / 'README.md').write_text(f'''# Repeated curved Boolean composition

Qualified on `2c52ee7d5b68da4630e55b0a2e2c2e8e4e98cdbd` plus this increment,
containing upstream `72cd216cc`. Production changes stay in HyperBRep. The
[contract](contract.md), [manifest](manifest.json), [source hashes](final-source.json)
and [attempt ledger](attempts.json) retain the inputs, failures and exact scope.

The original torus axial/longitudinal halves and cone longitudinal half now
complete recut intersection, subtraction to canonical empty with recovery, and
union of complementary halves. Both applicable operand orders run at identity
and six exact similarities: **63 configurations and 126 continuation outputs**.
The full-size cutters, strict policy and archive limits are unchanged. Every
nonempty output has independent exact volume/area, nine classification probes,
opposite paired edge uses, untrusted deterministic replay, subdivision,
reflected rescaling and further replay. Canonical empty results feed recovery.

The native repairs retain both coincident surface charts and actual source-use
preimages, prove complete circular boundary overlap and spatial image agreement,
reuse cone meridian evaluation, and prove geometric equality across analytic
shell records. Circular trace unions include angle offsets and require full
coverage across different frames. Public `CoincidentFaces` replaces the former
`CoincidentPlanar` payload without an alias; `native_overlap()` exposes complete
native span evidence on a boundary no-op. Full operation provenance remains open.

## Qualification

All **{len(qualification)} final scoped commands** match the final source snapshot.
BREP/IO all-feature debug and release each pass **{checks['native-debug']['test_totals']['passed']} tests**;
minimal release passes **{checks['native-minimal']['test_totals']['passed']}**. Both strict all-target Clippy
configurations, warning-denied docs, six examples, fuzz-target compilation,
formatting and **58 zero-import WASM groups** pass. Eleven STEP files pass the
independent OCCT topology/floating-point mass checks. All **22 prior generated
STEP artifacts are byte-identical**. Six recut/reconstruction torus/cone exports
retain `UnsupportedSurface` with body/entity identity; the same context then
exports a supported cylinder.

Negative controls include wrong circle interiors despite matching endpoints and
an internal image flag, partial/gapped/near circular coverage, incorrect angular
parameter fractions, same-image/different parameter frames, near-shifted shell
records and adjacent numerical intervals covering only the same semicircle.
The [complete original frontier](continuation-frontier.json) has ten validated
native results and **five typed quarter/band blockers**. These diagnostic counts
do not substitute for the independent acceptance tests of the nine targeted
configurations. Earlier failed candidates, compile errors and both first Clippy
failures remain in the ledger.

## Cost observations

The preserved campaign uses all **138 cases in 12 corpora**, three alternating
CPU-0 pairs each (**72 processes**). Inputs, iterations, completion, exact receipts
and deterministic artifacts are compared without a hash waiver. Native/scalar
cache state follows the unchanged harnesses. No simultaneous tests or compilation
run during timing. Shared-host observations are not statistical speedup claims.

| Corpus | Cases | Median case ratio | Largest case ratio |
| --- | ---: | ---: | ---: |
{rows}

Rows exceeding the default ten-percent observation budget:

{over_text}

[Raw timing, allocation, process resources and executable sizes](benchmark-v2/)
retain every trial. The first complete [campaign](benchmark-v1/) and its six over-budget rows remain,
as do its [absolute costs](new-coplanar-costs/summary.json). A strict native
line-side exclusion avoids inverse construction for proven unrelated boundary
uses; on-line/blocked classifications retain the full inverse. The focused
[64-case probe](contact-filter-probe/kernel-costs.json) retains every receipt and
reduces the largest native ratio from 1.295617 to 1.119734, with four spline rows
still over budget. The table above is the separate complete final campaign.
The older NURBS Mobius/archive/cached-arc timing exceptions
remain open; a later observation alone does not isolate their cause or establish
controlled-host admission. The exact composition extension is retained for its
higher-priority completion/correctness contract, with outstanding costs explicit.

The eleven new successful workloads have separate absolute costs over three
processes. Each includes exact checks, full materialization and validation, with
one untimed warmup. Nine original configurations and the transformed matrix hash
complete outputs; provenance assertions replay actual paired source parameters.

| Completed workload | Median ms | Allocation requests | Requested bytes |
| --- | ---: | ---: | ---: |
{new_rows}

The [same-workload comparison](new-domain-cost-comparison.json) also retains
initial successful-candidate versus final-filter costs for all eleven rows, with
unchanged receipts. The largest observed ratio is {max(row['ratio'] for row in new_comparison):.6f};
{sum(row['ratio'] > 1.1 for row in new_comparison)} rows exceed 1.10.
[Absolute records](new-coplanar-costs-v2/summary.json) are not speedups against failed
operations, and allocator requests/process RSS do not establish retained-heap or
total-work bounds.

## Replay and remaining gates

[Source reconstruction](source-reconstruction.json) binds preserved candidate
bytes to each attempt; [the compressed overlays](source-overlays.tar.gz) and the
pinned baseline reproduce the recorded snapshots to the stated coverage. External
probe paths and local tool setup still require the commands/environment in the
harness. [The audit](audit.json) checks the final scope and local evidence links.

All **28 work-package gates remain open**. General curved shells and coincidence,
quarter/band continuation, selected surface/root images, complete provenance,
resource/cancellation bounds, torus/cone/spline STEP, package/MSRV/binding delivery,
instrumented coverage, formal proof and runtime fuzz/ASan campaigns remain open.
The WASM probe uses workspace source paths. No full-workspace/pre-push campaign
or push is claimed. The surrounding implementation is left to concurrent work.
''')
print(json.dumps(dict(source_identity=final_identity, final_commands=len(qualification),
                     test_counts=manifest['test_counts'], over_budget=len(over), frontier_successes=completed), indent=2))
