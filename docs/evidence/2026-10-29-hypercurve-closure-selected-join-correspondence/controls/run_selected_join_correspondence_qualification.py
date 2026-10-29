from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
while True:
 focus=c/'selected-join-correspondence-fix5/complete.json';lint=c/'selected-join-correspondence-preflight-4/complete.json'
 if focus.exists():
  f=json.loads(focus.read_text());assert f['all_passed'] and f['groups']==10
 if lint.exists():
  l=json.loads(lint.read_text());assert l['exit_code']==0 and l['source_stable']
 if focus.exists() and lint.exists():
  assert f['source']==l['source'];break
 time.sleep(10)
raise SystemExit(subprocess.run(['python3',str(c/'qualify_selected_join_correspondence.py'),'--attempt','final1'],cwd=r/'selected-join-correspondence').returncode)
