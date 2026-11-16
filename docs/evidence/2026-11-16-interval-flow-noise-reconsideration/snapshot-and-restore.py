from pathlib import Path
import subprocess,os,json,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs')
tracked=['crates/hyperdynamics/Cargo.toml','crates/hyperdynamics/README.md','crates/hyperdynamics/src/field/taylor_flow/noise.rs','crates/hyperdynamics/tests/flow_noise_witness.rs']
new=['crates/hyperdynamics/benches/flow_noise_evolution.rs','crates/hyperdynamics/examples/flow_noise_evolution.rs','crates/hyperdynamics/src/field/taylor_flow/noise/evolution.rs','crates/hyperdynamics/tests/flow_noise_evolution.rs']
def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=root,env=env)
base=git('rev-parse','HEAD').decode().strip();assert base=='da19d12ef60614cab931cce2ea361242b6197a8b'
assert sorted(git('diff','--name-only').decode().splitlines())==sorted(tracked)
assert sorted(git('ls-files','--others','--exclude-standard').decode().splitlines())==sorted(new)
index=s/'snapshot-index';assert not index.exists();env=os.environ|{'GIT_INDEX_FILE':str(index)}
git('read-tree',base,env=env);git('add','--',*tracked,*new,env=env);tree=git('write-tree',env=env).decode().strip()
patch=git('diff','--cached','--binary',base,env=env);(s/'rejected-candidate.patch').write_bytes(patch)
commit=subprocess.check_output(['git','commit-tree',tree,'-p',base],input=b'Unaccepted affine-noise controller reconsideration; rejected on owner runtime\n',cwd=root,env=env).decode().strip()
ref='refs/interval-unaccepted/flow-noise-20261116';git('update-ref',ref,commit,'0'*40)
(s/'unaccepted-snapshot.json').write_text(json.dumps({'ref':ref,'commit':commit,'parent':base,'tree':tree,'patch_sha256':hashlib.sha256(patch).hexdigest(),'paths':tracked+new,'accepted':False},indent=2)+'\n');index.unlink()
git('restore','--source=HEAD','--worktree','--',*tracked)
for name in new:(root/name).unlink()
(root/'crates/hyperdynamics/src/field/taylor_flow/noise').rmdir()
assert not git('status','--porcelain')
(s/'restoration.json').write_text(json.dumps({'head':base,'clean':True,'unaccepted_snapshot':commit},indent=2)+'\n');print(commit,flush=True)
