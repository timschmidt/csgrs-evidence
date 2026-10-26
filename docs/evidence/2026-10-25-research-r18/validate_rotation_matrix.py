from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
record = raw / ('rotation-matrix-validation-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-native-target',
           CCACHE_DIR='/tmp/csgrs-r18-native-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r18-native-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
base = json.loads((raw / 'baseline-sources.json').read_text())
names = [*base, 'tests/r18_compound_rotation_probe.rs']
def inventory():
    return {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
before = inventory()
changed = [name for name in names if name not in base or before[name] != base[name]]
for name in changed:
    target = record / 'source' / name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes((root / name).read_bytes())
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
(record / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--binary'], cwd=root))
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']},
    'changed_inputs': changed}, indent=2) + '\n')
commands = [
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300),
    ('rotation-matrix', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs',
                         '--no-default-features', '--features', 'curve', '--test', 'r18_compound_rotation_probe',
                         '--', '--test-threads=1', '--nocapture'], 600),
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
    print('R18 CLEAN NATIVE', name, status, record, flush=True)
    assert status == 0, (name, record)
assert inventory() == before
result = {'record': str(record), 'sources_unchanged': True, 'commands': rows,
          'scope': 'Clean private candidate: original tests plus18fresh four-angle axis/family/policy combinations, each certified cube oracle, empty subtraction and strict empty-to-cube continuation. Validation timings are not matched performance measurements.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-rotation-matrix-validation.json').write_text(json.dumps(result, indent=2) + '\n')
print('R18 CLEAN NATIVE COMPLETE', record, flush=True)
