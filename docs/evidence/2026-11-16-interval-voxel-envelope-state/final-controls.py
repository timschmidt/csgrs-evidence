from pathlib import Path
import subprocess,sys,json,time
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);candidate=json.loads((s/'candidate.json').read_text())['head']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
rows=json.loads((s/'final-inplace.json').read_text());assert len(rows)==3 and all(x['exit_code']==x['runtime_exit_code']==0 for x in rows)
try:
 for label,head in [('current','17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f'),('fixed','c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'),('validated','644732fdf9b6f4995d51635a43743b63b0a034c7')]:
  subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
  subprocess.run([sys.executable,str(s/'final-artifacts.py'),label],check=True)
finally:
 subprocess.run(['git','switch','--detach',candidate],cwd=r,check=True)
(s/'final-controls-complete.json').write_text(json.dumps({'candidate':candidate,'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True),'time':time.time()},indent=2)+'\n')
