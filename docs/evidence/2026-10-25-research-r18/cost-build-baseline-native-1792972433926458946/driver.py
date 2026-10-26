from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
variant, mode = sys.argv[1:]
assert variant in ['baseline', 'candidate'] and mode in ['native', 'allocations']
record = raw / ('cost-build-' + variant + '-' + mode + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
base = json.loads((raw / 'baseline-sources.json').read_text())
runtime = ['crates/hyperreal/src/computable/node/' + name for name in
           ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs']]
expected = base if variant == 'baseline' else json.loads((raw / 'native-candidate-sources.json').read_text())
for name in runtime:
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected[name], name
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-cost-target',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
manifest = raw / 'cost/Cargo.toml'
if not manifest.with_name('Cargo.lock').exists():
    subprocess.run(['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(manifest)],
                   cwd=root, env=env, check=True, capture_output=True)
names = {str(root / name): name for name in base}
names.update({str(raw / 'cost' / name): 'cost/' + name for name in
              ['Cargo.toml', 'Cargo.lock', 'main.rs', 'allocator.rs', 'body.rs']})
def inventory():
    return {label: hashlib.sha256(Path(path).read_bytes()).hexdigest() for path, label in names.items()}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
for path, label in names.items():
    if label.startswith('cost/') or label in runtime:
        target = record / 'source' / label
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(Path(path).read_bytes())
command = ['cargo', 'build', '--locked', '--offline', '--release', '--manifest-path', str(manifest),
           '--message-format=json']
if mode == 'allocations': command.extend(['--features', 'allocations'])
start = time.monotonic()
with (record / 'build.stdout').open('w') as out, (record / 'build.stderr').open('w') as err:
    process = subprocess.Popen(command, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
    try:
        status = process.wait(timeout=900)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()
        status = 'timeout'
(record / 'command.json').write_text(json.dumps({'command': command, 'status': status,
    'seconds': time.monotonic() - start, 'env': {k: env[k] for k in
    ['CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']}}, indent=2) + '\n')
assert status == 0, (record, status)
binaries = []
for line in (record / 'build.stdout').read_text().splitlines():
    row = json.loads(line)
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'r18_predicate_cost':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
result = {'record': str(record), 'variant': variant, 'mode': mode,
          'binary': str(binary), 'bytes': binary.stat().st_size,
          'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources_unchanged': True,
          'sources': str(record / 'sources.json'), 'harness_sha256': before['cost/main.rs'],
          'lock_sha256': before['cost/Cargo.lock'],
          'sections': subprocess.check_output(['size', '-A', str(binary)], text=True),
          'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
          'features': 'hyperlimit default std + serde; hyperreal serde + cached-f64-approx matching the root dependency; no dispatch-trace feature',
          'allocator': 'System' if mode == 'native' else 'counting System requests, full new realloc size'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / ('latest-cost-build-' + variant + '-' + mode + '.json')).write_text(json.dumps(result, indent=2) + '\n')
print('R18 COST BUILD COMPLETE', variant, mode, record, flush=True)
