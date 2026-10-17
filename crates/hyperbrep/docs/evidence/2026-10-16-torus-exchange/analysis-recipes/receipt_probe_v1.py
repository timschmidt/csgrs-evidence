"""Reproduce the five archive receipts without changing measured source or logs."""
import hashlib
import io
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
import tomllib

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from check import ENV, hashes, run

BASE = 'fa541102c93c617cdef28faa0e5451fd0c0c8d25'
read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
source = hashes()
campaign = OUT/'benchmark-v1'
commands = read(campaign/'commands.json')
assert len(commands) == 105 and all(r['exit_code'] == 0 for r in commands)
assert read(campaign/'source.json') == source
assert not read(campaign/'receipt-admission.json')['passed']
expected_cases = {'sectors/torus_longitudinal_band', 'sectors/similarity_matrix',
                  'oblique/identity', 'oblique/millimetre_reflection', 'oblique/radical_reflection'}
assert {r['case'] for r in read(campaign/'observed-receipt-migrations.json')} == expected_cases

checkout = Path('/tmp/hyperbrep-torus-receipt-baseline')
checkout.mkdir(exist_ok=False)
crates = ['hyperbrep', 'hyperbrep-io', 'hyperreal', 'hyperlimit', 'hyperlattice',
          'hypercurve', 'hypersolve', 'hypertri', 'hypermesh']
paths = subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE, '--',
    *['crates/'+name for name in crates]], cwd=ROOT).decode().splitlines()
paths = [p for p in paths if '/src/' in p
    or (('/benches/' in p or '/tests/' in p or '/examples/' in p) and p.endswith('.rs'))
    or (Path(p).name in ['Cargo.toml', 'README.md', 'build.rs'] and len(Path(p).parts) == 3)]
data = subprocess.check_output(['git', 'archive', BASE, *paths], cwd=ROOT)
with tarfile.open(fileobj=io.BytesIO(data)) as packed:
    packed.extractall(checkout, filter='data')
baseline_files = {p: digest(checkout/p) for p in paths}
write(OUT/'receipt-baseline-source.json', dict(revision=BASE, files=baseline_files,
    scope='Pinned production and numerical dependencies extracted from git; no current scalar substitution. Supplemental post-campaign reproduction, not another timed comparison.'))

retained = OUT/'analysis-recipes/receipt-project-inputs'
retained.mkdir(exist_ok=False)
inputs = {str(p): digest(p) for p in [Path(__file__).resolve(), OUT/'analysis-recipes/receipt_probe.rs']}
projects = {}
for side, dependency_root in [('baseline', checkout), ('candidate', ROOT)]:
    project = Path('/tmp/hyperbrep-torus-receipt-'+side+'-probe')
    (project/'src').mkdir(parents=True, exist_ok=False)
    manifest = '[package]\nname = "hyperbrep-torus-receipt-probe"\nversion = "0.0.0"\nedition = "2024"\n[workspace]\n[dependencies]\n'
    for name in ['hyperbrep', 'hyperbrep-io', 'hypercurve', 'hyperlimit']:
        extra = ', default-features = false' if name in ['hyperbrep', 'hyperbrep-io'] else ''
        if name == 'hypercurve': extra += ', features = ["triangulation"]'
        manifest += name+' = { path = "'+str(dependency_root/'crates'/name)+'"'+extra+' }\n'
    manifest += 'hyperreal = { path = "'+str(dependency_root/'crates/hyperreal')+'", features = ["serde", "cached-f64-approx"] }\n'
    manifest += 'hypertri = { path = "'+str(dependency_root/'crates/hypertri')+'", default-features = false, features = ["earcut", "cdt"] }\n'
    manifest += 'serde_json = "=1.0.151"\n'
    (project/'Cargo.toml').write_text(manifest)
    shutil.copyfile(ROOT/'Cargo.lock', project/'Cargo.lock')
    shutil.copyfile(OUT/'analysis-recipes/receipt_probe.rs', project/'src/main.rs')
    for name in ['sectors.rs', 'oblique.rs', 'seam_cuts.rs', 'closed_cylinder.rs']:
        original = dependency_root/'crates/hyperbrep/tests/support'/name
        text = original.read_text()
        if name == 'sectors.rs':
            old = '    result\n        .model()\n        .to_json()\n        .unwrap()\n        .bytes()\n        .fold('
            assert text.count(old) == 1
            text = text.replace(old, '    let data = result.model().to_json().unwrap();\n    crate::record(&data);\n    data.bytes().fold(')
        elif name == 'oblique.rs':
            old = '    json.bytes().fold('
            assert text.count(old) == 1
            text = text.replace(old, '    crate::record(&json);\n'+old)
        (project/'src'/name).write_text(text)
        inputs[str(original)] = digest(original)
    assert run('receipt-'+side+'-lock', ['cargo', 'generate-lockfile', '--offline',
        '--manifest-path', str(project/'Cargo.toml')]) == 0
    pinned = tomllib.loads((ROOT/'Cargo.lock').read_text())['package']
    locked = tomllib.loads((project/'Cargo.lock').read_text())['package']
    key = lambda r: tuple(r.get(k) for k in ['name', 'version', 'source', 'checksum'])
    assert {key(r) for r in locked if 'source' in r} <= {key(r) for r in pinned if 'source' in r}
    for p in [project/'Cargo.toml', project/'Cargo.lock', *sorted((project/'src').glob('*.rs'))]:
        target = retained/(side+'-'+p.name)
        shutil.copyfile(p, target)
        inputs[str(p)] = digest(p)
        inputs[str(target)] = digest(target)
    projects[side] = project
