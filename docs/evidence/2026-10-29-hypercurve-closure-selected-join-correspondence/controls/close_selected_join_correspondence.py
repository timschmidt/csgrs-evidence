from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def alive(pid):
 try:return (Path('/proc')/str(pid)/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
q=c/'selected-join-correspondence-qualification-final1';launch=json.loads((c/'selected-join-correspondence-qualification-final1-controller.json').read_text())
point_launch=json.loads((c/'selected-polynomial-points-closeout-final7-controller.json').read_text())
while True:
 rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
 if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):raise SystemExit('Selected-field correspondence qualification failed; no finalization')
 if not (q/'complete.json').exists() and not alive(launch['pid']):raise SystemExit('Selected-field correspondence qualification stopped before completion')
 point_done=(c/'selected-polynomial-points-final-commit.json').exists() and not alive(point_launch['pid'])
 if not (c/'selected-polynomial-points-final-commit.json').exists() and not alive(point_launch['pid']):raise SystemExit('Point finalization stopped before commit; selected-field correspondence alignment remains pending')
 if (q/'complete.json').exists() and point_done:break
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-join-correspondence');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('align_selected_join_correspondence.py')
run('probe_polynomial_operations_correspondence.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_join_correspondence.py',action)
print('SELECTED-FIELD CORRESPONDENCE INCREMENT COMMITTED; GENERAL OPERATION CLOSURE REMAINS OPEN',flush=True)
