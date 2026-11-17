from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-scope/csgrs');h=s/'consumer';old=s.parent/'solver-cancellation-consumer';target=Path('/dev/shm/interval-cancellation-boundary/target');art=Path('/dev/shm/interval-cancellation-scope-images');start=time.monotonic();deadline=start+max(0,json.loads((s/'continuation.json').read_text())['original_deadline_unix']-time.time());commands=json.loads((s/'commands.json').read_text());images=json.loads((s/'images.json').read_text());observations=json.loads((s/'observations.json').read_text())
save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def guard():
 raw=Path('/proc/1621335/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]=='38218939' and f[0]=='T';assert time.monotonic()<deadline;assert shutil.disk_usage('/mnt/development').free>=20*1024**3

def run(name,cmd,cwd=r,limit=600):
 previous=next((c for c in commands if c['name']==name),None)
 if previous is not None:
  assert previous['command']==cmd and previous['cwd']==str(cwd) and previous['exit_code']==0 and not previous['timeout']
  raw=gzip.decompress((s/previous['log']).read_bytes());assert hashlib.sha256(raw).hexdigest()==previous['log_sha256'];return raw.decode()
 guard();t=time.monotonic();out=s/(name+'.log');timeout=False;save('active.json',dict(pid=os.getpid(),name=name,command=cmd,started=time.time(),deadline_remaining=deadline-t))
 with out.open('wb') as f:
  p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=min(limit,deadline-t))
  except BaseException as ex:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(ex,subprocess.TimeoutExpired):timeout=True
   else:raise
 raw=out.read_bytes();out.with_suffix('.log.gz').write_bytes(gzip.compress(raw,compresslevel=1,mtime=0));out.unlink();row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,timeout=timeout,seconds=time.monotonic()-t,log=name+'.log.gz',log_sha256=hashlib.sha256(raw).hexdigest());commands.append(row)
 if len(commands)%25==0 or not cmd[0].startswith(str(art)):save('commands.json',commands)
 assert not timeout and p.returncode==0,(name,p.returncode)
 return raw.decode()

def full(raw):return '\n'.join(l for l in raw.splitlines() if l.startswith(('OUTPUT ','TRACE ')))
refs={};oldimages={a['path']:(b['label'],b['features']) for b in json.loads((old/'builds.json').read_text()) for k,a in b['artifacts'].items() if k=='resource'}
for c in json.loads((old/'commands.json').read_text()):
 if c['command'][0] not in oldimages or c['exit_code']:continue
 label,features=oldimages[c['command'][0]];key=(label,features,tuple(c['command'][1:]));raw=gzip.decompress((old/c['log']).read_bytes()).decode()
 if key in refs:assert refs[key]==full(raw)
 else:refs[key]=full(raw)
assert art.is_dir();assert hashlib.sha256(subprocess.check_output(['git','diff','--binary'],cwd=r)).hexdigest()==json.loads((s/'started.json').read_text())['source_patch_sha256']
try:
 run('owner-format',['cargo','+1.95.0','fmt','-p','hypersolve','--','--check'])
 for features in ['', 'trace','cancel-retry','trace,cancel-retry']:
  suffix=features.replace(',','-') or 'default';cmd=['cargo','+1.95.0','build','--release','--offline','--locked','--bin','cancellation-resource']
  if features:cmd+=['--features',features]
  run(suffix+'-build',cmd,cwd=h);p=art/suffix
  previous=next((x for x in images if x['features']==features),None)
  if previous is not None:assert sha(p)==previous['sha256']
  else:
   shutil.copy2(target/'release/cancellation-resource',p);images.append(dict(features=features,path=str(p),sha256=sha(p),bytes=p.stat().st_size));save('images.json',images)
  for case in range(7):
   for policy in ['strict','approx']:
    for trace in (['passive','active'] if 'trace' in features else ['passive']):
     configs=[['observe','0','165',trace,policy,'reuse']] if 'cancel-retry' in features else [[mode,str(warm),str(pattern),trace,policy,reuse] for reuse in ['reuse','rebuild'] for warm in [0,1] for mode in ['observe','stack','stack-drop'] for pattern in ([165] if mode=='observe' else [165,90])]
     for config in configs:
      args=[str(case),*config];name='-'.join([suffix,*args]);raw=run(name,[str(p),*args],cwd=h,limit=60)
      label='candidate' if 'cancel-retry' in features else 'baseline';assert full(raw)==refs[(label,features,tuple(args))],('full output/trace',name)
      if 'cancel-retry' not in features:assert full(raw)==refs[('candidate',features,tuple(args))]
      values={}
      for line in raw.splitlines():
       tag,_,value=line.partition(' ')
       if tag in ['STACK','HEADROOM','ALLOCATION','USABLE','CLEANUP','USABLE_CLEANUP','INPUT_CLEANUP','INPUT_USABLE_CLEANUP']:values[tag]=value
      row=dict(features=features,args=args,log=name+'.log.gz',fields=values)
      previous=next((x for x in observations if x['features']==features and x['args']==args),None)
      if previous is not None:assert previous==row
      else:observations.append(row)
  save('observations.json',observations);print(suffix,'controls complete',len(observations),flush=True)
 for features,name in [(['--no-default-features'],'owner-no-default'),(['--all-features'],'owner-all-features')]:run(name,['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--lib',*features])
 run('curve-tests',['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypercurve','--test','work_budget','--test','cancellation_release'])
 run('owner-clippy',['cargo','+1.95.0','clippy','--locked','--offline','-p','hypersolve','--all-targets','--all-features','--','-D','warnings'])
 run('consumer-clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--all-features','--','-D','warnings'],cwd=h)
 run('final-format',['cargo','+1.95.0','fmt','-p','hypersolve','--','--check'])
 save('commands.json',commands);save('completion.json',dict(exit_code=0,seconds=time.monotonic()-start,images=len(images),observations=len(observations),commands=len(commands),admitted=False))
except BaseException as ex:
 save('commands.json',commands);save('observations.json',observations);save('completion.json',dict(exit_code=1,error=repr(ex),seconds=time.monotonic()-start,commands=len(commands),admitted=False));raise
