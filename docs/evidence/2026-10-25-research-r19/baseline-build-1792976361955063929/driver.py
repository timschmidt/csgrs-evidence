from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import time
import tomllib

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r19-trace')
record = raw / ('baseline-build-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target', CARGO_BUILD_JOBS='1',
           CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
manifest = raw / 'probe/Cargo.toml'
lock = manifest.with_name('Cargo.lock')
if not lock.exists():
    shutil.copy2(root / 'Cargo.lock', lock)
    with (record / 'metadata.stdout').open('w') as out, (record / 'metadata.stderr').open('w') as err:
        subprocess.run(['cargo', 'metadata', '--offline', '--manifest-path', str(manifest), '--format-version=1'],
                       cwd=root, env=env, stdout=out, stderr=err, check=True, timeout=120)
packages = {(p['name'], p['version'], p.get('source')): p.get('checksum')
            for p in tomllib.loads((root / 'Cargo.lock').read_text())['package']}
for p in tomllib.loads(lock.read_text())['package']:
    if p.get('source'):
        key = (p['name'], p['version'], p['source'])
        assert key in packages and packages[key] == p.get('checksum'), key
base = json.loads((raw / 'baseline-sources.json').read_text())
def inventory():
    result = {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in base}
    result.update({'probe/' + name: hashlib.sha256((raw / 'probe' / name).read_bytes()).hexdigest()
                   for name in ['Cargo.toml', 'Cargo.lock', 'main.rs']})
    return result
before = inventory()
assert all(before[name] == digest for name, digest in base.items())
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
for name in ['Cargo.toml', 'Cargo.lock', 'main.rs']:
    (record / name).write_bytes((raw / 'probe' / name).read_bytes())
command = ['cargo', 'build', '--locked', '--offline', '--release', '--manifest-path', str(manifest), '--message-format=json']
start = time.monotonic()
with (record / 'build.stdout').open('w') as out, (record / 'build.stderr').open('w') as err:
    result = subprocess.run(command, cwd=root, env=env, stdout=out, stderr=err, timeout=900)
(record / 'command.json').write_text(json.dumps({'command': command, 'status': result.returncode,
    'seconds': time.monotonic() - start, 'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']},
    'scope': 'Functional probe build while R18 primary validation runs separately; no performance inference from duration.'}, indent=2) + '\n')
assert result.returncode == 0, record
artifacts = [r for line in (record / 'build.stdout').read_text().splitlines()
             if (r := json.loads(line)).get('reason') == 'compiler-artifact' and r.get('executable')]
assert len(artifacts) == 1
binary = record / 'probe-binary'
shutil.copy2(artifacts[0]['executable'], binary)
assert inventory() == before
result = {'record': str(record), 'binary': str(binary), 'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
    'bytes': binary.stat().st_size, 'sources_unchanged': True, 'sources': str(record / 'sources.json'),
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'source_status': 'Provisional final R18 source, still under primary validation; no R19 runtime changes.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-baseline-build.json').write_text(json.dumps(result, indent=2) + '\n')
print('R19 BASELINE PROBE BUILT', record, flush=True)
