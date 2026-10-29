from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
requirements=[('selected-query-fibers-fix4','focus'),('selected-query-fibers-preflight-2','lint'),('selected-query-fibers-owners-2','owners')]
while True:
 complete=[]
 for name,kind in requirements:
  d=c/name
  if (d/'results.json').exists() and any(row['exit_code']!=0 or not row['source_stable'] for row in json.loads((d/'results.json').read_text())):raise SystemExit(name+' failed; no broad qualification')
  if (d/'complete.json').exists():
   value=json.loads((d/'complete.json').read_text())
   if kind=='lint':assert value['exit_code']==0 and value['source_stable']
   else:assert value['all_passed']
   complete.append(value)
 if len(complete)==len(requirements):
  assert all(x['source']==complete[0]['source'] for x in complete)
  break
 time.sleep(10)
command=['python3',str(c/'qualify_selected_query_fibers.py'),'--attempt','final1']
print('START',command,flush=True)
raise SystemExit(subprocess.run(command,cwd=r/'selected-query-fibers').returncode)
