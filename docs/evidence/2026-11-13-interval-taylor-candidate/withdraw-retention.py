from pathlib import Path
import subprocess,json,hashlib
p=Path(__file__).parent;root=Path('/mnt/development/csgrs');source=Path('/mnt/development/csgrs-taylor');state=json.loads((p/'SOURCE_FINAL.json').read_text());trees=json.loads((p/'prepared-trees.json').read_text());retained=json.loads((p/'retained-source.json').read_text())
def git(repo,*args):return subprocess.check_output(['git',*args],cwd=repo)
assert git(root,'rev-parse','HEAD').decode().strip()==retained['commit']
assert not git(root,'diff','--binary')
assert git(root,'write-tree').decode().strip()==trees['combined_tree']
assert git(source,'rev-parse','HEAD').decode().strip()==retained['commit'] and not git(source,'status','--porcelain')
for row in json.loads((p/'combined-state.json').read_text()):assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['combined_sha256']
assert git('/mnt/development/alumina-interface','diff','--binary','HEAD')==(p/'pending-interface.patch').read_bytes()
restore=[]
for row in state['paths']:
 path=row['path'];old=subprocess.run(['git','show',trees['original_staged_tree']+':'+path],cwd=root,capture_output=True);restore.append((path,old.stdout if old.returncode==0 else None))
subprocess.run(['git','update-ref','-m','withdraw Taylor retention pending pristine stopped-path cost gates','HEAD',state['base'],retained['commit']],cwd=root,check=True)
subprocess.run(['git','read-tree',trees['original_staged_tree']],cwd=root,check=True)
for path,data in restore:
 target=root/path
 if data is None:target.unlink()
 else:target.write_bytes(data)
assert not git(root,'diff','--binary')
assert git(root,'diff','--cached','--binary')==(p/'pending-dynamics.patch').read_bytes()
assert len(git(root,'diff','--cached','--name-only').splitlines())==40
assert not git(source,'status','--porcelain')
record=dict(candidate_commit=retained['commit'],candidate_worktree=str(source),candidate_clean=True,main_restored_to=state['base'],pending_tree=trees['original_staged_tree'],pending_paths=40,pending_patch_sha256=hashlib.sha256((p/'pending-dynamics.patch').read_bytes()).hexdigest(),interface_unchanged=True,reason='Pristine twelve-pair comparison retains two small statistically adverse stopped-path timings. All correctness/resource/size checks pass; performance retention remains unresolved. Candidate and all earlier observations remain available.')
(p/'retention-withdrawn.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record,indent=2))
