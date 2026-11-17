from pathlib import Path
import hashlib,json,os,signal,subprocess,time,shutil
s=Path(__file__).parent;q=s.parent/'coordinated-ci';root=Path('/mnt/development/csgrs');watcher=3416600;parent=1621335

def state(pid,expected):
 raw=Path(f'/proc/{pid}/stat').read_text();fields=raw[raw.rfind(')')+2:].split();assert fields[19]==expected;return fields[0]

def save(name,data):(s/name).write_text(json.dumps(data,indent=2)+'\n')
assert state(parent,'38218939')=='T'
assert state(watcher,'45823480') not in ['T','t','Z','X']
assert not (q/'runs/hyperspatial.checks.m00.04/active.json').exists()
os.kill(watcher,signal.SIGSTOP)
assert state(watcher,'45823480')=='T'
source=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip();assert source=='4192d8c726d3333a31cb7eddc30cc0d464d61411'
save('build-hold.json',dict(time=time.time(),watcher=watcher,watcher_start='45823480',parent=parent,parent_start='38218939',source=source,reason='Temporarily suspend recurrence watcher while already-held queue remains stopped; bounded public correctness reproduction, no timed qualification. Resume same watcher in finally; no command/budget resets.'))
rows=[];started=time.monotonic();target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack');env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
try:
 for name,cmd in [('lock',['cargo','+1.95.0','generate-lockfile','--offline']),('fmt',['cargo','+1.95.0','fmt']),('build',['cargo','+1.95.0','build','--release','--locked','--offline']),('clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'])]:
  start=time.monotonic()
  with (s/(name+'.log')).open('w') as out:p=subprocess.run(cmd,cwd=s/'harness',env=env,stdout=out,stderr=subprocess.STDOUT,timeout=900)
  row=dict(name=name,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-start);rows.append(row);save('commands.json',rows);print(name,p.returncode,flush=True);assert p.returncode==0,row
 dest=Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts');dest.mkdir(exist_ok=True);binary=dest/'baseline';shutil.copy2(target/'release/residual-certainty-review',binary)
 save('artifact.json',dict(path=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),source_revision=source,lock_sha256=hashlib.sha256((s/'harness/Cargo.lock').read_bytes()).hexdigest()))
 for case in range(8):
  for name,expected in [('control',0),('witness',101)]:
   cmd=[str(binary),name,str(case)];start=time.monotonic()
   with (s/f'{case}-{name}.log').open('w') as out:p=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,timeout=120)
   row=dict(case=case,name=name,command=cmd,exit_code=p.returncode,expected=expected,seconds=time.monotonic()-start);rows.append(row);save('commands.json',rows);print(case,name,p.returncode,flush=True);assert p.returncode==expected,row
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()==source
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=root)
 save('completion.json',dict(terminal=True,exit_code=0,source=source,controls=8,reproduced_failures=8,seconds=time.monotonic()-started,performance_claim=False))
finally:
 assert state(parent,'38218939')=='T'
 assert state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT)
 save('build-hold-released.json',dict(time=time.time(),watcher=watcher,action='SIGCONT same watcher; held queue remains under original finite watcher horizon',seconds=time.monotonic()-started))
