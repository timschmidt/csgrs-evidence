from pathlib import Path
import importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order');prefix='fiber-point-order-prototype3'
assert not (root/(prefix+'-results.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(root/(prefix+'-source-before.json'),source);e.save_json(root/(prefix+'-files-before.json'),files);(root/(prefix+'.patch')).write_bytes(patch)
for name in source['untracked_inputs']:
 p=root/(prefix+'-inputs')/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes((checkout/name).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-fiber-point-order-admission','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
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
assert run('build',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','fiber_point_incidence','--no-run','--message-format=json'],1800,True)==0
artifacts=[json.loads(line) for line in (root/(prefix+'-build.jsonl')).read_text().splitlines()]
binary=next(a['executable'] for a in artifacts if a.get('executable') and a['target']['name']=='fiber_point_incidence')
run('witnesses',[binary,'--nocapture'],300)
def lib(name):return Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']==name for f in a['filenames'] if f.endswith('.rlib')))
curve=lib('hypercurve');solver=lib('hypersolve');original=root/(prefix+'-original')
cmd=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/'fiber-point-order-baseline2-original.rs'),'--crate-name','fiber_point_order_original','-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(original)]
if run('original-build',cmd,120)==0:run('original-positive',[str(original)],120)
targets=['rational_point_forms','point_affine_forms','polynomial_point_order','polynomial_point_locations','hypercurve_circle_predicates','hypercurve_curve_point','point_equality_contract','svg_circle_replay','svg_point_replay']
cmd=['cargo','test','--locked','--release','--all-features','-p','hypercurve','--no-fail-fast']
for target in targets:cmd+=['--test',target]
run('existing-point-and-circle',cmd,1800)
assert all(row['exit_code']==0 for row in rows)
print('PROTOTYPE PASSED',flush=True)
