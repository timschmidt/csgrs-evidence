"""Bind the completed similarity increment to source, checks and preserved costs."""
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
    row = original | {'source_differences_from_final': [p for p in sorted(source.keys() | before.keys()) if source.get(p) != before.get(p)]}
    counts = re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (OUT / row['log']).read_text())
    if counts:
        row['test_totals'] = {key: sum(int(x[i]) for x in counts) for i, key in enumerate(['passed', 'failed', 'ignored'])}
    attempts.append(row)
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy', 'rustdoc',
          'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example', 'circular-example',
          'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check',
          'benchmark-build', 'current-cut-frontier', 'benchmarks', 'new-similarity-benchmarks']
qualification = [next(r for r in reversed(attempts) if r['label'] == label) for label in labels]
probe_inputs = {str((OUT / 'wasm-probe' / name).relative_to(ROOT)) for name in ['Cargo.toml', 'Cargo.lock']}
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row['label']
    assert not row['source_differences_from_final'], row['label']
    if row['label'] in ['wasm-build', 'wasm-runtime', 'benchmark-build', 'benchmarks', 'new-similarity-benchmarks', 'current-cut-frontier']:
        assert not row['source_differences_from_final'], row['label']
checks = {r['label']: r for r in qualification}
expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6, export=6, pcurves=6, edge_images=3, analytic_export=8)
commands = read('benchmark-v2/commands.json')
binaries = read('benchmark-v2/executables.json')
assert len(commands) == 60 and all(r['exit_code'] == 0 for r in commands)
assert read('benchmark-v2/source.json') == source
cost_summary = []
for kind, count in expected.items():
    rows = read(f'benchmark-v2/{kind}-costs.json')
    assert len(rows) == count
    old, new = (binaries[side][kind] for side in ['baseline', 'candidate'])
    assert old['features'] == new['features']
    cost_summary.append(dict(kind=kind, cases=count, binary_identical=old['sha256'] == new['sha256'], median_ratio=statistics.median(r['ratio'] for r in rows),
        maximum_ratio=max(r['ratio'] for r in rows), over_ten_percent=[r for r in rows if r['ratio'] > 1.1],
        allocation_changes=[r for r in rows if r.get('baseline_allocation_per_iteration') != r.get('candidate_allocation_per_iteration')],
        executable_bytes=dict(baseline=old['bytes'], candidate=new['bytes'], ratio=new['bytes']/old['bytes']),
        costs=f'benchmark-v2/{kind}-costs.json'))
new = read('new-similarity-costs-v2/summary.json')
assert read('new-similarity-costs-v2/source.json') == source
assert new['completed_processes'] == 3 and len(new['costs']) == 9
step_artifacts = []
for path in sorted((OUT / 'exports').glob('*.step')):
    previous = OUT.parent / '2026-10-16-upstream-corrections/exports' / path.name
    step_artifacts.append(dict(name=path.name, bytes=path.stat().st_size,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(), unchanged=path.read_bytes() == previous.read_bytes()))
