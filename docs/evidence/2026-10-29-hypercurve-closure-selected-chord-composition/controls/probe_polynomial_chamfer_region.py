from pathlib import Path
import argparse,hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);p.add_argument('--case',action='append');args=p.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-chamfer-dispatch';record=c/('polynomial-chamfer-region-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'contract.json').write_bytes((c/'polynomial-shared-slab-incidence-contract.json').read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent/'hypercurve-polynomial-chamfer-admission')};rows=[]
def run(name,command,timeout):
 assert e.source_snapshot()[0]==source
 started=time.time()
 with (record/(name+'.log')).open('w') as log:
  proc=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'pid':proc.pid,'name':name,'command':command,'epoch':started})
  try:code=proc.wait(timeout=timeout)
  except subprocess.TimeoutExpired:
   os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':timeout,'source_stable':after==source};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert after==source;return code
code=run('build',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','polynomial_region_admission','--no-run','--message-format=json'],1800)
if code:
 e.save_json(record/'complete.json',{'source':source,'all_passed':False,'groups':len(rows),'epoch':time.time()});raise SystemExit(1)
artifacts=[]
for line in (record/'build.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
binary=Path(next(v['executable'] for v in artifacts if v.get('reason')=='compiler-artifact' and v['target']['name']=='polynomial_region_admission' and v.get('executable')))
digest=hashlib.sha256(binary.read_bytes()).hexdigest();e.save_json(record/'attribution.json',{'binary':str(binary),'binary_sha256':digest,'source':source,'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR']}})
listing=subprocess.check_output([str(binary),'--list'],text=True)
tests=args.case or [line.removesuffix(': test') for line in listing.splitlines() if line.endswith(': test')]
assert tests
for test in tests: run(test,[str(binary),test,'--exact','--nocapture'],180)
assert hashlib.sha256(binary.read_bytes()).hexdigest()==digest
e.save_json(record/'complete.json',{'source':source,'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'epoch':time.time()})
