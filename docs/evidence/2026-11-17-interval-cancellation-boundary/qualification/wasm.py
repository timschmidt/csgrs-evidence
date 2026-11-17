from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;work=Path('/dev/shm/interval-cancellation-boundary');start=json.loads((s/'started.json').read_text())['time'];deadline=start+1800;commands=[];images=[]
assert json.loads((s/'integration-completion.json').read_text())['exit_code']==0
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
try:
 for label,original,target in [('baseline',s/'witness',Path('/dev/shm/interval-five-repair-packaged/target/consumer')),('candidate',s/'candidate-witness',work/'target')]:
  h=s/(label+'-wasm');shutil.copytree(original,h);shutil.copy2(s/'wasm-witness.rs',h/'lib.rs');manifest=(h/'Cargo.toml').read_text();manifest+='\n[lib]\npath = "lib.rs"\ncrate-type = ["cdylib"]\n';(h/'Cargo.toml').write_text(manifest)
  env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
  if label=='baseline':env['CARGO_HOME']='/dev/shm/interval-five-repair-packaged/cargo-home'
  for suffix,cmd,cap in [('build',['cargo','+1.95.0','build','--release','--locked','--offline','--lib','--target','wasm32-unknown-unknown'],600),('invoke',['node',str(s/'invoke-wasm.cjs'),str(work/(label+'-witness.wasm')),label],20)]:
   name=label+'-wasm-'+suffix;remaining=deadline-time.time();assert remaining>0 and shutil.disk_usage('/mnt/development').free>=20*1024**3
   save('wasm-active.json',dict(pid=os.getpid(),name=name,command=cmd,budget=min(cap,remaining)));t=time.monotonic();timed=False
   with (s/(name+'.log')).open('w') as log:
    p=subprocess.Popen(cmd,cwd=h,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
    try:p.wait(timeout=min(cap,remaining))
    except subprocess.TimeoutExpired:timed=True;os.killpg(p.pid,signal.SIGKILL);p.wait()
   commands.append(dict(name=name,command=cmd,cwd=str(h),exit_code=p.returncode,timed_out=timed,seconds=time.monotonic()-t,log_sha256=sha(s/(name+'.log'))));save('wasm-commands.json',commands);assert p.returncode==0 and not timed,(name,p.returncode)
   if suffix=='build':
    image=target/'wasm32-unknown-unknown/release/cancellation_boundary_witness.wasm';dest=work/(label+'-witness.wasm');assert not dest.exists();shutil.copy2(image,dest);images.append(dict(label=label,path=str(dest),sha256=sha(dest),bytes=dest.stat().st_size));save('wasm-images.json',images)
   print(name,'passed',flush=True)
 save('wasm-completion.json',dict(exit_code=0,baseline_successes=1,baseline_expected_traps=2,candidate_successes=3,seconds_since_original_start=time.time()-start,admitted=False))
except BaseException as e:
 save('wasm-completion.json',dict(exit_code=1,error=repr(e),seconds_since_original_start=time.time()-start,admitted=False));raise
finally:(s/'wasm-active.json').unlink(missing_ok=True)
