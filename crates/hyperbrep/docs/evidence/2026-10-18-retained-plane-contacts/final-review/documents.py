"""Reconcile measured finite admission into BRep-owned documentation and ledger leaf."""
import hashlib, importlib.util, json
from pathlib import Path
import sys
OUT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import ROOT, hashes
read=lambda name:json.loads((OUT/name).read_text())
source=hashes();q=read('qualification-summary.json');cost=read('resource-review.json');artifacts=read('artifact-preservation.json')
assert q['source']==cost['source']==artifacts['source']==read('step-review.json')['source']==source
counts=q['test_counts'];consumers=read('consumers.json');groups=sum(consumers['groups'].values())
validation=(
 'Finite curve/plane contacts retain exact Parameter and GeometricPoint3 values, first-derivative contact kind and normalized mixed point/range components. '
 'Positive-weight higher-degree Bezier/NURBS equations reuse owner root authority; planar images reuse owner finite bounds, intersections and chart transport on the consumed interval. '
 'Fourteen shared BRep groups cover complete roots, unequal weights, repeated roots, shared spline joints, ambiguous one-sided endpoint blockers and recovery, coincidence ranges, distinct visits to one point, reversal, nonunit charts, pole-containing sources and finite restrictions, affine reflection, 1e-12/1e-1000 gaps, policy reuse, zero-work exhaustion and recovery. '
 'Certified containment can materialize a planar pcurve when the source-to-plane chart is an owner-certified similarity; reversed/restricted source charts and nonunit spatial mapping retain exact correspondence. '
 'Actual contact parameters feed shared edge splits, cold replay, repeated slab cuts, reunion, two-sided set identities and empty recovery. '
 'Three owner integration regressions cover selected/nonunit span transport and retained source restriction; private regressions enforce independent planes for axis clearance and exact reuse of an observed represented boundary parameter, and reversed retained pcurve projection on a nonunit spatial interval. '
 f"Affected BRep/IO release suites pass {counts['native-release']}/{counts['native-minimal']} tests with all/minimal features and {counts['new-debug']} new debug groups. "
 f"Hypercurve passes {counts['curve-tests']} integration, {counts['curve-retained']} retained-boundary, {counts['curve-winding']} winding, {counts['curve-successors']} successor and {counts['curve-subdivision']} subdivision tests, plus five retained linear/policy compatibility tests. "
 'Warnings-denied affected all-target Clippy and rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
 f"Source-path native consumers and {groups} real zero-import WASM groups pass. All {artifacts['preserved_files']} prior artifacts remain byte-identical; {artifacts['new_files']} new native archives agree across two fresh processes. "
 'The 24 prism and 81 continuation outcomes, seven original full profile completions and original two-complete/two-unsupported path controls remain. '
 'Twenty original prism OCCT reader observations were rerun. A native STEP consumer verifies four typed body/entity-attributed selected cube/cap encoding failures before/after replay, native recovery, and a successful represented cube control. No new STEP capability is claimed.')
limits=(
 'Finite contact and supported continuation admission, not complete general CAD. Selected carrier chart endpoints, broader selected surface images, arbitrary procedural equivalence/intersections, general metrics and STEP encodings remain open. '
 'Simple/Repeated classify first derivatives, not integer multiplicity or global crossing; Boundary identifies clipping of coincident support. Coefficient-only consumers preserve typed failures when selected scalar views are unavailable. '
 'No full source history, inherited-intent promotion, operation-wide work, retained-heap, coefficient-growth or cancellation bound is added. '
 'Source-path native/WASM consumers do not establish installed distribution, MSRV, production language bindings, formal proof, coverage targets or runtime fuzz/ASan/lexicase campaigns. '
 'All 28 work packages and full pre-push qualification remain open/in-progress; no push. Production changes are confined to BRep and the Hypercurve chart/restriction APIs it consumes. Unrelated concurrent-thread work is untouched. '
 'Qualification stays pinned to upstream 540074a8c and unchanged source.')
