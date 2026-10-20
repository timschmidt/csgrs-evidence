"""Requalify affected consumers after sharing the existing seam test module."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run
from source_binding import admit

source = hashes()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
attempts = json.loads((OUT / 'attempts.json').read_text())
bindings = {}
for label in ['native-debug', 'native-release', 'native-minimal', 'dependency-libraries']:
    row = next(r for r in reversed(attempts) if r['label'] == label)
    assert row['exit_code'] == 0
    bindings[label] = admit(row, source)
    assert not bindings[label]['exact_source_match']
for name, flags in [('debug', ['--all-features']), ('release', ['--all-features', '--release']),
                    ('minimal', ['--no-default-features', '--release'])]:
    assert run('rewired-tests-' + name, ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep',
        *flags, '--test', 'rotated_reconstruction', '--no-fail-fast'], 600) == 0
subprocess.run(['python3', str(Path(__file__).with_name('qualify.py')), '--only',
    'native-clippy', 'native-minimal-clippy', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check'],
    cwd=ROOT, env=ENV, check=True)
assert source == hashes() and hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
(OUT / 'wiring-admission.json').write_text(json.dumps(dict(source=source, recipe_sha256=recipe,
    original_complete_runs=bindings, affected_consumers_requalified=True), indent=2) + '\n')
print('module wiring and affected consumer checks passed', flush=True)
