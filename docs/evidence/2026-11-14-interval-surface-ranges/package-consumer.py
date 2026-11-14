from pathlib import Path
import hashlib, json, os, shutil, subprocess, tarfile, time, tomllib

s = Path(__file__).parent / 'package-final'
s.mkdir()
r = Path('/mnt/development/csgrs-surface-interval-ranges')
b = Path('/mnt/development/.interval-refactor-build/surface-interval-ranges-packages-final')
b.mkdir()
home = b / 'cargo-home'
names = ['hyperreal', 'hyperinterval', 'hyperlattice-interval', 'hyperlattice',
         'hyperlimit', 'hypertri', 'hypersolve', 'hypercurve', 'hyperbrep']
head = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=r).decode().strip()
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=r)
(s / 'SOURCE.json').write_text(json.dumps(dict(commit=head, clean=True), indent=2)+'\n')
env = os.environ | {'CARGO_HOME': str(home), 'CARGO_TARGET_DIR': str(b / 'target'),
                    'CARGO_BUILD_JOBS': '2', 'CARGO_NET_OFFLINE': 'true'}
rows = []
def run(name, command, cwd, capture=False):
    print('START', name, flush=True)
    start = time.monotonic()
    with (s / (name + '.log')).open('xb') as output:
        result = subprocess.run(command, cwd=cwd, env=env, stdout=output,
                                stderr=subprocess.PIPE if capture else subprocess.STDOUT)
    if capture:
        (s / (name + '.stderr')).write_bytes(result.stderr)
    rows.append(dict(name=name, command=command, cwd=str(cwd),
                     returncode=result.returncode, seconds=time.monotonic()-start))
    (s / 'package-commands.json').write_text(json.dumps(rows, indent=2)+'\n')
    print(json.dumps(rows[-1]), flush=True)
    if result.returncode:
        print((s / (name + '.log')).read_text()[-5000:], flush=True)
        if capture:
            print(result.stderr.decode()[-5000:], flush=True)
        raise SystemExit(result.returncode)

# The helper reads the original Cargo home before the isolated home is set.
subprocess.run(['bash', '-c', 'source scripts/release-package-cache.sh; prepare_release_package_home "$1"',
                'bash', str(home)], cwd=r, check=True)
command = ['cargo', '+1.95.0', 'package', '--locked', '--config',
           'patch.crates-io.hypervoxel.path="crates/hypervoxel"']
for name in names:
    command += ['-p', name]
run('package-verified', command, r)
packages = b / 'packages'
packages.mkdir()
paths, artifacts = {}, []
for name in names:
    archive, = (b / 'target/package').glob(name + '-[0-9]*.crate')
    data = archive.read_bytes()
    with tarfile.open(archive) as tar:
        tar.extractall(packages, filter='data')
    path = packages / archive.name[:-6]
    paths[name] = path
    vcs = json.loads((path / '.cargo_vcs_info.json').read_text())
    assert vcs['git']['sha1'] == head and not vcs['git'].get('dirty', False)
    artifacts.append(dict(name=name, sha256=hashlib.sha256(data).hexdigest(),
                          bytes=len(data), vcs=vcs))
(s / 'package-artifacts.json').write_text(json.dumps(artifacts, indent=2)+'\n')
for name, relative in [('hyperbrep', 'src/geometry/interval_ranges.rs'),
                       ('hypersolve', 'src/expression_program/bivariate.rs')]:
    assert (paths[name] / relative).read_bytes() == (r / 'crates' / name / relative).read_bytes()
consumer = b / 'consumer'
(consumer / 'src').mkdir(parents=True)
example = (paths['hyperbrep'] / 'examples/surface_ranges.rs').read_bytes()
assert example == (r / 'crates/hyperbrep/examples/surface_ranges.rs').read_bytes()
(consumer / 'src/main.rs').write_bytes(example)
manifest = '''[package]
name="packaged-surface-interval-ranges"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hyperbrep={version="0.2.0",features=["interval-ranges"]}
hypersolve={version="0.4.0",default-features=false}
hyperreal="0.14.0"
hyperinterval={version="0.1.0",features=["hyperreal"]}
hyperlattice="0.7.0"
hyperlimit="0.5.0"
[patch.crates-io]
''' + ''.join(name+'={path='+json.dumps(str(path))+'}\n' for name, path in paths.items())
(consumer / 'Cargo.toml').write_text(manifest)
(s / 'packaged-consumer-Cargo.toml').write_text(manifest)
shutil.copyfile(r / 'Cargo.lock', consumer / 'Cargo.lock')
# Resolve only the changed root while retaining existing locked dependency versions.
run('consumer-resolve', ['cargo', '+1.95.0', 'metadata', '--offline', '--format-version', '1'], consumer, True)
shutil.copyfile(consumer / 'Cargo.lock', s / 'packaged-consumer-Cargo.lock')
baseline = tomllib.loads((r / 'Cargo.lock').read_text())['package']
allowed = {(p['name'], p['version'], p.get('source'), p.get('checksum')) for p in baseline if p.get('source')}
actual = tomllib.loads((consumer / 'Cargo.lock').read_text())['package']
changes = [p for p in actual if p.get('source') and
           (p['name'], p['version'], p.get('source'), p.get('checksum')) not in allowed]
(s / 'dependency-version-review.json').write_text(json.dumps(
    dict(registry_versions_and_checksums_preserved=not changes, unexpected=changes), indent=2)+'\n')
assert not changes, changes
metadata = json.loads((s / 'consumer-resolve.log').read_text())
found = []
for item in metadata['packages']:
    if item['name'].startswith('hyper'):
        assert item['name'] in names, item['name']
        assert Path(item['manifest_path']).resolve().is_relative_to(packages.resolve())
        assert item['source'] is None
        found.append(item['name'])
assert {'hyperreal', 'hyperinterval', 'hyperlattice', 'hyperlimit', 'hypersolve', 'hypercurve', 'hyperbrep'} <= set(found)
run('consumer-build', ['cargo', '+1.95.0', 'build', '--locked'], consumer)
run('consumer-run', ['cargo', '+1.95.0', 'run', '--locked'], consumer)
run('consumer-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '--', '-D', 'warnings'], consumer)
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=r)
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=r).decode().strip() == head
(s / 'packaged-consumer-source.json').write_text(json.dumps(dict(
    all_resolved_hyper_packages_from_archives=True, verified_packages=names,
    resolved_packages=sorted(found), source_commit=head,
    example_sha256=hashlib.sha256(example).hexdigest(), full_release_not_claimed=True), indent=2)+'\n')
print('Nine packages verified; archive-only surface consumer passed', flush=True)
