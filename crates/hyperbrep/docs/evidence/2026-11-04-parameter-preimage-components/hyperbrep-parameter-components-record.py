from pathlib import Path
import subprocess,json
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-parameter-preimage-components'
record=repo/relative;q=json.loads((record/'qualification.json').read_text())
index=Path('docs/evidence-archive.tsv');old=index.read_text().splitlines();rows={r.split('\t')[0]:r for r in old[1:]}
before_rows=rows.copy()
assert len(rows)==len(old)-1, 'duplicate index records'
previous=Path('/tmp/hyperbrep-tensor-inverse-manifest.tsv').read_text().splitlines()[1:]
assert len(previous)==8 and all(rows[r.split('\t')[0]]==r for r in previous), 'preceding local manifest must match the full global index'
assert relative not in rows, 'new record must be appended exactly once'
assert not subprocess.check_output(['git','-C',str(repo),'diff','--name-only'],text=True).strip()
subprocess.run(['git','-C',str(repo),'add','--',relative],check=True)
subprocess.run(['git','-C',str(repo),'commit','-m','Qualify native parameter preimage components and tensor projection intersection'],check=True)
commit=subprocess.check_output(['git','-C',str(repo),'rev-parse','HEAD'],text=True).strip()
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest',str(repo),commit],text=True)
manifest_file=Path('/tmp/hyperbrep-parameter-components-manifest.tsv');manifest_file.write_text(manifest)
subprocess.run(['python3','scripts/evidence_archive.py','verify',str(repo),commit,str(manifest_file)],check=True)
for row in manifest.splitlines()[1:]:
 key=row.split('\t')[0]
 if key in rows:assert rows[key]==row,'historical record changed: '+key
 rows[key]=row
assert len(rows)==len(before_rows)+1 and relative in rows
assert all(rows[k]==v for k,v in before_rows.items()), 'every historical global record must remain unchanged'
index.write_text(old[0]+'\n'+'\n'.join(rows[k] for k in sorted(rows,key=str.encode))+'\n')
row=rows[relative].split('\t');archive={'local_repository':str(repo),'commit':commit,'record':relative,'sha256':row[3],'published':False}
p=Path('crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json');status=json.loads(p.read_text());entry=json.loads(Path('/tmp/hyperbrep-parameter-components-increment-draft.json').read_text())
assert not any(i['id']==entry['id'] for i in status['increments'])
g=q['groups']
entry['validation']=f"Final serial fixed-source campaign passes {g['curve']['passed']} affected Hypercurve integration tests, {g['curve-evaluation']['passed']} evaluation units, {g['curve-incidence']['passed']} incidence units, {g['curve-polynomial']['passed']} polynomial/source-chart units, {g['curve-support']['passed']} support units and {g['curve-rational']['passed']} rational evaluator units; all {g['brep']['passed']} BRep tests/doctests and {g['io']['passed']} downstream IO tests/doctests. Overlapping unit filters produce {q['successful_harness_reports']} successful harness reports covering {q['distinct_tests_passed']} distinct tests, with {q['repeated_harness_reports']} repeated reports and {q['ordinary_ignored']} ordinary ignored cases. Strict all-target/all-feature Clippy, formatting, warning-denied docs, production WASM compilation and all three native fuzz-consumer bin checks pass. All {q['final_source_fingerprints']} source/manifest/fixture fingerprints remain unchanged around all {len(q['validation'])} final commands. Expanded coverage includes selected SVG, circle, chord, point-fiber and curve-intersection consumers of the public result enum. Original generated tensor transverse recut and selected native-spline graph-stitching chains remain ordinary passing cases, alongside both incident face uses, cold/fresh-process replay and further reflected edits. New expectations certify the original mixed planar and finite spatial probes, original/canceled source-map punctures, a quintic hole and selected restriction endpoint, open authored ends, reversal, repeated component intersection, empty defined domains and distinct discontinuous source germs. Mixed-projection output is consumed by restriction, reversal and nonuniform reflected affine queries. An expanded old test still expected Unsupported for the now-supported selected parabola point; preserve its failed first-campaign receipt and strengthen the assertion to the unique independently specified t=sqrt(1/2), certified certainty and original point equality. No test is weakened. The first serial campaign failed that stale blocker expectation before BRep. The second failed a preserved partial-constant spline Unsupported expectation; retain its near-distinct-root checks and strengthen the final assertion to the exact closed [0,1], original span chart and endpoint inclusion. Both incomplete campaigns remain failed evidence, separate from final qualification. The archived source patch reconstructs {q['reconstructed_files']} changed/new affected source, manifest and fixture files, including all untracked sources; {len(q['source_review']['changed_or_new_paths'])} source/test/bench paths differ from record 8. The next proper spatial and punctured implicit-branch probes remain typed blockers and do not count as geometric completions. No full Hypercurve library, runtime fuzz/sanitizer/coverage, WASM execution, release or pre-push qualification is inferred."
entry['evidence_archive']=archive;status['increments'].append(entry)
status['next_actions'][0]="Continue WP02/WP03/WP04/WP05a/WP06 from complete native rational parameter components and their source-germ-preserving intersection. Preserve the original [0,1] union {5/2} spline and {0,1/3,2/3,1} quadratic tensor/spline exact-success witnesses, all selected tensor inverse/replay chains, nonlinear cap/hole/quartic cases and native-spline graph stitching. Extend CurveParameterLocation and spatial consumers to proper continuous/mixed inverse loci: the admitted planar-tensor/native-spline probe requires [0,1/3] union {1} and still blocks. Complete punctured constant selected implicit-branch queries: the preserved nonrational y=sqrt(x) probe requires [0,1/2) union (1/2,1] and still blocks. Reuse original guards, selected source/fiber identities, open endpoints and parameter charts without treating missing proofs as inequality or exclusion. Complete unresolved shared components, procedural/point-ordered inverses, continuous overlap assembly, coplanar selected-line support collection, general chart arrangements and reconstruction. Consume all authored/generated families through further Booleans, offsets, shelling, fillets/chamfers, transforms and native replay. Total work/heap/cancellation and release packages remain open; no whole work package is complete."
assert not status['complete'] and len(status['work_packages'])==28 and all(w['status']!='complete' for w in status['work_packages'])
p.write_text(json.dumps(status,indent=2)+'\n')
summary={'archive':archive,'files':int(row[1]),'bytes':int(row[2]),'passed':q['distinct_tests_passed'],'harness_reports':q['successful_harness_reports'],'ignored':q['ordinary_ignored'],'groups':g}
Path('/tmp/hyperbrep-parameter-components-record-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary))
