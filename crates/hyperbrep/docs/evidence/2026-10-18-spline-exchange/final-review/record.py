"""Record the exact spline feature only after source-bound admission and cost review."""
import hashlib, importlib.util, json, subprocess, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
read=lambda n:json.loads((OUT/n).read_text())
write=lambda p,x:p.write_text(json.dumps(x,indent=2)+'\n')
source=hashes(); q=read('qualification-summary.json'); c=read('cost-summary.json'); r=read('resource-summary.json'); review=read('resource-decision.json')
assert all(x['source']==source for x in [q,c,r,review,read('new-consumers.json'),read('new-cost-summary.json'),read('prior-native-cost-summary.json'),read('spline-artifacts.json')])
assert review['decision']=='kept' and c['receipt_preserved'] and not c['migrations']
assert read('prior-image-artifacts.json')['unchanged']==8
assert len(read('spline-artifacts.json')['artifacts'])==58
reader=read('spline-occt.json')['rows']
assert len(reader)==28 and all(x['valid'] and x['volume_agrees'] and x['observed_solids']==x['solids'] for x in reader)
b=read('baseline.json'); assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()==b['baseline']
validation=(
 'Exact rational Bezier/positive clamped NURBS edges and spline linear extrusions now complete STEP export, '
 'independent parse/import, native validation, cold replay and repeated slab cuts/restoration. The original '
 'mixed parabola/retained chord keeps all eight reversal/component/affine variants, exact area 32/3, volume '
 '32 at height 3, holes, disconnected components and 1/10^12 classification probes. Independently authored '
 'parabolic STEP fixtures retain nonunit source charts, nonunit vector magnitude, rational weights, interior '
 'knots, reversed traversal, interior trims and metre/mm units. Alternate pcurves, full-image negatives, '
 'ambiguous preimages, malformed records, exact encoding failures and small explicit budgets are checked. '
 'Native curve and both NURBS surface axes reject excess endpoint knot multiplicity through one shared validator; STEP retains the precise native cause. '
 f"Native/IO release suites pass {q['tests']['native-release']['passed']} all-feature and {q['tests']['native-minimal']['passed']} minimal tests; "
 '93 focused curve release tests and 58 focused debug tests pass. Affected all-target warning-denied '
 'Clippy, rustdoc, nine STEP examples, external consumers, fuzz-target compilation and formatting pass. '
 'Actual WASM completes the previous 138 and 14 groups plus nine new shared spline groups, with zero '
 'imports. All 211 previous native/STEP artifacts and eight preceding profile artifacts remain byte-identical. '
 'Fifty-eight new native/STEP artifacts agree across two fresh processes. OCCT independently reads all '
 '28 new STEP cases with expected solid counts, Gauss-Kronrod numerical volumes and valid shapes; '
 'earlier root-selection and Gauss integration discrepancies are retained with their exact recipes. The original 24 prism '
 'outcomes, 81 continuation diagnostics and seven retained-profile recipes remain unchanged (two native '
 'successes, five typed unsupported outcomes). The original Bezier writer rejection fixture is retained '
 'as a stronger positive chart/entity/full-solid exchange regression; unsupported circle/ellipse extrusion '
 'controls still reject.')
cost=(f"All 192 original receipts remain across 22 full corpora and 132 fresh processes. Median case ratio {r['timing_ratio_median']:.6f}; "
 f"range {r['timing_ratio_range'][0]:.6f}–{r['timing_ratio_range'][1]:.6f}. "
 f"{len(r['adverse_timing_rows'])} timing rows exceed the 10% review marker; {len(r['increased_allocation_rows'])} rows increase allocation requests. "
 'The preceding six native workflow groups have three further alternating paired processes. Nine new '
 'full acceptance groups have separate absolute observations from three fresh processes; former '
 'unsupported work is never a speedup baseline. All raw unfavorable observations remain. '+review['summary'])
limits=(
 'This is a finite source-path domain, not general spline solids or full STEP/AP conformance. Native spline '
 'inspection and point location do not certify a whole edge; body publication still requires native '
 'whole-image/topology validation. The complete continued-modeling corpus uses global-z products; oblique '
 'native point-location tests do not establish general oblique solid exchange/Boolean closure. Ambiguous '
 'or unrepresented vertex preimages, arbitrary wall pcurves, other spline surfaces, selected-root '
 'serialization, non-finite-decimal encodings and general source-history exchange remain open. STEP '
 'hints do not certify untrimmed carrier simplicity or upgrade inherited source qualification. Four '
 'original selected parabola profiles and the nonlinear parallel cap remain unsupported. Operation-wide '
 'work/heap/cancellation bounds, coverage/formal/fuzz/ASan/lexicase campaigns, registry/MSRV/binding '
 'delivery and all 28 work packages remain open or in progress. Prior numerical-reader and cost '
 'limitations remain recorded. Cargo membership and source-path WASM are not shipped-user qualification. '
 'No push or complete pre-push claim. Supporting-crate changes belong in their owning layer; unrelated '
 'upstream breakage remains with the concurrent thread.')
