from pathlib import Path
import json,os,signal,subprocess,time
s=Path(__file__).parent;b=s.parent;held=False;records=[]
def save(n,v):(s/n).write_text(json.dumps(v,indent=2)+'\n')
def state(pid,start):
 p=Path(f'/proc/{pid}/stat')
 if not p.exists():return None
 raw=p.read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
assert json.loads((s/'completion.json').read_text())['exit_code']==0
assert state(1621335,'38218939')=='T'
try:
 for _ in range(120):
  ws=state(3416600,'45823480')
  if ws in [None,'Z','X','S']:break
  time.sleep(.05)
 if ws=='S':
  os.kill(3416600,signal.SIGSTOP);held=True
  for _ in range(20):
   if state(3416600,'45823480')=='T':break
   time.sleep(.05)
  assert state(3416600,'45823480')=='T'
 else:
  assert ws in [None,'Z','X'];terminal=json.loads((b/'coordinated-ci/external-recurrence-watch/result.json').read_text());assert terminal['terminal'] and terminal['reason'].startswith('observation horizon reached');save('watcher-terminal.json',terminal)
 for name in ['analyze','verify']:
  started=time.monotonic()
  with (s/(name+'.log')).open('w') as log:
   result=subprocess.run(['python3',str(s/(name+'.py'))],stdout=log,stderr=subprocess.STDOUT,timeout=300)
  records.append(dict(command=name,exit_code=result.returncode,seconds=time.monotonic()-started,limit_seconds=300));save('analysis-commands.json',records);assert result.returncode==0,name
  print(name,'passed',records[-1]['seconds'],flush=True)
except BaseException as ex:save('analysis-failure.json',dict(terminal=True,error=repr(ex),completed_commands=records));raise
finally:
 assert state(1621335,'38218939')=='T'
 if held:
  assert state(3416600,'45823480')=='T';os.kill(3416600,signal.SIGCONT)
 save('analysis-release.json',dict(time=time.time(),watcher_resumed=held,horizon_reset=False))
