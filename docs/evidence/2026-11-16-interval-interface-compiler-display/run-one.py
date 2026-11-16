from pathlib import Path
import os,json,subprocess,sys,time,hashlib,signal,fcntl,shutil
s=Path(__file__).parent;manifest=Path(sys.argv[1]);name=sys.argv[2];record=next(x for x in json.loads(manifest.read_text()) if x['id']==name)
out=s/'runs'/name;out.mkdir(parents=True,exist_ok=False)
root=Path(record.get('repository','/mnt/development/csgrs-coordinated-ci'));cwd=root/record.get('cwd','');toolchain=record.get('toolchain','stable')
env=os.environ|{'CARGO_BUILD_JOBS':'16','CARGO_INCREMENTAL':'0','RUST_TEST_THREADS':'8','CARGO_TERM_COLOR':'never','RUSTUP_TOOLCHAIN':toolchain,'CARGO_TARGET_DIR':f'/mnt/development/.interval-refactor-build/coordinated-ci/{toolchain}','RUNNER_TEMP':str(out/'runner-temp'),'GITHUB_WORKSPACE':str(root),'PATH':'/tmp/interval-refactor/coordinated-ci/tool-install/bin:/tmp/interval-refactor/tools/bin:'+os.environ['PATH']}|record.get('env',{})
for key in record.get('unset_env',[]):env.pop(key,None)
Path(env['RUNNER_TEMP']).mkdir();script=out/'command.sh';script.write_text(record['run']+'\n');cmd=['bash','--noprofile','--norc','-e','-o','pipefail',str(script)]
shared_lock=None
if record.get('shared_output_files'):
 shared_lock=(s/'shared-output.lock').open('a');fcntl.flock(shared_lock,fcntl.LOCK_EX)
patch=subprocess.check_output(['git','diff','--binary','HEAD'],cwd=root)
(out/'dirty.patch').write_bytes(patch)
r=record|{'runner_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'manifest_sha256':hashlib.sha256(manifest.read_bytes()).hexdigest(),'tracked_diff_before_sha256':hashlib.sha256(patch).hexdigest(),'command':cmd,'cwd_absolute':str(cwd),'source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'started_unix':time.time(),'environment':{k:env.get(k) for k in ['CARGO_BUILD_JOBS','CARGO_INCREMENTAL','RUST_TEST_THREADS','CARGO_TERM_COLOR','RUSTUP_TOOLCHAIN','CARGO_TARGET_DIR','RUNNER_TEMP','GITHUB_WORKSPACE','RUSTFLAGS','RUSTDOCFLAGS','PATH',*record.get('env',{})]},'script_sha256':hashlib.sha256(script.read_bytes()).hexdigest()}
with (out/'output.log').open('w') as log:
 p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);r['pid']=p.pid;r['proc_starttime']=Path(f'/proc/{p.pid}/stat').read_text().split()[21];(out/'active.json').write_text(json.dumps(r,indent=2)+'\n');print('START',name,'pid',p.pid,flush=True);
 try:
  r['exit_code']=p.wait(timeout=record.get('local_timeout_seconds'))
 except subprocess.TimeoutExpired:
  r['timeout_reached']=True
  try:os.killpg(p.pid,signal.SIGTERM)
  except ProcessLookupError:pass
  try:p.wait(timeout=10)
  except subprocess.TimeoutExpired:
   try:os.killpg(p.pid,signal.SIGKILL)
   except ProcessLookupError:pass
   p.wait()
  try:os.killpg(p.pid,signal.SIGKILL)
  except ProcessLookupError:pass
  r['exit_code']=124
if record.get('shared_output_files'):
 r['retained_outputs']={}
 for output_name in record['shared_output_files']:
  path=root/output_name
  if path.is_file():
   shutil.copy2(path,out/output_name);r['retained_outputs'][output_name]=hashlib.sha256(path.read_bytes()).hexdigest();path.unlink()
if shared_lock:shared_lock.close()
r['source_head_after']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()
r['tracked_diff_after_sha256']=hashlib.sha256(subprocess.check_output(['git','diff','--binary','HEAD'],cwd=root)).hexdigest()
r['source_boundaries_unchanged']=(r['source_head']==r['source_head_after'] and r['tracked_diff_before_sha256']==r['tracked_diff_after_sha256'])
r['elapsed_seconds']=time.time()-r['started_unix'];(out/'result.json').write_text(json.dumps(r,indent=2)+'\n');(out/'active.json').unlink();print('END',name,'exit',r['exit_code'],'seconds',round(r['elapsed_seconds'],2),flush=True);sys.exit(r['exit_code'])
