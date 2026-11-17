from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
from artifact_sizes import native
s=Path(__file__).parent;h=s/'consumer';r=Path('/mnt/development/interval-solver-five-repair/csgrs');control=s.parent/'solver-five-repair-resources';target=Path('/dev/shm/interval-solver-five-repair');art=Path('/dev/shm/interval-five-repair-reused-lifetime-artifacts')
final='4a04dd9744bfecb578963b42fa3bffef5b7062b5';branch='interval-solver-five-repair';four='f65589b44e1a010de75f8129b371ecbf503cc052';started=time.monotonic();deadline=started+3600;rows=[];commands=[];references={};held=False;stored_logs=0
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def save(n,v):(s/n).write_text(json.dumps(v,indent=2)+'\n')
def sha(b):return hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(r),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def run(name,cmd,expected=0,budget=1200,history=False):
 global stored_logs
 left=deadline-time.monotonic();assert left>0 and stored_logs<=512*1024**2 and shutil.disk_usage(r).free>=20*1024**3
 stat=Path(f'/proc/{os.getpid()}/stat').read_text();save('active.json',dict(pid=os.getpid(),proc_starttime=stat[stat.rfind(')')+2:].split()[19],name=name,command=cmd,revision=git('rev-parse','HEAD').decode().strip(),started_unix=time.time(),effective_timeout=min(left,budget)))
 began=time.monotonic();timed_out=False;raw_path=s/(name+'.raw');actual=['prlimit','--fsize=50331648:50331648','--',*cmd] if history else cmd
 with raw_path.open('wb') as log:
  p=subprocess.Popen(actual,cwd=h,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=min(left,budget))
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124;timed_out=True
 raw=raw_path.read_bytes();compressed=gzip.compress(raw,compresslevel=1,mtime=0);path=s/(name+'.log.gz');path.write_bytes(compressed);raw_path.unlink();stored_logs+=len(compressed)
 row=dict(name=name,command=cmd,executed_command=actual,exit_code=code,expected_exit_code=expected,seconds=time.monotonic()-began,timed_out=timed_out,log=path.name,raw_bytes=len(raw),raw_sha256=sha(raw),stored_bytes=len(compressed),stored_sha256=sha(compressed));commands.append(row);save('commands.json',commands);assert code==expected,row
 return raw.decode(),row

