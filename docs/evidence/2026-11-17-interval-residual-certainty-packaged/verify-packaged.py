from pathlib import Path
import gzip
import hashlib
import json
import subprocess
import tarfile

s = Path('/tmp/interval-refactor/residual-certainty-packaged-v2')
old = Path('/tmp/interval-refactor/residual-certainty-admission')
review = Path(__file__).parent
root = Path('/mnt/development/csgrs')
checkout = Path('/mnt/development/interval-residual-certainty/csgrs')
work = Path('/dev/shm/interval-residual-certainty-packaged-v2')
candidate = 'aad7409a5928e309812d9a5cc361d46313685266'


def read(path):
    return json.loads(path.read_text())


def sha(data):
    return hashlib.sha256(data).hexdigest()


def git(*args, cwd=checkout):
    return subprocess.check_output(['git', *args], cwd=cwd)


completion = read(s / 'packaged-build-completion.json')
assert completion['exit_code'] == 0 and completion['terminal']
assert (s / 'packaged-hold-released.json').exists()
assert git('rev-parse', 'HEAD').decode().strip() == candidate
assert not git('status', '--porcelain=v1')
rows = read(s / 'packaged-builds.json')
archives = read(s / 'package-archives.json')
assert len(rows) == 12 and len(archives) == 18
assert completion['controls'] == 12960
assert completion['workspace_output_trace_matches'] == 12960
sources = ['fixture.rs', 'operation.rs', 'lib.rs', 'main.rs', 'invoke.cjs']
for name in sources:
    assert (s / 'consumer' / name).read_bytes() == (old / 'portable' / name).read_bytes()

verified_source_files = 0
for row in archives:
    path = Path(row['path'])
    assert path.stat().st_size == row['bytes']
    assert sha(path.read_bytes()) == row['sha256']
    with tarfile.open(path) as tar:
        prefix = f"{row['name']}-{row['version']}/"
        members = tar.getmembers()
        assert all(m.isfile() and m.name.startswith(prefix) for m in members)
        contents = {m.name[len(prefix):]: tar.extractfile(m).read() for m in members}
    assert len(contents) == len(members)
    vcs = json.loads(contents['.cargo_vcs_info.json'])
    assert vcs == row['vcs'] and vcs['git']['sha1'] == row['revision']
    assert not vcs['git'].get('dirty', False)
    checked = {f['path']: f['sha256'] for f in row['source_files']}
    assert set(contents) - {'Cargo.toml', 'Cargo.lock', '.cargo_vcs_info.json'} == set(checked)
    for name, digest in checked.items():
        original = checkout / 'crates' / row['name'] / ('Cargo.toml' if name == 'Cargo.toml.orig' else name)
        relative = original.resolve().relative_to(checkout).as_posix()
        assert contents[name] == git('show', row['revision'] + ':' + relative)
        assert sha(contents[name]) == digest
        verified_source_files += 1

workspace_matches = 0
metadata_configs = 0
for row in rows:
    name = f"packaged-{row['label']}-{row['features'] or 'default'}-{row['kind']}"
    prior = name.replace('packaged-', 'portable-', 1)
    suffix = '-controls.jsonl.gz' if row['kind'] == 'native' else '-controls.jsonl'
    opener = gzip.open if row['kind'] == 'native' else open
    with opener(s / (name + suffix), 'rt') as actual, opener(old / (prior + suffix), 'rt') as expected:
        count = 0
        for a, b in zip(actual, expected, strict=True):
            a, b = json.loads(a), json.loads(b)
            assert a['config'] == b['config'] and a['output'] == b['output']
            if row['kind'] == 'native':
                assert a['exit_code'] == 0 and a['stderr'] == ''
            else:
                assert a['imports'] == []
                assert all(a[k] <= 192 * 1024**2 for k in ['before', 'materialized', 'after'])
            count += 1
        assert count == row['control_count']
        workspace_matches += count
    metadata = read(s / (name + '-metadata.log'))
    active = {n['id'] for n in metadata['resolve']['nodes']}
    local = []
    for package in metadata['packages']:
        if package['id'] not in active:
            continue
        path = Path(package['manifest_path'])
        if package['name'] == 'residual-certainty-consumer':
            assert path == work / 'consumer' / 'Cargo.toml'
        elif package['source'] is None or package['name'].startswith('hyper'):
            archive = next(a for a in archives if a['label'] == row['label'] and a['name'] == package['name'])
            assert package['version'] == archive['version'] and package['source'] is None
            assert path == work / 'packages' / f"{package['name']}-{package['version']}" / 'Cargo.toml'
            local.append(package['name'])
    assert sorted(local) == ['hyperlattice', 'hyperlimit', 'hyperreal', 'hypersolve']
    metadata_configs += 1
    artifact = Path(row['artifact']['path'])
    assert sha(artifact.read_bytes()) == row['artifact']['sha256']

assert workspace_matches == 12960
checks = read(s / 'packaged-final-checks.json')
assert len(checks) == 5 and all(c['exit_code'] == 0 for c in checks)
consumer_warnings = []
package_notices = []
for path in sorted(s.glob('*.stderr')):
    for line in path.read_text().splitlines():
        if line.startswith('warning:') or line.startswith('warning['):
            target = package_notices if path.name.endswith('-verified-packages.stderr') else consumer_warnings
            target.append({'file': path.name, 'line': line})
assert not consumer_warnings, consumer_warnings
assert all("ignoring " in r['line'] and "not included in the published package" in r['line'] for r in package_notices)
assert 'negative control: cleared compiler artifacts still use stale synthetic-registry source' in (s / 'package-cache-control.log').read_text()
assert 'package-cache acceptance passed' in (s / 'package-cache-control.log').read_text()

unchanged = ['crates/hypersolve/src/certification.rs', 'crates/hypersolve/src/failed_constraints.rs']
for path in unchanged:
    assert git('show', '4192d8c726d3333a31cb7eddc30cc0d464d61411:' + path) == (root / path).read_bytes()
ledger_hashes = {}
for path in ['docs/research/interval-memory-accounts.json', 'docs/research/interval-size-accounts.json', 'interval-inventory.tsv']:
    data = (root / path).read_bytes()
    assert data == git('show', '1449965cebd3994d8e730e31ea6a1fddd7373abf:' + path, cwd=root)
    ledger_hashes[path] = sha(data)

result = dict(
    archives=len(archives), source_files_verified=verified_source_files,
    final_images=len(rows), workspace_full_output_trace_matches=workspace_matches,
    metadata_configs=metadata_configs, no_workspace_library_fallback=True,
    unchanged_fixture_sources=sources, clippy_configs=4, formatting_pass=True,
    consumer_warnings=consumer_warnings, package_exclusion_notices=package_notices,
    package_cache_control_pass=True, source_and_ledgers_unchanged=ledger_hashes,
    candidate_restored=True, source_admitted=False, runtime_claim=False,
)
(review / 'verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: v for k, v in result.items() if k not in ['package_exclusion_notices', 'source_and_ledgers_unchanged']}, indent=2))
print('Preserved package exclusion notices:', len(package_notices))
