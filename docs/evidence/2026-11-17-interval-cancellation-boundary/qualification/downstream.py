from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-boundary/csgrs');start=json.loads((s/'started.json').read_text())['time'];commands=[]
assert json.loads((s/'completion.json').read_text())['exit_code']==0 and not (s/'active.json').exists()
env=os.environ|{'CARGO_TARGET_DIR':str(r.parent/'target'),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
def run(name,cmd,extra=None):
 remaining=1800-(time.time()-start);assert remaining>0;assert shutil.disk_usage('/mnt/development').free>=20*1024**3
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
 t=time.monotonic();timed=False;save('downstream-active.json',dict(pid=os.getpid(),name=name,command=cmd,budget=min(600,remaining)))
 with (s/(name+'.log')).open('w') as log:
  p=subprocess.Popen(cmd,cwd=r,env=env|(extra or {}),stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=min(600,remaining))
  except subprocess.TimeoutExpired:timed=True;os.killpg(p.pid,signal.SIGKILL);p.wait()
 record=dict(name=name,command=cmd,exit_code=p.returncode,timed_out=timed,seconds=time.monotonic()-t,log_sha256=hashlib.sha256((s/(name+'.log')).read_bytes()).hexdigest());commands.append(record);save('downstream-commands.json',commands);assert not timed and p.returncode==0,(name,p.returncode)
 print(name,'passed',flush=True)
try:
 run('curve-format',['cargo','+1.95.0','fmt','-p','hypercurve'])
 assert (r/'crates/hypercurve/tests/work_budget.rs').read_bytes().startswith((s/'original-curve-tests.rs').read_bytes())
 run('curve-cancellation-tests',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypercurve','--test','work_budget','--test','cancellation_release'])
 run('curve-cancellation-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hypercurve','--all-features','--test','work_budget','--test','cancellation_release','--','-D','warnings'])
 run('curve-docs',['cargo','+1.95.0','doc','--locked','--offline','-p','hypercurve','--all-features','--no-deps'],extra={'RUSTDOCFLAGS':'-D warnings'})
 run('final-format',['cargo','+1.95.0','fmt','-p','hypersolve','-p','hypercurve','--','--check'])
 run('final-whitespace',['git','diff','--check'])
 save('downstream-completion.json',dict(exit_code=0,seconds_since_original_start=time.time()-start,original_curve_tests_unchanged=True,admitted=False))
except BaseException as e:
 save('downstream-completion.json',dict(exit_code=1,error=repr(e),seconds_since_original_start=time.time()-start,admitted=False));raise
finally:(s/'downstream-active.json').unlink(missing_ok=True)
