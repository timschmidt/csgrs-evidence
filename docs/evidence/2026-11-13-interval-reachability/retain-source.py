from pathlib import Path
import subprocess,json,hashlib
p=Path(__file__).parent;root=Path('/mnt/development/csgrs');source=Path('/mnt/development/csgrs-reachability');state=json.loads((p/'SOURCE_FINAL.json').read_text());trees=json.loads((p/'prepared-trees.json').read_text())
def git(repo,*args):return subprocess.check_output(['git',*args],cwd=repo)
assert git(root,'rev-parse','HEAD').decode().strip()==state['base']
assert git(root,'diff','--cached','--binary')==(p/'pending-dynamics.patch').read_bytes()
assert git(root,'write-tree').decode().strip()==trees['original_staged_tree']
assert git(source,'write-tree').decode().strip()==trees['source_tree']
assert not git(source,'diff','--binary')
for row in state['paths']:assert hashlib.sha256((source/row['path']).read_bytes()).hexdigest()==row['sha256']
for row in json.loads((p/'combined-state.json').read_text()):assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['combined_sha256']
old_paths=git(root,'diff','--cached','--name-only').splitlines()
checks=json.loads((p/'final-qualification.json').read_text());assert len(checks)==14 and all(r['returncode']==0 for r in checks)
checks=json.loads((p/'downstream-qualification.json').read_text());assert len(checks)==11 and all(r['exit']==0 for r in checks)
assert not any(r['interval_above_one'] for r in json.loads((p/'native-pair-comparison.json').read_text())['rows'])
assert git('/mnt/development/alumina-interface','diff','--binary','HEAD')==(p/'pending-interface.patch').read_bytes()
with (p/'source-commit.log').open('w') as log:subprocess.run(['git','commit','-m','hyperdynamics: certify finite epsilon endpoint covers'],cwd=source,stdout=log,stderr=subprocess.STDOUT,check=True)
commit=git(source,'rev-parse','HEAD').decode().strip();assert git(source,'rev-parse','HEAD^').decode().strip()==state['base']
subprocess.run(['git','update-ref','-m','retain qualified finite reachability source','HEAD',commit,state['base']],cwd=root,check=True)
subprocess.run(['git','read-tree',trees['combined_tree']],cwd=root,check=True)
assert not git(root,'diff','--binary')
assert git(root,'diff','--cached','--name-only').splitlines()==old_paths
assert not git(source,'status','--porcelain')
(p/'pending-dynamics-after.patch').write_bytes(git(root,'diff','--cached','--binary'))
(p/'retained-source.json').write_text(json.dumps(dict(commit=commit,parent=state['base'],source_tree=trees['source_tree'],combined_index_tree=trees['combined_tree'],pending_paths=len(old_paths),pending_preservation='Original staged tree and patch retained; only the three documented overlapping files incorporate accepted additions. All other pending blobs remain identical.',interface_patch_unchanged=True),indent=2)+'\n');print(commit,'retained; pending paths',len(old_paths))
