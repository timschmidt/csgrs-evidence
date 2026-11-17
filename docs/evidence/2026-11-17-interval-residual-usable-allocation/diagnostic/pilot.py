from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time
s=Path(__file__).parent
old=Path('/tmp/interval-refactor/residual-certainty-admission')
def save(n,v): (s/n).write_text(json.dumps(v,indent=2)+'\n')
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text(); fields=raw[raw.rfind(')')+2:].split(); assert fields[19]==start; return fields[0]
def limits(): resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))
assert not (s/'pilot.json').exists()
assert not os.environ.get('LD_PRELOAD')
assert state(1621335,'38218939')=='T'
assert state(3416600,'45823480')=='S'
assert hashlib.sha256(Path('/tmp/interval-refactor/coordinated-ci/external-recurrence-watch/watch.py').read_bytes()).hexdigest()=='0605dff88dcf1b7a2bcafb44c9aa0ff0c60e17a13be04bc8580dccc39e29a6b1'
os.kill(3416600,signal.SIGSTOP)
results=[]
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T': break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 save('pilot-hold.json',dict(pid=os.getpid(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',started_unix=time.time()))
 command=['cc','-shared','-fPIC','-O2','-Wall','-Wextra','-Werror',str(s/'malloc_trace.c'),'-o',str(s/'malloc_trace.so')]
 p=subprocess.run(command,capture_output=True,text=True,timeout=30)
 (s/'compile.log').write_text(p.stdout+p.stderr)
 save('compile.json',dict(command=command,exit_code=p.returncode)); assert p.returncode==0
 for name,cmd in [('compiler-version',['cc','--version']),('glibc-version',['ldd','--version'])]:
  (s/(name+'.txt')).write_text(subprocess.check_output(cmd,text=True,timeout=10))
 builds=[r for r in json.loads((old/'resource-builds.json').read_text()) if r['features']=='' and r['label'] in ['fixed','current','candidate']]
 images=[]
 for r in builds:
  binary=r['binary']; assert hashlib.sha256(Path(binary['path']).read_bytes()).hexdigest()==binary['sha256']
  symbols=subprocess.check_output(['nm','-S','-C','--defined-only',binary['path']],text=True,timeout=10)
  symbol=[l for l in symbols.splitlines() if l.endswith(' residual_certainty_resource::allocation::ENABLED')]; assert len(symbol)==1
  fields=symbol[0].split();assert int(fields[1],16)==1
  images.append(dict(label=r['label'],revision=r['revision'],**binary,enabled_symbol=symbol[0],offset=fields[0]))
 save('original-images.json',images)
 for mode in ['plain','interposed']:
  r=images[-1];assert r['label']=='candidate'
  cmd=[r['path'],'24','observe','0','165','passive','strict','rebuild']
  env=dict(os.environ)
  if mode=='interposed':env.update(LD_PRELOAD=str(s/'malloc_trace.so'),RESIDUAL_ENABLED_OFFSET=r['offset'])
  name='pilot-'+mode+'.log'
  with (s/name).open('wb') as out:
   p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=30,preexec_fn=limits)
  results.append(dict(mode=mode,label='candidate',command=cmd,exit_code=p.returncode,log=name));assert p.returncode==0
 save('pilot.json',dict(results=results,exit_code=0))
except BaseException as e:
 save('pilot.json',dict(results=results,exit_code=1,error=repr(e)));raise
finally:
 assert state(1621335,'38218939')=='T' and state(3416600,'45823480')=='T'
 os.kill(3416600,signal.SIGCONT)
 save('pilot-release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
print(json.dumps(results))
