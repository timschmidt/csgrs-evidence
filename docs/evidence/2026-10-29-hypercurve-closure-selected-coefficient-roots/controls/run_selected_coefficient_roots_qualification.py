from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
requirements=[('selected-coefficient-roots-fix4','focus'),('selected-coefficient-roots-preflight-4','lint'),('selected-coefficient-roots-owners-3','owners')]
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
command=['python3',str(c/'qualify_selected_coefficient_roots.py'),'--attempt','final1']
print('START',command,flush=True)
raise SystemExit(subprocess.run(command,cwd=r/'selected-coefficient-roots').returncode)
