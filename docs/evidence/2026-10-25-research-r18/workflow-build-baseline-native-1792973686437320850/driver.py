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
variant = sys.argv[1]
mode = "native"
assert variant in ['baseline', 'candidate'] and mode in ['native', 'allocations']
record = raw / ('workflow-build-' + variant + '-' + mode + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
base = json.loads((raw / 'baseline-sources.json').read_text())
runtime = ['crates/hyperreal/src/computable/node/' + name for name in
           ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs']]
expected = base if variant == 'baseline' else json.loads((raw / 'native-candidate-sources.json').read_text())
for name in runtime:
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected[name], name
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-native-target',
           CCACHE_DIR='/tmp/csgrs-r18-native-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r18-native-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
names = {str(root / name): name for name in base}
names[str(root / 'tests/r18_workflow_cost.rs')] = 'tests/r18_workflow_cost.rs'
def inventory():
    return {label: hashlib.sha256(Path(path).read_bytes()).hexdigest() for path, label in names.items()}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
for path, label in names.items():
    if label == 'tests/r18_workflow_cost.rs' or label in runtime:
        target = record / 'source' / label
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(Path(path).read_bytes())
command = ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs',
           '--no-default-features', '--features', 'curve,stl-io,obj-io',
           '--test', 'r18_workflow_cost', '--no-run', '--message-format=json']
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
    ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']}}, indent=2) + '\n')
assert status == 0, (record, status)
binaries = []
for line in (record / 'build.stdout').read_text().splitlines():
    row = json.loads(line)
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'r18_workflow_cost':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
result = {'record': str(record), 'variant': variant, 'mode': mode,
          'binary': str(binary), 'bytes': binary.stat().st_size,
          'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources_unchanged': True,
          'sources': str(record / 'sources.json'), 'harness_sha256': before['tests/r18_workflow_cost.rs'],
          'lock_sha256': before['Cargo.lock'],
          'sections': subprocess.check_output(['size', '-A', str(binary)], text=True),
          'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
          'features': 'csgrs curve,stl-io,obj-io; no dispatch-trace feature',
          'allocator': 'System' if mode == 'native' else 'counting System requests, full new realloc size'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / ('latest-workflow-build-' + variant + '-' + mode + '.json')).write_text(json.dumps(result, indent=2) + '\n')
print('R18 WORKFLOW BUILD COMPLETE', variant, mode, record, flush=True)