def build(label,revision,features,reproduction=False):
 name=label+'-'+(features.replace(',','-') or 'default');cmd=['cargo','+1.95.0','build','--release','--locked','--offline','--bin','solver-five-reused-lifetime']
 if features:cmd+=['--features',features]
 run(name+'-build',cmd);dest=art/name;shutil.copy2(target/'release/solver-five-reused-lifetime',dest);size=native(dest)
 lines=subprocess.check_output(['objdump','-h',str(dest)],text=True).splitlines();allocated=executable=0
 for i,line in enumerate(lines[:-1]):
  fields=line.split()
  if len(fields)>=7 and fields[0].isdigit():
   flags={v.strip() for v in lines[i+1].split(',')}
   if 'ALLOC' in flags:allocated+=int(fields[2],16)
   if 'CODE' in flags:executable+=int(fields[2],16)
 size.update(allocated_bytes=allocated,executable_bytes=executable)
 for suffix,cmd in [('sections',['readelf','-SW']),('symbols',['nm','-S','--defined-only'])]:(s/'listings'/(name+'.'+suffix+'.gz')).write_bytes(gzip.compress(subprocess.check_output([*cmd,str(dest)]),mtime=0))
 row=dict(label=label,revision=revision,features=features,reproduction_only=reproduction,size=size,source_sha256={p.name:sha(p.read_bytes()) for p in h.iterdir() if p.is_file()},histories=[])
 for case in range(7) if 'added' in features else range(4):
  for policy in ['strict','approx']:
   for recording in ['passive','active'] if 'trace' in features else ['passive']:
    for repeat in range(1 if reproduction else 3):
     cname=f'{name}-{case}-{policy}-{recording}-{repeat}';expected=101 if reproduction and case==6 else 0
     text,command=run(cname,[str(dest),str(case),policy,recording,'32'],expected=expected,budget=60,history=True)
     if expected:assert 'qualified ball receipt must remain unresolved' in text
     else:
      lines=text.splitlines();output=[l for l in lines if l.startswith('OUTPUT ')];traces=[l for l in lines if l.startswith('TRACE ')];assert len(output)==len(traces)==32
      assert [l.split(' ',2)[1] for l in output]==list(map(str,range(32)))
      assert len([l for l in lines if l.startswith('CYCLE ')])==32 and len([l for l in lines if l.startswith('SETUP ')])==len([l for l in lines if l.startswith('TEARDOWN ')])==1
      key=(features,case,policy,recording)
      if key in references:
       prior=gzip.decompress((s/references[key]).read_bytes()).decode().splitlines();assert output==[l for l in prior if l.startswith('OUTPUT ')] and traces==[l for l in prior if l.startswith('TRACE ')],(key,'complete history mismatch')
      else:references[key]=command['log']
      cold_label='four-reproduction' if reproduction else label;cold_build=next(v for v in json.loads((control/'builds.json').read_text()) if v['label']==cold_label and v['features']==features)
      cold=next(c for c in cold_build['controls'] if c['kind']=='resource' and c['case']==case and c['policy']==policy and c['recording']==recording)
      old=[l for l in (control/cold['log']).read_text().splitlines() if l.startswith('OUTPUT ')];assert len(old)==1 and output[0].split(' ',2)[2]==old[0][7:]
     row['histories'].append(dict(case=case,policy=policy,recording=recording,repeat=repeat,expected_exit_code=expected,log=command['log']))
 rows.append(row);save('builds.json',rows);print(name,'histories',len(row['histories']),flush=True)
try:
 assert git('rev-parse','HEAD').decode().strip()==final and git('branch','--show-current').decode().strip()==branch and not git('status','--porcelain=v1')
 assert not art.exists() and not (s/'completion.json').exists();assert shutil.disk_usage(s).free>=1024**3
 assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGSTOP);held=True
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T';save('hold.json',dict(started_unix=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False));art.mkdir();(s/'listings').mkdir()
 run('initial-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 git('checkout','--detach',four);build('four-reproduction',four,'trace,added',True)
 boundaries=json.loads((control/'boundaries.json').read_text());save('boundaries.json',boundaries)
 for label,revision in boundaries:
  git('checkout','--detach',revision)
  for features in ['','trace']:build(label,revision,features)
 for features in ['added','trace,added']:build('five',final,features)
 for features in ['','trace','added','trace,added']:
  cmd=['cargo','+1.95.0','clippy','--locked','--offline','--all-targets']
  if features:cmd+=['--features',features]
  run('clippy-'+(features.replace(',','-') or 'default'),cmd+['--','-D','warnings'])
 run('final-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 assert len(rows)==19 and not git('status','--porcelain=v1')
 success=sum(h['expected_exit_code']==0 for row in rows for h in row['histories']);failed=sum(h['expected_exit_code']!=0 for row in rows for h in row['histories']);assert success==726 and failed==4
 save('completion.json',dict(terminal=True,exit_code=0,builds=19,artifacts=19,successful_histories=success,complete_cycles=success*32,expected_failures=failed,full_history_groups=len(references),seconds=time.monotonic()-started,stored_log_bytes=stored_logs,admitted=False,timing_claim=False))
except BaseException as ex:save('completion.json',dict(terminal=True,exit_code=1,error=repr(ex),builds=len(rows),seconds=time.monotonic()-started,admitted=False));raise
finally:
 if held:
  assert not git('status','--porcelain=v1');git('checkout',branch);assert git('rev-parse','HEAD').decode().strip()==final
  assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT)
  save('release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False,restored_revision=final,restored_branch=branch))
