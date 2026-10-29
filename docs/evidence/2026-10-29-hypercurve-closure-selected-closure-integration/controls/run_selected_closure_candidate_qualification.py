from pathlib import Path
import importlib.util
import json
import shutil
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
spec = importlib.util.spec_from_file_location('gate', c / 'selected_closure_candidate_gate.py')
gate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gate)
source = gate.wait()
while shutil.disk_usage(r).free < 12 * 1024**3:
    print('Waiting for 12 GiB free build space; no qualification command started.', flush=True)
    time.sleep(30)
w = r / 'selected-closure-integration'
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
assert e.source_snapshot()[0] == source
command = ['python3', str(c / 'qualify_selected_closure_candidate.py'), '--attempt', 'final1']
print('START', command, flush=True)
raise SystemExit(subprocess.run(command, cwd=w).returncode)
