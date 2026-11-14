from pathlib import Path
import json,subprocess,os,hashlib
r=Path('/mnt/development/csgrs');s=Path(__file__).parent;m=json.loads((s/'SOURCE.json').read_text());baseline=json.loads((s/'BASELINE.json').read_text())['csgrs']
def git(*args,env=None,data=None,check=True):
 return subprocess.run(['git',*args],cwd=r,env=env,input=data,capture_output=True,check=check)
assert git('rev-parse','HEAD').stdout.decode().strip()==m['base']
assert git('diff','--binary').stdout==b''
assert hashlib.sha256(git('diff','--cached','--binary').stdout).hexdigest()==baseline['staged_sha256']
before=git('write-tree').stdout.decode().strip();branch=git('symbolic-ref','HEAD').stdout.decode().strip()
index=Path('/tmp/interval-refactor/taylor-model-composition-integration.index');assert not index.exists()
env=os.environ|{'GIT_INDEX_FILE':str(index)}
git('read-tree',before,env=env)
apply=git('apply','--cached','--3way',str(s/'candidate.patch'),env=env,check=False)
(s/'integration-preflight.log').write_bytes(apply.stdout+apply.stderr)
assert apply.returncode==0,apply.stderr.decode()
combined=git('write-tree',env=env).stdout.decode().strip()
patch=git('diff','--binary',before,combined).stdout;(s/'integration.patch').write_bytes(patch)
reverse=git('apply','--cached','--3way','-R',str(s/'candidate.patch'),env=env,check=False)
(s/'integration-reversal.log').write_bytes(reverse.stdout+reverse.stderr)
assert reverse.returncode==0,reverse.stderr.decode()
recovered=git('write-tree',env=env).stdout.decode().strip();assert recovered==before
preflight={'before_index':before,'combined_index':combined,'recovered_index':recovered,'exact_reversal':True,'source_commit':m['commit']}
(s/'integration-preflight.json').write_text(json.dumps(preflight,indent=2)+'\n')
# Apply only the already verified prepared change to the actual index/worktree.
git('apply','--index',str(s/'integration.patch'))
assert git('write-tree').stdout.decode().strip()==combined
git('update-ref',branch,m['commit'],m['base'])
status=git('status','--porcelain').stdout.decode();assert len(status.splitlines())==41
assert git('diff','--binary').stdout==b''
preflight.update(branch=branch,pending_sha256=hashlib.sha256(git('diff','--cached','--binary').stdout).hexdigest(),status=status)
(s/'INTEGRATION.json').write_text(json.dumps(preflight,indent=2)+'\n');index.unlink()
print(json.dumps({k:v for k,v in preflight.items() if k!='status'},indent=2))
