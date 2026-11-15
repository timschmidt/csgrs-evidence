import subprocess,os,json,hashlib,tempfile
from pathlib import Path
stage=Path(__file__).parent
primary=Path('/mnt/development/csgrs');isolated=Path('/mnt/development/csgrs-sdf-voxel-enclosures')
paths=['crates/hypersdf/CHANGELOG.md', 'crates/hypersdf/Cargo.toml', 'crates/hypersdf/README.md', 'crates/hypersdf/src/hypervoxel_adapter.rs', 'crates/hypersdf/src/lib.rs', 'crates/hypersdf/src/hypervoxel_adapter/enclosure.rs', 'crates/hypersdf/tests/voxel_enclosures.rs', 'crates/hypersdf/examples/voxel_enclosures.rs']
def git(repo,*args,input=None,env=None):return subprocess.check_output(['git','-C',str(repo),*args],input=input,env=env)
initial=json.loads((stage/'initial-state.json').read_text())['csgrs'];base=initial['head'].strip()
assert git(primary,'rev-parse','HEAD').decode().strip()==base
assert git(isolated,'rev-parse','HEAD').decode().strip()==base
pending=git(primary,'diff','--cached','--binary');assert hashlib.sha256(pending).hexdigest()==initial['staged_sha256'];assert not git(primary,'diff','--binary')
changed=set(git(isolated,'diff','--name-only').decode().splitlines())|set(git(isolated,'ls-files','--others','--exclude-standard').decode().splitlines())
assert changed==set(paths),changed
assert not set(paths)&set(git(primary,'diff','--cached','--name-only').decode().splitlines())
git(isolated,'diff','--check');git(isolated,'add','--',*paths)
git(isolated,'commit','-m','feat(hypersdf): retain native cell enclosures through voxel intake')
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
