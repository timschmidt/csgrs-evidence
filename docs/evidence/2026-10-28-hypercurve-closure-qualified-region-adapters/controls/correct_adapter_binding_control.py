from pathlib import Path
import hashlib
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
checkout = r / 'qualified-region-adapters'
spec = importlib.util.spec_from_file_location('e', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files_before, patch = e.source_snapshot()
failed = c / 'qualified-region-adapters-qualification-adapter5'
assert before == json.loads((failed / 'source-before.json').read_text())
assert before == json.loads((failed / 'source-after.json').read_text())
rows = json.loads((failed / 'results.json').read_text())
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows[:-1])
assert rows[-1]['name'] == 'wasm-consumers' and rows[-1]['exit_code'] == 1
assert 'TypeError: square.differenceWithContext is not a function' in (failed / 'qualification-wasm-consumers.log').read_text()
p = checkout / 'tests/wasm/geometry_certainty.cjs'
s = p.read_text()
old = 'const removal = keep(square.differenceWithContext(square, false));'
new = 'const removal = keep(square.difference(square, false));'
assert s.count(old) == 1
(c / 'qualified-region-adapter-before-binding-correction.patch').write_bytes(patch)
p.write_text(s.replace(old, new))
after, files_after, _ = e.source_snapshot()
old_map = {row[0]: row[1:] for row in files_before}
changed = sorted(row[0] for row in files_after if old_map.get(row[0]) != row[1:])
assert changed == ['tests/wasm/geometry_certainty.cjs']
parent = c / 'qualified-region-adapter-parent-source.json'
(c / 'qualified-region-adapter-parent-source-before-binding-correction.json').write_bytes(parent.read_bytes())
state = json.loads(parent.read_text())
assert state['after'] == before
state['after'] = after
state['epoch'] = time.time()
parent.write_text(json.dumps(state, indent=2) + '\n')
record = {'before': before, 'after': after, 'changed_paths': changed,
          'owner': 'Actual JavaScript binding consumer control',
          'properties': ['P19', 'P25', 'P30'],
          'input_domain': 'Exact canonical empty and square-minus-itself regions, consumed through strict and contextual membership and bounds',
          'failing_witness': str(failed / 'qualification-wasm-consumers.log'),
          'change': 'Call CurveRegionJs.difference; the original test mistakenly used the MeshJs differenceWithContext method. Preserve every receipt, empty-result, policy-transition and ownership assertion.',
          'script_invocation': 'bash scripts/test-wasm-bindings.sh; adapter4 direct invocation failed before running bindings',
          'qualification': 'Fresh full adapter6 required after this edit', 'epoch': time.time()}
(c / 'qualified-region-adapter-binding-correction.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record), flush=True)
command = ['python3', str(c / 'qualify_region_adapters.py'), 'qualified-region-adapters', '--attempt', 'adapter6', '--target', str(r.parent / 'hypercurve-selected-circle-points-admission')]
with (c / 'qualified-region-adapters-qualification-adapter6-controller.log').open('w') as log:
    p = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
launch = {'pid': p.pid, 'command': command, 'source': after, 'epoch': time.time()}
(c / 'qualified-region-adapters-qualification-adapter6-controller.json').write_text(json.dumps(launch, indent=2) + '\n')
print(json.dumps(launch), flush=True)
