from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development');rows={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence']:
 def git(*args):return subprocess.check_output(['git',*args],cwd=r/name)
 rows[name]=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
assert rows['csgrs']['head']=='6ca8d3d5a43a71b11a0caf1daba3e09d7600b87e';assert rows['csgrs']['staged_sha256']=='d0f3f56e94d54d5f7330111f7bd6051cfe2caaf7ea23b21910b9b2cfaf69f6c0'
(s/'BASELINE.json').write_text(json.dumps(rows,indent=2)+'\n');subprocess.run(['git','worktree','add','--detach',str(r/'csgrs-adaptive-taylor'),rows['csgrs']['head']],cwd=r/'csgrs',check=True)
