"""Post-campaign archive proof; never compile while measured processes run."""
import hashlib
import io
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from check import hashes, run

read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
source = hashes()
campaign = OUT / 'benchmark-v1'
commands = read(campaign / 'commands.json')
assert len(commands) == 96 and all(row['exit_code'] == 0 for row in commands)
assert read(campaign / 'source.json') == source
assert (campaign / 'receipt-admission.json').is_file()
baseline = '90a5c258eb2387d6a2f84fcf1e6ed420da1c4622'
checkout = Path('/tmp/hyperbrep-prism-receipt-baseline')
checkout.mkdir(exist_ok=False)
crates = ['hyperbrep', 'hyperbrep-io', 'hyperreal', 'hyperlimit', 'hyperlattice',
          'hypercurve', 'hypersolve', 'hypertri', 'hypermesh']
paths = subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', baseline, '--',
                                *['crates/' + name for name in crates]], cwd=ROOT).decode().splitlines()
paths = [path for path in paths if '/src/' in path
         or (('/benches/' in path or '/tests/' in path or '/examples/' in path) and path.endswith('.rs'))
         or path.split('/')[-1] in ['Cargo.toml', 'README.md', 'build.rs'] and len(Path(path).parts) == 3]
data = subprocess.check_output(['git', 'archive', baseline, *paths], cwd=ROOT)
with tarfile.open(fileobj=io.BytesIO(data)) as archive:
    archive.extractall(checkout, filter='data')
baseline_sources = {path: digest(checkout / path) for path in paths}
write(OUT / 'receipt-baseline-source.json', dict(revision=baseline, files=baseline_sources,
      scope='Pinned BREP, IO and all local numerical/geometry dependencies, including the old scalar implementation. Physical /tmp source copy; no surrounding current dependency substitution. Not a timing comparison.'))

fixture_paths = ['crates/hyperbrep-io/tests/support/analytic_cylinder.rs',
                 'crates/hyperbrep-io/tests/support/supplied_pcurves.rs',
                 'crates/hyperbrep-io/tests/fixtures/exact-cylinder.step',
                 'crates/hyperbrep-io/tests/fixtures/supplied-cylinder.step',
                 'crates/hyperbrep-io/tests/fixtures/occt-cylinder-off-carrier.step',
                 'crates/hyperbrep-io/benches/circles.rs', 'crates/hyperbrep-io/benches/pcurves.rs']
for path in fixture_paths:
    assert subprocess.check_output(['git', 'show', baseline + ':' + path], cwd=ROOT) == (ROOT / path).read_bytes(), path
retained = OUT / 'analysis-recipes/receipt-project-inputs'
retained.mkdir(exist_ok=False)
projects = {}
inputs = {str(path): digest(path) for path in [Path(__file__).resolve(), OUT / 'analysis-recipes/receipt_probe.rs']}
inputs.update({str(ROOT / path): digest(ROOT / path) for path in fixture_paths})
for side, dependency_root in [('baseline', checkout), ('candidate', ROOT)]:
    project = Path('/tmp/hyperbrep-prism-receipt-' + side + '-probe')
    (project / 'src').mkdir(parents=True, exist_ok=False)
    manifest = ('[package]\nname = "hyperbrep-prism-receipt-probe"\nversion = "0.0.0"\n'
                'edition = "2024"\n[workspace]\n[dependencies]\n')
    for crate in ['hyperbrep', 'hyperbrep-io', 'hypercurve', 'hyperlimit']:
        feature = ', features = ["triangulation"]' if crate == 'hypercurve' else ''
        manifest += crate + ' = { path = "' + str(dependency_root / 'crates' / crate) + '"' + feature + ' }\n'
    manifest += 'hyperreal = { path = "' + str(dependency_root / 'crates/hyperreal') + '", features = ["serde", "cached-f64-approx"] }\n'
    manifest += 'hypertri = { path = "' + str(dependency_root / 'crates/hypertri') + '", default-features = false, features = ["earcut", "cdt"] }\n'
    manifest += 'serde_json = "=1.0.151"\n'
    (project / 'Cargo.toml').write_text(manifest)
    shutil.copyfile(OUT / 'analysis-recipes/receipt_probe.rs', project / 'src/main.rs')
    shutil.copyfile(ROOT / 'Cargo.lock', project / 'Cargo.lock')
    command = ['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(project / 'Cargo.toml')]
    assert run('receipt-' + side + '-lock', command) == 0
    for name in ['Cargo.toml', 'Cargo.lock']:
        shutil.copyfile(project / name, retained / (side + '-' + name))
        inputs[str(project / name)] = digest(project / name)
    inputs[str(project / 'src/main.rs')] = digest(project / 'src/main.rs')
    projects[side] = project
write(OUT / 'receipt-probe-inputs.json', dict(files=inputs,
    baseline='receipt-baseline-source.json',
    product_source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    scope='Post-campaign analysis inputs are hashed independently; the product/qualification snapshot remains unchanged. Same unchanged benchmark fixtures and support code are used for both sides.'))

for side, project in projects.items():
    command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json', '--manifest-path',
               str(project / 'Cargo.toml'), '--', 'emit', str(OUT / ('receipt-' + side + '-artifacts'))]
    assert run('receipt-' + side + '-emit', command) == 0
command = ['cargo', 'run', '--offline', '--locked', '--release', '--message-format=json', '--manifest-path',
           str(projects['candidate'] / 'Cargo.toml'), '--', 'compare',
           str(OUT / 'receipt-baseline-artifacts'), str(OUT / 'receipt-candidate-artifacts'),
           str(OUT / 'receipt-archive-equality.json')]
assert run('receipt-archive-equality', command) == 0
assert all(digest(Path(path)) == value for path, value in inputs.items())
assert all(digest(checkout / path) == value for path, value in baseline_sources.items())
assert hashes() == source
print('Four archive migrations reproduced and compared; bind hashes to benchmark rows before approval.')
