from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-parameter-preimage-components'
record=repo/relative
prefix='/tmp/hyperbrep-parameter-components-final'
receipts=json.loads(Path(prefix+'-validation.json').read_text())
assert len(receipts)==13,len(receipts)
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
for p in Path('/tmp').glob('hyperbrep-parameter-components-*'):
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
with tempfile.TemporaryDirectory(prefix='hyperbrep-parameter-components-source-') as work:
 scratch=Path(work)
 for name in changed:
  p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
  p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
 subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
 subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
 for name in changed+new:assert (scratch/name).read_bytes()==Path(name).read_bytes(),name
frontiers=json.loads(Path('/tmp/hyperbrep-parameter-components-next-frontiers.json').read_text())
assert frontiers['compile_status']==0 and frontiers['run_status']==0 and not frontiers['completion']
review=json.loads(Path('/tmp/hyperbrep-parameter-components-source-review.json').read_text())
assert len(review['changed_or_new_paths'])==24 and not review['removed_paths']
assert 'test mixed_projection_components_recover_all_finite_spatial_visits ... ok' in Path(prefix+'-brep.log').read_text()
assert 'test mixed_constant_intervals_and_isolated_visits_are_complete ... ok' in Path(prefix+'-curve.log').read_text()
assert 'test ordinary_constant_source_queries_keep_original_punctures ... ok' in Path(prefix+'-curve.log').read_text()
info={'next_executed_frontiers':frontiers,'source_review':review,'base':base,'qualification':'scoped exact completion; general operation closure remains incomplete','validation':receipts,'groups':groups,'successful_harness_reports':passed,'distinct_tests_passed':len(identities),'repeated_harness_reports':successful_reports-len(identities),'ordinary_ignored':ignored,'final_source_fingerprints':len(source),'reconstructed_files':len(changed+new),'new_files':new,'observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'tested_native_mixed_preimages_complete':True,'tested_original_denominator_punctures_preserved':True,'tested_algebraic_endpoint_inclusion':True,'tested_source_germ_intersection':True,'tested_finite_spatial_inverse_from_mixed_projections':True,'native_cold_and_fresh_process_continuation':True,'general_closure':False,'general_continuous_spatial_inverse':False,'general_implicit_punctured_inverse':False,'performance_improvement':False,'total_resource_bound':False,'fuzz_runtime':False,'wasm_runtime':False,'release':False,'pre_push':False,'published':False},'retained_failures':'Before implementation, native mixed parameter loci and finite TensorImage inverse with mixed projections return Unsupported. Ordinary represented constant rational source with an original denominator hole returns Boundary. Test-only integer conversion errors and strict Clippy useless conversions are retained separately from final fixed-source passes. The first serial campaign fails a stale Unsupported expectation on a selected parabola point. The second fails an older Unsupported expectation on a partly constant spline. Both fixture assertions are strengthened to independent exact-success expectations and qualified only by the final campaign. Record-8 frontier failures remain immutable historical evidence and are now closed by ordinary exact-success witnesses.', 'scope_note':'Intersection and support unit filters overlap; successful harness reports and distinct test identities are reported separately. The affected Hypercurve scope expands to rational evaluator units and all selected SVG/point/intersection callers of the public enum. Full BRep and IO suites are separate gates. No full Hypercurve library or pre-push claim.'}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
admission=json.loads(Path('/tmp/hyperbrep-parameter-components-increment-draft.json').read_text())
admission['validation']=f"Final fixed-source serial campaign: {len(receipts)} successful commands, {len(identities)} distinct tests, {passed} successful harness reports, {ignored} ignored. See qualification.json for gate, scope and source receipts."
(record/'admission.json').write_text(json.dumps(admission,indent=2)+'\n')
(record/'support-matrix.md').write_bytes(Path('crates/hyperbrep/docs/SUPPORT_MATRIX.md').read_bytes())
(record/'future-work.md').write_bytes(Path('crates/hypercurve/FUTURE_WORK.md').read_bytes())
readme=Path('/tmp/hyperbrep-parameter-components-evidence-readme.txt')
(record/'README.md').write_bytes(readme.read_bytes())
with (record/'toolchain.txt').open('w') as f:
 for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print(json.dumps({'record':relative,'harness_reports':passed,'distinct_tests':len(identities),'ignored':ignored,'fingerprints':len(source),'source_files':len(changed+new),'groups':groups}))
