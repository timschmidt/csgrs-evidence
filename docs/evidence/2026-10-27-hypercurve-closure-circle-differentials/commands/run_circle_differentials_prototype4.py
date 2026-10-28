from pathlib import Path
import hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-circle-differentials');prefix='circle-differentials-prototype4'
assert not (root/(prefix+'-results.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()

for name in source['untracked_inputs']:
 target=root/(prefix+'-inputs')/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes((checkout/name).read_bytes())
e.save_json(root/(prefix+'-source-before.json'),source);e.save_json(root/(prefix+'-files-before.json'),files);(root/(prefix+'.patch')).write_bytes(patch)
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-differentials-admission','CARGO_BUILD_JOBS':'2','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
rows=[]
def run(name,cmd,timeout,json_output=False):
 assert e.source_snapshot()[0]==source
 start=time.time()
 with (root/(prefix+'-'+name+('.jsonl' if json_output else '.log'))).open('w') as out,(root/(prefix+'-'+name+'-stderr.log')).open('w') as err:
  process=subprocess.Popen(cmd,cwd=checkout,env=env,stdout=out,stderr=err,start_new_session=True)
  try:code=process.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
 after,after_files,_=e.source_snapshot();row={'name':name,'command':cmd,'exit_code':code,'elapsed_seconds':time.time()-start,'source_stable':source==after,'external_timeout_seconds':timeout};rows.append(row)
 e.save_json(root/(prefix+'-results.json'),rows);e.save_json(root/(prefix+'-source-after.json'),after);e.save_json(root/(prefix+'-files-after.json'),after_files);print(row,flush=True);assert row['source_stable'];return code
cmd=['cargo','build','--locked','--release','--all-features','-p','hypercurve','--lib','--message-format=json']
assert run('build',cmd,1800,True)==0
artifacts=[json.loads(line) for line in (root/(prefix+'-build.jsonl')).read_text().splitlines()]
def lib(name):return Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']==name for f in a['filenames'] if f.endswith('.rlib')))
curve=lib('hypercurve');solver=lib('hypersolve')
original=root/'selected-circle-points-next-consumers.rs';copy=root/(prefix+'-original.rs');copy.write_bytes(original.read_bytes()+(root/'circle-differentials-additional-cases.rs').read_bytes());binary=root/(prefix+'-original')
cmd=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(copy),'--crate-name','circle_differentials_original','-L','dependency='+str(curve.parent),'-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(binary)]
assert run('original-build',cmd,120)==0
for name in [
 'selected_circle_derivatives_match_independent_complex_formula',
 'selected_circle_scalar_derivatives_keep_chart_endpoints_and_orders',
 'selected_circle_derivatives_survive_restriction_reversal_and_similarity',
 'selected_circle_derivatives_retry_and_keep_requested_policy_certainty',
]:
 run(name,[str(binary),name,'--exact','--nocapture'],1800)
e.save_json(root/(prefix+'-attribution.json'),{'library':str(curve),'library_sha256':hashlib.sha256(curve.read_bytes()).hexdigest(),'source_file':str(copy),'source_sha256':hashlib.sha256(copy.read_bytes()).hexdigest(),'source':source,'original_assertions_unchanged':True})
assert all(row['exit_code']==0 for row in rows)
print('Additional independent differential cases passed.',flush=True)
