from pathlib import Path
import subprocess,json,hashlib,os,tempfile
s=Path(__file__).parent;state=json.loads((s/'initial-state.json').read_text());out=[]
def git(p,*args,**kw):return subprocess.check_output(['git','-C',p,*args],**kw)
for key,kind,count in [('primary','staged',41),('interface','unstaged',8)]:
 v=state[key];p=v['path'];assert git(p,'rev-parse','HEAD').decode().strip()==v['head'];assert git(p,'status','--short').decode()==v['status']
 for args,field in [(('diff','--cached','--binary'),'staged_sha256'),(('diff','--binary'),'unstaged_sha256')]:assert hashlib.sha256(git(p,*args)).hexdigest()==v[field]
 paths=[x.decode() for x in git(p,'diff',*(['--cached'] if kind=='staged' else []),'--name-only','-z').split(b'\0') if x];assert len(paths)==count
 ref='refs/interval-unaccepted/path-dynamics-20261116';assert subprocess.run(['git','-C',p,'show-ref','--verify','--quiet',ref]).returncode==1
 if key=='primary':tree=git(p,'write-tree').decode().strip()
 else:
  (s/'canonical-golden.patch').write_bytes(git(p,'diff','--binary','--','crates/alumina-interface-core/src/machine_profile.rs'))
  with tempfile.TemporaryDirectory(prefix='interval-snapshot-') as temporary:
   env=os.environ|{'GIT_INDEX_FILE':str(Path(temporary)/'index')}
   git(p,'read-tree','HEAD',env=env);git(p,'add','--',*paths,env=env);tree=git(p,'write-tree',env=env).decode().strip()
 message='UNACCEPTED interval path-dynamics snapshot\n\nRecoverable archive of pending work before removal for reproduced cost gates.\nNot qualified for release or retention. See path-dynamics-current-admission evidence.\n'
 commit=git(p,'commit-tree',tree,'-p',v['head'],input=message.encode()).decode().strip();git(p,'update-ref',ref,commit)
 out.append({'repository':p,'parent':v['head'],'tree':tree,'commit':commit,'ref':ref,'paths':paths,'accepted':False})
(s/'unaccepted-snapshots.json').write_text(json.dumps(out,indent=2)+'\n')
# Snapshot both repositories before touching either worktree.
for row in out:
 git(row['repository'],'restore','--source=HEAD','--staged','--worktree','--',*row['paths']);assert not git(row['repository'],'status','--porcelain')
# Preserve the independent canonical witness for separate qualification.
git(state['interface']['path'],'apply',str(s/'canonical-golden.patch'))
# The isolated checkout has only the staged candidate plus the recorded alias edit.
p=state['isolated']['path'];(s/'combined-rejected.patch').write_bytes(git(p,'diff','HEAD','--binary'))
paths=out[0]['paths'];git(p,'restore','--source=HEAD','--staged','--worktree','--',*paths);assert not git(p,'status','--porcelain')
print(json.dumps(out))
