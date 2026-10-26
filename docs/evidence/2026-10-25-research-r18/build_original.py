from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
probe = root / 'tests/r18_compound_rotation_probe.rs'
record = raw / ('original-build-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'probe.rs').write_bytes(probe.read_bytes())
base = json.loads((raw / 'baseline-sources.json').read_text())
def inventory():
    return {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in base}
assert inventory() == base
(record / 'sources.json').write_text(json.dumps({**base, str(probe.relative_to(root)): hashlib.sha256(probe.read_bytes()).hexdigest()}, indent=2) + '\n')
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r04-primary-only-target',
           CCACHE_DIR='/tmp/csgrs-r04-primary-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r04-primary-ccache/tmp', CARGO_BUILD_JOBS='2')
cmd = ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features',
       '--test', 'r18_compound_rotation_probe', '--no-run', '--message-format=json']
start = time.monotonic()
with (record / 'build.stdout').open('w') as out, (record / 'build.stderr').open('w') as err:
    proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
    try:
        status = proc.wait(timeout=1200)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        status = 'timeout'
(record / 'command.json').write_text(json.dumps({'command': cmd, 'status': status,
                                               'seconds': time.monotonic() - start,
                                               'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
                                               'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS']}}, indent=2) + '\n')
assert status == 0, record
binaries = []
for line in (record / 'build.stdout').read_text().splitlines():
    row = json.loads(line)
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'r18_compound_rotation_probe':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == base
assert probe.read_bytes() == (record / 'probe.rs').read_bytes()
probe.unlink()
result = {'record': str(record), 'binary': str(binary), 'bytes': binary.stat().st_size,
          'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
          'sources': str(record / 'sources.json'), 'sources_unchanged': True,
          'temporary_probe_removed_from_primary': True,
          'scope': 'Original consumer reproduction on current retained production implementation; no library instrumentation or recognizer change.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-original-build.json').write_text(json.dumps(result, indent=2) + '\n')
print('R18 ORIGINAL BUILD COMPLETE', record, flush=True)
