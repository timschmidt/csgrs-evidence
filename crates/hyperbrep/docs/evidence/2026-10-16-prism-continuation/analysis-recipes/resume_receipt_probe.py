"""Resume the semantic probe after its retained analysis-only compile correction."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, hashes, run

digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
source = hashes()
previous = json.loads((OUT / 'receipt-probe-inputs-v1.json').read_text())
old_probe = OUT / 'analysis-recipes/receipt_probe_v1.rs'
current = OUT / 'analysis-recipes/receipt_probe.rs'
projects = {side: Path('/tmp/hyperbrep-prism-receipt-' + side + '-probe')
            for side in ['baseline', 'candidate']}
replaced = {str(current), *[str(project / 'src/main.rs') for project in projects.values()]}
for name, expected in previous['files'].items():
    path = old_probe if name in replaced else Path(name)
    assert digest(path) == expected, name
for project in projects.values():
    shutil.copyfile(current, project / 'src/main.rs')
inputs = {name: digest(Path(name)) for name in previous['files']}
inputs[str(Path(__file__).resolve())] = digest(Path(__file__).resolve())
inputs[str(old_probe)] = digest(old_probe)
record = previous | dict(files=inputs, preceding='receipt-probe-inputs-v1.json',
                         correction='receipt-probe-compile-failure.json')
(OUT / 'receipt-probe-inputs.json').write_text(json.dumps(record, indent=2) + '\n')
binaries = {}
for side, project in projects.items():
    command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json',
               '--manifest-path', str(project / 'Cargo.toml'), '--', 'emit',
               str(OUT / ('receipt-' + side + '-artifacts'))]
    if run('receipt-' + side + '-emit', command):
        raise SystemExit(1)
    executable = Path(ENV['CARGO_TARGET_DIR']) / 'release/hyperbrep-prism-receipt-probe'
    frozen = Path('/tmp/hyperbrep-prism-receipt-' + side + '-executable')
    shutil.copyfile(executable, frozen)
    frozen.chmod(0o755)
    binaries[side] = dict(path=str(frozen), bytes=frozen.stat().st_size, sha256=digest(frozen))
    (OUT / 'receipt-probe-binaries.json').write_text(json.dumps(binaries, indent=2) + '\n')
command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json',
           '--manifest-path', str(projects['candidate'] / 'Cargo.toml'), '--', 'compare',
           str(OUT / 'receipt-baseline-artifacts'), str(OUT / 'receipt-candidate-artifacts'),
           str(OUT / 'receipt-archive-equality.json')]
if run('receipt-archive-equality', command):
    raise SystemExit(1)
assert all(digest(Path(name)) == expected for name, expected in inputs.items())
assert hashes() == source
print('Four complete archive comparisons passed; measured receipt binding remains.')
