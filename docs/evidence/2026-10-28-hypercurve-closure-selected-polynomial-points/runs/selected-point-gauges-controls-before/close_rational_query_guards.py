from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def alive(pid):
 try:return (Path('/proc')/str(pid)/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
q=c/'rational-query-guards-qualification-final1';launch=json.loads((c/'rational-query-guards-qualification-final1-controller.json').read_text())
point_launch=json.loads((c/'selected-polynomial-points-closeout-final6-controller.json').read_text())
while True:
 rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
 if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):raise SystemExit('Rational guard qualification failed; no finalization')
 if not (q/'complete.json').exists() and not alive(launch['pid']):raise SystemExit('Rational guard qualification stopped before completion')
 point_done=(c/'selected-polynomial-points-final-commit.json').exists() and not alive(point_launch['pid'])
 if not (c/'selected-polynomial-points-final-commit.json').exists() and not alive(point_launch['pid']):raise SystemExit('Point finalization stopped before commit; rational guard alignment remains pending')
 if (q/'complete.json').exists() and point_done:break
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'rational-query-guards');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('align_rational_query_guards.py')
run('probe_polynomial_operations_guards.py')
for action in ['archive','receipts','check','commit']:run('finalize_rational_query_guards.py',action)
print('RATIONAL QUERY GUARD INCREMENT COMMITTED; GENERAL OPERATION CLOSURE REMAINS OPEN',flush=True)
