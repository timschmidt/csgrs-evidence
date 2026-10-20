"""Wait for the fixed-source run, fix only its module wiring, then qualify."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes
from source_binding import REPLACEMENTS

recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
path = OUT / 'qualification-drivers.json'
deadline = time.monotonic() + 1800
while not path.exists():
    assert time.monotonic() < deadline, 'initial qualification did not complete'
    time.sleep(2)
drivers = json.loads(path.read_text())
assert len(drivers) == 1
assert set(drivers[0]['failures']) == {'native-clippy', 'native-minimal-clippy'}, drivers
assert 'wasm-runtime' in drivers[0]['executed'] and 'diff-check' in drivers[0]['executed']
for name in drivers[0]['failures']:
    log = (OUT / (name + '-1.log')).read_text()
    assert 'duplicate_mod' in log and 'could not compile `hyperbrep` (bench "sectors")' in log
before = hashes()
for relative, (old, new) in REPLACEMENTS.items():
    target = ROOT / relative
    text = target.read_text()
    assert text.count(old) == 1
    target.write_text(text.replace(old, new, 1))
after = hashes()
assert {p for p in before if before[p] != after[p]} == REPLACEMENTS.keys()
(OUT / 'wiring-edit.json').write_text(json.dumps(dict(before=before, after=after,
    recipe_sha256=recipe, replacements=REPLACEMENTS,
    purpose='Share existing seam test helpers without duplicate module compilation; no workflow or assertion body changes.'), indent=2) + '\n')
print('applied exact module-wiring correction', flush=True)
for name in ['rewire_checks.py', 'finish_checks.py', 'feature_graph.py',
             'dependency_summary.py', 'frontier_review.py', 'growth_summary.py', 'report.py']:
    print('running driver', name, flush=True)
    subprocess.run(['python3', str(Path(__file__).with_name(name))], cwd=ROOT, env=ENV, check=True)
assert hashes() == after and hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
(OUT / 'complete-checks-driver.json').write_text(json.dumps(dict(source=after, recipe_sha256=recipe,
    checks_and_measurements_complete=True, retention_review='Required separately; this driver does not choose retention or edit project status.'), indent=2) + '\n')
print('all checks and measurements complete; retention review pending', flush=True)
