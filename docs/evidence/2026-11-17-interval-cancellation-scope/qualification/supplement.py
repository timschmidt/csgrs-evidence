from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-scope/csgrs');target=Path('/dev/shm/interval-cancellation-boundary/target');art=Path('/dev/shm/interval-cancellation-scope-images');a=json.loads((s/'active.json').read_text());deadline=a['started']+a['deadline_remaining']-1;commands=[];images=[]
save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1','RUSTDOCFLAGS':'-D warnings'}
def run(name,cmd,cwd=r,limit=600):
 left=deadline-time.time();assert left>0;assert shutil.disk_usage('/mnt/development').free>=20*1024**3;t=time.monotonic();out=s/(name+'.log');timed=False;save('supplement-active.json',dict(pid=os.getpid(),name=name,command=cmd,remaining_seconds=left))
 with out.open('wb') as f:
  p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=min(limit,left))
  except BaseException as ex:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(ex,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=out.read_bytes();out.with_suffix('.log.gz').write_bytes(gzip.compress(raw,mtime=0));out.unlink();commands.append(dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,log=name+'.log.gz',log_sha256=hashlib.sha256(raw).hexdigest()));save('supplement-commands.json',commands);assert p.returncode==0 and not timed,(name,p.returncode)
try:
 while not (s/'completion.json').exists():assert time.time()<deadline;time.sleep(5)
 assert json.loads((s/'completion.json').read_text())['exit_code']==0
 run('owner-resultant-integrations',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--test','ordered_field_resultant','--test','ordered_field_resultants'])
 for kind in ['native','wasm']:
  h=s/('candidate-witness' if kind=='native' else 'candidate-wasm');cmd=['cargo','+1.95.0','build','--release','--locked','--offline']
  if kind=='wasm':cmd+=['--lib','--target','wasm32-unknown-unknown']
  run(kind+'-witness-build',cmd,cwd=h)
  source=target/('release/cancellation-boundary-witness' if kind=='native' else 'wasm32-unknown-unknown/release/cancellation_boundary_witness.wasm');dest=art/('publication-witness'+('' if kind=='native' else '.wasm'));assert not dest.exists();shutil.copy2(source,dest);images.append(dict(kind=kind,path=str(dest),sha256=sha(dest),bytes=dest.stat().st_size));save('witness-images.json',images)
  run(kind+'-witness-invoke',[str(dest)] if kind=='native' else ['node',str(s/'invoke-wasm.cjs'),str(dest),'candidate'],cwd=h,limit=20)
 run('strict-docs',['cargo','+1.95.0','doc','--locked','--offline','--no-deps','--all-features','-p','hypersolve','-p','hypercurve'])
 save('supplement-completion.json',dict(exit_code=0,deadline_unix=deadline,finished=time.time(),remaining_seconds=deadline-time.time(),admitted=False))
except BaseException as ex:
 save('supplement-completion.json',dict(exit_code=1,error=repr(ex),deadline_unix=deadline,finished=time.time(),admitted=False));raise
