from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
from artifact_sizes import native
s=Path(__file__).parent;h=s/'consumer';r=Path('/mnt/development/interval-solver-five-repair/csgrs');target=Path('/dev/shm/interval-solver-five-repair');art=Path('/dev/shm/interval-five-repair-resource-artifacts')
final='4a04dd9744bfecb578963b42fa3bffef5b7062b5';four='f65589b44e1a010de75f8129b371ecbf503cc052';branch='interval-solver-five-repair'
started=time.monotonic();deadline=started+max(0,json.loads((s/'retry.json').read_text())['original_deadline_unix']-time.time());rows=json.loads((s/'builds.json').read_text());commands=json.loads((s/'commands.json').read_text());held=False
references={};env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def save(n,v):(s/n).write_text(json.dumps(v,indent=2)+'\n')
def git(*args):return subprocess.check_output(['git','-C',str(r),*args])
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def run(name,cmd,cwd=h,expected=0,budget=1200):
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 left=deadline-time.monotonic();assert left>0 and shutil.disk_usage(r).free>=20*1024**3
 raw=Path(f'/proc/{os.getpid()}/stat').read_text();f=raw[raw.rfind(')')+2:].split();save('active.json',dict(pid=os.getpid(),proc_starttime=f[19],name=name,command=cmd,cwd=str(cwd),revision=git('rev-parse','HEAD').decode().strip(),started_unix=time.time(),effective_timeout=min(budget,left)))
 began=time.monotonic();timed_out=False
 with (s/(name+'.log')).open('w') as log:
  p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=min(budget,left))
  except BaseException as ex:
   os.killpg(p.pid,signal.SIGKILL);p.wait()
   if isinstance(ex,subprocess.TimeoutExpired):code=124;timed_out=True
   else:raise
 row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=code,expected_exit_code=expected,seconds=time.monotonic()-began,timed_out=timed_out)
 commands.append(row);save('commands.json',commands);assert code==expected,row
 return (s/(name+'.log')).read_text()
def measure(path,name):
 result=native(path);out=subprocess.check_output(['objdump','-h',str(path)],text=True);allocated=executable=0
 lines=out.splitlines()
 for i,line in enumerate(lines[:-1]):
  f=line.split()
  if len(f)>=7 and f[0].isdigit():
   flags={v.strip() for v in lines[i+1].split(',')}
   if 'ALLOC' in flags:allocated+=int(f[2],16)
   if 'CODE' in flags:executable+=int(f[2],16)
 result.update(allocated_bytes=allocated,executable_bytes=executable)
 for suffix,cmd in [('sections',['objdump','-h']),('symbols',['nm','-S','--defined-only']),('size',['size','-A'])]:
  data=subprocess.check_output([*cmd,str(path)]);(s/'listings'/(name+'.'+suffix+'.gz')).write_bytes(gzip.compress(data,compresslevel=1,mtime=0))
 return result

