from pathlib import Path
import json,os,signal,subprocess,time
s=Path(__file__).parent;root=Path('/mnt/development/interval-residual-certainty/csgrs');out=s/'downstream';out.mkdir(exist_ok=False)
assert json.loads((s/'candidate/completion.json').read_text())['exit_code']==0
watcher=3416600;parent=1621335

def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def save(name,data):(out/name).write_text(json.dumps(data,indent=2)+'\n')
assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='S'
os.kill(watcher,signal.SIGSTOP);assert state(watcher,'45823480')=='T'
start=time.monotonic();save('build-hold.json',dict(time=time.time(),watcher=watcher,parent=parent,scope='Affected downstream correctness checks only; no performance claim.'))
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/alpha-proof-stack','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'};rows=[]
try:
 for name,cmd in [('hyperpath',['cargo','+1.95.0','test','--locked','--release','-p','hyperpath','--all-features','--lib','--tests']),('hyperdynamics',['cargo','+1.95.0','test','--locked','--release','-p','hyperdynamics','--all-features','--lib','--tests'])]:
  began=time.monotonic()
  with (out/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800)
  row=dict(name=name,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-began,budget_seconds=1800);rows.append(row);save('commands.json',rows);print(name,p.returncode,flush=True);assert p.returncode==0
 save('completion.json',dict(terminal=True,exit_code=0,seconds=time.monotonic()-start,performance_claim=False))
finally:
 assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT);save('build-hold-released.json',dict(time=time.time(),seconds=time.monotonic()-start,watcher=watcher))
