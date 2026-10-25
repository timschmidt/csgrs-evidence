from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
record = raw / ('retention-' + variant + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r17-trace-target',
           CCACHE_DIR='/tmp/csgrs-r17-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r17-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_BENCH_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
names = list(json.loads((raw / 'baseline-sources.json').read_text()))
names.append('crates/hyperreal/src/rational/arithmetic/r17_retention_tests.rs')
def inventory():
    return {n: hashlib.sha256((root / n).read_bytes()).hexdigest() for n in names}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
(record / 'test-source.rs').write_bytes((root / names[-1]).read_bytes())
(record / 'source.patch').write_bytes(subprocess.check_output(
    ['git', 'diff', '--', 'crates/hyperreal'], cwd=root))
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: v for k, v in env.items() if k.startswith(('CARGO_', 'CCACHE_', 'RUSTFLAGS'))},
}, indent=2) + '\n')
commands = [
    ['cargo', 'fmt', '--all', '--', '--check'],
    ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperreal',
     '--all-features', '--lib', 'r17_retention_tests', '--', '--nocapture'],
]
rows = []
for index, cmd in enumerate(commands):
    start = time.monotonic()
    with (record / f'{index}.stdout').open('w') as out, (record / f'{index}.stderr').open('w') as err:
        proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
        try:
            status = proc.wait(timeout=1800)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    row = {'command': cmd, 'status': status, 'seconds': time.monotonic() - start}
    rows.append(row)
    (record / 'commands.json').write_text(json.dumps(rows, indent=2) + '\n')
    print(variant, index, status, str(record), flush=True)
    if status != 0:
        break
assert inventory() == before
result = {'record': str(record), 'sources_unchanged': True,
          'passed': len(rows) == len(commands) and all(r['status'] == 0 for r in rows)}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / ('latest-retention-' + variant + '.json')).write_text(json.dumps(result, indent=2) + '\n')
sys.exit(0 if result['passed'] else 1)
