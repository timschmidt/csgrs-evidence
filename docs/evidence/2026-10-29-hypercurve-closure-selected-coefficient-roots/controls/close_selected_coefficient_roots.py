from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-coefficient-roots'
q=c/'selected-coefficient-roots-qualification-final1'
while True:
 if (q/'results.json').exists():
  assert all(x['exit_code']==0 and x['source_stable'] for x in json.loads((q/'results.json').read_text())), 'selected-coefficient qualification failed'
 complete=json.loads((q/'complete.json').read_text()) if (q/'complete.json').exists() else None
 parent=json.loads((c/'selected-closure-integration-final-commit.json').read_text()) if (c/'selected-closure-integration-final-commit.json').exists() else None
 if complete:
  assert complete['all_passed'] and complete['groups']==25
 if complete and parent:break
 time.sleep(15)
for script,args in [('align_selected_coefficient_roots.py',[]),('probe_polynomial_operations_coefficient_roots.py',['--attempt','coefficient-roots-final1'])]+[('finalize_selected_coefficient_roots.py',[action]) for action in ['archive','receipts','check','commit']]:
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=w);print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
print('SELECTED-COEFFICIENT ROOTS COMMITTED LOCALLY; FULL PRE-PUSH AND GENERAL OPERATION CLOSURE REMAIN OPEN',flush=True)
