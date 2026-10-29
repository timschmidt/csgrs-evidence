from pathlib import Path
import json, subprocess, time
r=Path(__file__).resolve().parents[1]
c=r/'controls'
focus=c/'selected-polynomial-points-fix14'
while not (focus/'complete.json').exists():
    if (focus/'results.json').exists():
        rows=json.loads((focus/'results.json').read_text())
        if any(row['exit_code']!=0 or not row['source_stable'] for row in rows):
            raise SystemExit('Focused point qualification failed; full qualification not started')
    launch=json.loads((c/'selected-polynomial-points-fix14-controller.json').read_text())
    try: alive=(Path('/proc')/str(launch['pid'])/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
    except FileNotFoundError: alive=False
    if not alive: raise SystemExit('Focused point qualification stopped without completion')
    time.sleep(10)
complete=json.loads((focus/'complete.json').read_text())
assert complete['all_passed'] and complete['groups']==23
command=['python3',str(c/'qualify_selected_polynomial_points.py'),'--attempt','final6']
print('START',command,flush=True)
raise SystemExit(subprocess.run(command,cwd=r/'selected-polynomial-points').returncode)
