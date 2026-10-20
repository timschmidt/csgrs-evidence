"""Publish scoped admission and update only the BREP-owned shared ledger value."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT

read=lambda path:json.loads(path.read_text())
sha=lambda data:hashlib.sha256(data).hexdigest()
write=lambda path,value:path.write_text(json.dumps(value,indent=2)+'\n')
qualification=read(OUT/'qualification-summary.json')
resources=read(OUT/'resource-observations.json')
assert qualification['new_complete_workflows']==dict(stroke=4,multiple_components=2)
validation=('Native/IO release suites pass 560 all-feature and 552 minimal-feature tests; eight new focused tests pass in debug. '
    'Both all-target Clippy configurations, external consumer lints, warning-denied rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
    'The warning-denied standalone WASM build executes 119 groups with zero imports, preserving all 111 preceding groups. '
    'Four normalized stroke workflows and two multi-component workflows complete exact measures, incidence, near-boundary classification, cold native replay, STEP import and continued Boolean/empty recovery checks. '
    'Optional OCCT reads independently check all six new STEP outputs. All 81 preceding native diagnostic outcomes, all 24 prism outcomes and 71 old STEP files are preserved. '
    'The unchanged general-path control retains two butt successes, four byte-identical artifacts and two round-cap UnsupportedMeasurement failures. '
    'The absent-API compile failure, initial test API errors and missing reader argument remain recorded; their corrections do not weaken acceptance. '
    'Scalar/dependency implementations are unchanged from the merged baseline; its two inherited zero-factor debug failures remain upstream-owned.')
limits=('This exposes the existing native component constructor through a strict model-owning API. It does not add general rational-path area, a new planar arrangement or broader Boolean/analytic closure. '
    'A local strict construction does not certify an earlier approximate source intent; complete source-qualification delivery remains open. '
    'Solver budgets do not bound total work, expression growth, retained heap or cancellation. Source-path native/WASM consumers and optional OCCT reads do not establish package/MSRV, actual C/Python/JavaScript bindings, formal proofs, coverage, runtime fuzz/ASan/lexicase, release or the full pre-push matrix. '
    'All 28 work packages remain open or in progress. No push is included.')
table=['| Completed stroke workflow | Median ms per call | Allocation requests per call | Requested bytes per call |','| --- | ---: | ---: | ---: |']
for row in resources['complete_region_workflows']:
    values=row['per_complete_workflow']
    table.append(f"| `{row['case']}` | {values['elapsed_ns']/1e6:.6f} | {values['allocation_calls']:,.3f} | {values['requested_bytes']:,.3f} |")
table='\n'.join(table)
old='; '.join(f"{row['case']} ratio {row['wall_ratio']:.6f}" for row in resources['preserved_old_path'] if row['completed'])
cost=('Three fresh benchmark processes each execute one warmup and three measured iterations of all four new complete stroke workflows, with exact checks and STEP/native materialization inside timing. '
    'Three further processes execute both multi-component workflows; 24 alternating old-path processes retain every success and unsupported failure. '
    f'Old successful-process timing observations: {old}. '
    'All latency, allocator requests, process RSS, artifact checksums and executable sizes remain. These are absolute new-capability costs and short shared-host preservation observations, not a general speedup, retained-heap bound or package-size claim. '
    'Private construction and existing callers are unchanged; historical broad benchmark campaigns are not reattributed to this source.')
write(OUT/'idea-ledger.json',[
    dict(idea='Expose the normalized region through the model-owning builder',decision='kept',evidence='missing-public-api-1.log; qualification-summary.json; new-artifacts.json',reason='Makes native circular evidence and winding-owned components available through the ordinary public API; six complete workflows pass.'),
    dict(idea='Reuse the existing component constructor and native line/arc proof',decision='already-satisfied',evidence='review.md; final-source.json',reason='Private construction and existing Boolean callers already enforce this representation path; only the new public entry adds a strict scope.'),
    dict(idea='Recover circle identity by fitting rational boundary paths',decision='architecture-inapplicable',evidence='contract.md; review.md',reason='Hypercurve already owns exact native image evidence. Fitting would introduce a different source-fidelity contract and duplicate ownership; no such algorithm was implemented or timed.'),
    dict(idea='Credit the new region route as a fix or speedup for the original path contract',decision='rejected',evidence='old-path-control.json; resource-observations.json',reason='The two original round-path UnsupportedMeasurement outcomes remain. A different admitted input route must have separate capability and cost evidence.'),
])
write(OUT/'retention-decision.json',dict(decision='kept',reason='Exact public capability extension using the existing native proof owner; not a runtime optimization.',
    validation=validation,cost_evidence=cost,limits=limits,work_packages_complete=False))
readme=f'''# Public normalized-region extrusion

Baseline: `e2b812fd804be6c5ceacb41fa9707ed4c126eab6`, including upstream
`be2a0c37bfe57799c62a36125a5cb883a5458f00`. The public API was first absent
([compiler receipt](missing-public-api-1.log)). The new
`builder::extrude_curve_region(&region, z_min, z_max)` enters a strict scope,
reuses the existing native component constructor, and returns model-owning bodies.
The original component remains the planar support proof; native circle evidence
is borrowed from Hypercurve. Existing private callers and all surrounding crate
runtime implementations are unchanged.

Read the prospective [contract](contract.md), mathematical and ownership
[review](review.md), [qualification summary](qualification-summary.json),
[retention decision](retention-decision.json) and [idea ledger](idea-ledger.json).

## Completed and preserved behavior

{validation}

The 3–4–5 line stroke has radius 1 and height 3. Independent exact expectations
are volume 30 / 30+3*pi and area 62 / 50+8*pi for butt / round caps.
The multi-component input has outer area 36, hole 16, island 4 and separate
component 1: volume 75, boundary area 206 and three solids. Both authored
directions complete their entire workflows. Native tests separately cover
canonical emptiness, invalid height ordering, removal/reunion, preserved caller
certainty and inherited exhausted-budget recovery.

The [new artifacts](new-artifacts.json) contain six STEP and six native JSON
outputs. Four stroke pairs agree byte-for-byte between the external consumer,
documented example and first prototype. Benchmark receipts hash the same full
bytes. Exact formulas, classifications and incidence establish semantic claims
separately from deterministic bytes and OCCT's floating-point interoperability.
The [old path control](old-path-control.json) remains incomplete for round caps;
this different public input route does not change that original contract.

## Cost observations

{cost}

{table}

See [every raw process and case](resource-observations.json), including adverse
old-path samples and binary sizes. Allocation bytes count cumulative requests,
including reallocations; they do not measure live heap. New full-work success
has no valid speed ratio against old unsupported work. The benchmark build and
features are recorded in [all commands](attempts.json); all task builds and
correctness runs finished before these timed processes. OS/shared caches were
not flushed. The source-path WASM harness grows from 111 to 119 groups; its
size is not a matched shipped-package comparison.

## Reproduction and limits

The [manifest](manifest.json) binds every recipe, source, lock, log and output.
[Source reconstruction](source-reconstruction.json) pairs the pinned baseline
with compressed overlays, including the missing-API and failed test prototypes.
Retained external projects document their local absolute dependency paths;
recreate those paths or explicitly record relocation before reproducing them.
The final [audit](audit.json) verifies sources, frozen executables, exact
artifacts, ledger ownership and preserved stashes. It is a local admission
audit, not release qualification.

All attempts remain in [attempts.json](attempts.json). The initial test API
errors were corrected without changing inputs or assertions. The first cone
reader invocation omitted its required directory argument; it failed before
reading a file. The corrected invocation uses the unchanged reader and inputs.
The twelve timed old round-path failures and two preserved controls remain
unsupported outcomes, not successful completions.

{limits}
'''
(OUT/'README.md').write_text(readme)
section='\n\n## Public normalized-region extrusion (2026-10-17)\n\n'+cost+'\n\n'+table+'\n\n'+limits+'\n'
for path,link in [(ROOT/'crates/hyperbrep/PERFORMANCE.md','docs/evidence/2026-10-17-region-extrusion/README.md'),
                  (ROOT/'crates/hyperbrep-io/PERFORMANCE.md','../hyperbrep/docs/evidence/2026-10-17-region-extrusion/README.md')]:
    text=path.read_text()
    assert '## Public normalized-region extrusion (2026-10-17)' not in text
    path.write_text(text+section+f'\nSee the [source-bound admission record]({link}) for complete samples and reproduction.\n')

path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status=read(path)
identifier='public-normalized-region-extrusion-2026-10-17'
assert not any(row['id']==identifier for row in status['increments'])
status['increments'].append(dict(id=identifier,work_packages=['WP00','WP01','WP08','WP14a','WP21'],
    properties=['P1','P6','P8','P9','P11','P12','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
    change='Expose strict builder::extrude_curve_region over the existing native component constructor; preserve native line/circle evidence, original component support, holes, islands and empty material. Add native, STEP, example, complete-work benchmark and standalone WASM consumers.',
    source='../src/ownership/builder.rs',evidence='evidence/2026-10-17-region-extrusion/manifest.json',validation=validation,cost_evidence=cost,limits=limits))
status['next_actions'][0]='Preserve the public normalized-region extrusion corpus: four butt/round stroke workflows, two multi-component STEP workflows, native holes/islands/empty/invalid-height/certainty/budget controls, exact artifacts and 119 WASM groups. General rational-path side measurement and source-qualification delivery require separate proofs and complete consumers; retain the original unsupported inputs.'
status['next_actions'][1]='Use region-extrusion for the current public profile feature and stroke-upstream-integration for merged be2a0c37b ownership guidance. Preserve all 81 native diagnostic outcomes, 24 prism outcomes, 71 old STEP artifacts, six new complete exchanges and historical 176 main/196 dependency benchmark contracts. New source needs fresh applicable evidence; historical timings do not qualify later changes. Supporting crate changes needed for BREP features are authorized; unrelated repairs stay with their owner.'
for index,text in enumerate(status['next_actions']):
    if text.startswith('Preserve every historical feature/integration baseline'):
        status['next_actions'][index]='Preserve every historical baseline, failed probe and complete cost campaign. Exact finite conical LINE-revolution exchange is implemented in cone-exchange; its next-domains.md separates finite B-spline generator recognition, direct conical charts, singular apex topology and source-document persistence. Reproduce each next blocker on current source and admit native proof, exact exchange and continued modeling together. Broader torus chart/gluing, whole-operation resources and shipped-consumer gates remain open.'

ledger_path=ROOT/'docs/properties-status.json'
before=ledger_path.read_text()
baseline=read(OUT/'baseline.json')['baseline']
assert before==subprocess.check_output(['git','show',baseline+':docs/properties-status.json'],cwd=ROOT,text=True)
brep=json.loads(before)['current_work']['hyperbrep']
brep.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
    latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_implementation=identifier,
    qualification=validation+' '+cost+' '+limits)
status['acceptance_contract']['upstream_revision']=brep['upstream_revision']
status['acceptance_contract']['latest_integration']='evidence/2026-10-17-stroke-upstream-integration/README.md'
status['acceptance_contract']['implementation_ownership']=brep['implementation_ownership']
write(path,status)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper)
spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
after=spans.replace_brep(before,brep)
ledger_path.write_text(after)
write(OUT/'ledger-update.json',dict(baseline=baseline,before_sha256=sha(before.encode()),after_sha256=sha(after.encode()),
    ownership='Only current_work.hyperbrep was replaced; all other raw bytes preserved.',
    status_guidance='Refresh the stale crate-local acceptance_contract upstream pointer and ownership text to match the already integrated shared ledger and the user-authorized supporting feature work. Historical increment records stay unchanged.'))
print('Recorded capability, costs, limits and BREP-owned guidance.',flush=True)
