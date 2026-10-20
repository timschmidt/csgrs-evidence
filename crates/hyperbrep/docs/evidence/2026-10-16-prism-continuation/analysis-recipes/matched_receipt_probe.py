"""Repeat the archive proof with the measured Cargo feature configuration."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, hashes, run

digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
source = hashes()
previous = read(OUT / 'receipt-probe-inputs.json')
assert all(digest(Path(name)) == value for name, value in previous['files'].items())
for current, retained in [
    ('receipt-probe-inputs.json', 'receipt-probe-inputs-v2.json'),
    ('receipt-probe-binaries.json', 'receipt-probe-binaries-v1.json'),
    ('receipt-archive-equality.json', 'receipt-archive-equality-v1.json'),
]:
    assert not (OUT / retained).exists()
    shutil.copyfile(OUT / current, OUT / retained)

projects = {}
inputs = previous['files'].copy()
for side in ['baseline', 'candidate']:
    old = Path('/tmp/hyperbrep-prism-receipt-' + side + '-probe')
    project = Path('/tmp/hyperbrep-prism-receipt-' + side + '-matched-probe')
    assert not project.exists()
    (project / 'src').mkdir(parents=True)
    manifest = (old / 'Cargo.toml').read_text()
    lines = manifest.splitlines()
    selected = [line for line in lines if line.startswith('hyperbrep = ')]
    assert len(selected) == 1 and 'default-features' not in selected[0]
    manifest = manifest.replace(selected[0], selected[0].replace(' }', ', default-features = false }'))
    (project / 'Cargo.toml').write_text(manifest)
    shutil.copyfile(old / 'Cargo.lock', project / 'Cargo.lock')
    shutil.copyfile(old / 'src/main.rs', project / 'src/main.rs')
    for name in ['Cargo.toml', 'Cargo.lock', 'src/main.rs']:
        inputs[str(project / name)] = digest(project / name)
    for name in ['Cargo.toml', 'Cargo.lock']:
        retained = OUT / 'analysis-recipes/receipt-project-inputs' / (side + '-matched-' + name)
        shutil.copyfile(project / name, retained)
        inputs[str(retained)] = digest(retained)
    shutil.copytree(OUT / ('receipt-' + side + '-artifacts'),
                    OUT / ('receipt-default-marker-' + side + '-artifacts'))
    projects[side] = project

inputs[str(Path(__file__).resolve())] = digest(Path(__file__).resolve())
write(OUT / 'receipt-probe-feature-correction.json', dict(
    failed_check='receipt-artifact-binding-1.log',
    cause='The analysis projects enabled hyperbrep default=[]; the measured benchmark had no default feature marker. All other selected geometry features already agreed.',
    correction='New external projects disable hyperbrep default features explicitly. The feature-equality assertion and the measured product are unchanged.',
    retained_inputs='receipt-probe-inputs-v2.json',
    retained_proof='receipt-archive-equality-v1.json',
    retained_binaries='receipt-probe-binaries-v1.json'))
write(OUT / 'receipt-probe-inputs.json', previous | dict(
    files=inputs, preceding='receipt-probe-inputs-v2.json',
    correction='receipt-probe-feature-correction.json'))

binaries = {}
for side, project in projects.items():
    command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json',
               '--manifest-path', str(project / 'Cargo.toml'), '--', 'emit',
               str(OUT / ('receipt-' + side + '-artifacts'))]
    if run('receipt-' + side + '-emit', command):
        raise SystemExit(1)
    before = OUT / ('receipt-default-marker-' + side + '-artifacts')
    after = OUT / ('receipt-' + side + '-artifacts')
    assert {p.name: digest(p) for p in before.iterdir()} == {p.name: digest(p) for p in after.iterdir()}
    executable = Path(ENV['CARGO_TARGET_DIR']) / 'release/hyperbrep-prism-receipt-probe'
    frozen = Path('/tmp/hyperbrep-prism-receipt-' + side + '-matched-executable')
    shutil.copyfile(executable, frozen)
    frozen.chmod(0o755)
    binaries[side] = dict(path=str(frozen), bytes=frozen.stat().st_size, sha256=digest(frozen))
    write(OUT / 'receipt-probe-binaries.json', binaries)
command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json',
           '--manifest-path', str(projects['candidate'] / 'Cargo.toml'), '--', 'compare',
           str(OUT / 'receipt-baseline-artifacts'), str(OUT / 'receipt-candidate-artifacts'),
           str(OUT / 'receipt-archive-equality.json')]
if run('receipt-archive-equality', command):
    raise SystemExit(1)
assert all(digest(Path(name)) == value for name, value in inputs.items())
assert hashes() == source
assert read(OUT / 'receipt-archive-equality.json') == read(OUT / 'receipt-archive-equality-v1.json')
print('Matched-feature archives and exact equality proofs are unchanged.')
