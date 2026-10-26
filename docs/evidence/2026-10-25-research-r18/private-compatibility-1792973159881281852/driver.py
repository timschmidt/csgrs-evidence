from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
record = raw / ('private-compatibility-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-native-target',
           CCACHE_DIR='/tmp/csgrs-r18-native-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r18-native-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
names = [*json.loads((raw / 'baseline-sources.json').read_text()),
         'tests/r18_compound_rotation_probe.rs']
def inventory():
    return {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
before = inventory()
expected = json.loads((raw / 'native-candidate-sources.json').read_text())
assert all(before[name] == expected[name] for name in expected)
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR',
                              'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']}}, indent=2) + '\n')
common = ['--locked', '--offline', '--release']
owners = ['-p', 'hyperreal', '-p', 'hyperlimit']
public = ['-p', 'csgrs', '--no-default-features', '--features', 'curve,stl-io,obj-io']
commands = [
    ('owner-default-clippy', ['cargo', 'clippy', *common, *owners, '--all-targets', '--', '-D', 'warnings'], 1200),
    ('owner-all-feature-clippy', ['cargo', 'clippy', *common, *owners, '--all-targets', '--all-features', '--', '-D', 'warnings'], 1200),
    ('public-clippy', ['cargo', 'clippy', *common, *public, '--test', 'r18_compound_rotation_probe', '--test', 'downstream_solids', '--test', 'successive_operations', '--', '-D', 'warnings'], 1200),
    ('downstream-solids', ['cargo', 'test', *common, *public, '--test', 'downstream_solids', '--', '--test-threads=1'], 1200),
    ('cylinder-matrix', ['cargo', 'test', *common, *public, '--test', 'downstream_solids', 'near_coincident_rotated_cylinder_boolean_matrix_completes_exactly', '--', '--ignored', '--exact', '--test-threads=1'], 1200),
    ('successive-operations', ['cargo', 'test', *common, *public, '--test', 'successive_operations', '--', '--include-ignored', '--test-threads=1', '--nocapture'], 2400),
]
rows = []
for name, command, timeout in commands:
    start = time.monotonic()
    with (record / (name + '.stdout')).open('w') as out, (record / (name + '.stderr')).open('w') as err:
        process = subprocess.Popen(command, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
        try:
            status = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            status = 'timeout'
    rows.append({'name': name, 'command': command, 'status': status, 'seconds': time.monotonic() - start})
    (record / 'commands.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R18 PRIVATE COMPATIBILITY', name, status, record, flush=True)
    assert status == 0, (name, record)
assert inventory() == before
result = {'record': str(record), 'sources_unchanged': True, 'commands': rows,
          'scope': 'Private candidate owner lint and unchanged public compatibility gates, including the ignored full cylinder matrix and all successive chains. Validation wall times are not native performance comparisons.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-private-compatibility.json').write_text(json.dumps(result, indent=2) + '\n')
print('R18 PRIVATE COMPATIBILITY COMPLETE', record, flush=True)
