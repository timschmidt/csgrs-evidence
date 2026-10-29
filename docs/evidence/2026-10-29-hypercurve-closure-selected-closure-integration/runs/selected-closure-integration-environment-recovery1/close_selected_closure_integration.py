from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls'
spec=importlib.util.spec_from_file_location('gate',c/'selected_closure_candidate_gate.py');gate=importlib.util.module_from_spec(spec);spec.loader.exec_module(gate)
q=c/'selected-closure-integration-qualification-final1'
launch=gate.load(c/'selected-closure-integration-qualification-final1-controller.json')
readiness=gate.load(c/'selected-closure-integration-readiness-controller.json')
publication=2563553
while True:
 rows=gate.load(q/'results.json') or []
 assert all(row['exit_code']==0 and row['source_stable'] for row in rows),'Combined qualification failed'
 complete=gate.load(q/'complete.json')
 if complete:assert complete['all_passed'] and complete['groups']==25
 elif not gate.alive(launch['pid']):raise SystemExit('Combined qualification stopped before completion')
 ready=gate.load(c/'selected-closure-integration-ready.json')
 if not ready and not gate.alive(readiness['pid']):raise SystemExit('Predecessor readiness stopped before final admission')
 published=gate.load(r/'prepush-selected-fields/publication-ready.json')
 if not published and not gate.alive(publication):raise SystemExit('Parent publication closeout stopped before its final receipt')
 if complete and ready and published:break
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-closure-integration');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('align_selected_closure_integration.py')
run('probe_polynomial_operations_integration.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_closure_integration.py',action)
print('INTEGRATED SOURCE COMMITTED LOCALLY; FULL PRE-PUSH AND GENERAL GEOMETRIC CLOSURE REMAIN OPEN',flush=True)
