from pathlib import Path
import importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-circle-differentials');prefix='circle-differentials-line-probe1'
assert not (root/(prefix+'-results.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(root/(prefix+'-source-before.json'),source);e.save_json(root/(prefix+'-files-before.json'),files);(root/(prefix+'.patch')).write_bytes(patch)
for name in source['untracked_inputs']:
 p=root/(prefix+'-inputs')/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes((checkout/name).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-differentials-admission','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
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
env['RUST_BACKTRACE']='1'
binary='/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-differentials-admission/release/deps/fiber_point_incidence-76f962adeff97936'
import hashlib
e.save_json(root/(prefix+'-binary.json'),{'path':binary,'sha256':hashlib.sha256(Path(binary).read_bytes()).hexdigest(),'built_by':'circle-differentials-prototype6-budget-consumer','source':source})
code=run('original-positive',[binary,'selected_circle_derivative_points_replay_before_another_exact_split','--exact','--nocapture'],300)
assert code==101
print('Exact line export failure reproduced on unchanged positive case.',flush=True)
