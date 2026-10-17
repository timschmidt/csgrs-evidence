"""Run costs only after qualification, without concurrent task compilation/tests."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

source = hashes()
from source_binding import admit
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
drivers = json.loads((OUT/'qualification-drivers.json').read_text())
attempts = json.loads((OUT/'attempts.json').read_text())
labels = {label for driver in drivers for label in driver['executed']}
latest = lambda label: next(r for r in reversed(attempts) if r['label']==label)
assert {label for label in labels if latest(label)['exit_code']} == {'inherited-zero-factor-default', 'inherited-zero-factor-all-features'}
for label in labels:
    admit(latest(label), source)
helpers = json.loads((OUT.parent/'2026-10-17-cone-continuation/manifest.json').read_text())['benchmark_helpers']['files']
for path, expected in helpers.items():
    assert hashlib.sha256((ROOT/path).read_bytes()).hexdigest() == expected
subprocess.run(['python3', str(OUT/'final-review/continuation.py')], cwd=ROOT, env=ENV, check=True)
assert hashes() == source
project = Path('/tmp/hyperbrep-cone-exchange-probe')
retained = OUT/'final-review/rational_split.rs'
actual = project/'src/bin/rational_split.rs'
assert actual.read_bytes() == retained.read_bytes()
split_inputs = [retained, actual, project/'Cargo.toml', project/'Cargo.lock']
split_digests = {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in split_inputs}
assert run('rational-split-consumer', ['cargo','run','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml'),'--bin','rational_split','--',str(OUT/'rational-split-exports')], 600) == 0
assert run('rational-split-clippy', ['cargo','clippy','--offline','--locked','--manifest-path',str(project/'Cargo.toml'),'--bin','rational_split','--','-D','warnings'], 600) == 0
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==digest for p,digest in split_digests.items())
(OUT/'rational-split-inputs.json').write_text(json.dumps(split_digests,indent=2)+'\n')
assert run('rational-split-occt', ['python3',str(OUT/'final-review/rational_split_occt.py')], 300) == 0
subprocess.run(['python3', str(OUT/'build_benchmarks.py'), 'candidate'], cwd=ROOT, env=ENV, check=True)
assert hashes() == source
assert run('benchmarks', ['python3', str(OUT/'benchmark.py'), '--name', 'benchmark-v1'], 7200) == 0
assert run('dependency-costs', ['python3', str(OUT/'analysis-recipes/dependency_costs.py')], 5400) == 0
assert hashes() == source
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
(OUT/'finish-checks-driver.json').write_text(json.dumps(dict(
    passed=True, source=source, recipe_sha256=recipe, preserved_helpers=helpers,
    scope='Prospectively frozen baselines. No task tests/builds overlap a timed campaign. Separate dependency builds finish before their timed samples. Inherited scalar failures remain failures.'), indent=2)+'\n')