assert len(step_artifacts) == 7 and all(r['unchanged'] for r in step_artifacts)
manifest = dict(
    baseline='f3d34bef56f26bb1e20fa8cc816f9451a7bee59d', upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
    source='final-source.json', contract='contract.md', qualification=qualification, all_attempts=attempts,
    qualification_scope='All 22 final commands match the complete final snapshot. The preceding 22-command record, probe manifest correction and full benchmark campaign remain in pre-subdivision-manifest.json. The subdivision review required a production repair, so all affected checks and complete corpora were repeated. No concurrent source changes during checks or timing.',
    preceding_qualification='pre-subdivision-manifest.json',
    preceding_source_reconstruction='pre-subdivision-reconstruction.json',
    decision='Keep native exact analytic similarities and the reproduced BREP-owned chart/replay/measurement dependencies. Preserve prior completed-work receipts and all adverse observations. Broader CAD, release and resource gates remain open.',
    ideas=[
        dict(idea='Share one exact positive metric factor across analytic carriers and shell certificates', decision='kept', evidence='Full primitive/clipped/void matrices, inverse/repeated compositions, selected parameters and complete model replay; complete preserved-corpus costs retained.'),
        dict(idea='Implement straight axial chart transport through native Hypercurve source-preserving similarities', decision='kept', evidence='Selected line restrictions survive three scale/split/inverse cycles; aliasing plane/cylinder charts get separate records. Curved axial pcurves still fail typed.'),
        dict(idea='Normalize the torus band coordinate without simplifying its exact ratio', decision='rejected', evidence='similarity-matrix-4.log remains undecided on the original radical band expectation.'),
        dict(idea='Reuse the existing scalar-owned compact_quadratic_tower reduction on dimensionless height', decision='kept', evidence='The same radical band passes exact volume equality, classification, replay and composition checks; no scalar changes.'),
        dict(idea='Canonicalize dependent archive records from old runtime vertices', decision='rejected', evidence='Complete original archive pairs retain 120 planar-pcurve and 32 rational-endpoint expression differences after replay.'),
        dict(idea='Use emitted canonical coordinates for dependent planar pcurves and rational edge/profile endpoints', decision='kept', evidence='Unchanged byte-equality assertions pass radical forward/inverse and complete profile workflows. Prior benchmark artifact receipts and seven STEP files remain compared.'),
        dict(idea='Reflect extrusion u while negating the v direction', decision='rejected', evidence='Pinned baseline reflection-only replay fails EdgeUseImageMismatch.'),
        dict(idea='Reverse the native extrusion profile and certify complete reversed-profile parameter equality', decision='kept', evidence='Five native profile families, nonunit NURBS domains, reflected scales, raw replay and a same-endpoint/wrong-interior negative test pass.'),
        dict(idea='Align reflected subcurve comparison charts by an exact parameter translation', decision='kept', evidence='profile-subdivision-1.log reproduces split-then-reflect failure; ten added compositions pass after equal-span, complete-carrier and endpoint-map proofs. Earlier source and costs remain reproducible.'),
        dict(idea='Route elliptic revolution meridians through the existing complete-parameterization proof', decision='kept', evidence='Missing dispatch reproduced before scaling; exact axis clearance, meridian identity and parameter correspondence remain mandatory.'),
        dict(idea='Repair dependencies by changing surrounding scalar/predicate/curve implementations', decision='architecture-inapplicable', evidence='Every reproduced blocker here has a BREP owner or an existing shared operation; no surrounding implementation changes.'),
        dict(idea='Replace failed seam-aligned torus/cone cuts with passing oblique cases', decision='rejected', evidence='Original full inputs and baseline/current typed failures remain in cut-frontier.md; only already-admitted clipped sources enter the completed scaling corpus.'),
    ],
    cache_contract='TransformMetric belongs to one immutable matrix and one strict operation; its positive scale proof/result is reused within that operation only and is dropped afterward. No global state, eviction or cross-policy approximation. Every returned model starts with empty derived query caches. Existing scalar caches are not controlled or heap-bounded by this helper.',
    migration='No public signature or archive schema/version change and no compatibility adapter. Version-9 canonical expression bytes can change where the old serializer mixed runtime and emitted coordinates; exact represented values/topology stay unchanged and independent validation remains mandatory. All 123 retained benchmark observations and seven existing STEP outputs are checked separately. Extrusion reflection now yields a replayable model; the prior inconsistent chart is repaired.',
    coverage=dict(primitive_transforms=40, clipped_void_transforms=64, selected_scale_edit_inverse_cycles=3,
                  periodic_near_workflows=6, profile_workflows=83, scaled_step_unit_workflows=4,
                  chart_alias_orientations=2, count_scope='Named overlapping matrices, not a proof over all analytic or scalar inputs; native test configurations overlap.'),
    wasm=read(checks['wasm-runtime']['log']), independent_reader=read(checks['occt-reader']['log']),
    preserved_step_artifacts=step_artifacts, benchmark_cases=expected, benchmark_summary=cost_summary,
    new_similarity_costs=new,
    benchmark_scope='Three alternating CPU-0 pairs per complete corpus on a shared host, 60 processes and 123 case receipts. Three separate processes measure nine newly completed workflows including exact checks and full replay. Allocator requests, requested bytes, process RSS and executable sizes are observations, not total-heap/work bounds or statistical speedup claims.',
    failures='Every attempt remains in attempts.json with its actual source hashes and log. Original full inputs, byte-difference archives, discarded formula/reversal attempts, mistyped zero-test filter and failed WASM consumer build/runtime are retained. current-cut-frontier-2.log checks the three unresolved cut cases on final source; process success means the diagnostic ran, not that these cuts succeeded.',
    limits=['All 28 work packages remain open.', 'General nonlinear axial pcurves require exact affine image carriers; arbitrary nonsimilar analytic transforms and general family promotion are not admitted.',
        'Three retained seam-aligned torus/cone cuts still fail typed before scaling.',
        'Other analytic/spline/void/assembly STEP exchange, full provenance, scalar/geometry work/heap/cancellation admission and shipped package/MSRV/bindings remain open.',
        'No runtime fuzz/ASan/lexicase, coverage or formal proof. Fuzz targets compile; WASM uses workspace source paths, not a published JavaScript/package consumer.',
        'No full workspace/pre-push campaign and no push. Shared-host timing observations do not close earlier or current performance release gates.'])
