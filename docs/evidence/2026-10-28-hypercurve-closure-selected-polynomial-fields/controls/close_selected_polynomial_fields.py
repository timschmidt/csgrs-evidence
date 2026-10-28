from pathlib import Path
import json,os,subprocess,sys,time
r=Path(__file__).resolve().parents[1];c=r/'controls';q=c/'selected-polynomial-fields-qualification-final1'
launch=json.loads((c/'selected-polynomial-fields-qualification-final1-controller.json').read_text())
while not (q/'complete.json').exists():
    try:os.kill(launch['pid'],0)
    except ProcessLookupError:raise SystemExit('Qualification stopped without complete receipt')
    rows=json.loads((q/'results.json').read_text()) if (q/'results.json').exists() else []
    if any(row['exit_code'] != 0 or not row['source_stable'] for row in rows):raise SystemExit('Qualification failed; no archive or commit')
    time.sleep(15)
commands=[['python3',str(c/'probe_polynomial_operations_fields.py')]]
commands += [['python3',str(c/'finalize_selected_polynomial_fields.py'),action] for action in ['archive','receipts','check','commit']]
for command in commands:
    print('START',command,flush=True)
    result=subprocess.run(command,cwd=r/'selected-polynomial-fields')
    print('FINISH',result.returncode,flush=True)
    if result.returncode:raise SystemExit(result.returncode)
print('SELECTED FIELD INCREMENT COMMITTED; GEOMETRIC CLOSURE REMAINS OPEN',flush=True)
