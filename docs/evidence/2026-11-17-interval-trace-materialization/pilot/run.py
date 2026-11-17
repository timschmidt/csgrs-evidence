from pathlib import Path
import gzip,hashlib,itertools,json,os,resource,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-trace-materialization/csgrs');h=s/'consumer';target=Path('/dev/shm/interval-trace-materialization-target');images=Path('/dev/shm/interval-trace-materialization-images');source=r/'crates/hyperreal/src/dispatch_trace.rs';start=time.monotonic();deadline=start+3600;commands=[];builds=[];observations=[];references={};save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');sha=lambda b:hashlib.sha256(b).hexdigest()
env=os.environ|dict(CARGO_TARGET_DIR=str(target),CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1')
original_limit=resource.getrlimit(resource.RLIMIT_FSIZE);resource.setrlimit(resource.RLIMIT_FSIZE,(1024**3,original_limit[1]))
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939';assert not Path('/proc/3416600').exists();assert time.monotonic()<deadline and len(commands)<2000
 assert shutil.disk_usage('/mnt/development').free>=20*1024**3;assert shutil.disk_usage('/tmp').free>=2560*1024**2
 files=[p for p in s.rglob('*') if p.is_file()];assert sum(p.stat().st_size for p in files)<512*1024**2 and sum(p.stat().st_size for p in files if p.suffix=='.gz')<256*1024**2

def run(name,args,cwd=r,cap=1200,executable=None):
 guard();t=time.monotonic();log=s/(name+'.log');timed=False;save('active.json',dict(pid=os.getpid(),name=name,command=args,cwd=str(cwd),direct_child=len(commands)+1,started=time.time(),remaining=deadline-t))
 with log.open('wb') as output:
  p=subprocess.Popen(args,cwd=cwd,env=env,executable=executable,stdout=output,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=(lambda:resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,original_limit[1]))) if executable else None)
  try:p.wait(timeout=min(cap,deadline-t))
  except BaseException as e:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(e,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=log.read_bytes();encoded=gzip.compress(raw,compresslevel=1,mtime=0);log.with_suffix('.log.gz').write_bytes(encoded);log.unlink();c=dict(name=name,command=args,executable=executable,cwd=str(cwd),exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,log=log.with_suffix('.log.gz').name,raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(encoded),stored_sha256=sha(encoded));commands.append(c);save('commands.json',commands);assert p.returncode==0 and not timed,(name,p.returncode,timed);return raw.decode(),c

def git(name,*args):return run(name,['git',*args],cap=60)[0].strip()

assert not (s/'started.json').exists() and not images.exists();images.mkdir();guard();save('started.json',dict(time=time.time(),deadline_seconds=3600,direct_child_limit=2000,source_base='ab81708aa8c44eb895043879162803a964f6ebc5',driver_sha256=sha(Path(__file__).read_bytes()),protocol_sha256=sha((s/'PROTOCOL.md').read_bytes()),sources={n:sha((s/(n+'.rs')).read_bytes()) for n in ['control','batch','incremental']},environment_overrides={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']},original_rlimit_fsize=original_limit,effective_rlimit_fsize=resource.getrlimit(resource.RLIMIT_FSIZE)))
control_revision=None
try:
 assert git('initial-revision','rev-parse','HEAD')=='ab81708aa8c44eb895043879162803a964f6ebc5'
 assert git('initial-branch','branch','--show-current')=='interval-trace-materialization'
 assert git('initial-diff','diff','--name-only')=='crates/hyperreal/src/dispatch_trace.rs'
 assert source.read_bytes()==(s/'control.rs').read_bytes()
 git('control-add','add','crates/hyperreal/src/dispatch_trace.rs');git('control-commit','commit','-m','Test ordered content trace snapshots and take ownership');control_revision=git('control-revision','rev-parse','HEAD')
 run('lock',['cargo','+1.95.0','generate-lockfile','--offline'],cwd=h);run('harness-format',['cargo','+1.95.0','fmt','--all','--','--check'],cwd=h);run('compiler',['rustc','+1.95.0','-Vv'],cap=60)
 configurations=[]
 for n in [0,1,2,12,64,65,256,4096]:
  groups=[0] if n==0 else sorted({1,min(17,n),max(1,n//2),n})
  for g,mode,warm,repeat in itertools.product(groups,['snapshot','take'],[0,8],range(3)):configurations.append(dict(n=n,groups=g,mode=mode,warm=warm,repeat=repeat))
 save('configurations.json',configurations)
 for label in ['control','batch','incremental']:
  if label!='control':
   git(label+'-branch','checkout','-b','interval-trace-'+label,control_revision);source.write_bytes((s/(label+'.rs')).read_bytes());git(label+'-add','add','crates/hyperreal/src/dispatch_trace.rs');git(label+'-commit','commit','-m','Experiment with '+label+' trace materialization')
  revision=git(label+'-revision','rev-parse','HEAD');assert not git(label+'-status','status','--porcelain=v1')
  run(label+'-owner-tests',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hyperreal','--all-features','--lib','dispatch_trace::tests'])
  run(label+'-owner-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hyperreal','--all-features','--all-targets','--','-D','warnings'])
  run(label+'-build',['cargo','+1.95.0','build','--release','--locked','--offline','--bin','trace-materialization'],cwd=h)
  run(label+'-harness-clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'],cwd=h)
  artifact=images/label;shutil.copy2(target/'release/trace-materialization',artifact);image=dict(path=str(artifact),bytes=artifact.stat().st_size,sha256=sha(artifact.read_bytes()));row=dict(label=label,revision=revision,source_sha256=sha(source.read_bytes()),image=image);builds.append(row);save('builds.json',builds)
  for i,config in enumerate(configurations):
   args=[str(config['n']),str(config['groups']),config['mode'],str(config['warm'])];raw,c=run(f'{label}-{i:04}', ['trace-materialization-control',*args],cwd=h,cap=60,executable=str(artifact));output=next(x for x in raw.splitlines() if x.startswith('OUTPUT '));key=tuple(args)
   if key in references:assert references[key]==output,('output mismatch',label,config)
   else:references[key]=output
   observations.append(dict(label=label,config=config,log=c['log']));save('observations.json',observations)
  assert sha(artifact.read_bytes())==image['sha256'];print(label,'completed',len(configurations),'controls',len(commands),'direct children',flush=True)
  patch=run(label+'-patch',['git','diff',control_revision if label!='control' else 'ab81708aa8c44eb895043879162803a964f6ebc5',revision,'--','crates/hyperreal/src/dispatch_trace.rs'],cap=60)[0];(s/(label+'.patch')).write_text(patch)
 run('final-source-format',['rustfmt','+1.95.0','--edition','2024','--check',str(source)],cap=120)
 git('restore-control','checkout','interval-trace-materialization');assert git('restored-revision','rev-parse','HEAD')==control_revision and not git('restored-status','status','--porcelain=v1')
 save('completion.json',dict(exit_code=0,commands=len(commands),controls=len(observations),configurations=len(configurations),images=len(builds),full_output_domains=len(references),control_revision=control_revision,seconds=time.monotonic()-start,restored=True,admitted=False,timing_claim=False))
except BaseException as error:save('completion.json',dict(exit_code=1,error=repr(error),commands=len(commands),controls=len(observations),control_revision=control_revision,seconds=time.monotonic()-start,automatic_retry=False,admitted=False));raise
finally:save('commands.json',commands);save('observations.json',observations)
