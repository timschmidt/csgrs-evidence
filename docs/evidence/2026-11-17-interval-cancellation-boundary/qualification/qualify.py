from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-boundary/csgrs');work=r.parent;started=json.loads((s/'started.json').read_text())['time'];commands=[]
env=os.environ|{'CARGO_TARGET_DIR':str(work/'target'),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
def run(name,cmd,cwd=r,budget=600,extra=None):
 remaining=1800-(time.time()-started);assert remaining>0;assert shutil.disk_usage('/mnt/development').free>=20*1024**3
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
 t=time.monotonic();timed=False;save('active.json',dict(pid=os.getpid(),name=name,command=cmd,cwd=str(cwd),budget=min(budget,remaining)))
 with (s/(name+'.log')).open('w') as log:
  p=subprocess.Popen(cmd,cwd=cwd,env=env|(extra or {}),stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=min(budget,remaining))
  except subprocess.TimeoutExpired:timed=True;os.killpg(p.pid,signal.SIGKILL);p.wait()
 row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,timed_out=timed,seconds=time.monotonic()-t,log_sha256=sha(s/(name+'.log')));commands.append(row);save('commands.json',commands);assert not timed and p.returncode==0,(name,p.returncode)
 print(name,'passed',flush=True)
try:
 run('format',['cargo','+1.95.0','fmt','-p','hypersolve'])
 original=(s/'original-tests.rs').read_bytes();assert (r/'crates/hypersolve/src/work_budget/tests.rs').read_bytes().startswith(original)
 run('owner-no-default',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--lib','--no-default-features'])
 run('owner-all-features',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--lib','--all-features'])
 run('owner-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hypersolve','--all-targets','--all-features','--','-D','warnings'])
 run('owner-docs',['cargo','+1.95.0','doc','--locked','--offline','-p','hypersolve','--no-deps','--all-features'],extra={'RUSTDOCFLAGS':'-D warnings'})
 h=s/'candidate-witness';shutil.copytree(s/'witness',h)
 manifest=(h/'Cargo.toml').read_text()
 for name,version in [('hyperreal','0.14.0'),('hyperlattice','0.7.0'),('hyperlimit','0.5.0'),('hypersolve','0.4.0')]:
  before=f'/dev/shm/interval-five-repair-packaged/packages/{name}-{version}';assert before in manifest;manifest=manifest.replace(before,str(r/'crates'/name))
 (h/'Cargo.toml').write_text(manifest)
 assert (h/'main.rs').read_bytes()==(s/'witness/main.rs').read_bytes()
 run('candidate-witness-build',['cargo','+1.95.0','build','--release','--locked','--offline'],h)
 image=work/'target/release/cancellation-boundary-witness';shutil.copy2(image,work/'candidate-witness')
 run('candidate-witness',[str(work/'candidate-witness')],h,20)
 assert 'kind: Cancellation' in (s/'candidate-witness.log').read_text()
 run('format-check',['cargo','+1.95.0','fmt','-p','hypersolve','--','--check'])
 run('whitespace',['git','diff','--check'])
 save('images.json',dict(baseline=dict(path=str(work/'baseline-witness'),sha256=sha(work/'baseline-witness')),candidate=dict(path=str(work/'candidate-witness'),sha256=sha(work/'candidate-witness'))))
 save('completion.json',dict(exit_code=0,seconds_since_campaign_start=time.time()-started,commands=len(commands),original_tests_unchanged=True,admitted=False))
except BaseException as e:
 save('completion.json',dict(exit_code=1,error=repr(e),seconds_since_campaign_start=time.time()-started,commands=len(commands),admitted=False));raise
finally:(s/'active.json').unlink(missing_ok=True)
