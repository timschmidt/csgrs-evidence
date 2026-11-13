from pathlib import Path
import subprocess,os,json,hashlib
p=Path(__file__).parent;root=Path('/mnt/development/csgrs');source=Path('/mnt/development/csgrs-taylor');state=json.loads((p/'SOURCE_FINAL.json').read_text());paths=[r['path'] for r in state['paths']]
def git(repo,*args,env=None):return subprocess.check_output(['git',*args],cwd=repo,env=env)
assert git(root,'rev-parse','HEAD').decode().strip()==state['base']
assert git(root,'diff','--cached','--binary')==(p/'pending-dynamics.patch').read_bytes()
for row in state['paths']:assert hashlib.sha256((source/row['path']).read_bytes()).hexdigest()==row['sha256']
for row in json.loads((p/'combined-state.json').read_text()):assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['combined_sha256']
original=git(root,'write-tree').decode().strip()
subprocess.run(['git','add','--',*paths],cwd=source,check=True)
assert not git(source,'diff','--binary')
source_tree=git(source,'write-tree').decode().strip()
index=Path('/tmp/interval-refactor/taylor-combined-index');env={**os.environ,'GIT_INDEX_FILE':str(index)}
subprocess.run(['git','read-tree',original],cwd=root,env=env,check=True)
subprocess.run(['git','add','--',*paths],cwd=root,env=env,check=True)
combined=git(root,'write-tree',env=env).decode().strip()
assert git(root,'diff','--cached','--binary')==(p/'pending-dynamics.patch').read_bytes()
record=dict(original_staged_tree=original,source_tree=source_tree,combined_tree=combined)
(p/'prepared-trees.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record,indent=2))
