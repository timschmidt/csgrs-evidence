from pathlib import Path
import hashlib,json,os,shutil,subprocess,time,signal
p=Path(__file__).resolve().parent
FLAGS='--remap-path-prefix=/tmp/csgrs-r12-verification-baseline=/source --remap-path-prefix=/tmp/csgrs-research-2026-10-25/r12/isolated-verification/remapped/probe-baseline=/probe --remap-path-prefix=/tmp/csgrs-research-2026-10-25/r12/isolated-verification/remapped/wasm-baseline=/probe --remap-path-prefix=/tmp/csgrs-r12-verification-candidate=/source --remap-path-prefix=/tmp/csgrs-research-2026-10-25/r12/isolated-verification/remapped/probe-candidate=/probe --remap-path-prefix=/tmp/csgrs-research-2026-10-25/r12/isolated-verification/remapped/wasm-candidate=/probe'
for kind in ['probe','wasm']:
 for v in ['baseline','candidate']:
  d=p/(kind+'-'+v);target=p/('target-'+kind+'-'+v)
  env=dict(os.environ,CARGO_TARGET_DIR=str(target),RUSTFLAGS=FLAGS)
  cmd=['cargo','build','--offline','--locked','--release']+(['--target','wasm32-unknown-unknown'] if kind=='wasm' else [])
  start=time.time()
  with (p/(v+'-'+kind+'-build.log')).open('w') as log:
   proc=subprocess.Popen(cmd,cwd=d,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   try:code=proc.wait(timeout=900)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
  record={'command':cmd,'cwd':str(d),'target':str(target),'RUSTFLAGS':FLAGS,'code':code,'seconds':time.time()-start,'lock_sha256':hashlib.sha256((d/'Cargo.lock').read_bytes()).hexdigest(),'compiler':subprocess.check_output(['rustc','-Vv'],text=True)}
  if code==0:
   binary=p/(v+'-probe'+('.wasm' if kind=='wasm' else ''))
   source=target/('wasm32-unknown-unknown/release/research_tangent_wasm.wasm' if kind=='wasm' else 'release/research_tangent_probe')
   shutil.copy2(source,binary);record.update(binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),binary_bytes=binary.stat().st_size)
   if kind=='probe':record['size']=subprocess.check_output(['size','-A',str(binary)],text=True)
  (p/(v+'-'+kind+'-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(kind,v,code,flush=True)
  if code!=0:raise SystemExit(1)
