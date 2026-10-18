"""Finish the fixed-source run, preserving its original narrow artifact-audit failure."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, ENV, hashes

sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
source = hashes()
historical = OUT/'before-finite-source-final-stages.json'
prior = json.loads(historical.read_text())
assert source == prior['source']
assert [row['exit_code'] for row in prior['rows']] == [0, 0, 0, 1]
inputs = {str(p.relative_to(ROOT)): sha(p) for p in [
    Path(__file__), Path(__file__).with_name('complete_artifacts.py'),
    Path(__file__).with_name('finite_source_comparison.py'), historical,
    OUT/'analysis-recipes/consumer_costs.py', OUT/'analysis-recipes/new_costs.py']}
rows = prior['rows'][:3]
for stage, recipe in [('artifacts', Path(__file__).with_name('complete_artifacts.py')),
                       ('consumer_costs', OUT/'analysis-recipes/consumer_costs.py'),
                       ('new_costs', OUT/'analysis-recipes/new_costs.py')]:
    command = ['python3', '-B', str(recipe)]
    start = time.monotonic()
    result = subprocess.run(command, cwd=ROOT, env=ENV)
    unchanged = hashes() == source and all(sha(ROOT/name) == digest for name, digest in inputs.items())
    rows.append(dict(stage=stage, command=command, exit_code=result.returncode,
                     elapsed_seconds=time.monotonic()-start, source_unchanged=unchanged))
    (OUT/'final-stages.json').write_text(json.dumps(dict(source=source, inputs=inputs, rows=rows,
        failure_history=str(historical.relative_to(OUT)),
        scope='First three completed stages reused at identical source. The original narrow artifact audit remains a failure; its exact finite-source supplement completes that stage before sequential costs.'), indent=2)+'\n')
    assert unchanged and result.returncode == 0, stage
