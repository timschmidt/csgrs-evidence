"""Recheck final source after the verified formatting-only scalar cleanup.

The previous debug and dependency library suites retain their exact snapshots
and explicit canonical-format admission. Final release/minimal consumers,
focused scalar tests, lints, documentation and boundary builds run again here.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, run

recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
assert json.loads((OUT / 'scalar-format-review.json').read_text())['applied']
attempts = json.loads((OUT / 'attempts.json').read_text())
failures = []
for label in ['scalar-all-features', 'scalar-minimal', 'dependency-clippy',
              'dependency-minimal-clippy', 'dependency-rustdoc']:
    before = next(row for row in reversed(attempts) if row['label'] == label)
    if run(label, before['command'], before['external_timeout_seconds'], before['environment']):
        failures.append(label)
command = ['python3', str(OUT / 'qualify.py'), '--only',
    'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
    'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example',
    'supplied-example', 'circular-example', 'similarity-example', 'torus-example',
    'torus-occt', 'occt-reader', 'fuzz-check', 'wasm-build', 'wasm-runtime',
    'fmt', 'diff-check']
if subprocess.run(command, cwd=ROOT, env=ENV).returncode:
    failures.append('native-consumers')
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
(OUT / 'final-qualification-driver.json').write_text(json.dumps(dict(
    recipe=str(Path(__file__).relative_to(ROOT)), sha256=recipe,
    failures=failures,
    scope='Final scalar bytes have identical canonical rustfmt output to the preserved full debug/dependency suites; their original snapshots remain retained. Repeated checks here consume the final reduced diff.'
), indent=2) + '\n')
print('final qualification failures:', failures, flush=True)
raise SystemExit(bool(failures))
