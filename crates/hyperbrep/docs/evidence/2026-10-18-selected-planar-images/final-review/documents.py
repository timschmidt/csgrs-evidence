"""Reconcile only measured finite admission into BRep-owned documentation."""
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
 'Selected planar spatial points now retain their original planar point, root and frame for exact affine-form comparison, conservative bounds, nonuniform transforms and native replay. '
 'Whole source/frame/chart proofs admit selected edge trims without independent scalar endpoints. Selected parallel-cap splits cold-replay and continue through repeated slab cuts, reunion, two-sided set identities and empty recovery. '
 'Eight shared BRep groups and six shared Hypercurve groups cover polynomial root equations, opposite normal sheets, symbolic coefficients, strict/approximate/strict scopes, 1e-1000/1e-12 distinctions, typed pole failures, malformed sources, work exhaustion and recovery. '
 'Additional native controls retain interior cusp splits, domain-scoped injectivity and source lifetime without cycles. '
 f"Affected BRep/IO release suites pass {counts['native-release']}/{counts['native-minimal']} tests with all/minimal features and {counts['new-debug']} new debug groups. "
 f"Hypercurve passes {counts['curve-tests']} integration, {counts['curve-retained']} retained-boundary, {counts['curve-winding']} winding and {counts['curve-successors']} successor tests, plus five retained linear/policy compatibility tests. "
 'Warnings-denied affected all-target Clippy and rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
 f"Source-path native consumers and {groups} real zero-import WASM groups pass. All {artifacts['preserved_files']} prior artifacts remain byte-identical; {artifacts['new_files']} new native archives agree across two fresh processes. "
 'The 24 prism and 81 continuation outcomes, seven original full profile completions and original two-complete/two-unsupported path controls remain. '
 'Twenty prism OCCT reader observations were rerun; earlier observations apply only to identical preserved bytes. A supplemental native STEP consumer verifies typed, attributed encoding failure before/after selected-solid replay and subsequent native recovery. No new STEP capability is claimed.')
limits=(
 'Finite selected planar-point and split continuation, not complete general CAD. Selected carrier chart endpoints, arbitrary procedural source equivalence/intersections, broader selected surface images, metrics and STEP encodings remain open. '
 'No full source history, inherited-intent promotion, operation-wide work, retained-heap, coefficient-growth or cancellation bound is added. '
 'Source-path native/WASM consumers do not establish installed distribution, MSRV, production language bindings, formal proof, coverage targets or runtime fuzz/ASan/lexicase campaigns. '
 'All 28 work packages and full pre-push qualification remain open/in-progress; no push. Production changes are confined to BRep and the Hypercurve predicates/injectivity it consumes. Unrelated concurrent-thread work is untouched. '
 'Qualification stays pinned to upstream 540074a8c and unchanged source.')
inc=dict(id='selected-planar-images-2026-10-18',work_packages=['WP02','WP07','WP08','WP13'],
 properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P14','P15','P16','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
 change='Retain selected planar spatial images and owner affine forms; prove full selected trim images and exact prism continuation; keep domain-scoped parallel reassembly and native source replay.',
 evidence='evidence/'+OUT.name+'/manifest.json',validation=validation,cost_evidence=cost['summary'],limits=limits)
