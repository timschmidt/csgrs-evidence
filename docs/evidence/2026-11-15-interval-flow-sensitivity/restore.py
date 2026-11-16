from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent
assert json.loads((s/'retained-downstream.json').read_text())['exit_code']==0
paths=['crates/hyperlattice-interval/src/matrix.rs','crates/hyperlattice-interval/tests/cartesian.rs','crates/hyperlattice-interval/tests/no_alloc.rs','crates/hyperlattice-interval/tests/replay.rs']
assert set(subprocess.check_output(['git','diff','--name-only']).decode().splitlines())==set(paths)
rows=[]
for name in paths:
 p=Path(name);candidate=(s/'rejected-matrix'/name).read_bytes();assert p.read_bytes()==candidate
 original=subprocess.check_output(['git','show','HEAD:'+name]);p.write_bytes(original)
 assert p.read_bytes()==original
 rows.append({'path':name,'rejected_sha256':hashlib.sha256(candidate).hexdigest(),'restored_sha256':hashlib.sha256(original).hexdigest()})
assert not subprocess.check_output(['git','status','--porcelain=v1'])
(s/'restoration.json').write_text(json.dumps(rows,indent=2)+'\n');print('restored all four remaining candidate files, worktree clean')
