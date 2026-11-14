from pathlib import Path
import subprocess,json,hashlib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-portfolio-cost');pid=2823794
while Path(f'/proc/{pid}/cmdline').exists():
 try:cmd=Path(f'/proc/{pid}/cmdline').read_bytes()
 except FileNotFoundError:break
 if b'dynamics-portfolio-cost/qualify.py' not in cmd:break
 time.sleep(1)
rows=json.loads((s/'qualification.json').read_text());assert len(rows)==7 and all(x['returncode']==0 for x in rows)
assert json.loads((s/'completed-cost-probe.json').read_text())['returncode']==0
assert json.loads((s/'allocation-run.json').read_text())['returncode']==0
m=json.loads((s/'SOURCE.json').read_text())
for x in m['files']:assert hashlib.sha256((r/x['path']).read_bytes()).hexdigest()==x['sha256'],x['path']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==m['base']
subprocess.run(['git','diff','--check'],cwd=r,check=True)
subprocess.run(['git','add','--',*[x['path'] for x in m['files']]],cwd=r,check=True)
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','--cached','--binary'],cwd=r))
subprocess.run(['git','commit','-m','Qualify regridded reachability in completed-flow comparisons'],cwd=r,check=True)
m['commit']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();(s/'SOURCE.json').write_text(json.dumps(m,indent=2)+'\n')
assert subprocess.check_output(['git','status','--porcelain'],cwd=r)==b''
subprocess.run(['python3','-B',str(s/'integrate.py')],check=True)
subprocess.run(['python3','-B',str(s/'validate-main.py')],check=True)
subprocess.run(['python3','-B',str(s/'run-timing.py')],check=True)
print('qualification, source commit, integration, main checks and timings complete',flush=True)
