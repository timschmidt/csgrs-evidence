from pathlib import Path
import subprocess,json
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-selected-rational-preimages'
record=repo/relative;q=json.loads((record/'qualification.json').read_text())
subprocess.run(['git','-C',str(repo),'add','--',relative],check=True)
subprocess.run(['git','-C',str(repo),'commit','-m','Qualify selected native rational preimages and source chart reconstruction'],check=True)
commit=subprocess.check_output(['git','-C',str(repo),'rev-parse','HEAD'],text=True).strip()
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest',str(repo),commit],text=True)
manifest_file=Path('/tmp/hyperbrep-selected-spline-manifest.tsv');manifest_file.write_text(manifest)
subprocess.run(['python3','scripts/evidence_archive.py','verify',str(repo),commit,str(manifest_file)],check=True)
index=Path('docs/evidence-archive.tsv');old=index.read_text().splitlines();rows={r.split('\t')[0]:r for r in old[1:]}
for row in manifest.splitlines()[1:]:
 key=row.split('\t')[0]
 if key in rows:assert rows[key]==row,'historical record changed: '+key
 rows[key]=row
index.write_text(old[0]+'\n'+'\n'.join(rows[k] for k in sorted(rows,key=str.encode))+'\n')
row=rows[relative].split('\t');archive={'local_repository':str(repo),'commit':commit,'record':relative,'sha256':row[3],'published':False}
p=Path('crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json');status=json.loads(p.read_text());entry=json.loads(Path('/tmp/hyperbrep-selected-spline-increment-draft.json').read_text())
assert not any(i['id']==entry['id'] for i in status['increments'])
g=q['groups']
entry['validation']=f"Final serial fixed-source campaign passes {g['curve']['passed']} affected Hypercurve integration tests, {g['curve-evaluation']['passed']} evaluation units, {g['curve-incidence']['passed']} incidence units, {g['curve-line-sections']['passed']} source-chart unit and {g['curve-support']['passed']} support units; all {g['brep']['passed']} BRep tests/doctests and {g['io']['passed']} downstream IO tests/doctests. The incidence/support filters overlap: {q['successful_harness_reports']} successful harness reports represent {q['distinct_tests_passed']} distinct tests, with {q['repeated_harness_reports']} repeated unit reports and {q['ordinary_ignored']} ordinary ignored cases. Strict all-target/all-feature Clippy, formatting, warning-denied docs, production WASM compilation and all three native fuzz-consumer bin checks pass. All {q['final_source_fingerprints']} source/manifest/fixture fingerprints remain unchanged around all {len(q['validation'])} commands. The original nonlinear transverse recut remains enabled and passes its full continuation chain. New rational inverse cases cover independent selected queries, rational targets, selected trims, exact nearby distinctions, all visits, constant coordinates, original poles, knots/seams, native point definition replay and budget/policy retry. Spatial negative controls reject matching XY but unequal Z. Recovered selected roots split a tensor edge, survive cold/fresh-process replay and support inverse location plus another split. The original elevated-tensor cube now completes full graph stitching, replay, a further cut and independent half-cube set equality in both directed differences. A separately cold-valid lens with scalar parameter domains reproduces the wrong UV frame/world image; source-chart preservation restores cold replay and another split. Raw failed/unsupported probes and candidate compilation mistakes remain archived separately from completed final checks. The archived patch reconstructs {q['reconstructed_files']} changed/new affected files, including untracked sources, fixtures and bench callers; eight source/test files differ from the preceding qualified increment. No full Hypercurve library, runtime fuzz/sanitizer/coverage, WASM execution, release or pre-push qualification is inferred. Post-record JSON/link/index/source/budget/diff checks pass."
entry['evidence_archive']=archive;status['increments'].append(entry)
status['next_actions'][0]="Continue WP02/WP04/WP05a/WP06 beyond the completed selected native-line/rational/NURBS and planar/affine inverse paths. Preserve the original nonlinear tensor transverse recut and elevated-tensor selected-spline full graph chain, including independent exact expectations, native replay and further operations. Reproduce and complete independent retained-point TensorImage inverses, actually coplanar selected-line support collection, mixed continuous/discrete preimage results and general chart/reconstruction closure. Scalar trim parameters do not authorize replacing a surface UV chart; unavailable coordinates and absent sufficient certificates never prove exclusion or inequality. Retain selected fields, original denominator guards, exact active domains and complete parameter/image laws. Consume outputs through transforms, reconstruction, native replay and further Boolean/offset/corner operations. Complete the existing all-type/all-operation, resource/cancellation and release packages without narrowing target domains. This increment completes no whole work package."
assert not status['complete'] and len(status['work_packages'])==28 and all(w['status']!='complete' for w in status['work_packages'])
p.write_text(json.dumps(status,indent=2)+'\n')
summary={'archive':archive,'files':int(row[1]),'bytes':int(row[2]),'passed':q['distinct_tests_passed'],'harness_reports':q['successful_harness_reports'],'ignored':q['ordinary_ignored'],'groups':g}
Path('/tmp/hyperbrep-selected-spline-record-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary))
