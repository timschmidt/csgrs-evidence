from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import ast,gzip,hashlib,itertools,json,os,re,shutil,signal,subprocess,time
s=Path(__file__).parent;control=s.parent/'solver-five-repair-resources';rawdir=Path('/dev/shm/interval-five-repair-measurement-transient')
labels=['fixed','current','alpha','linalg','jacobian','domain','four','five'];builds=json.loads((control/'builds.json').read_text());bins={(r['label'],r['features']):r['artifacts']['resource'] for r in builds if not r['reproduction_only']}
sha=lambda b:hashlib.sha256(b).hexdigest()
def save(name,data):(s/name).write_text(json.dumps(data,indent=2)+'\n')
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
for a in bins.values():assert sha(Path(a['path']).read_bytes())==a['sha256']
assert shutil.disk_usage('/mnt/development').free>=20*1024**3 and shutil.disk_usage(s).free>=1024**3
assert shutil.which('prlimit') and not rawdir.exists() and not (s/'completion.json').exists()
jobs=[]
for added in [False,True]:
 for label,case,policy,lifetime,config,warm,repeat in itertools.product(['five'] if added else labels,range(4,7) if added else range(4),['strict','approx'],['reuse','rebuild'],['default','passive','active'],[0,1],range(3)):
  features=','.join((['trace'] if config!='default' else [])+(['added'] if added else []));a=bins[label,features]
  for mode,pattern in [('observe',165),('stack',165),('stack',90),('stack-drop',165),('stack-drop',90)]:
   jobs.append(dict(label=label,case=case,policy=policy,lifetime=lifetime,config=config,warm=warm,repeat=repeat,mode=mode,pattern=pattern,added=added,features=features,binary=a['path'],binary_sha256=a['sha256']))
assert len(jobs)==12600
save('plan.json',dict(processes=len(jobs),workers=6,process_budget_seconds=60,total_budget_seconds=7200,output_limit_bytes=8*1024**2,compressed_submission_threshold=512*1024**2,stage_ceiling_bytes=640*1024**2,jobs=jobs))
assert (s/'plan.json').stat().st_size<16*1024**2
(s/'logs').mkdir();rawdir.mkdir();started=time.monotonic();deadline=started+7200;started_unix=time.time();held=False
stat=Path(f'/proc/{os.getpid()}/stat').read_text();save('active.json',dict(pid=os.getpid(),proc_starttime=stat[stat.rfind(')')+2:].split()[19],started_unix=started_unix,deadline_unix=started_unix+7200,processes=len(jobs)))
def run(index):
 job=jobs[index];command=[job['binary'],str(job['case']),job['mode'],str(job['warm']),str(job['pattern']),'active' if job['config']=='active' else 'passive',job['policy'],job['lifetime']]
 path=rawdir/f'{index:05}.log';began=time.monotonic();left=deadline-began
 if left<=0:return job|dict(index=index,command=command,exit_code=124,external_containment='total deadline before launch',seconds=0)
 containment=None
 with path.open('wb') as f:
  p=subprocess.Popen(['prlimit','--fsize=8388608:8388608','--',*command],stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=min(60,left))
  except subprocess.TimeoutExpired:
   os.killpg(p.pid,signal.SIGKILL);p.wait();code=124;containment='external elapsed timeout'
 raw=path.read_bytes();assert len(raw)<=8*1024**2
 if code==-signal.SIGXFSZ:containment='external output file limit'
 stored=gzip.compress(raw,compresslevel=1,mtime=0);log=s/'logs'/f'{index:05}.log.gz';log.write_bytes(stored);path.unlink()
 row=job|dict(index=index,command=command,exit_code=code,seconds=time.monotonic()-began,log=str(log),raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(stored),stored_sha256=sha(stored),external_containment=containment)
 try:
  text=raw.decode()
  if code==0:
   for key in ['OUTPUT','TRACE','ALLOCATION','USABLE','CLEANUP','USABLE_CLEANUP','INPUT_CLEANUP','INPUT_USABLE_CLEANUP','STACK','HEADROOM']:
    found=re.findall(r'^'+key+r' (.*)$',text,re.M)
    if found:
     assert len(found)==1,(index,key)
     if key in ['OUTPUT','TRACE']:row[key+'_sha256']=sha(found[0].encode())
     else:row[key]=[int(x) for x in found[0].split()] if key=='HEADROOM' else ast.literal_eval(found[0])
   assert 'OUTPUT_sha256' in row and 'TRACE_sha256' in row
   required=['ALLOCATION','USABLE','CLEANUP','USABLE_CLEANUP','INPUT_CLEANUP','INPUT_USABLE_CLEANUP'] if job['mode']=='observe' else ['STACK','HEADROOM']
   assert all(k in row for k in required)
 except BaseException as ex:row['parse_error']=repr(ex)
 return row
done=[];stored_total=0;next_index=0;reason=None
try:
 assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGSTOP);held=True
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T';save('hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 with (s/'observations.jsonl').open('w') as log,ThreadPoolExecutor(max_workers=6) as pool:
  pending={}
  while pending or next_index<len(jobs):
   while len(pending)<6 and next_index<len(jobs) and reason is None:
    if time.monotonic()>=deadline:reason='total deadline';break
    if stored_total>=512*1024**2:reason='compressed log threshold';break
    if log.tell()>=48*1024**2:reason='metadata threshold';break
    pending[pool.submit(run,next_index)]=next_index;next_index+=1
   if not pending:break
   completed,_=wait(pending,timeout=1,return_when=FIRST_COMPLETED)
   for f in completed:
    index=pending.pop(f);row=f.result();done.append(row);stored_total+=row.get('stored_bytes',0);log.write(json.dumps(row)+'\n');log.flush()
    if row['exit_code'] or row.get('parse_error'):reason=reason or 'failed process/control'
   if completed and (len(done)%120<6 or reason):
    status=dict(completed=len(done),planned=len(jobs),failed=sum(bool(r['exit_code'] or r.get('parse_error')) for r in done),stored_bytes=stored_total,elapsed_seconds=time.monotonic()-started,stop_reason=reason)
    save('progress.json',status);print(json.dumps(status),flush=True)
   if reason and not pending:break
 failures=[r['index'] for r in done if r['exit_code'] or r.get('parse_error')]
 for a in bins.values():assert sha(Path(a['path']).read_bytes())==a['sha256']
 result=dict(terminal=True,exit_code=int(bool(failures or reason or len(done)!=len(jobs))),processes=len(done),planned=len(jobs),failed=failures,stop_reason=reason,stored_log_bytes=stored_total,seconds=time.monotonic()-started,images_unchanged=True,admitted=False,timing_claim=False)
 save('completion.json',result);print(json.dumps(result),flush=True);assert result['exit_code']==0
except BaseException as ex:
 if not (s/'completion.json').exists():save('completion.json',dict(terminal=True,exit_code=1,error=repr(ex),processes=len(done),planned=len(jobs),seconds=time.monotonic()-started,admitted=False))
 raise
finally:
 if held:
  assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT)
  save('release.json',dict(time=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
