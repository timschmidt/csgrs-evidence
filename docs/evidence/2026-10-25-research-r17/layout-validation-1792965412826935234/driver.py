from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
record = raw / ('layout-validation-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r17-trace-target',
           CCACHE_DIR='/tmp/csgrs-r17-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r17-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_BENCH_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes', PROPTEST_RNG_SEED='20261025')
names = subprocess.check_output(['git', 'ls-files', '--cached', '--others', '--exclude-standard'], cwd=root, text=True).splitlines()
names = [n for n in names if (root / n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml', 'Cargo.lock', 'config.toml'])]
def inventory():
    return {n: hashlib.sha256((root / n).read_bytes()).hexdigest() for n in names}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
commands = [
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check']),
    ('hyperreal-tests', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperreal', '--all-features']),
    ('hyperlimit-tests', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperlimit', '--all-features']),
    ('hyperreal-clippy', ['cargo', 'clippy', '--locked', '--offline', '--release', '-p', 'hyperreal', '--all-features', '--all-targets', '--', '-D', 'warnings']),
]
rows = []
for name, cmd in commands:
    start = time.monotonic()
    with (record / (name + '.stdout')).open('w') as out, (record / (name + '.stderr')).open('w') as err:
        proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
        try:
            status = proc.wait(timeout=1800)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    rows.append({'name': name, 'command': cmd, 'status': status, 'seconds': time.monotonic() - start})
    (record / 'commands.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R17 VALIDATION', name, status, record, flush=True)
assert inventory() == before
result = {'record': str(record), 'sources_unchanged': True,
          'all_passed': all(r['status'] == 0 for r in rows)}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-layout-validation.json').write_text(json.dumps(result, indent=2) + '\n')
raise SystemExit(0 if result['all_passed'] else 1)
