from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development');rows={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence']:
 def git(*args):return subprocess.check_output(['git',*args],cwd=r/name)
 rows[name]=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
assert rows['csgrs']['head']=='8c51ff690c1194152b80b4606408cdbdffd35971'
assert rows['csgrs']['staged_sha256']=='e52d18c6c53a33a3037b977bb3f718eca60ff766f474b024748897b7ffef4273'
(s/'BASELINE.json').write_text(json.dumps(rows,indent=2)+'\n')
subprocess.run(['git','worktree','add','--detach',str(r/'csgrs-physics-flow'),rows['csgrs']['head']],cwd=r/'csgrs',check=True)
