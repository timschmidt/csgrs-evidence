from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-boundary/csgrs');start=json.loads((s/'started.json').read_text())['time'];deadline=start+1800
result=s/'integration-completion.json'
try:
 while not (s/'downstream-completion.json').exists() or (s/'downstream-active.json').exists():
  if time.time()>=deadline:raise TimeoutError('Original qualification deadline reached while waiting; no reset')
  time.sleep(3)
 assert json.loads((s/'downstream-completion.json').read_text())['exit_code']==0
 remaining=deadline-time.time();assert remaining>0 and shutil.disk_usage('/mnt/development').free>=20*1024**3
 cmd=['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--test','ordered_field_resultant','--test','ordered_field_resultants']
 env=os.environ|{'CARGO_TARGET_DIR':str(r.parent/'target'),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'};timed=False;t=time.monotonic()
 (s/'integration-active.json').write_text(json.dumps(dict(pid=os.getpid(),command=cmd,budget=min(600,remaining)),indent=2)+'\n')
 with (s/'owner-integration.log').open('w') as log:
  p=subprocess.Popen(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=min(600,remaining))
  except subprocess.TimeoutExpired:timed=True;os.killpg(p.pid,signal.SIGKILL);p.wait()
 record=dict(command=cmd,exit_code=p.returncode,timed_out=timed,seconds=time.monotonic()-t,seconds_since_original_start=time.time()-start,log_sha256=hashlib.sha256((s/'owner-integration.log').read_bytes()).hexdigest(),admitted=False);result.write_text(json.dumps(record,indent=2)+'\n');assert p.returncode==0 and not timed
except BaseException as e:
 if not result.exists():result.write_text(json.dumps(dict(exit_code=1,error=repr(e),seconds_since_original_start=time.time()-start,admitted=False),indent=2)+'\n')
 raise
finally:(s/'integration-active.json').unlink(missing_ok=True)
