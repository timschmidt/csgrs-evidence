from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls';d=c/'selected-query-fibers-fix4'
while not (d/'complete.json').exists():
 if (d/'results.json').exists() and any(row['exit_code']!=0 or not row['source_stable'] for row in json.loads((d/'results.json').read_text())):raise SystemExit('Focused selected-query fibers failed; no owner qualification')
 time.sleep(10)
assert json.loads((d/'complete.json').read_text())['all_passed']
raise SystemExit(subprocess.run(['python3',str(c/'probe_selected_query_fiber_owners.py'),'--attempt','2'],cwd=r/'selected-query-fibers').returncode)
