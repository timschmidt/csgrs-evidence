from pathlib import Path
import subprocess,os,json,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/alumina-firmware');base='2d68e82b7341db7b747b20e4ad1455a4c1113a00'
def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=root,env=env)
assert git('rev-parse','HEAD').decode().strip()==base and not git('diff','--cached')
tracked=git('diff','--name-only').decode().splitlines();new=git('ls-files','--others','--exclude-standard').decode().splitlines()
assert tracked==['crates/alumina-foc/src/lib.rs'] and new==['crates/alumina-foc/src/order_image_migration.rs']
assert git('diff','--numstat').decode().split()[:2]==['3','0']
index=s/'tests-snapshot-index';assert not index.exists();env=os.environ|{'GIT_INDEX_FILE':str(index)}
git('read-tree',base,env=env);git('add','--',*tracked,*new,env=env);tree=git('write-tree',env=env).decode().strip()
patch=git('diff','--cached','--binary',base,env=env);(s/'firmware-tests-only.patch').write_bytes(patch)
commit=subprocess.check_output(['git','commit-tree',tree,'-p',base],input=b'Unaccepted FOC order-image witnesses; final test data section exceeds unchanged percentage cap\n',cwd=root,env=env).decode().strip()
ref='refs/interval-unaccepted/foc-order-tests-20261116';git('update-ref',ref,commit,'0'*40);index.unlink()
git('restore','--source=HEAD','--worktree','--',*tracked)
for path in new:(root/path).unlink()
assert not git('status','--porcelain')
r={'repository':'alumina-firmware','ref':ref,'commit':commit,'parent':base,'tree':tree,'patch_sha256':hashlib.sha256(patch).hexdigest(),'paths':tracked+new,'accepted':False,'restored_clean':True,'reason':'File and code fit scoped test allowance; .data.rel.ro +824 bytes / 1.0870712401055416% exceeds unchanged 1% allocated-section cap. No retroactive cap increase.'}
(s/'unaccepted-tests-snapshot.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