readable_validation = validation
for sentence in ['Actual contact parameters feed', 'Affected BRep/IO release suites pass', 'Twenty original prism OCCT reader observations']:
 readable_validation = readable_validation.replace(' '+sentence, '\n\n'+sentence)
readable_limits = limits
for sentence in ['No full source history', 'All 28 work packages']:
 readable_limits = readable_limits.replace(' '+sentence, '\n\n'+sentence)
inc=dict(id='retained-plane-contacts-2026-10-18',work_packages=['WP02','WP05b','WP06','WP08'],
 properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P14','P15','P16','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
 change='Retain complete finite curve/plane contacts, selected original-source points and mixed overlap components; consume exact owner charts and actual source ranges through split/replay/solid continuation.',
 evidence='evidence/'+OUT.name+'/manifest.json',validation=validation,cost_evidence=cost['summary'],limits=limits)
p=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=json.loads(p.read_text());assert not any(x['id']==inc['id'] for x in status['increments']);status['increments'].append(inc);status['updated_on']='2026-10-18'
status['next_actions'][0]=f"Use evidence/{OUT.name}/manifest.json as the current finite plane-contact baseline. Preserve {artifacts['preserved_files']} prior artifacts and {artifacts['new_files']} new repeated archives, all {groups} WASM groups, 24 prism/81 continuation outcomes, seven original profile completions, and every adverse cost row. Two former unsupported controls are explicitly migrated and excluded from matched ratios."
status['next_actions'][1]=f'Follow evidence/{OUT.name}/next-domains.md for selected procedural-profile chart/axial-edge/surface fields, general selected surface-result carriers, complete intersections and release/resource gates. Keep root, chart and restriction authority in Hypercurve/Hypersolve; spatial frames and topology in BRep; STEP boundaries in IO.'
p.write_text(json.dumps(status,indent=2)+'\n')
spec=importlib.util.spec_from_file_location('ledger_spans',OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py');spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
p=ROOT/'docs/properties-status.json';before=p.read_text();leaf=json.loads(before)['current_work']['hyperbrep'];leaf.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_implementation=inc['id'],qualification=validation+' '+cost['summary']+' '+limits);after=spans.replace_brep(before,leaf);p.write_text(after)
(OUT/'ledger-update.json').write_text(json.dumps(dict(only='current_work.hyperbrep',before_sha256=hashlib.sha256(before.encode()).hexdigest(),after_sha256=hashlib.sha256(after.encode()).hexdigest(),other_bytes_preserved=after==spans.replace_brep(before,leaf)),indent=2)+'\n')
with (ROOT/'crates/hyperbrep/PERFORMANCE.md').open('a') as f:
 f.write('\n\n## Retained finite curve/plane contacts (2026-10-18)\n\nThe [admission](docs/evidence/'+OUT.name+'/README.md) extends exact contacts, source-bound parameter/point queries and supported split/replay/solid continuation. It is a capability extension and public API migration.\n\n'+cost['summary']+'\n\n[All raw costs](docs/evidence/'+OUT.name+'/consumer-costs.json), [absolute new costs](docs/evidence/'+OUT.name+'/new-costs.json) and [resource observations](docs/evidence/'+OUT.name+'/resource-review.json) retain adverse results. The two migrated groups have no matched ratios; earlier adverse obligations remain.\n')
