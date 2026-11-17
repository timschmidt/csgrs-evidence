from pathlib import Path
import json,subprocess,sys
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);head=json.loads((s/'initial.json').read_text())['head'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
try:
 for label,rev in [('original',head),('fixed','c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb')]:
  subprocess.run(['git','switch','--detach',rev],cwd=r,check=True);subprocess.run([sys.executable,str(s/'artifacts.py'),label],check=True)
finally:subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
(s/'artifact-controls-complete.json').write_text(json.dumps({'restored_head':head,'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True)},indent=2)+'\n')
