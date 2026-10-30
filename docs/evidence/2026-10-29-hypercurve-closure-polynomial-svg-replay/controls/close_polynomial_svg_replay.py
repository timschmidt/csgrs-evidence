from pathlib import Path
import json,os,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls';q=c/'polynomial-svg-replay-qualification-final9'
controller=json.loads((c/'polynomial-svg-replay-qualification-final9-controller.json').read_text())
while not (q/'complete.json').exists():
 if (q/'results.json').exists():
  assert all(x['exit_code']==0 and x['source_stable'] for x in json.loads((q/'results.json').read_text())), 'Qualification failed; no commit'
 os.kill(controller['pid'],0);time.sleep(10)
d=json.loads((q/'complete.json').read_text());assert d['all_passed'] and d['groups']==17
command=['python3',str(c/'correct_polynomial_svg_replay_catalog.py')]
print('START',command,flush=True)
result=subprocess.run(command,cwd=r/'polynomial-svg-replay');print('FINISH',result.returncode,flush=True)
if result.returncode:raise SystemExit(result.returncode)
for action in ['archive','receipts','check','commit']:
 command=['python3',str(c/'finalize_polynomial_svg_replay.py'),action];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'polynomial-svg-replay');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
print('POLYNOMIAL PROJECTION AND SVG REPLAY COMMITTED LOCALLY; NO PUSH OR UNIVERSAL CLOSURE CLAIM',flush=True)
