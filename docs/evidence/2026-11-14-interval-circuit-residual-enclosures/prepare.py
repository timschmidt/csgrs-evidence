from pathlib import Path
import subprocess,hashlib,json
s=Path(__file__).parent;root=Path('/mnt/development');rows={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence']:
 def git(*args):return subprocess.check_output(['git',*args],cwd=root/name)
 rows[name]=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
assert rows['csgrs']['head']=='e6ecb73b3a904298058f9f280e6d0e1809e8c000'
assert rows['csgrs']['staged_sha256']=='676e5d602a1fbdcc3fc7ff0d15bfb62692ef03f69a5a62f957aa7c7b6697b359'
(s/'BASELINE.json').write_text(json.dumps(rows,indent=2)+'\n')
subprocess.run(['git','worktree','add','--detach',str(root/'csgrs-circuit-residual-enclosures'),rows['csgrs']['head']],cwd=root/'csgrs',check=True)