write('manifest.json', manifest)
rows = '\n'.join(f"| {r['kind']} | {r['cases']} | {r['median_ratio']:.6f} | {r['maximum_ratio']:.6f} |" for r in cost_summary)
new_rows = '\n'.join(f"| {r['case']} | {r['median_ns']/1e6:.6f} | {r['allocation_calls_per_iteration']:.1f} | {r['requested_bytes_per_iteration']:.1f} |" for r in new['costs'])
(OUT / 'README.md').write_text(f'''# Native analytic similarities

Qualified on `f3d34bef56f26bb1e20fa8cc816f9451a7bee59d` plus this increment,
containing upstream `72cd216cc`. Production changes stay in HyperBRep and its IO
consumers; no surrounding implementation repair or compatibility adapter.

The [contract](contract.md), [manifest](manifest.json), [final source hashes](final-source.json)
and [attempt ledger](attempts.json) retain the domain, every failure and measurement.
Exact metric transport normalizes analytic frames, scales physical lengths and
axial pcurves, separates incompatible shared charts, and transports solid/void
certificates. Selected parameters survive scaling, subdivision, inverse transforms,
archive replay and Boolean/empty continuation. Native millimetre/inch scaling now
completes the original export/reimport workflow; output units remain independent
of physical scaling.

## Qualification and scope

All 22 final scoped commands complete successfully, including a diagnostic that
retains three failed Boolean cuts. BREP/IO all-feature debug and release each pass
**431 tests**; minimal release passes **423**. Strict all-target Clippy in both
configurations, warning-denied docs, six examples, fuzz-target compilation and
formatting pass. **37 zero-import WASM groups** execute in Wasmtime 38.0.0.
Every final command matches the complete final source snapshot. The
[preceding qualification](pre-subdivision-manifest.json) retains the original
WASM consumer dependency failure and correction. Final review then found that
split→reflect profile replay needed an exact parameter-origin translation in
the complete-image proof. That repair retains every carrier coefficient and
adds ten workflows. All affected checks and complete retained corpora were
rerun; the first qualification and timing campaign remain intact.

Independent exact formulas, classifications and image checks cover 40 primitive
transforms, 64 clipped/void transforms, three selected scale/edit/inverse cycles,
six periodic/near-offset workflows, 83 native profile workflows, four STEP unit
workflows and both shared-chart orientations. Configurations overlap. OCCT 7.9.3.1
independently reads eleven STEP files with expected topology and floating-point
volume/area. Seven existing STEP artifacts remain byte-identical. These are
interoperability checks, not proofs of exactness or full EXPRESS/AP conformance.

The extension also repairs reproduced extrusion reflection, forward-only and
shifted-chart profile agreement, torus radical-band measurement and archive canonical-coordinate
inconsistencies. Elliptic revolution meridians now use the existing full image
proof. A same-endpoint/wrong-interior profile is still rejected. Version-9 archive
schema is unchanged, but canonical expression bytes can change for previously
inconsistent endpoint encodings; all admitted output values and topology still
require independent validation. The original mismatching archive pairs remain.

## Completed-work cost observations

[All 60 alternating processes](benchmark-v2/commands.json) preserve the required
observations and fixture facts across **123 prior cases**. Allocation changes,
all unfavorable timing ratios, binary sizes and raw process resources remain in
the manifest and per-corpus files. Shared-host medians do not establish a general
speedup or a statistical performance admission. The preceding [60-process campaign](benchmark-v1/commands.json) also remains.
Its largest observed ratio, 1.117454, is from the byte-identical arc control;
the largest ratio among its changed executables is 1.047605. Three allocator
rows reduce requests and bytes. Final observations below remain separate from
that first campaign; no favorable sample replaces an adverse observation.

| Corpus | Cases | Median candidate/baseline ratio | Largest ratio |
| --- | ---: | ---: | ---: |
{rows}

[Three new-domain trials](new-similarity-costs-v2/summary.json) measure nine complete
workflows. Exact checks and full archive materialization/revalidation remain
inside the timing boundary. The [first new-workflow trials](new-similarity-costs/summary.json)
remain; the profile matrix now contains 83 rather than 73 workflows, so those
two absolute matrix timings do not measure the same completed contract.
Single-cylinder rows hash their complete replayed
archives; matrix rows return completed-work counts and assert independent exact
expectations internally. Rejection/recovery remains a separately named workload.

| Workflow | Median ms | Allocation requests | Requested bytes |
| --- | ---: | ---: | ---: |
{new_rows}

These costs cannot be compared with the previous failing scale operation as a
speedup. Allocation requests and RSS do not bound retained heap, scalar work,
expression growth or cancellation. Scalar caches are not globally reset.

## Preserved failures and remaining work

The [original seam-cut frontier](cut-frontier.md) is reproduced on both pinned
baseline and final source: two torus halves and one cone half still fail typed
before scaling. The full cases remain; successful oblique cuts do not replace
them. All compile/validation failures, the insufficient torus rewrite, earlier
profile reversal, archive pairs, and failed WASM attempts remain available.
`periodic-near-1.log` executed zero tests due to a mistyped filter and earns no
acceptance credit; its corrected named test and full suites pass.

General curved axial pcurves, nonsimilar analytic promotion, broader booleans,
other STEP families/voids/assemblies, complete provenance/resource contracts,
shipped packages/MSRV/bindings, runtime fuzz/ASan/lexicase, coverage and formal
proof remain open. The [final audit](audit.json) checks local links, JSON, source identity and the
shared ledger. Nine original raw log/patch files contain whitespace diagnostics;
they remain byte-preserved. Code/documentation whitespace checks pass separately.
All **28 work-package gates remain open**. No push.
''')
print('Source-bound qualification, all failures and complete cost observations recorded.')
