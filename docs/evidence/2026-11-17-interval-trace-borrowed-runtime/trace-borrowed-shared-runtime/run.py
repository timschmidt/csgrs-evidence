from pathlib import Path
import gzip,hashlib,json,os,resource,shutil,signal,subprocess,time
s=Path(__file__).parent;h=s/'consumer';target=Path('/dev/shm/interval-trace-materialization-target');art=Path('/dev/shm/interval-trace-borrowed-shared-runtime-image');start=time.monotonic();deadline=start+1200;commands=[];names=set();observations=[];sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');cpu=min(os.sched_getaffinity(0));hard=resource.getrlimit(resource.RLIMIT_FSIZE)[1]
env=os.environ|dict(CARGO_TARGET_DIR=str(target),CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1')
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists();assert time.monotonic()<deadline and len(commands)<300;assert shutil.disk_usage('/mnt/development').free>=20*1024**3 and shutil.disk_usage('/tmp').free>=2560*1024**2
 files=[p for p in s.rglob('*') if p.is_file()];assert sum(p.stat().st_size for p in files)<256*1024**2 and sum(p.stat().st_size for p in files if p.suffix=='.gz')<128*1024**2

def child_setup(executable):
 resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2 if executable else 1024**3,hard))
 if executable:os.sched_setaffinity(0,{cpu})

def run(name,args,cap=60,executable=None):
 guard();assert name not in names;names.add(name);t=time.monotonic();log=s/(name+'.log');timed=False
 with log.open('wb') as output:
  p=subprocess.Popen(args,cwd=h,env=env,executable=executable,stdout=output,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=lambda:child_setup(executable));save('active.json',dict(producer=os.getpid(),child=p.pid,name=name,number=len(commands)+1,remaining=deadline-t))
  try:p.wait(timeout=min(cap,deadline-t))
  except BaseException as error:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(error,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=log.read_bytes();stored=gzip.compress(raw,compresslevel=1,mtime=0);log.with_suffix('.log.gz').write_bytes(stored);log.unlink();c=dict(name=name,command=args,cwd=str(h),executable=executable,affinity=[cpu] if executable else None,exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,log=name+'.log.gz',raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(stored),stored_sha256=sha(stored));commands.append(c);save('commands.json',commands);save('active.json',dict(producer=os.getpid(),child=None));assert p.returncode==0 and not timed,(name,p.returncode);return raw.decode(),c

assert load(s.parent/'trace-take-unwind/completion.json')['exit_code']==0 and not Path('/proc/294942').exists();assert load(s.parent/'trace-borrowed-key-runtime/completion.json')['exit_code']==0 and not Path('/proc/283919').exists();assert not (s/'started.json').exists() and not art.exists();art.mkdir();guard();save('started.json',dict(time=time.time(),producer=os.getpid(),deadline_seconds=1200,cpu=cpu,allowed_cpus=sorted(os.sched_getaffinity(0)),direct_child_limit=300,driver_sha256=sha(Path(__file__).read_bytes()),protocol_sha256=sha((s/'PROTOCOL.md').read_bytes()),environment_overrides={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}))
try:
 run('harness-lock',['cargo','+1.95.0','generate-lockfile','--offline'])
 run('format-main',['rustfmt','+1.95.0','--edition','2024',str(h/'main.rs')])
 for name,v in load(s/'sources.json').items():assert (h/name).read_bytes()==Path(v['source']).read_bytes() and sha((h/name).read_bytes())==v['sha256']
 save('harness.json',{p.name:dict(bytes=p.stat().st_size,sha256=sha(p.read_bytes())) for p in h.iterdir() if p.is_file()})
 run('build',['cargo','+1.95.0','build','--release','--locked','--offline'],cap=600)
 run('clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'],cap=600)
 run('format',['cargo','+1.95.0','fmt','--all','--','--check'],cap=600)
 image=art/'shared';shutil.copy2(target/'release/trace-shared-runtime',image);save('build.json',dict(image=dict(path=str(image),bytes=image.stat().st_size,sha256=sha(image.read_bytes()))))
 configs=[dict(n=n,groups=g,length=length,mode=mode,rounds=(1048576+n-1)//n,repeat=rep,order='control-first' if rep%2==0 else 'borrowed-first') for n in [256,4096] for g in [17,n] for length in [5,256] for mode in ['snapshot','take'] for rep in range(12)];assert len(configs)==192;save('configurations.json',configs)
 for i,cfg in enumerate(configs):
  args=[str(cfg[k]) for k in ['n','groups','length','mode','rounds','order']];raw,c=run(f'case-{i:04}',['trace-shared-runtime-control',*args],executable=str(image));lines=raw.splitlines();assert lines[0]=='CONFIG '+' '.join(args) and lines[-1]==f"COMPLETE {cfg['rounds']}";assert lines[1].removeprefix('ITERATION_CONTROL ')==lines[2].removeprefix('ITERATION_BORROWED ');assert sum(x.startswith('BEGIN ') for x in lines)==2;observations.append(dict(config=cfg,log=c['log']));save('observations.json',observations)
 assert sha(image.read_bytes())==load(s/'build.json')['image']['sha256'];save('completion.json',dict(exit_code=0,commands=len(commands),controls=len(observations),seconds=time.monotonic()-start,admitted=False));print('Shared-input runtime:192completed pairs',flush=True)
except BaseException as error:save('completion.json',dict(exit_code=1,error=repr(error),commands=len(commands),controls=len(observations),seconds=time.monotonic()-start,automatic_retry=False,admitted=False));raise
finally:save('commands.json',commands);save('observations.json',observations)
