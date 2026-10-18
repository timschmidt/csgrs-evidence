"""Publish only claims derived from the fixed-source finite acceptance record."""
import hashlib, importlib.util, json
from pathlib import Path
import sys
OUT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import ROOT, hashes
read=lambda name:json.loads((OUT/name).read_text())
source=hashes(); qualification=read('qualification-summary.json'); cost=read('resource-review.json'); artifacts=read('artifact-preservation.json')
assert qualification['source']==cost['source']==artifacts['source']==source
counts=qualification['test_counts']; n=artifacts['new_files']
validation=(
    'The unchanged original nonlinear parallel cap now extrudes and cold-replays through retained planar spatial curves. '
    'Whole source/frame/chart proofs admit edge images; Hypercurve supplies exact evaluation, inverse parameters and complete simple-loop winding. '
    'Eleven core acceptance groups cover independent values/derivatives, nonunit/reversed charts, conservative bounds, inverse queries, path/region extrusion, planar faces, holes/components, split edges, reflected nonuniform affine transforms, repeated same-profile slab cuts/restoration, near-boundary classification, forged interiors, metadata limits and typed failures/recovery. '
    f"BRep/IO release suites pass {counts['native-release']}/{counts['native-minimal']} tests with all/minimal features; new debug acceptance passes {counts['new-debug']}. "
    f"Affected Hypercurve tests pass {counts['curve-tests']} integration, {counts['curve-retained']} retained-boundary, {counts['curve-winding']} winding and {counts['curve-successors']} successor tests. "
    'Warnings-denied affected all-target Clippy/rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
    'External source-path native consumers pass; actual zero-import WASM passes 12+7+11+7+9+14+138=198 groups. '
    f'All 362 preceding artifacts remain byte-identical, including eight typed encoding diagnostics; {n} new native archives agree across two fresh processes. '
    'All 24 prism and 81 continuation outcomes remain. All seven original full profile recipes now complete native cold replay; the nonlinear cap volume remains explicitly unsupported. '
    'Earlier two-complete/two-unsupported path controls remain. Twenty prism OCCT observations were rerun; prior quintic observations apply only to identical bytes. '
    'A separate native pole review confirms that storing a source definition is not a finite-loop certificate: interior poles retain typed query and face-admission blockers across replay, followed by finite-source recovery.')
limits=(
    'This is finite planar lifting and procedural cap continuation, not complete general CAD. General selected spatial evaluation/domain views, unlike procedural-source equivalence/ordering, arbitrary surface intersections, general metrics, full source history and wider STEP representation remain open. '
    'Polynomial B-spline planar-source archives remain unsupported; existing builder NURBS promotion is retained. Local strict replay does not certify earlier approximate source intent. '
    'No operation-wide work, coefficient-growth, retained-heap or cancellation bound is added. Source-path consumers do not establish registry installation, MSRV or production bindings. '
    'Coverage/formal verification, runtime fuzz/ASan/lexicase campaigns, full pre-push qualification and all 28 work packages remain open/in-progress. No push. '
    'Production changes are confined to BRep; unrelated concurrent-thread breakage is untouched. Qualification is pinned to upstream 540074a8c and unchanged source.')
