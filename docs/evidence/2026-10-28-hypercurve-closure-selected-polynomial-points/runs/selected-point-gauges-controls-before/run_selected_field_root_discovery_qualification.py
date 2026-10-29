from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
while True:
 focus=c/'selected-field-root-discovery-fix5/complete.json';lint=c/'selected-field-root-discovery-preflight-4/complete.json'
 if focus.exists():
  f=json.loads(focus.read_text());assert f['all_passed'] and f['groups']==14
 if lint.exists():
  l=json.loads(lint.read_text());assert l['exit_code']==0 and l['source_stable']
 if focus.exists() and lint.exists():
  assert f['source']==l['source'];break
 for label in ['selected-field-root-discovery-fix5','selected-field-root-discovery-preflight-4']:
  launch=json.loads((c/(label+'-controller.json')).read_text())
  try:alive=(Path('/proc')/str(launch['pid'])/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
  except FileNotFoundError:alive=False
  if not (c/label/'complete.json').exists() and not alive:raise SystemExit(label+' stopped without completion')
 time.sleep(10)
command=['python3',str(c/'qualify_selected_field_root_discovery.py')]
print('START',command,flush=True)
raise SystemExit(subprocess.run(command,cwd=r/'selected-field-root-discovery').returncode)
