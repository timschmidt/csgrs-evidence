"""Resume qualification after restoring unchanged omitted harness inputs.

Preserve the failed driver record and already completed checks. Production
source and preceding qualified input hashes must remain unchanged throughout.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, ENV, hashes

source = hashes()
initial = json.loads((OUT/'final-stages.json').read_text())
assert initial['source'] == source
assert [(r['stage'], r['exit_code']) for r in initial['rows']] == [
    ('qualify', 0), ('consumers', 0), ('preserve', 1)]
assert all(r['source_unchanged'] for r in initial['rows'])
saved = OUT/'final-stages-initial.json'
assert not saved.exists()
saved.write_text(json.dumps(initial, indent=2)+'\n')
rows = initial['rows'][:2]

def stage(name, command):
    start = time.monotonic()
    result = subprocess.run(command, cwd=ROOT, env=ENV)
    unchanged = hashes() == source
    row = dict(stage=name, command=command, exit_code=result.returncode,
               elapsed_seconds=time.monotonic()-start, source_unchanged=unchanged)
    rows.append(row)
    (OUT/'final-stages.json').write_text(json.dumps(dict(source=source, rows=rows), indent=2)+'\n')
    assert unchanged and result.returncode == 0, name

command = ['python3', '-B', str(Path(__file__).with_name('preserve_remaining.py'))]
stage('preserve', command)
rows[-1]['resumed_after'] = 'final-stages-initial.json'
rows[-1]['scope'] = 'Original consumer and previous axial checks passed before the missing-input failure. This command finishes the remaining unchanged scripts and compares every required artifact.'
for name in ['artifacts', 'consumer_costs', 'new_costs']:
    stage(name, ['python3', '-B', str(OUT/'analysis-recipes'/f'{name}.py')])