write(OUT/'retention-decision.json',dict(decision='kept',source=source,validation=validation,cost_evidence=cost,limits=limits,preserved_artifacts=211,preserved_cases=192,reason='Complete the original exact profile through interchange and continued modeling while preserving the prior supported corpus.'))
write(OUT/'idea-ledger.json',[
 dict(idea='Native borrowed spline coefficients and shared plane/extrusion chart queries',decision='kept',evidence='review.md',result='Keep geometry proof in HyperBRep and parameter-space geometry in Hypercurve; IO does not fit or duplicate the kernel.'),
 dict(idea='Exact STEP spline and linear-extrusion entities with source chart maps',decision='kept',evidence='spline-artifacts.json',result='Retain knots, weights, trims and units through complete edited workflows and independent authored imports.'),
 dict(idea='Finite trimmed extrusion boundary enclosure in native solid separation',decision='kept',evidence='spline-build-3.log',result='The reproduced imported-component cut failure is resolved by the shared affine-along-V enclosure proof; strict separation remains required.'),
 dict(idea='Reject excess endpoint knot runs in the common native validator',decision='kept',evidence='endpoint-native-reproduction-1.log',result='The native constructor formerly accepted an invalid endpoint run; the STEP fixture already failed later at incidence. Curves, both surface axes and IO now share the precise early invariant.'),
 dict(idea='Use adaptive Gauss-Kronrod for the optional OCCT numerical volume check',decision='kept',evidence='research.md',result='All 28 identical STEP files meet the unchanged numerical threshold. Default/adaptive Gauss discrepancies and original recipes remain recorded; numerical estimators never replace native exact proofs.'),
 dict(idea='Use matching endpoints or STEP hints as whole-image evidence',decision='rejected',evidence='review.md',result='Bowed interior, ambiguous preimage and wrong alternate-pcurve controls reject before body publication.'),
 dict(idea='Expand arbitrary knot multiplicities before validating counts',decision='rejected',evidence='contract.md',result='Check degree/control count, overflow and cumulative explicit knot budget before expansion.'),
 dict(idea='Use prior UnsupportedCurve timing as the new exchange speedup baseline',decision='architecture-inapplicable',evidence='baseline-step.log',result='Successful interchange performs more work; new complete groups have absolute costs and original successful groups retain matched comparisons.')])
relative='evidence/'+OUT.name; location=str(OUT.relative_to(ROOT)); identity='spline-exchange-2026-10-18'
p=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'; status=json.loads(p.read_text())
assert all(x['id']!=identity for x in status['increments'])
status['updated_on']='2026-10-18'
status['increments'].append(dict(id=identity,work_packages=['WP00','WP02','WP03','WP08','WP14a','WP14b','WP21'],properties=['P1','P6','P8','P9','P11','P16','P17','P18','P19','P20','P24','P25','P26','P27','P30','P35','P36','P37','P39'],change='Exact spline STEP exchange, native chart/image admission, independent import and repeated cuts/restoration.',source='../src/geometry/spline.rs',evidence=relative+'/manifest.json',validation=validation,cost_evidence=cost,limits=limits))
for wp in status['work_packages']:
 if wp['id']=='WP14b': wp['status']='in-progress'
