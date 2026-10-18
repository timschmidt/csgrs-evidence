"""Run preserved contracts before costs, sequentially, on fixed source."""
import json
from pathlib import Path
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, ENV, hashes

source = hashes()
assert json.loads((OUT/'qualification-driver.json').read_text())['source'] == source
assert json.loads((OUT/'consumers.json').read_text())['source'] == source
rows = []
for stage in ['preserve', 'artifacts', 'consumer_costs', 'new_costs']:
    command = ['python3', '-B', str(OUT/'analysis-recipes'/f'{stage}.py')]
    start = time.monotonic()
    result = subprocess.run(command, cwd=ROOT, env=ENV)
    unchanged = hashes() == source
    rows.append(dict(stage=stage, command=command, exit_code=result.returncode,
                     elapsed_seconds=time.monotonic()-start, source_unchanged=unchanged))
    (OUT/'remaining-stages.json').write_text(json.dumps(dict(source=source, rows=rows), indent=2)+'\n')
    assert unchanged and result.returncode == 0, stage