def build(label,rev,features,reproduction=False):
 name=label+'-'+(features.replace(',','-') or 'default')
 cmd=['cargo','+1.95.0','build','--release','--locked','--offline','--bins']
 if features:cmd+=['--features',features]
 run(name+'-build',cmd)
 row=dict(label=label,revision=rev,features=features,reproduction_only=reproduction,source_sha256={p.name:sha(p) for p in h.iterdir() if p.is_file()},artifacts={},controls=[])
 for kind,binary in [('resource','solver-five-chain-resource'),('lifetime','solver-five-chain-lifetime')]:
  dest=art/(name+'-'+kind)
  if dest.exists():assert sha(dest)==sha(target/'release'/binary)
  else:shutil.copy2(target/'release'/binary,dest)
  row['artifacts'][kind]=measure(dest,name+'-'+kind)
  for case in (range(7) if 'added' in features else range(4)):
   for policy in ['strict','approx']:
    for recording in (['passive','active'] if 'trace' in features else ['passive']):
     control=f'{name}-{kind}-{case}-{policy}-{recording}'
     cmd=[str(dest),str(case),'observe','0','165',recording,policy,'reuse'] if kind=='resource' else [str(dest),str(case),policy,recording,'32']
     expected=101 if reproduction and case==6 else 0
     text=run(control,cmd,expected=expected,budget=60)
     out=[l for l in text.splitlines() if l.startswith('OUTPUT ')];traces=[l for l in text.splitlines() if l.startswith('TRACE ')]
     if expected:
      assert 'qualified ball receipt must remain unresolved' in text
     else:
      assert len(out)==1 and len(traces)==(1 if kind=='resource' else 32)
      key=(kind,case,policy,features,recording)
      if key in references:assert references[key]==(out,traces),(label,key,'full output/trace mismatch')
      else:references[key]=(out,traces)
     row['controls'].append(dict(kind=kind,case=case,policy=policy,recording=recording,expected_exit_code=expected,log=control+'.log',command=cmd,full_output_trace_sha256=hashlib.sha256(('\n'.join(out+traces)).encode()).hexdigest() if not expected else None))
 rows.append(row);save('builds.json',rows);print(name,'images',len(row['artifacts']),'controls',len(row['controls']),flush=True)
try:
 assert not (s/'completion.json').exists() and git('rev-parse','HEAD').decode().strip()==final and git('branch','--show-current').decode().strip()==branch and not git('status','--porcelain=v1')
 assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGSTOP);held=True
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T';save('hold.json',dict(started_unix=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 assert art.is_dir() and (s/'listings').is_dir()
 for row in rows:
  assert row['label']=='four-reproduction' and row['revision']==four
  assert row['source_sha256']=={p.name:sha(p) for p in h.iterdir() if p.is_file()}
  for a in row['artifacts'].values():assert sha(a['path'])==a['sha256']
  for c in row['controls']:
   if c['expected_exit_code']==0:
    lines=(s/c['log']).read_text().splitlines();key=(c['kind'],c['case'],c['policy'],row['features'],c['recording']);assert key not in references;references[key]=([l for l in lines if l.startswith('OUTPUT ')],[l for l in lines if l.startswith('TRACE ')])
 run('initial-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 assert len(rows)==1  # Reuse the verified, completed reproduction without rerunning it.
 boundaries=[('fixed','c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'),('current','ee4932b4cf8482e6d4d4672833395fd937e8047f')]
 boundaries += [(x['component'],x['composed_revision']) for x in json.loads((s.parent/'solver-combined-admission/component-boundaries.json').read_text())]
 boundaries += [('four',four),('five',final)]
 save('boundaries.json',boundaries)
 for label,rev in boundaries:
  git('checkout','--detach',rev)
  for features in ['', 'trace']:build(label,rev,features)
 for features in ['added','trace,added']:build('five',final,features)
 for features in ['', 'trace','added','trace,added']:
  cmd=['cargo','+1.95.0','clippy','--offline','--locked','--all-targets']
  if features:cmd+=['--features',features]
  cmd+=['--','-D','warnings'];run('clippy-'+(features.replace(',','-') or 'default'),cmd)
 run('final-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 assert not git('status','--porcelain=v1') and len(rows)==19 and time.monotonic()<=deadline
 save('completion.json',dict(terminal=True,exit_code=0,builds=len(rows),artifacts=2*len(rows),successful_controls=sum(c['expected_exit_code']==0 for r in rows for c in r['controls']),expected_failures=sum(c['expected_exit_code']!=0 for r in rows for c in r['controls']),full_output_trace_groups=len(references),seconds=time.monotonic()-started,admitted=False,timing_claim=False))
except BaseException as ex:
 save('completion.json',dict(terminal=True,exit_code=1,error=repr(ex),builds=len(rows),seconds=time.monotonic()-started,admitted=False));raise
finally:
 if held:
  assert not git('status','--porcelain=v1');git('checkout',branch);assert git('rev-parse','HEAD').decode().strip()==final
  assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT)
  save('release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False,restored_revision=final,restored_branch=branch))
