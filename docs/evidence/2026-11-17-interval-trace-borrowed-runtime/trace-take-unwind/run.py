from pathlib import Path
import gzip,hashlib,json,os,resource,shutil,signal,subprocess,time
s=Path(__file__).parent;main=Path('/mnt/development/csgrs');r=Path('/dev/shm/interval-trace-materialization/csgrs');target=Path('/dev/shm/interval-trace-materialization-target');start=time.monotonic();deadline=start+1800;commands=[];names=set();sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');hard=resource.getrlimit(resource.RLIMIT_FSIZE)[1]
env=os.environ|dict(CARGO_TARGET_DIR=str(target),CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1');base='4f41bd58415d936968e1955dbd431f0cb5e988f0';candidate='d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0';source=Path('crates/hyperreal/src/dispatch_trace.rs');marker='    #[test]\n    fn sign_refinement_trace_records_attempt_and_decision_precision_buckets()'
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists();assert time.monotonic()<deadline and len(commands)<100;assert shutil.disk_usage('/mnt/development').free>=20*1024**3 and shutil.disk_usage('/tmp').free>=2560*1024**2;assert sum(p.stat().st_size for p in s.rglob('*') if p.is_file())<128*1024**2

def run(name,args,work=main,cap=900):
 guard();assert name not in names;names.add(name);t=time.monotonic();p=s/(name+'.log');timed=False
 with p.open('wb') as output:
  child=subprocess.Popen(args,cwd=work,env=env,stdout=output,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_FSIZE,(1024**3,hard)));save('active.json',dict(producer=os.getpid(),child=child.pid,name=name,number=len(commands)+1,remaining=deadline-t))
  try:child.wait(timeout=min(cap,deadline-t))
  except BaseException as error:
   os.killpg(child.pid,signal.SIGKILL);child.wait()
   if isinstance(error,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=p.read_bytes();stored=gzip.compress(raw,mtime=0);p.with_suffix('.log.gz').write_bytes(stored);p.unlink();c=dict(name=name,command=args,cwd=str(work),exit_code=child.returncode,timeout=timed,seconds=time.monotonic()-t,log=name+'.log.gz',raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(stored),stored_sha256=sha(stored));commands.append(c);save('commands.json',commands);save('active.json',dict(producer=os.getpid(),child=None));assert child.returncode==0 and not timed,(name,child.returncode);return raw.decode()
def git(name,*args):return run(name,['git',*args],work=r,cap=60).strip()
assert not (s/'started.json').exists();guard();assert load(s.parent/'trace-borrowed-key-runtime/completion.json')['exit_code']==0 and not Path('/proc/283919').exists();save('started.json',dict(time=time.time(),producer=os.getpid(),deadline_seconds=1800,direct_child_limit=100,driver_sha256=sha(Path(__file__).read_bytes()),protocol_sha256=sha((s/'PROTOCOL.md').read_bytes()),environment_overrides={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}))
def prefix(text):return text[:text.index('#[cfg(test)]\nmod tests')]
try:
 assert git('initial-head','rev-parse','HEAD')==base and not git('initial-clean','status','--porcelain=v1')
 before=(s/'primary-before.rs').read_text();addition=(s/'addition.rs').read_text();assert (main/source).read_text()==before.replace(marker,addition+marker)
 run('primary-format-file',['rustfmt','+1.95.0','--edition','2024',str(main/source)],cap=120)
 assert prefix((main/source).read_text())==prefix(before);(s/'primary-after.rs').write_bytes((main/source).read_bytes())
 run('primary-tests',['cargo','+1.95.0','test','--locked','--offline','-p','hyperreal','--all-features','--lib','dispatch_trace::tests'])
 run('primary-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hyperreal','--all-features','--all-targets','--','-D','warnings'])
 git('candidate-branch','checkout','-b','interval-trace-borrowed-unwind',candidate);old=(r/source).read_text();assert old==(s.parent/'trace-borrowed-key-pilot/candidate.rs').read_text();(r/source).write_text(old.replace(marker,addition+marker));run('candidate-format-file',['rustfmt','+1.95.0','--edition','2024',str(r/source)],work=r,cap=120);assert prefix((r/source).read_text())==prefix(old);(s/'candidate-after.rs').write_bytes((r/source).read_bytes())
 git('candidate-add','add',str(source));git('candidate-commit','commit','-m','Cover trace take cleanup when report aggregation unwinds');revision=git('candidate-head','rev-parse','HEAD')
 run('candidate-tests',['cargo','+1.95.0','test','--locked','--offline','-p','hyperreal','--all-features','--lib','dispatch_trace::tests'],work=r)
 run('candidate-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hyperreal','--all-features','--all-targets','--','-D','warnings'],work=r)
 run('primary-format',['cargo','+1.95.0','fmt','--all','--','--check'])
 git('candidate-format','diff','--check');git('restore-control','checkout','interval-trace-materialization');assert git('restored-head','rev-parse','HEAD')==base and not git('restored-clean','status','--porcelain=v1')
 save('completion.json',dict(exit_code=0,revision=revision,commands=len(commands),seconds=time.monotonic()-start,source_restored=True,production_prefixes_unchanged=True,primary_source_sha256=sha((main/source).read_bytes()),candidate_source_sha256=sha((s/'candidate-after.rs').read_bytes()),admitted=False));print('Unwind witness and owner checks passed on both production implementations',flush=True)
except BaseException as error:save('completion.json',dict(exit_code=1,error=repr(error),commands=len(commands),seconds=time.monotonic()-start,automatic_retry=False,admitted=False));raise
finally:save('commands.json',commands)
