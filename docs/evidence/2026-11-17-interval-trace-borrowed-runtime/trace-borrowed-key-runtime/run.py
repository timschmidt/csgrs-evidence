from pathlib import Path
import gzip,hashlib,json,os,resource,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-trace-materialization/csgrs');h=s/'consumer';target=Path('/dev/shm/interval-trace-materialization-target');art=Path('/dev/shm/interval-trace-borrowed-runtime-images');start=time.monotonic();deadline=start+2400;commands=[];names=set();observations=[];builds=[];sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');cpu=min(os.sched_getaffinity(0));hard=resource.getrlimit(resource.RLIMIT_FSIZE)[1]
env=os.environ|dict(CARGO_TARGET_DIR=str(target),CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1')
base='4f41bd58415d936968e1955dbd431f0cb5e988f0';candidate='d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0'
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists();assert time.monotonic()<deadline and len(commands)<1600;assert shutil.disk_usage('/mnt/development').free>=20*1024**3 and shutil.disk_usage('/tmp').free>=2560*1024**2
 files=[p for p in s.rglob('*') if p.is_file()];assert sum(p.stat().st_size for p in files)<256*1024**2 and sum(p.stat().st_size for p in files if p.suffix=='.gz')<128*1024**2

def run(name,args,work=r,cap=60,executable=None):
 guard();assert name not in names;names.add(name);t=time.monotonic();log=s/(name+'.log');timed=False
 def child_setup():
  resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2 if executable else 1024**3,hard))
  if executable:os.sched_setaffinity(0,{cpu})
 with log.open('wb') as output:
  p=subprocess.Popen(args,cwd=work,env=env,executable=executable,stdout=output,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=child_setup)
  save('active.json',dict(producer=os.getpid(),child=p.pid,name=name,number=len(commands)+1,remaining=deadline-t))
  try:p.wait(timeout=min(cap,deadline-t))
  except BaseException as error:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(error,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=log.read_bytes();stored=gzip.compress(raw,compresslevel=1,mtime=0);log.with_suffix('.log.gz').write_bytes(stored);log.unlink();c=dict(name=name,command=args,cwd=str(work),executable=executable,affinity=[cpu] if executable else None,exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,log=name+'.log.gz',raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(stored),stored_sha256=sha(stored));commands.append(c);save('commands.json',commands);save('active.json',dict(producer=os.getpid(),child=None));assert p.returncode==0 and not timed,(name,p.returncode);return raw.decode(),c

def git(name,*args):return run(name,['git',*args])[0].strip()
assert not (s/'started.json').exists() and not art.exists();art.mkdir();guard();save('started.json',dict(time=time.time(),producer=os.getpid(),deadline_seconds=2400,direct_child_limit=1600,cpu=cpu,allowed_cpus=sorted(os.sched_getaffinity(0)),uname=list(os.uname()),driver_sha256=sha(Path(__file__).read_bytes()),protocol_sha256=sha((s/'PROTOCOL.md').read_bytes()),environment_overrides={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}))
try:
 assert git('initial-head','rev-parse','HEAD')==base and not git('initial-clean','status','--porcelain=v1')
 run('harness-format',['rustfmt','+1.95.0','--edition','2024',str(h/'main.rs')],work=h)
 run('harness-lock',['cargo','+1.95.0','generate-lockfile','--offline'],work=h)
 save('harness.json',{p.name:dict(bytes=p.stat().st_size,sha256=sha(p.read_bytes())) for p in h.iterdir() if p.is_file()})
 for label,revision in [('control',base),('borrowed',candidate)]:
  git(label+'-checkout','checkout','--detach',revision);assert git(label+'-head','rev-parse','HEAD')==revision
  run(label+'-build',['cargo','+1.95.0','build','--release','--locked','--offline'],work=h,cap=600)
  run(label+'-clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'],work=h,cap=600)
  p=art/label;shutil.copy2(target/'release/trace-borrowed-runtime',p);builds.append(dict(label=label,revision=revision,source_sha256=sha((r/'crates/hyperreal/src/dispatch_trace.rs').read_bytes()),image=dict(path=str(p),bytes=p.stat().st_size,sha256=sha(p.read_bytes()))));save('builds.json',builds)
 configs=[]
 for n in [1,12,65,256,4096]:
  for groups in sorted({1,min(17,n),n}):
   for length in [5,256]:
    for mode in ['snapshot','take']:configs.append(dict(n=n,groups=groups,length=length,mode=mode,trace='active',rounds=(1048576+n-1)//n))
 for n in [1,4096]:
  for length in [5,256]:
   for mode in ['snapshot','take']:configs.append(dict(n=n,groups=1,length=length,mode=mode,trace='passive',rounds=(1048576+n-1)//n))
 assert len(configs)==56;save('configurations.json',configs)
 for di,cfg in enumerate(configs):
  args=[str(cfg[k]) for k in ['n','groups','length','mode','trace','rounds']]
  expected=[f'ROW pilot|count|p{i:04}'+('x'*(cfg['length']-5))+'|'+str(len(range(i,cfg['n'],cfg['groups']))) for i in range(cfg['groups'])] if cfg['trace']=='active' else []
  for rep in range(12):
   order=['control','borrowed'] if rep%2==0 else ['borrowed','control']
   for label in order:
    raw,c=run(f'case-{di:02}-{rep:02}-{label}',['trace-borrowed-runtime-control',*args],work=h,executable=str(art/label));lines=raw.splitlines();assert lines[4:-1]==expected and lines[-1]==f"COMPLETE {cfg['rounds']}";assert lines[0]=='CONFIG '+' '.join(args)
    observations.append(dict(config=cfg,domain=di,rep=rep,label=label,log=c['log'],cpu_ns=int(lines[1].split()[1]),wall_ns=int(lines[2].split()[1]),clock_resolution_ns=int(lines[3].split()[1])));save('observations.json',observations)
 for b in builds:assert sha(Path(b['image']['path']).read_bytes())==b['image']['sha256']
 run('harness-format-check',['rustfmt','+1.95.0','--edition','2024','--check',str(h/'main.rs')],work=h)
 git('restore-control','checkout','interval-trace-materialization');assert git('restored-head','rev-parse','HEAD')==base and not git('restored-clean','status','--porcelain=v1')
 save('completion.json',dict(exit_code=0,commands=len(commands),controls=len(observations),seconds=time.monotonic()-start,source_restored=True,admitted=False));print('Borrowed runtime screen complete:1344exact completed controls',flush=True)
except BaseException as error:save('completion.json',dict(exit_code=1,error=repr(error),commands=len(commands),controls=len(observations),seconds=time.monotonic()-start,automatic_retry=False,admitted=False));raise
finally:save('commands.json',commands);save('observations.json',observations)
