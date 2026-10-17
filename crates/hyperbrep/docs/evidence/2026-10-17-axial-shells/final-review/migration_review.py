"""Bind each reviewed representation change to independent consumer evidence."""
import hashlib,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes
read=lambda n:json.loads((OUT/n).read_text())
c=read('cost-summary.json');a=read('artifact-comparison.json');detail=read('artifact-review.json');q=read('qualification-summary.json')
source=hashes();assert source==c['source']==q['source']
expected={'prisms/same_height','prisms/covering_cylinders','prisms/covering_bores','prisms/annular_cut','prism_exchange/half_cylinder','prism_exchange/annular_prism'}
receipt_rows=[]
for r in c['migrations']:
 assert r['corpus'] in ['prisms','prism_exchange'] and r['case'] in expected,r
 before,after=r['baseline'],r['candidate'];assert set(before)==set(after)
 changed=[k for k in before if before[k]!=after[k]];assert changed==['receipt'],(r,changed)
 assert before['outcome']==after['outcome']=='certified'
 reason=('The complete prism harness hashes its materialized native archives.' if r['corpus']=='prisms' else 'The complete exchange harness hashes two materialized STEP files, under identity and reflected scale. The supplemental capture reproduces both measured receipts exactly, retaining the original complete assertions. These STEP outputs are additional to the preceding standalone consumer artifact inventory.')
 receipt_rows.append(dict(corpus=r['corpus'],case=r['case'],changed_fields=changed,before=before,after=after,reason=reason+' The constructor now publishes exact plane/cylinder side carriers, with mapped pcurves/orientation. Independent exact measures, material samples, replay and continued Booleans remain asserted.'))
assert {r['case'] for r in receipt_rows}==expected
paths=[r['path'] for r in a['rows'] if not r['unchanged']]
assert paths==[r['path'] for r in detail['rows']] and len(paths)==16
assert detail['carrier_transitions']==dict(Plane=57,Cylinder=36) and detail['unchanged_step_files']==67
capture=read('step-receipt-capture.json');equivalence=read('step-receipt-equivalence.json')
assert capture['source']==equivalence['source']==source
assert len(capture['rows'])==2 and len(equivalence['rows'])==4 and len(equivalence['readers'])==8
assert sum(len(r['changed_entities']) for r in equivalence['rows'])==7
assert all(r['valid'] and r['solids']==1 for r in equivalence['readers'])
result=dict(source=source,all_changes_reviewed=True,artifact_paths=paths,receipt_cases=[[r['corpus'],r['case']] for r in c['migrations']],artifact_review='artifact-review.json',step_receipt_review='step-receipt-equivalence.json',receipt_review=receipt_rows,authority='Complete native carrier equations and chart/orientation maps; original full-size independently derived expectations, cold native/STEP consumption, malformed controls and exact boundary records. Checksums and same-kernel round trips alone are not semantic equality proofs.',migration='Greenfield native surface representation and Boolean error-variant change. No compatibility shim or tolerance conversion. All 67 preceding standalone consumer STEP files happen to remain byte-identical; sixteen native archives deliberately change. The additional benchmark STEP capture identifies two unchanged identity exports and two equivalent reflected carrier-placement migrations.',recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(OUT/'migration-review.json').write_text(json.dumps(result,indent=2)+'\n')
lines=['# Native carrier and API migration','',result['migration'],'',
'Every changed preceding standalone consumer artifact is listed below. All 187 artifacts are retained: 171 are byte-identical and sixteen native archives migrate. The 104 unchanged native archives include the original cone/reconstruction/growth continuations. The 67 STEP files in that inventory are unchanged; additional exchange-benchmark STEP outputs are reviewed separately below.','',
'The sixteen changed archives replace 57 exact line extrusions with planes and 36 exact circle extrusions with cylinders. Entity counts, vertices, spatial curves, edge uses, edges, wires, shells, solids and selections are unchanged. Circular holes additionally transform pcurves and flip face orientation to retain the same material side. [Field-level inventory](artifact-review.json) records every affected surface and face.','',
'For a line profile, the plane is the complete affine extrusion equation. For a circle, the new angular coordinate is its exact signed source parameter plus phase; axial coordinate and orientation use the exact frame sign. These are complete native maps, not fitted endpoint replacements. Cold admission and the independent native/STEP formulas, material samples, incidence and continuation tests verify the supported consumers. The original shear case remains supported by exact finite extrusion promotion before affine transport.','',
'`BooleanError::CoincidentOwnershipAmbiguous` replaces `CoplanarOwnershipAmbiguous`, since the same material-side rule now covers cylinders. No old-name alias is introduced. Saved geometry contains the existing Plane/Cylinder variants; no serialized admission flag is added.','',
'| Changed native archive | Old bytes | New bytes |','| --- | ---: | ---: |']
for r in a['rows']:
 if not r['unchanged']:lines.append(f"| `{r['path']}` | {r['baseline_bytes']} | {r['candidate_bytes']} |")
lines+=['','## Cost receipt changes','',
'Four prism archive-hash receipts and two exchange STEP-text receipts change. Case names, original iterations, certified outcomes and the complete workload assertions remain. Every revision produces the same receipt in all three fresh processes. This is an intentional representation migration, not a performance-only preservation claim. The [supplemental STEP capture](step-receipt-capture.json) reproduces the exchange receipts and retains both revisions of each hashed file, outside the timing campaign.','',
'| Case | Old receipt | New receipt |','| --- | ---: | ---: |']
for r in receipt_rows:lines.append(f"| `{r['case']}` | {r['before']['receipt']} | {r['after']['receipt']} |")
lines+=['','The four exchange exports are captured for both revisions. The identity half-cylinder and annulus are byte-identical. The reflected half-cylinder changes two cylinder axis directions and moves one plane origin within that exact plane. The reflected annulus changes four cylinder axis directions. Reversing a cylinder axis with unchanged reference X, origin and radius gives the complete chart map `(u,v) -> (-u,-v)`, preserving its set and radial normal. The plane displacement has exactly zero rational dot product with its unchanged normal. All spatial curves, vertices, topology, face orientations and every other file byte remain unchanged. The [complete entity review](step-receipt-equivalence.json) checks these facts, and all eight files additionally read as valid single solids with the independent expected measures in OCCT. This finite artifact review is not a general STEP equivalence algorithm.','',
'All costs, including slower rows and increased allocation requests, remain in [costs.md](costs.md). One original exact thin-layer file has a separately retained [OCCT import limitation](occt-thin-comparison.json); no native geometry or fixture is changed to match the reader. All eight new rotated/reflected exports are valid in that reader.','']
(OUT/'migration-review.md').write_text('\n'.join(lines));print('Reviewed all artifact and receipt migrations.',flush=True)
