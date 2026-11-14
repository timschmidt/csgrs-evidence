from pathlib import Path
import subprocess,json,hashlib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-evolution')
while Path('/proc/2802101/cmdline').exists():
 try:cmd=Path('/proc/2802101/cmdline').read_bytes()
 except FileNotFoundError:break
 if b'taylor-evolution/build-controls.py' not in cmd:break
 time.sleep(1)
rows=json.loads((s/'control-builds.json').read_text());assert len(rows)==6 and all(x['returncode']==0 for x in rows)
subprocess.run(['python3','-B',str(s/'inspect-controls.py'),'candidate'],check=True)
controls=json.loads((s/'candidate-inspected-controls.json').read_text());assert len(controls)==3
assert all(not x['allocated_differences_except_build_id'] and x['canonical_function_layout_equal'] for x in controls),controls
m=json.loads((s/'SOURCE.json').read_text())
for x in m['files']:assert hashlib.sha256((r/x['path']).read_bytes()).hexdigest()==x['sha256'],x['path']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==m['base']
subprocess.run(['git','diff','--check'],cwd=r,check=True)
subprocess.run(['git','add','--',*[x['path'] for x in m['files']]],cwd=r,check=True)
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','--cached','--binary'],cwd=r))
subprocess.run(['git','commit','-m','Compose validated Taylor endpoints across finite horizons'],cwd=r,check=True)
m['commit']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();(s/'SOURCE.json').write_text(json.dumps(m,indent=2)+'\n')
assert subprocess.check_output(['git','status','--porcelain'],cwd=r)==b''
subprocess.run(['python3','-B',str(s/'integrate.py')],check=True)
subprocess.run(['python3','-B',str(s/'validate-main.py')],check=True)
subprocess.run(['python3','-B',str(s/'run-timing.py')],check=True)
print('controls, source commit, integration, main checks and timings complete',flush=True)
