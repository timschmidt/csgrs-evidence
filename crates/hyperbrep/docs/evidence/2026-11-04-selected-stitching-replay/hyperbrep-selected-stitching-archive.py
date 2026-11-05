from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-selected-stitching-replay'
record=repo/relative
prefix='/tmp/hyperbrep-selected-stitching-final'
receipts=json.loads(Path(prefix+'-validation.json').read_text())
assert len(receipts)==7,len(receipts)
assert all(r['status']==0 and r['source_unchanged'] for r in receipts)
curve=json.loads(Path('/tmp/hyperbrep-selected-stitching-curve-scope.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in curve['unchanged_fingerprints'].items())
assert all(r['status']==0 and r['source_unchanged'] for r in curve['receipts'])
source=json.loads(Path(prefix+'-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
probe=Path('/tmp/hyperbrep-selected-stitching-flat-full-stitch-final-probe.log')
assert probe.is_file() and 'Geometry(UnsupportedParameterLocation)' in probe.read_text()
brep=Path(prefix+'-brep.log').read_text()
assert 'test nonlinear_tensor_caps_support_transverse_recuts ... ok' in brep
assert '#[ignore' not in Path('crates/hyperbrep/tests/tensor_graph_solids.rs').read_text().split('fn nonlinear_tensor_caps_support_transverse_recuts')[0].split('#[test]')[-1]
groups={};passed=ignored=0
for r in receipts+curve['receipts']:
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',Path(r['log']).read_text())
 assert all(int(row[1])==0 for row in rows)
 p=sum(int(row[0]) for row in rows);i=sum(int(row[2]) for row in rows)
 groups[r['name']]={'passed':p,'ignored':i};passed+=p;ignored+=i
record.mkdir(parents=True,exist_ok=True)
for p in Path('/tmp').glob('hyperbrep-selected-stitching-*'):
 if p.is_file() and not p.name.endswith(('increment-draft.json','manifest.tsv','record-summary.json')):
  shutil.copy(p,record/p.name)
roots=[str(Path('crates',c)) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io']]
base=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
changed=subprocess.check_output(['git','diff','--name-only','HEAD','--',*roots],text=True).splitlines()
new=subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*roots],text=True).splitlines()
keep=lambda n: Path(n).suffix in ['.rs','.json','.toml'] and 'docs' not in Path(n).parts
changed=[n for n in changed if keep(n)];new=[n for n in new if keep(n)]
patch=subprocess.check_output(['git','diff','--binary','HEAD','--',*changed])
for name in new:
 r=subprocess.run(['git','diff','--no-index','--binary','--','/dev/null',name],capture_output=True)
 assert r.returncode==1;patch+=r.stdout
(record/'source.patch').write_bytes(patch)
with tempfile.TemporaryDirectory(prefix='hyperbrep-selected-stitching-source-') as work:
 scratch=Path(work)
 for name in changed:
  p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
  p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
 subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
 subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
 for name in changed+new:assert (scratch/name).read_bytes()==Path(name).read_bytes(),name
info={'base':base,'qualification':'scoped exact completion; general operation closure remains incomplete','validation':receipts,'curve_scope':curve,'groups':groups,'tests_passed':passed,'ordinary_ignored':ignored,'final_source_fingerprints':len(source),'reconstructed_files':len(changed+new),'new_files':new,'observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'original_transverse_recut_completed':True,'elevated_flat_tensor_full_graph_stitch_completed':False,'native_cold_and_fresh_process_continuation':True,'general_closure':False,'performance_improvement':False,'total_resource_bound':False,'fuzz_runtime':False,'wasm_runtime':False,'release':False,'pre_push':False,'published':False},'superseded_campaign':'The first campaign passed all 134 affected integration tests, but its final source fingerprint check deliberately refused qualification after the fallback proof was moved behind the existing injectivity certificates. It stopped before BRep, so no concurrent rebuilding removed future test executables. A second campaign qualifies the unchanged 787-file Hypercurve/Hypersolve scope and all 189 affected curve checks. It had already started BRep when the later flat-tensor UV-frame witness changed BRep source. Only that task controller and child test processes were explicitly interrupted; its BRep status -2/source_unchanged=false is not a full-suite pass. Final BRep/downstream checks run serially on fixed source after that fix; unchanged lower-layer receipts are qualified separately.', 'next_executed_frontier':{'operation':'intersection_graph(...).stitch_selected_faces(Intersection)','domain':'validated degree-elevated affine tensor cube with a quintic selected edge split, strictly inside another cube','outcome':'Geometry(UnsupportedParameterLocation)','probe':'hyperbrep-selected-stitching-flat-full-stitch-probe.py','log':'hyperbrep-selected-stitching-flat-full-stitch-final-probe.log','scope':'Full graph atomization remains unsupported; the direct face-transfer chart regression passes. No blocker is counted as completed geometry.'}, 'retained_failures':'Original UnrepresentablePoint census; scalar edge transfers; irrelevant noncoplanar selected endpoint request; unmatched selected world-image charts; cold intersecting-frame line agreement; cold tensor-on-plane image agreement; cold mapped-branch self-incidence; test control net axis transposition, raw rational-pcurve setup and syntax mistakes; degree-elevated flat-tensor chart retention; generic caller Clippy warnings. Raw failed and superseded logs remain separate from final successful checks.'}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
(record/'README.md').write_text('''# Selected-point stitching and cold replay\n\nOwning layers: Hypercurve selected polynomial map/relation and self-incidence proofs; HyperBRep spatial selected-point inverses, Boolean endpoint atomization and boundary reconstruction, parameter transport and whole-image native replay. P6/P14/P15/P17/P18/P19/P20. Native archive remains version 17.\n\nThe original nonlinear tensor fixture x=-1+3u-u^2, y=2v-1, z=(2u-1)^2+y^2 is capped at z<=1/2 and recut at x<=0. Original hole and selected quartic endpoint witnesses remain intact. The strengthened ordinary test checks hand-derived interior/exterior/boundary points at u=1/4 and u=1/3, exact 2^-60 roof separations, shared edge uses, retained unmaterialized vertices, deterministic serialization separately from material semantics, cold and fresh-process replay, and a further z<=-1/2 cut. The latter equals the independently specified rectangular prism in both exact set differences, has volume one, and supports replay and canonical empty recovery. Earlier failures remain archived; none is counted as a completion pass.\n\nIndependent regressions check selected spatial native-line inversion across all coordinates, finite trims and reversal, 2^-60 distinct parallel supports, reflected shear, selected-domain chart transport, wrong UV frames, complete affine line world laws in intersecting plane frames, mapped tensor sections on planes, wrong plane/chart/interior images despite matching endpoints, rational polynomial relation pullbacks and single-branch injectivity under a folding ambient map. Retracing maps do not acquire false empty self-incidence. A selected cube-face reconstruction witness performs cold replay and another stitch.\n\nFinal BRep/downstream validation runs serially on fixed source; the 189 lower-layer curve checks retain their independently verified unchanged 787-file dependency scope. qualification.json lists the exact commands, statuses, timings, ignored counts and source fingerprint checks. It includes affected curve units/integrations, all BRep/IO tests and doctests, flat-tensor selected-chart retention and replay/subdivision, strict all-target/all-feature Clippy, formatting, warning-denied docs, production WASM compilation and all three native fuzz-consumer bin checks. Timings are observations rather than a speedup or total resource bound. No runtime fuzz, sanitizer/coverage, WASM execution, release or pre-push claim is made. source.patch reconstructs all changed/new affected source/fixture/caller files from the recorded base, including untracked files.\n\nThe full graph-stitching probe for the elevated flat tensor cube still reports UnsupportedParameterLocation during atomization; its reusable probe and original source geometry are retained alongside the direct chart-transfer regression. This is not an exact completion pass. General selected TensorImage/rational/NURBS preimages, actually coplanar selected-line support collection, continuous pullbacks, unrelated nonlinear charts, arbitrary algebraic operation closure, offsets/blends/chamfers and complete work/heap/cancellation guarantees remain open. The single-branch coordinate proof is not a general injective plane chart. No work package or persistent goal is complete. Evidence is local and unpublished.\n''')
with (record/'toolchain.txt').open('w') as f:
 for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print(json.dumps({'record':relative,'tests':passed,'ignored':ignored,'fingerprints':len(source),'source_files':len(changed+new),'groups':groups}))
