from pathlib import Path
import subprocess,os,json,hashlib
s=Path(__file__).parent;records=[]
for name,base,expected_tracked,expected_new in [('csgrs','c17761095a4b24b055825383b780f2ae93dae0bc',4,2),('alumina-interface','32a59de0d69436427e5b97297c4929fd908bf326',1,0)]:
 root=Path('/mnt/development/interval-profile-static')/name
 def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=root,env=env)
 assert git('rev-parse','HEAD').decode().strip()==base
 assert not git('diff','--cached')
 tracked=git('diff','--name-only').decode().splitlines();new=git('ls-files','--others','--exclude-standard').decode().splitlines()
 assert len(tracked)==expected_tracked and len(new)==expected_new,(tracked,new)
 index=s/(name+'-snapshot-index');assert not index.exists();env=os.environ|{'GIT_INDEX_FILE':str(index)}
 git('read-tree',base,env=env);git('add','--',*tracked,*new,env=env);tree=git('write-tree',env=env).decode().strip()
 patch=git('diff','--cached','--binary',base,env=env);(s/(name+'-candidate.patch')).write_bytes(patch)
 commit=subprocess.check_output(['git','commit-tree',tree,'-p',base],input=b'Unaccepted shared sqrt endpoint relocation; repeated rational and exact-square runtime regressions\n',cwd=root,env=env).decode().strip()
 ref='refs/interval-unaccepted/sqrt-endpoint-20261116';git('update-ref',ref,commit,'0'*40)
 record={'repository':name,'ref':ref,'commit':commit,'parent':base,'tree':tree,'patch_sha256':hashlib.sha256(patch).hexdigest(),'paths':tracked+new,'accepted':False};records.append(record);index.unlink()
 git('restore','--source=HEAD','--worktree','--',*tracked)
 for path in new:(root/path).unlink()
 assert not git('status','--porcelain');record['restored_clean']=True
(s/'unaccepted-snapshots.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps(records,indent=2))
# Restore only external consumer locks whose original bytes were saved.
for name in ['profile-probe','wasm-profile']:
 (s/name/'Cargo.lock').write_bytes((s/(name+'-baseline-Cargo.lock')).read_bytes())
