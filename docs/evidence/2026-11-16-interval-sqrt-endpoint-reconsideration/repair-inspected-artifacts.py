from pathlib import Path
import subprocess,json,hashlib,shutil
s=Path(__file__).parent;c=Path('/mnt/development/interval-profile-static/csgrs');art=Path('/mnt/development/.interval-refactor-build/sqrt-endpoint-reconsideration/artifacts')
paths=['crates/hyperinterval/src/lib.rs','crates/hyperinterval/src/state.rs','crates/hypersolve/Cargo.toml','crates/hypersolve/src/real_interval.rs']
assert subprocess.check_output(['git','diff','--name-only'],cwd=c,text=True).splitlines()==sorted(paths)
patch=subprocess.check_output(['git','diff','--binary'],cwd=c);(s/'candidate-tracked-before-artifact-repair.patch').write_bytes(patch)
original={kind:json.loads((s/f'baseline-sqrt-{kind}-artifact.json').read_text()) for kind in ['native','trace']}
expected={kind:json.loads((s/f'candidate-sqrt-{kind}-artifact.json').read_text()) for kind in ['native','trace']}
for label,records in [('baseline',original),('candidate',expected)]:
 for kind in records:
  path=art/f'{label}-sqrt-{kind}';shutil.copy2(path,art/f'{label}-sqrt-{kind}-after-objcopy');records[kind]['after_objcopy_sha256']=hashlib.sha256(path.read_bytes()).hexdigest()
(s/'artifact-inspection-mutation.json').write_text(json.dumps({'baseline':original,'candidate':expected},indent=2)+'\n')
subprocess.run(['git','restore','--source=HEAD','--worktree','--',*paths],cwd=c,check=True)
try:
 for kind in ['native','trace']:
  subprocess.run(['python3',str(s/'build-sqrt.py'),'baseline-reproduced',kind],check=True)
  receipt=json.loads((s/f'baseline-reproduced-sqrt-{kind}-artifact.json').read_text());assert receipt['sha256']==original[kind]['sha256'],(kind,receipt,original[kind]);shutil.copy2(receipt['path'],art/f'baseline-sqrt-{kind}')
finally:
 subprocess.run(['git','apply','--binary','-'],cwd=c,input=patch,check=True)
 assert subprocess.check_output(['git','diff','--binary'],cwd=c)==patch
for kind in ['native','trace']:
 subprocess.run(['python3',str(s/'build-sqrt.py'),'candidate-reproduced',kind],check=True)
 receipt=json.loads((s/f'candidate-reproduced-sqrt-{kind}-artifact.json').read_text());assert receipt['sha256']==expected[kind]['sha256'],(kind,receipt,expected[kind]);shutil.copy2(receipt['path'],art/f'candidate-sqrt-{kind}')
print('all four originally measured artifacts reproduced exactly')
