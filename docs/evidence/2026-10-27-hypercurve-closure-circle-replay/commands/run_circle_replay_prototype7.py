from pathlib import Path
import hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-circle-replay');prefix='circle-replay-prototype7'
assert not (root/(prefix+'-results.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(root/(prefix+'-source-before.json'),source);e.save_json(root/(prefix+'-files-before.json'),files);(root/(prefix+'.patch')).write_bytes(patch)
for name in source['untracked_inputs']:
 p=root/(prefix+'-inputs')/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes((checkout/name).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-replay-admission','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
rows=[]
def run(name,cmd,timeout,json_output=False):
 assert e.source_snapshot()[0]==source
 start=time.time()
 with (root/(prefix+'-'+name+('.jsonl' if json_output else '.log'))).open('w') as out,(root/(prefix+'-'+name+'-stderr.log')).open('w') as err:
  p=subprocess.Popen(cmd,cwd=checkout,env=env,stdout=out,stderr=err,start_new_session=True)
  try: code=p.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
 after,afterfiles,_=e.source_snapshot();row={'name':name,'command':cmd,'exit_code':code,'elapsed_seconds':time.time()-start,'source_stable':source==after,'external_timeout_seconds':timeout};rows.append(row)
 e.save_json(root/(prefix+'-results.json'),rows);e.save_json(root/(prefix+'-source-after.json'),after);e.save_json(root/(prefix+'-files-after.json'),afterfiles);print(row,flush=True);assert row['source_stable'];return code
cmd=['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','svg_circle_replay','--no-run','--message-format=json']
if run('build',cmd,1800,True)!=0:raise SystemExit(1)
artifacts=[json.loads(line) for line in (root/(prefix+'-build.jsonl')).read_text().splitlines()]
binary=next(a['executable'] for a in artifacts if a.get('executable') and a['target']['name']=='svg_circle_replay')
run('circle-svg',[binary,'--nocapture'],300)
lib=Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']=='hypercurve' for f in a['filenames'] if f.endswith('.rlib')))
original=root/(prefix+'-original-circle')
command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/'circle-replay-next-baseline.rs'),'--crate-name','circle_replay_original','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(original)]
if run('original-build',command,120)==0:run('original-positive',[str(original)],120)
point_binary=root/(prefix+'-original-point-location')
command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/'circle-replay-point-location-baseline.rs'),'--crate-name','circle_point_location_original','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(point_binary)]
if run('original-point-build',command,120)==0:run('original-point-positive',[str(point_binary)],120)
run('old-svg',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','svg_selected_replay','--test','svg_parallel_replay','--test','svg_chord_replay','--test','svg_point_replay'],1800)
run('policy-unit',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--lib','circle_replay_and_point_queries_preserve_consumed_policy'],1800)
run('root-svg',['cargo','test','--locked','--release','--all-features','-p','csgrs','--test','svg_circle_replay'],1800)
assert all(row['exit_code']==0 for row in rows)
print('CIRCLE REPLAY PROTOTYPE PASSED',flush=True)
