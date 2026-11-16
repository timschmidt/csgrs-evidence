from pathlib import Path
import json,hashlib,subprocess
s=Path(__file__).parent
comparison=json.loads((s/'profile-comparison.json').read_text());assert comparison['decision']=='early-size-rejection'
rows=json.loads((s/'candidate-paths.json').read_text())
for name in ['csgrs','alumina-interface']:
 r=Path('/mnt/development/interval-profile-static')/name
 items=[x for x in rows if x['repo']==name]
 assert all(hashlib.sha256((r/x['path']).read_bytes()).hexdigest()==x['sha256'] for x in items)
 tracked=[x['path'] for x in items if not x['new']]
 subprocess.run(['git','restore','--source=HEAD','--worktree','--',*tracked],cwd=r,check=True)
 for x in items:
  if x['new']:(r/x['path']).unlink()
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
initial=json.loads((s/'initial-state.json').read_text());states={}
for name in ['primary','interface','firmware','isolated','isolated-interface','isolated-firmware']:
 path=initial[name]['path']
 def git(*args):return subprocess.check_output(['git','-C',path,*args])
 state={'head':git('rev-parse','HEAD').decode().strip(),'status':git('status','--porcelain').decode()}
 for kind,args in [('staged',['diff','--cached','--binary']),('unstaged',['diff','--binary'])]:
  state[kind+'_sha256']=hashlib.sha256(git(*args)).hexdigest()
  assert state[kind+'_sha256']==initial[name][kind+'_sha256']
 if name=='isolated':assert state['head']==initial['primary']['head']
 else:assert state['head']==initial[name]['head']
 states[name]=state
(s/'restoration.json').write_text(json.dumps(states,indent=2)+'\n')
print('isolated candidate removed; protected states unchanged')