write(OUT/'receipt-probe-inputs.json', dict(files=inputs, baseline='receipt-baseline-source.json',
    product_source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    instrumentation='Copy each side\'s original acceptance modules. At the existing final JSON hash, write those exact bytes to disk. Retain every original assertion and the original return receipt. Probe calls the same five benchmark workflows. Compiler feature/profile and emitted-receipt binding is required before review.'))

expected_graph = {r['target']['name']: {k:r[k] for k in ['features', 'profile']}
    for r in read(OUT/'feature-graph-admission.json')['common']
    if '/crates/' in r['package_id'] and r['target']['kind'] == ['lib']}
binaries = {}
for side, project in projects.items():
    assert run('receipt-'+side+'-build', ['cargo', 'build', '--offline', '--locked', '--release',
        '--message-format=json', '--manifest-path', str(project/'Cargo.toml')], 1200) == 0
    row = [r for r in read(OUT/'attempts.json') if r['label'] == 'receipt-'+side+'-build'][-1]
    graph = {}
    for line in (OUT/row['log']).read_text().splitlines():
        if not line.startswith('{'): continue
        item = json.loads(line)
        if item.get('reason') == 'compiler-artifact' and item['target']['kind'] == ['lib'] and item['target']['name'] in expected_graph:
            graph[item['target']['name']] = {k:item[k] for k in ['features', 'profile']}
    assert graph == expected_graph, (side, graph, expected_graph)
    built = Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-torus-receipt-probe'
    frozen = Path('/tmp/hyperbrep-torus-receipt-'+side+'-executable')
    shutil.copyfile(built, frozen)
    frozen.chmod(0o755)
    binaries[side] = dict(path=str(frozen), bytes=frozen.stat().st_size,
        sha256=digest(frozen), build=row, matched_library_features=graph)
    write(OUT/'receipt-probe-binaries.json', binaries)
    assert run('receipt-'+side+'-emit', [str(frozen), 'emit',
        str(OUT/('receipt-'+side+'-artifacts'))], 1200) == 0

assert run('receipt-archive-equality', [binaries['candidate']['path'], 'compare',
    str(OUT/'receipt-baseline-artifacts'), str(OUT/'receipt-candidate-artifacts'),
    str(OUT/'receipt-archive-equality.json')], 1200) == 0
for name, expected in inputs.items(): assert digest(Path(name)) == expected, name
for name, expected in baseline_files.items(): assert digest(checkout/name) == expected, name
assert hashes() == source
print('complete archive proof finished; receipt binding and explicit review still required')
