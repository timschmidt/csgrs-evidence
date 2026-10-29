from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def alive(pid):
 try:return (Path('/proc')/str(pid)/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
q=c/'selected-query-fibers-qualification-final1';launch=json.loads((c/'selected-query-fibers-qualification-final1-controller.json').read_text())
point_launch=json.loads((c/'selected-field-root-discovery-closeout-final5-controller.json').read_text())
while True:
 rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
 if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):raise SystemExit('Dependent-fiber qualification failed; no finalization')
 if not (q/'complete.json').exists() and not alive(launch['pid']):raise SystemExit('Dependent-fiber qualification stopped before completion')
 point_done=(c/'selected-field-root-discovery-final-commit.json').exists() and not alive(point_launch['pid'])
 if not (c/'selected-field-root-discovery-final-commit.json').exists() and not alive(point_launch['pid']):raise SystemExit('Root-discovery finalization stopped before commit; dependent-fiber alignment remains pending')
 if (q/'complete.json').exists() and point_done:break
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-query-fibers');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('align_selected_query_fibers.py')
run('probe_polynomial_operations_query_fibers.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_query_fibers.py',action)
print('DEPENDENT POLYNOMIAL QUERY FIBERS COMMITTED; GENERAL OPERATION CLOSURE REMAINS OPEN',flush=True)
