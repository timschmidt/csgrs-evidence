from pathlib import Path
import subprocess,sys,json
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root'])
for label,head in [('validated','644732fdf9b6f4995d51635a43743b63b0a034c7'),('original','17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f')]:
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
 subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
 for script in ['build-stack.py','run-stack.py']:subprocess.run([sys.executable,str(s/script),label],check=True)
subprocess.run(['git','switch','--detach','644732fdf9b6f4995d51635a43743b63b0a034c7'],cwd=r,check=True)
(s/'controls-complete.json').write_text(json.dumps({'source_restored':'644732fdf9b6f4995d51635a43743b63b0a034c7'},indent=2)+'\n')
