import os,signal,subprocess,time,json
from pathlib import Path
s=Path(__file__).parent
root=657687
command=Path(f'/proc/{root}/cmdline').read_bytes().replace(b'\0',b' ').decode()
assert 'cargo' in command and 'test --locked -p hyperreal -p hyperinterval --all-features' in command
paused=[];events=[]
def descendants(pid):
 result=[]
 for task in Path(f'/proc/{pid}/task').glob('*/children'):
  try:children=[int(x) for x in task.read_text().split()]
  except FileNotFoundError:continue
  for child in children:
   if child not in result:result.extend([child,*descendants(child)])
 return sorted(set(result))
start=time.time()
try:
 for _ in range(10):
  targets=[root,*descendants(root)]
  fresh=[pid for pid in targets if pid not in paused]
  if not fresh:break
  for pid in fresh:
   try:
    cmd=Path(f'/proc/{pid}/cmdline').read_bytes().replace(b'\0',b' ').decode()
    os.kill(pid,signal.SIGSTOP);paused.append(pid);events.append({'pid':pid,'command':cmd,'event':'stop','time':time.time()})
   except ProcessLookupError:pass
  time.sleep(0.05)
 for pid in paused:
  state=Path(f'/proc/{pid}/status').read_text().split('State:',1)[1].splitlines()[0]
  assert 'T' in state,(pid,state)
 (s/'timing-paused-processes.json').write_text(json.dumps({'start':start,'events':events},indent=2)+'\n')
 p=subprocess.run(['python3',str(s/'profile-timing.py')],cwd=s)
 code=p.returncode
finally:
 for pid in reversed(paused):
  try:os.kill(pid,signal.SIGCONT);events.append({'pid':pid,'event':'resume','time':time.time()})
  except ProcessLookupError:pass
 (s/'timing-paused-processes.json').write_text(json.dumps({'start':start,'end':time.time(),'events':events,'test_wall_time_includes_pause':True},indent=2)+'\n')
raise SystemExit(code)
