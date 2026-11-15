import subprocess, os, json, hashlib, tempfile
from pathlib import Path
stage=Path(__file__).parent
primary=Path('/mnt/development/csgrs')
isolated=Path('/mnt/development/csgrs-lattice-facts')
def git(repo,*args,input=None,env=None):
 return subprocess.check_output(['git','-C',str(repo),*args],input=input,env=env)
path='crates/hyperlattice-interval/tests/cartesian.rs'
initial=json.loads((stage/'initial-state.json').read_text())['csgrs']
base=initial['head']
assert git(primary,'rev-parse','HEAD').decode().strip()==base
assert git(isolated,'rev-parse','HEAD').decode().strip()==base
pending=git(primary,'diff','--cached','--binary')
assert hashlib.sha256(pending).hexdigest()==initial['staged_sha256']
assert not git(primary,'diff','--binary')
assert git(isolated,'diff','--name-only').decode().splitlines()==[path]
assert not git(isolated,'ls-files','--others','--exclude-standard')
assert (isolated/path).read_bytes().startswith(git(isolated,'show',base+':'+path))
git(isolated,'diff','--check')
git(isolated,'add','--',path)
git(isolated,'commit','-m','test(interval): cover rectangular products and signed composition')
new=git(isolated,'rev-parse','HEAD').decode().strip()
with tempfile.TemporaryDirectory() as directory:
 env=os.environ.copy();env['GIT_INDEX_FILE']=directory+'/index'
 git(primary,'read-tree',new,env=env)
 git(primary,'apply','--cached','--binary','-',input=pending,env=env)
 expected=git(primary,'write-tree',env=env)
 git(primary,'restore','--source='+new,'--staged','--worktree','--',path)
 assert git(primary,'write-tree')==expected
 git(primary,'update-ref','HEAD',new,base)
assert git(primary,'diff','--cached','--binary')==pending
assert not git(primary,'diff','--binary')
record={'base':base,'source_commit':new,'retained_paths':[path],'pending_paths':41,'pending_patch_sha256':hashlib.sha256(pending).hexdigest(),'expected_index_tree':expected.decode().strip(),'unstaged_empty':True}
(stage/'integration.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record))