increment=dict(id='planar-curve-lift-2026-10-18',work_packages=['WP02','WP07','WP08','WP13'],
    properties=['P1','P2','P3','P4','P5','P6','P8','P9','P11','P12','P14','P15','P16','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
    change='Retain planar Curve2 sources in injective affine spatial frames and explicit unit charts; validate complete edge images and directed procedural loops; preserve native source graphs and polynomial definitions; admit the original nonlinear parallel cap through supported solid continuations.',
    evidence='evidence/'+OUT.name+'/manifest.json',validation=validation,cost_evidence=cost['summary'],limits=limits)
p=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=json.loads(p.read_text())
assert not any(item['id']==increment['id'] for item in status['increments'])
status['increments'].append(increment); status['updated_on']='2026-10-18'
status['next_actions'][0]=f'Use evidence/{OUT.name}/manifest.json as the current planar-lift and original nonlinear-cap baseline. Preserve 362 prior files, {n} new repeated archives, all 198 WASM groups and native consumers, 24 prism and 81 continuation outcomes, seven original full profile completions and all raw costs. Forty matched groups do not replace the historical 192-case optimization catalogue or discharge earlier adverse obligations.'
status['next_actions'][1]=f'Follow evidence/{OUT.name}/next-domains.md for selected spatial images, whole procedural equivalence/ordering and exact intersection/trim closure. Keep the admitted source/frame/chart proof and shared Hypercurve owner; do not substitute display chords or independent root coordinates. Missing metrics do not invalidate the exact cap. Maintain STEP typed failures and full plan/release/resource work.'
p.write_text(json.dumps(status,indent=2)+'\n')
spec=importlib.util.spec_from_file_location('ledger_spans',OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py')
spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
p=ROOT/'docs/properties-status.json';before=p.read_text();leaf=json.loads(before)['current_work']['hyperbrep']
leaf.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_implementation=increment['id'],qualification=validation+' '+cost['summary']+' '+limits)
after=spans.replace_brep(before,leaf);p.write_text(after)
(OUT/'ledger-update.json').write_text(json.dumps(dict(only='current_work.hyperbrep',before_sha256=hashlib.sha256(before.encode()).hexdigest(),after_sha256=hashlib.sha256(after.encode()).hexdigest(),other_bytes_preserved=after==spans.replace_brep(before,leaf)),indent=2)+'\n')
with (ROOT/'crates/hyperbrep/PERFORMANCE.md').open('a') as f:
    f.write('\n\n## Retained planar curves and nonlinear cap extrusion (2026-10-18)\n\n')
    f.write('The [admission record](docs/evidence/'+OUT.name+'/README.md) adds exact planar spatial images and the original full nonlinear parallel-cap extrusion, replay and supported solid continuation. This is a capability extension.\n\n')
    f.write(cost['summary']+'\n\n')
    f.write('All [cost rows](docs/evidence/'+OUT.name+'/costs.md) and [resource observations](docs/evidence/'+OUT.name+'/resource-review.json) are retained. Earlier selected-profile unequal-hole rejection and other adverse costs remain open; this is no general performance or bounded-resource claim.\n')
failed=[item for item in read('attempts.json') if item['exit_code']]
lines=['# Retained attempts','','Every attempt retains its exact log and source snapshot in [attempts.json](attempts.json). Failed candidates are not final-source passes.','','| Attempt | Exit | Log |','| --- | ---: | --- |']
for item in failed:lines.append(f"| {item['label']} / {item['attempt']} | {item['exit_code']} | [{item['log']}]({item['log']}) |")
lines+=['','The original full cap first fails with UnsupportedPlanarProfile. Initial carrier compile errors and test API spelling errors are retained. Construction then succeeded while cold replay failed SelfIntersectingWire: the top arch traverses 1 to 0, and ascending-domain endpoints were incorrect adjacency expectations. The owner whole-loop proof and directed endpoints fix that case. Further regressions exposed the missing extrusion inverse dispatch, authored-path bridge, and quadratic/cubic source archives. These were implemented without weakening the original geometry.','', 'The historical Round path harness still unwraps UnsupportedMeasurement and exits 101. Both such controls are retained as expected diagnostic failures, not successful ordinary library operations.','']
(OUT/'attempt-review.md').write_text('\n'.join(lines))
readme=f"""# Exact planar spatial curves and nonlinear cap extrusion

Baseline `7510a3603805364cf5409dd9efbcf0d7f4a0c201` on `brep` includes
upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9`. A checkpoint fetch found
no new upstream commits. This increment admits the original full nonlinear
parallel cap, including its three quadratic straight closing segments.

`Curve3::planar_image` retains the Curve2 source, an injective affine plane frame
and an explicit unit-to-source chart. Scalar evaluation, derivatives, bounds and
inverse queries reuse the planar owner. Reversal/subdivision retain the source;
nonuniform transforms change the frame. Whole edge-image agreement and complete
procedural-loop proofs precede prism topology admission. Native replay rebuilds
those proofs with no trusted flags, copied offset formulas or sampled geometry.
Quadratic/cubic native pcurve definitions are retained without family demotion.
Version 9 gains family tags; preceding encodable bytes are unchanged.

The [contract](contract.md) identifies ownership, input and missing acceptance
before production changes. [Proofs](proofs.md) give the exact source/frame/chart
witness and independently derived expectations. [Decisions](ideas.md) and
[next domains](next-domains.md) retain alternatives and remaining work.

## Qualification

{validation}

[Qualification](qualification-summary.json), [attempts](attempts.json),
[consumer identities](consumers.json), [preserved artifacts](artifact-preservation.json)
and [original profile outcomes](original-profiles.json) bind results to fixed
source. The eleven native groups plus the STEP failure control execute in a
real zero-import WASM module. These are source-path consumers, not installed
packages or production language bindings. Failed candidates and original hard
controls remain in the [attempt review](attempt-review.md). The additional
[pole review](pole-review.json) records its own native source and typed outcomes.

## Cost and remaining gates

{cost['summary']}

[Costs](costs.md) include full assertions, native replay and supported output
materialization. [Resource records](resource-review.json) retain every slower
row, allocation request increase, RSS, executable size and finite archive
observation. External timeouts contain checks without establishing internal
bounds. Earlier adverse observations remain open.

{limits}

[Source reconstruction](source-reconstruction.json) retains every checked epoch,
including failures. The [manifest](manifest.json) binds source, evidence and
public documents; the [audit](final-audit.json) checks raw arithmetic, artifacts,
ledger ownership and protected stashes. Raw Cargo log whitespace is preserved
and reported separately in [staged checks](staged-whitespace.json); non-log
staged files must pass. No full pre-push or goal-completion claim is made.
"""
(OUT/'README.md').write_text(readme)
assert hashes()==source
print(validation+'\n'+cost['summary'])
