from pathlib import Path
import json,os,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def alive(pid):
 try:
  p=Path('/proc')/str(pid)
  return (p/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
q=c/'selected-polynomial-bounds-qualification-final1';launch=json.loads((c/'selected-polynomial-bounds-qualification-final1-controller.json').read_text())
while not (q/'complete.json').exists():
 rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
 if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):raise SystemExit('Enclosure qualification failed; no finalization')
 if not alive(launch['pid']):raise SystemExit('Enclosure qualification stopped without completion')
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-polynomial-bounds');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('probe_polynomial_operations_bounds.py')
run('probe_polynomial_point_composition_bounds.py')
parent=json.loads((c/'selected-polynomial-joins-closeout-controller.json').read_text())
print('WAIT FOR QUALIFIED PARENT COMMIT',flush=True)
while not (c/'selected-polynomial-joins-final-commit.json').exists():
 if not alive(parent['pid']):raise SystemExit('Parent closeout stopped without a committed increment')
 time.sleep(15)
run('align_selected_polynomial_bounds.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_polynomial_bounds.py',action)
print('ENCLOSURE INCREMENT COMMITTED; GEOMETRIC INTEGRATION REMAINS OPEN',flush=True)
