from pathlib import Path
import json,subprocess,os,time,hashlib,traceback,signal
s=Path(__file__).parent;r=Path('/mnt/development/interval-firmware-inventory/alumina-firmware');env=os.environ.copy()
for k in ['RUSTFLAGS','RUSTDOCFLAGS','CARGO_TARGET_DIR','RUSTUP_TOOLCHAIN']:env.pop(k,None)
env.update(CARGO_BUILD_JOBS='4',CARGO_INCREMENTAL='0',CARGO_TERM_COLOR='never',CARGO_TARGET_DIR=str(r/'target'))
patch=subprocess.check_output(['git','diff','--binary'],cwd=r);assert patch==(s/'qualification-oracle.patch').read_bytes()
commands=[('msrv-machine-ir-oracle',['cargo','+1.88.0','test','--locked','-p','alumina-machine-ir','--lib']),('current-machine-ir-oracle',['cargo','+1.95.0','test','--locked','-p','alumina-machine-ir','--lib']),('msrv-host-analysis',['cargo','+1.88.0','test','--locked','-p','xtask']),('msrv-owner-clippy',['cargo','+1.88.0','clippy','--locked','-p','alumina-machine-ir','-p','xtask','--all-targets','--','-D','warnings'])]
results=[]
try:
 for name,cmd in commands:
  rec={'id':name,'command':cmd,'cwd':str(r),'source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip(),'patch_sha256':hashlib.sha256(patch).hexdigest(),'started_unix':time.time(),'timeout_seconds':600}
  with (s/(name+'.log')).open('wb') as f:
   p=subprocess.Popen(cmd,cwd=r,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
   (s/'active.json').write_text(json.dumps({**rec,'pid':p.pid,'proc_starttime':Path(f'/proc/{p.pid}/stat').read_text().split()[21]},indent=2)+'\n')
   try:rec['returncode']=p.wait(timeout=600)
   except subprocess.TimeoutExpired:
    os.killpg(p.pid,signal.SIGKILL);p.wait();rec.update(returncode=p.returncode,timed_out=True)
  rec['elapsed_seconds']=time.time()-rec['started_unix'];rec['patch_unchanged']=patch==subprocess.check_output(['git','diff','--binary'],cwd=r);assert rec['patch_unchanged']
  (s/(name+'.json')).write_text(json.dumps(rec,indent=2)+'\n');results.append(rec);print(name,rec['returncode'],round(rec['elapsed_seconds'],2),flush=True)
  assert rec['returncode']==0,name
 (s/'qualification-results.json').write_text(json.dumps(results,indent=2)+'\n')
except BaseException:
 (s/'failure.txt').write_text(traceback.format_exc());raise
finally:
 # Only our recorded qualification patch may be removed from this owned tree.
 assert patch==subprocess.check_output(['git','diff','--binary'],cwd=r)
 subprocess.run(['git','restore','--','crates/alumina-machine-ir/src/lib.rs'],cwd=r,check=True)
 (s/'build-barrier').mkdir(exist_ok=True);(s/'build-barrier/result.json').write_text(json.dumps({'scope':'timing exclusion barrier only','terminal':True,'time':time.time()})+'\n')
