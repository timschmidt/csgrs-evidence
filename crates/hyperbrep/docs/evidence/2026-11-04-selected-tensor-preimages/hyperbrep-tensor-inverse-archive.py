from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-selected-tensor-preimages'
record=repo/relative
prefix='/tmp/hyperbrep-tensor-inverse-final'
receipts=json.loads(Path(prefix+'-validation.json').read_text())
assert len(receipts)==12,len(receipts)
assert all(r['status']==0 and r['source_unchanged'] for r in receipts)
source=json.loads(Path(prefix+'-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
assert 'test nonlinear_tensor_caps_support_transverse_recuts ... ok' in Path(prefix+'-brep.log').read_text()
assert 'test boolean_kernel::tests::selected_flat_tensor_trims_keep_their_surface_parameterization ... ok' in Path(prefix+'-brep.log').read_text()
assert 'test boolean_kernel::tests::scalar_trim_parameters_do_not_authorize_a_different_surface_chart ... ok' in Path(prefix+'-brep.log').read_text()
groups={};passed=ignored=0;identities=set();successful_reports=0
for r in receipts:
 log=Path(r['log']).read_text()
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',log)
 assert all(int(row[1])==0 for row in rows)
 p=sum(int(row[0]) for row in rows);i=sum(int(row[2]) for row in rows)
 groups[r['name']]={'passed':p,'ignored':i};passed+=p;ignored+=i
 crate='hypercurve' if r['name'].startswith('curve') else ('hyperbrep' if r['name']=='brep' else 'hyperbrep-io')
 target=None;count=0
 for line in log.splitlines():
  m=re.search(r'Running (unittests \S+|tests/\S+)',line)
  if m:target=m[1]
  if 'Doc-tests ' in line:target='doctests'
  m=re.match(r'test (.+?) \.\.\. ok$',line)
  if m:
   assert target,(r['name'],line)
   identities.add((crate,target,m[1]));count+=1
 assert count==p,(r['name'],count,p)
 successful_reports+=count
record.mkdir(parents=True,exist_ok=True)
for p in Path('/tmp').glob('hyperbrep-tensor-inverse-*'):
 if p.is_file() and not p.name.endswith(('increment-draft.json','manifest.tsv','record-summary.json','-bin')):
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
with tempfile.TemporaryDirectory(prefix='hyperbrep-tensor-inverse-source-') as work:
 scratch=Path(work)
 for name in changed:
  p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
  p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
 subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
 subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
 for name in changed+new:assert (scratch/name).read_bytes()==Path(name).read_bytes(),name
frontier=json.loads(Path('/tmp/hyperbrep-tensor-inverse-next-components-probe.json').read_text())
assert frontier['compile_status']==0 and frontier['run_status']==0 and not frontier['completion']
capture=json.loads(Path('/tmp/hyperbrep-tensor-inverse-reflected-fixture-capture.json').read_text())
assert capture['compile_status']==0 and capture['run_status']==0
mixed=json.loads(Path('/tmp/hyperbrep-tensor-inverse-mixed-projections-probe.json').read_text())
assert mixed['compile_status']==0 and mixed['run_status']==0 and not mixed['completion']
info={'downstream_mixed_projection_frontier':mixed,'fixture_capture':capture,'next_executed_frontier':frontier,'base':base,'qualification':'scoped exact completion; general operation closure remains incomplete','validation':receipts,'groups':groups,'successful_harness_reports':passed,'distinct_tests_passed':len(identities),'repeated_harness_reports':successful_reports-len(identities),'ordinary_ignored':ignored,'final_source_fingerprints':len(source),'reconstructed_files':len(changed+new),'new_files':new,'observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'admitted_tensor_projection_preimages':True,'tested_finite_map_visits_complete':True,'original_source_and_map_guards':True,'tested_discontinuous_chart_germs_retained':True,'reflected_tensor_whole_image_replay':True,'native_cold_and_fresh_process_continuation':True,'general_closure':False,'performance_improvement':False,'total_resource_bound':False,'fuzz_runtime':False,'wasm_runtime':False,'release':False,'pre_push':False,'published':False},'retained_failures':'Original selected TensorImage inverse and folded polynomial-image inverse return Unsupported. A valid coordinate pullback is zero and was treated as PolynomialTopology(ZeroPolynomial). Reflected model replay fails EdgeUseSupportMismatch despite correct source geometry; matching endpoints do not establish the world function. A canceled map denominator fails whole-box image admission before the query-only guard path is added. Discontinuous source charts at one knot were merged by parameter equality alone. Candidate borrow/type errors and one empty-log shell attempt are retained separately from final qualification.','superseded_campaign':'The first serial attempt passed its compiled curve targets, but its final source fingerprint check deliberately rejected qualification after the discontinuous-knot witness and source-germ fix. The controller stopped before BRep. Its source_unchanged=false receipt is retained separately and is not a fixed-source completion pass.', 'scope_note':'Intersection and support unit filters overlap; successful harness reports and distinct test identities are reported separately. This is affected Hypercurve scope plus the full BRep and IO suites, not the full Hypercurve library or a pre-push campaign.'}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
readme=Path('/tmp/hyperbrep-tensor-inverse-evidence-readme.txt')
(record/'README.md').write_bytes(readme.read_bytes())
with (record/'toolchain.txt').open('w') as f:
 for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print(json.dumps({'record':relative,'harness_reports':passed,'distinct_tests':len(identities),'ignored':ignored,'fingerprints':len(source),'source_files':len(changed+new),'groups':groups}))