failed=[x for x in read('attempts.json') if x['exit_code']]
lines=['# Retained attempts','','All commands, logs and source identities are retained in [attempts.json](attempts.json). Earlier failures are not final-source passes.','','| Attempt | Exit | Log |','| --- | ---: | --- |']
for x in failed:lines.append(f"| {x['label']} / {x['attempt']} | {x['exit_code']} | [{x['log']}]({x['log']}) |")
lines+=['','Three baseline probes require exact cubic, nonunit NURBS and nonlinear parallel plane contacts; all fail UnsupportedIntersection. Compiler/API migration failures remain recorded. Axis-clearance migration first reused the same plane twice; the independent quadratic/selected regressions caught this and the second normal was corrected. Finite subcurve regressions caught queries against an irrelevant source pole; Hypercurve now owns the generated restriction and BRep queries the actual consumed range. A coefficient-only boundary mapper initially rejected an already supplied exact scalar view; exact root equality now permits only the proved value.','', 'The first full release suites reproduced two obsolete UnsupportedIntersection expectations: high-degree noncontainment and planar-image containment. The retained full fixtures now require exact answers. Both cohorts are capability migrations and receive no matched time ratio. The strengthened containment consumer then exposed missing planar pcurve materialization. A shared BRep conversion now delegates exact similarity/restriction to Hypercurve and preserves the signed source chart; independently derived shifted/rotated plane coordinates and a nonunit reversed mapping verify it. Uncertified similarities retain the owner construction error. No geometry, policy or required success was weakened. The first failed final-stage/qualification records remain separately preserved. A later independent discontinuous-spline probe exposed a closed overlap with an ambiguous endpoint; transported closed endpoints now undergo exact image and plane checks before publication, with the regression and successful interior/subcurve recovery retained. That consumer stage also revealed an incorrect STEP oracle: the selected cube reports UnmaterializedPoint, while the cap fixture reports NonRational. The test now preserves those exact distinct existing IO diagnostics. Its failed source epoch and frozen binaries remain recorded; final binaries use a new prefix.','', 'The historical Round path harness still unwraps UnsupportedMeasurement and exits 101. Those controls remain expected diagnostics, not successful ordinary library operations.','']
(OUT/'attempt-review.md').write_text('\n'.join(lines))
text=f'''# Retained finite curve/plane contacts

Baseline `f88e9882b87a9c969237c5d54388d888a9c99f32` on `brep`, with upstream
`540074a8c05ccc676d7c70b8f0093f98804b81d9`. A fresh baseline fetch found no
new upstream commits. This increment extends complete finite contacts and
preserves exact source/parameter evidence through supported topology consumers.

Hypercurve owns planar root/derivative/contact authority, chart-preserving
source restriction and span-parameter transport. HyperBRep owns homogeneous
plane equations, spatial frames, source-chart mapping and complete contact
assembly. The public API now exposes `Parameter`, `GeometricPoint3`,
`CurveSurfaceContactKind` and mixed `CurveSurfaceComponents`. Closed overlap
ranges own their endpoints; distinct visits to one point retain their parameters.
There is no compatibility shim or saved-model format change.

The [contract](contract.md), [proof witnesses](proofs.md), [decisions](ideas.md)
and [next domains](next-domains.md) distinguish this finite extension from the
full development plan. Two existing unsupported controls deliberately become
required exact answers; their raw performance samples remain separately marked.

## Qualification

{readable_validation}

[Qualification](qualification-summary.json), [consumer identities](consumers.json),
[preserved artifacts](artifact-preservation.json), [original profile outcomes](original-profiles.json), [selected STEP boundary](step-review.json)
and [attempts](attempts.json) bind these observations to fixed source. Every
failed candidate and historical control remains in the [attempt review](attempt-review.md).

## Cost and remaining work

{cost['summary']}

[All cost rows](costs.md) include exact assertions, replay and materialization.
[Resource records](resource-review.json) retain every slower row, allocation
increase, RSS, executable size and finite archive observation. External timeouts
contain the checks without establishing internal bounds.

{readable_limits}

[Source reconstruction](source-reconstruction.json) preserves every checked epoch.
The [manifest](manifest.json) binds source, records and documentation; the
[final audit](final-audit.json) checks them against raw evidence and ownership.
No full pre-push or goal-completion claim is made.
'''
(OUT/'README.md').write_text(text)
assert hashes()==source
print(json.dumps(dict(test_counts=counts,wasm_groups=groups,cost=cost['summary']),indent=2))
