from pathlib import Path
import argparse,importlib.util,json,os,re,signal,subprocess,sys,time
sys.dont_write_bytecode=True
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=(r/'selected-query-derivatives').resolve();record=c/('selected-query-derivatives-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-query-derivatives-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp')}
rows=[]
def run(name,command,timeout=300,extra_env=None):
 assert e.source_snapshot()[0]==source
 started=time.time();print('START',name,flush=True)
 with (record/(name+'.log')).open('w') as log:
  p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env={**env,**(extra_env or {})},stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'pid':p.pid,'name':name,'command':command,'epoch':started})
  try:code=p.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':timeout,'source_stable':source==after};rows.append(row)
 e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert row['source_stable'];return code
command=['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','selected_query_derivatives','--no-run','--message-format=json']
assert run('compile',command,3600)==0
artifacts=[]
for line in (record/'compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
binary=next(x['executable'] for x in artifacts if x.get('reason')=='compiler-artifact' and x['target']['name']=='selected_query_derivatives' and x.get('executable'))
tests=re.findall(r'^fn (selected_query_\w+)\(\) \{',(w/'crates/hypercurve/tests/selected_query_derivatives.rs').read_text(),re.M)
for name in tests:run(name,[binary,name,'--exact','--nocapture'])
if all(row['exit_code']==0 for row in rows):
 run('predecessors',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','hypercurve_derivative_completeness','--test','selected_polynomial_points','--test','svg_point_replay'],1800)
e.save_json(record/'complete.json',{'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'source':source,'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR']},'epoch':time.time()})
