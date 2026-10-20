"""Keep journal writers and measured stages sequential after qualification."""
import json
from pathlib import Path
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, ROOT, hashes

source = hashes()
while True:
    try:
        qualification = json.loads((OUT/'qualification-driver.json').read_text())
    except (FileNotFoundError, json.JSONDecodeError):
        qualification = {}
    if qualification.get('executed', [])[-1:] == ['diff-check'] and qualification.get('source') == source:
        break
    time.sleep(2)
assert qualification['source'] == source
assert not qualification['failures'] and not qualification['upstream_debug_blocked']
rows = []
for stage in ['consumers', 'artifacts', 'preserve', 'consumer_costs', 'new_costs']:
    command = ['python3', '-B', str(OUT/'analysis-recipes'/f'{stage}.py')]
    print('Starting stage', stage, flush=True)
    started = time.monotonic()
    result = subprocess.run(command, cwd=ROOT, env=ENV)
    rows.append(dict(stage=stage, command=command, exit_code=result.returncode,
                     elapsed_seconds=time.monotonic()-started, source_unchanged=hashes() == source))
    (OUT/'remaining-stages.json').write_text(json.dumps(dict(source=source, rows=rows), indent=2)+'\n')
    assert result.returncode == 0 and hashes() == source, stage
print('All remaining stages passed', flush=True)
