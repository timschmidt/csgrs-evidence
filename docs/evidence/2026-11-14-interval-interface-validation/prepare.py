from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development');rows={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence']:
 def git(*args):return subprocess.check_output(['git',*args],cwd=r/name)
 rows[name]=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
assert rows['csgrs']['head']=='5e85d4aba169d480469104886429bb3028d06035';assert rows['alumina-interface']['head']=='27086866147cb5db9fb22e6cccc4581a6fea5a02';(s/'BASELINE.json').write_text(json.dumps(rows,indent=2)+'\n')
patch=subprocess.check_output(['git','diff','--binary'],cwd=r/'alumina-interface');(s/'interface-pending.patch').write_bytes(patch)
for name in ['alumina-interface-validation','alumina-interface-validation-base']:
 subprocess.run(['git','worktree','add','--detach',str(r/name),rows['alumina-interface']['head']],cwd=r/'alumina-interface',check=True);subprocess.run(['git','apply',str(s/'interface-pending.patch')],cwd=r/name,check=True)