p=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=json.loads(p.read_text());assert not any(x['id']==inc['id'] for x in status['increments']);status['increments'].append(inc);status['updated_on']='2026-10-18'
status['next_actions'][0]=f"Use evidence/{OUT.name}/manifest.json as the current selected-planar baseline. Preserve {artifacts['preserved_files']} prior artifacts and {artifacts['new_files']} new repeated archives, all {groups} WASM groups, 24 prism/81 continuation outcomes, seven original profile completions, and every adverse cost row. One former selected-evaluation failure is explicitly migrated and excluded from matched ratios."
status['next_actions'][1]=f'Follow evidence/{OUT.name}/next-domains.md for selected carrier chart endpoints, broader procedural equivalence/intersection/trim closure and release/resource gates. Keep affine predicates and injectivity proofs in Hypercurve, spatial frames/topology in BRep, and STEP boundaries in IO. Preserve every full-size prior workflow.'
p.write_text(json.dumps(status,indent=2)+'\n')
spec=importlib.util.spec_from_file_location('ledger_spans',OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py');spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
p=ROOT/'docs/properties-status.json';before=p.read_text();leaf=json.loads(before)['current_work']['hyperbrep'];leaf.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_implementation=inc['id'],qualification=validation+' '+cost['summary']+' '+limits);after=spans.replace_brep(before,leaf);p.write_text(after)
(OUT/'ledger-update.json').write_text(json.dumps(dict(only='current_work.hyperbrep',before_sha256=hashlib.sha256(before.encode()).hexdigest(),after_sha256=hashlib.sha256(after.encode()).hexdigest(),other_bytes_preserved=after==spans.replace_brep(before,leaf)),indent=2)+'\n')
with (ROOT/'crates/hyperbrep/PERFORMANCE.md').open('a') as f:
 f.write('\n\n## Selected planar spatial images (2026-10-18)\n\nThe [admission](docs/evidence/'+OUT.name+'/README.md) extends exact selected point queries, trim replay and supported solid continuation. It is a capability extension.\n\n'+cost['summary']+'\n\n[All raw costs](docs/evidence/'+OUT.name+'/consumer-costs.json), [absolute new costs](docs/evidence/'+OUT.name+'/new-costs.json) and [resource observations](docs/evidence/'+OUT.name+'/resource-review.json) retain adverse results. The migrated mixed control has no matched ratio; earlier adverse obligations remain.\n')
failed=[x for x in read('attempts.json') if x['exit_code']]
lines=['# Retained attempts','','All commands, logs and source identities are retained in [attempts.json](attempts.json). Earlier failures are not final-source passes.','','| Attempt | Exit | Log |','| --- | ---: | --- |']
for x in failed:lines.append(f"| {x['label']} / {x['attempt']} | {x['exit_code']} | [{x['log']}]({x['log']}) |")
lines+=['','The baseline required selected evaluation and failed UnsupportedSelectedEvaluation. Point evaluation then passed while cold selected trim replay required scalar endpoints. The complete definition proof removes that demand. Continued slab Booleans next exposed scalar-only prism queries and selected pieces needing a certified reassembled proof image. Both were extended with exact owner evidence. An interior cusp regression required keeping original pieces when the joined range has invalid topology. Test API spelling mistakes and all failed candidates remain.','', 'The first final driver stopped at preservation because three retained component-consumer inputs were omitted from this bundle. The failure was reproduced and logged. Their exact preceding committed bytes were restored; production source and already-qualified test inputs stayed unchanged. [Restoration hashes](harness-input-restoration.json) and the [initial stage record](final-stages-initial.json) remain. final-review/resume.py ran the remaining checks after confirming every completed check used the same source.','', 'The historical Round path harness still unwraps UnsupportedMeasurement and exits 101. Those controls remain expected diagnostics, not successful ordinary library operations.','']
(OUT/'attempt-review.md').write_text('\n'.join(lines))
text=f'''# Selected planar spatial images and continued topology

Baseline `9b571e056aa87aa2c3fad6000c6fed282d4d511f` on `brep`, with upstream
`540074a8c05ccc676d7c70b8f0093f98804b81d9`. A fresh checkpoint fetch found no
new upstream commits. This increment extends selected point evaluation,
selected edge trims and their supported continued solid operations.

Hypercurve owns source-bound `CurvePointAffineForm2` and the correlated
selected-root/normal-sheet predicates. HyperBRep retains planar point evidence
with its spatial frame and original chart. Cold replay proves full edge images
and exact endpoint correspondence. Adjacent procedural pieces share a simpler
proof image only with matching source, direction, adjacency and injectivity;
original topology remains. Complete prism certificates supply product-set
semantics without independent selected vertex coordinates.

The [contract](contract.md), [proof witnesses](proofs.md), [decisions](ideas.md)
and [next domains](next-domains.md) distinguish this finite extension from the
full development plan. There is no format version change or compatibility shim.
The former selected-evaluation control deliberately becomes required exact
success; its prior full fixture is saved in diagnostic-inputs and its runtime
comparison is excluded from same-contract ratios.

## Qualification

{validation}

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

{limits}

[Source reconstruction](source-reconstruction.json) preserves checked epochs.
The [manifest](manifest.json) binds source, records and documentation; the
[final audit](final-audit.json) checks them against raw evidence and ownership.
No full pre-push or goal-completion claim is made.
'''
(OUT/'README.md').write_text(text)
assert hashes()==source
print(json.dumps(dict(test_counts=counts,wasm_groups=groups,validation=validation,cost=cost['summary']),indent=2))
