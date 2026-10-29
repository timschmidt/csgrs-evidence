from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
while True:
 focus=c/'selected-query-derivatives-fix10/complete.json';lint=c/'selected-query-derivatives-preflight-8/complete.json'
 rows=c/'selected-query-derivatives-fix10/results.json'
 if rows.exists() and any(row['exit_code']!=0 or not row['source_stable'] for row in json.loads(rows.read_text())):raise SystemExit('Focused derivative check failed; no broad qualification')
 if lint.exists():
  l=json.loads(lint.read_text())
  if l['exit_code']!=0 or not l['source_stable']:raise SystemExit('MSRV preflight failed; no broad derivative qualification')
 if focus.exists():
  f=json.loads(focus.read_text())
  if not f['all_passed']:raise SystemExit('Focused derivative checks failed; no broad qualification')
 if focus.exists() and lint.exists():
  assert f['source']==l['source'];break
 time.sleep(10)
command=['python3',str(c/'qualify_selected_query_derivatives.py'),'--attempt','final7']
print('START',command,flush=True)
result=subprocess.run(command,cwd=r/'selected-query-derivatives');raise SystemExit(result.returncode)
