from pathlib import Path
import json, os, subprocess, time
r=Path(__file__).resolve().parents[1];c=r/'controls';q=c/'native-tensor-witnesses-qualification-final2'
controller=json.loads((c/'native-tensor-witnesses-qualification-final2-controller.json').read_text())
while not (q/'complete.json').exists():
 if (q/'results.json').exists():
  assert all(x['exit_code']==0 and x['source_stable'] for x in json.loads((q/'results.json').read_text())), 'Local qualification failed; no commit'
 os.kill(controller['pid'],0)
 time.sleep(10)
complete=json.loads((q/'complete.json').read_text());assert complete['all_passed'] and complete['groups']==26
for action in ['archive','receipts','check','commit']:
 command=['python3',str(c/'finalize_native_tensor_witnesses.py'),action];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'native-tensor-witnesses');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
print('NATIVE TENSOR WITNESS FIX COMMITTED LOCALLY; NO PUSH OR GENERAL OPERATION COMPLETION CLAIM',flush=True)
