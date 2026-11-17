from pathlib import Path
import gzip,hashlib,json,os,resource,shutil,signal,subprocess,time
s=Path(__file__).parent;old=s.parent/'trace-materialization-pilot';r=Path('/dev/shm/interval-trace-materialization/csgrs');h=s/'consumer';cwd=old/'consumer';target=Path('/dev/shm/interval-trace-materialization-target');art=Path('/dev/shm/interval-trace-borrowed-key-images');source=r/'crates/hyperreal/src/dispatch_trace.rs';base='4f41bd58415d936968e1955dbd431f0cb5e988f0';start=time.monotonic();deadline=start+1800;commands=[];names=set();observations=[];sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
env=os.environ|dict(CARGO_TARGET_DIR=str(target),CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1');limit=resource.getrlimit(resource.RLIMIT_FSIZE);resource.setrlimit(resource.RLIMIT_FSIZE,(1024**3,limit[1]))
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists();assert time.monotonic()<deadline and len(commands)<500;assert shutil.disk_usage('/mnt/development').free>=20*1024**3 and shutil.disk_usage('/tmp').free>=2560*1024**2
 files=[p for p in s.rglob('*') if p.is_file()];assert sum(p.stat().st_size for p in files)<512*1024**2 and sum(p.stat().st_size for p in files if p.suffix=='.gz')<256*1024**2

def run(name,args,work=r,cap=1200,executable=None):
 guard();assert name not in names;names.add(name);t=time.monotonic();log=s/(name+'.log');timed=False;save('active.json',dict(pid=os.getpid(),name=name,command=args,cwd=str(work),direct_child=len(commands)+1,started=time.time(),remaining=deadline-t))
 with log.open('wb') as output:
  p=subprocess.Popen(args,cwd=work,env=env,executable=executable,stdout=output,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=(lambda:resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,limit[1]))) if executable else None)
  try:p.wait(timeout=min(cap,deadline-t))
  except BaseException as error:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(error,subprocess.TimeoutExpired):timed=True
   else:raise
 raw=log.read_bytes();encoded=gzip.compress(raw,compresslevel=1,mtime=0);log.with_suffix('.log.gz').write_bytes(encoded);log.unlink();c=dict(name=name,command=args,executable=executable,cwd=str(work),exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,log=name+'.log.gz',raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(encoded),stored_sha256=sha(encoded));commands.append(c);save('commands.json',commands);assert p.returncode==0 and not timed,(name,p.returncode);return raw.decode(),c

def git(name,*args):return run(name,['git',*args],cap=60)[0].strip()
assert not (s/'started.json').exists() and not art.exists();art.mkdir();guard();prepared=load(s/'prepared-source.json');assert sha((s/'candidate.rs').read_bytes())==prepared['candidate_sha256'];configs=load(old/'configurations.json');controls=[o for o in load(old/'observations.json') if o['label']=='control'];assert [o['config'] for o in controls]==configs and len(configs)==276
prior_commands={c['log']:c for c in load(old/'commands.json')};baseline=next(b for b in load(old/'builds.json') if b['label']=='control');assert sha(Path(baseline['image']['path']).read_bytes())==baseline['image']['sha256'];save('baseline.json',dict(build=baseline,observations=controls,verification_sha256=sha((old/'verification.json').read_bytes()),source_stage=str(old)));save('configurations.json',configs);save('started.json',dict(time=time.time(),deadline_seconds=1800,direct_child_limit=500,driver_sha256=sha(Path(__file__).read_bytes()),protocol_sha256=sha((s/'PROTOCOL.md').read_bytes()),baseline=base,environment_overrides={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}))
try:
 assert git('initial-head','rev-parse','HEAD')==base and git('initial-branch','branch','--show-current')=='interval-trace-materialization' and not git('initial-clean','status','--porcelain=v1');assert source.read_bytes()==(old/'control.rs').read_bytes()
 git('candidate-branch','checkout','-b','interval-trace-borrowed-key',base);source.write_bytes((s/'candidate.rs').read_bytes());git('candidate-add','add','crates/hyperreal/src/dispatch_trace.rs');git('candidate-commit','commit','-m','Borrow live identity keys for trace report aggregation');revision=git('candidate-head','rev-parse','HEAD');assert not git('candidate-clean','status','--porcelain=v1')
 run('owner-tests',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hyperreal','--all-features','--lib','dispatch_trace::tests'])
 run('owner-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hyperreal','--all-features','--all-targets','--','-D','warnings'])
 run('build',['cargo','+1.95.0','build','--release','--locked','--offline','--bin','trace-materialization'],work=h)
 run('harness-clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'],work=h)
 image=art/'canonical';shutil.copy2(target/'release/trace-materialization',image);build=dict(label='borrowed-key',revision=revision,source_sha256=sha(source.read_bytes()),image=dict(path=str(image),bytes=image.stat().st_size,sha256=sha(image.read_bytes())));save('build.json',build)
 for i,(config,prior) in enumerate(zip(configs,controls,strict=True)):
  args=[str(config['n']),str(config['groups']),config['mode'],str(config['warm'])];raw,c=run(f'control-{i:04}',['trace-materialization-control',*args],work=cwd,cap=60,executable=str(image));p=prior_commands[prior['log']];stored=(old/p['log']).read_bytes();assert sha(stored)==p['stored_sha256'];previous=gzip.decompress(stored);assert sha(previous)==p['raw_sha256'];output=next(x for x in raw.splitlines() if x.startswith('OUTPUT '));assert output==next(x for x in previous.decode().splitlines() if x.startswith('OUTPUT '));observations.append(dict(config=config,log=c['log'],prior_log=prior['log']));save('observations.json',observations)
 assert sha(image.read_bytes())==build['image']['sha256'];run('format',['rustfmt','+1.95.0','--edition','2024','--check',str(source)],cap=120);patch=git('candidate-patch','diff',base,revision,'--','crates/hyperreal/src/dispatch_trace.rs');(s/'candidate.patch').write_text(patch+'\n')
 git('restore-control','checkout','interval-trace-materialization');assert git('restored-head','rev-parse','HEAD')==base and not git('restored-clean','status','--porcelain=v1');save('completion.json',dict(exit_code=0,revision=revision,commands=len(commands),controls=len(observations),full_output_matches=len(observations),seconds=time.monotonic()-start,restored=True,admitted=False,timing_claim=False));print('borrowed keys: owner checks and276full-output controls passed',flush=True)
except BaseException as error:save('completion.json',dict(exit_code=1,error=repr(error),commands=len(commands),controls=len(observations),seconds=time.monotonic()-start,automatic_retry=False,admitted=False));raise
finally:save('commands.json',commands);save('observations.json',observations)
