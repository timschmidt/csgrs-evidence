from pathlib import Path
import json,os,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def alive(pid):
 try:
  p=Path('/proc')/str(pid)
  return (p/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
q=c/'selected-polynomial-points-qualification-final7';launch=json.loads((c/'selected-polynomial-points-qualification-final7-controller.json').read_text())
while not (q/'complete.json').exists():
 rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
 if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):raise SystemExit('Point qualification failed; no finalization')
 if not alive(launch['pid']):raise SystemExit('Point qualification stopped without completion')
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-polynomial-points');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('probe_polynomial_operations_points.py')
run('probe_selected_query_derivative_frontier.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_polynomial_points.py',action)
print('SELECTED POINT/PARAMETER INCREMENT COMMITTED; GENERAL OPERATION CLOSURE REMAINS OPEN',flush=True)
