import subprocess,os,json,hashlib,tempfile
from pathlib import Path
stage=Path(__file__).parent
primary=Path('/mnt/development/csgrs');isolated=Path('/mnt/development/csgrs-voxel-affine-enclosures')
paths=['crates/hyperlattice-interval/Cargo.toml', 'crates/hyperlattice-interval/README.md', 'crates/hyperlattice/Cargo.toml', 'crates/hyperlattice/README.md', 'crates/hypervoxel/Cargo.lock', 'crates/hypervoxel/Cargo.toml', 'crates/hypervoxel/README.md', 'crates/hypervoxel/src/error.rs', 'crates/hypervoxel/src/lib.rs', 'crates/hypervoxel/examples/affine_enclosure.rs', 'crates/hypervoxel/src/affine_enclosure.rs', 'crates/hypervoxel/tests/affine_enclosures.rs']
def git(repo,*args,input=None,env=None):return subprocess.check_output(['git','-C',str(repo),*args],input=input,env=env)
initial=json.loads((stage/'initial-state.json').read_text())['csgrs'];base=initial['head'].strip()
assert git(primary,'rev-parse','HEAD').decode().strip()==base
assert git(isolated,'rev-parse','HEAD').decode().strip()==base
pending=git(primary,'diff','--cached','--binary');assert hashlib.sha256(pending).hexdigest()==initial['staged_sha256'];assert not git(primary,'diff','--binary')
changed=set(git(isolated,'diff','--name-only').decode().splitlines())|set(git(isolated,'ls-files','--others','--exclude-standard').decode().splitlines())
assert changed==set(paths),changed
assert not set(paths)&set(git(primary,'diff','--cached','--name-only').decode().splitlines())
git(isolated,'diff','--check');git(isolated,'add','--',*paths)
git(isolated,'commit','-m','feat(hypervoxel): retain exact sources in affine box enclosures')
new=git(isolated,'rev-parse','HEAD').decode().strip()
with tempfile.TemporaryDirectory() as tmp:
 env=os.environ.copy();env['GIT_INDEX_FILE']=tmp+'/index'
 git(primary,'read-tree',new,env=env);git(primary,'apply','--cached','--binary','-',input=pending,env=env)
 expected=git(primary,'write-tree',env=env)
 git(primary,'restore','--source='+new,'--staged','--worktree','--',*paths)
 assert git(primary,'write-tree')==expected
 git(primary,'update-ref','HEAD',new,base)
assert git(primary,'diff','--cached','--binary')==pending;assert not git(primary,'diff','--binary')
record={'base':base,'source_commit':new,'retained_paths':paths,'pending_paths':41,'pending_patch_sha256':hashlib.sha256(pending).hexdigest(),'expected_index_tree':expected.decode().strip(),'unstaged_empty':True}
(stage/'integration.json').write_text(json.dumps(record,indent=2)+'\n')
(stage/'retained.patch').write_bytes(git(primary,'show','--format=fuller','--binary',new))
print(json.dumps(record))
