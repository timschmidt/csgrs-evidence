from pathlib import Path
import subprocess,json,hashlib
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-dynamics-return')
rows=json.loads((p/'candidate-source.json').read_text())
for row in rows:
    assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
assert hashlib.sha256(subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)).hexdigest()=='3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48'
for row in rows:
    name=row['path'];r=subprocess.run(['git','show',':'+name],cwd=root,capture_output=True)
    if r.returncode==0:(root/name).write_bytes(r.stdout)
    else:
        assert name=='crates/hyperdynamics/tests/provider_errors.rs'
        (root/name).unlink()
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==b''
assert hashlib.sha256(subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)).hexdigest()=='3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48'
(p/'restored-original-extraction.json').write_text(json.dumps(dict(restored_paths=len(rows),staged_patch_sha256='3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48',unstaged_diff=''),indent=2)+'\n')
print('original extraction restored; main and sibling repositories untouched')