status['next_actions'][0]=('Use '+relative+'/manifest.json as the current exact spline feature and preserved-cost baseline. Preserve all 211 previous artifacts, eight prior profiles, 58 new deterministic artifacts, 192 original cost receipts, six previous native cost groups, 24 prism outcomes, 81 continuation diagnostics and actual WASM groups 138/14/9. Retain every original failure and adverse resource observation.')
status['next_actions'][1]=('The original mixed parabola/retained-chord profile now completes exact STEP export/import, native replay, holes/components/affine variants and repeated cuts/restoration. Independent authored weights, knots, trims, nonunit charts and units have exact acceptance. Preserve four remaining selected parabola Boolean/affine profiles and the nonlinear parallel cap. Follow '+relative+'/next-step-domain.md: retained spatial carrier admission precedes the independent missing selected-parameter integral. Extend these shared proofs in their owners without sampling roots or changing selected-field caches. Arbitrary spline surfaces/pcurves, full source-history exchange and release delivery remain separate open work.')
write(p,status)
p=ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'; text=p.read_text(); start=text.index('The [retained-region diagnostic]'); end=text.index('\nThe retained diagonal STEP case',start)
text=text[:start]+'''The [retained-region diagnostic](evidence/2026-10-17-retained-region-extrusion/README.md)
preserves the seven original profile recipes. The
[native image increment](evidence/2026-10-18-native-boundary-images/README.md)
resolved retained-chord construction, replay and common-profile continuation.
The [exact spline exchange increment](evidence/2026-10-18-spline-exchange/README.md)
now completes the original mixed profile through STEP, including holes,
disconnected components, reversed and affine profiles and repeated cuts/restoration.
HyperBRep owns native spline inspection, plane projection, extrusion point location
and whole-image admission; IO owns exact entities, units, source charts and limits.
Independent authored records cover weights, interior knots/trims, nonunit charts
and metre/mm units. Native geometry replay does not preserve the complete authoring
graph, and STEP source hints cannot certify untrimmed carrier simplicity.
Preserve all five unsupported original profile recipes and exact negative controls.
General selected-parameter integration, nonlinear parallel extrusion, spline
surfaces, arbitrary pcurves and release delivery remain open.
'''+text[end:]; p.write_text(text)
p=ROOT/'crates/hyperbrep/docs/SUPPORT_MATRIX.md'; text=p.read_text(); old='parallel extrusion remain unsupported; STEP rejects this profile\'s rational\nBezier edge before reaching any later surface requirements.'
assert old in text
text=text.replace(old,'''parallel extrusion remain unsupported. The
[spline exchange increment](evidence/2026-10-18-spline-exchange/README.md)
adds exact clamped rational B-spline edge and linear-extrusion STEP exchange for
the admitted profiles. Independent authored records retain weights, knots,
interior trims, nonunit source charts and units. Imported solids validate, replay
and continue through the same supported global-z cuts/restoration. Native point
location supports oblique transverse charts; it does not alone admit general
oblique solid modeling. Whole-edge proofs remain mandatory. General spline
surfaces, arbitrary wall pcurves and ambiguous or unrepresented trims are open.'''); p.write_text(text)
p=ROOT/'crates/hyperbrep/PERFORMANCE.md'; text=p.read_text(); heading='# HyperBREP Performance Contract\n'; assert text.startswith(heading)
p.write_text(heading+f'''\n## 2026-10-18: exact spline exchange feature admission\n\nThe [qualification](docs/{relative}/README.md) completes exact profile interchange\nand continued modeling. {cost}\n\nThe [full report](docs/{relative}/costs.md), [new absolute costs](docs/{relative}/new-cost-summary.json),\n[prior native comparisons](docs/{relative}/prior-native-cost-summary.json) and\n[resource review](docs/{relative}/resource-review.md) retain every observation.\nThis feature does not close historical resource, delivery or project gates.\n'''+text[len(heading):])
p=ROOT/'docs/properties-status.json'; before=p.read_text(); entry=json.loads(before)['current_work']['hyperbrep']; entry.update(latest_evidence=location+'/manifest.json',latest_feature_evidence=location+'/manifest.json',latest_implementation=identity,qualification=validation+' '+cost+' '+limits)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'; spec=importlib.util.spec_from_file_location('spans',helper); spans=importlib.util.module_from_spec(spec); spec.loader.exec_module(spans); after=spans.replace_brep(before,entry); p.write_text(after)
write(OUT/'ledger-update.json',dict(before_sha256=hashlib.sha256(before.encode()).hexdigest(),after_sha256=hashlib.sha256(after.encode()).hexdigest(),helper_sha256=hashlib.sha256(helper.read_bytes()).hexdigest(),scope='Only current_work.hyperbrep changes; every other shared-ledger byte remains intact.'))
(OUT/'README.md').write_text(f'''# Exact spline STEP exchange\n\nBaseline `{b['baseline']}`, upstream `{b['upstream']}`. The\n[pre-edit reproduction](baseline.json) and [original failure](baseline-step.log)\nretain the exact RationalBezier writer blocker. The [contract](contract.md),\n[proof review](review.md) and [primary-source research](research.md) define ownership\nand the finite admitted domain.\n\n{validation}\n\n[All attempts](attempts.json) retain the original failures and source snapshots.\nThe obsolete Bezier rejection is promoted to a positive complete regression;\nits original geometry and the other negative fixtures remain. Deterministic\n[old artifacts](artifact-comparison.json), [prior profiles](prior-image-artifacts.json)\nand [new artifacts](spline-artifacts.json) supplement independently derived exact\nvolume, chart, incidence, near-boundary and set-identity assertions.\n[OCCT results](spline-occt.json) are numerical interoperability evidence only.\n\n{cost}\n\n[Full costs](costs.md), [prior native comparisons](prior-native-cost-summary.json),\n[new costs](new-cost-summary.json) and [resource review](resource-review.md)\ninclude unfavorable samples and explicit limits. The [idea ledger](idea-ledger.json)\nrecords retained and rejected choices.\n\n[Qualification](qualification-summary.json), [native/WASM consumers](new-consumers.json),\n[source reconstruction](source-reconstruction.json), [retention](retention-decision.json),\n[Cargo payloads](package-payload.json), [storage identity](storage-identity.json),\n[manifest](manifest.json) and [audit](audit.json) bind the evidence to source.\n\n{limits}\n''')
assert hashes()==source
print('Recorded exact spline exchange admission.',flush=True)
