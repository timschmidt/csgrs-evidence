from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
purpose = sys.argv[1]
assert purpose in ['allocator-check', 'lifecycle', 'held-report', 'full-release']
build = json.loads((raw / 'latest-trace-build.json').read_text())
binary = Path(build['binary'])
assert hashlib.sha256(binary.read_bytes()).hexdigest() == build['sha256']
record = raw / (purpose + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
assert 'UPDATE_HYPERCIRCUIT_EASYDUINO_RELEASE_SNAPSHOT' not in env
for key in ['EASYDUINO_STAGE', 'EASYDUINO_CHECK', 'R17_STOP_STAGE', 'R17_REPEATS', 'R17_ALLOCATOR_CHECK']:
    env.pop(key, None)
env['EASYDUINO_BOARD'] = 'nano'
cmd = [str(binary)]
if purpose == 'allocator-check':
    env['R17_ALLOCATOR_CHECK'] = '1'
elif purpose == 'lifecycle':
    env.update(EASYDUINO_STAGE='profile', R17_REPEATS='2')
elif purpose == 'held-report':
    env.update(EASYDUINO_STAGE='profile', R17_STOP_STAGE='report-projected')
    cmd = ['heaptrack', '--record-only', '-o', str(record / 'heaptrack'), str(binary)]
cmd = ['/usr/bin/time', '-v', *cmd]


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024 ** 3, 8 * 1024 ** 3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (2 * 1024 ** 3, 2 * 1024 ** 3))


start = time.monotonic()
with (record / 'run.stdout').open('w') as out, (record / 'run.stderr').open('w') as err:
    proc = subprocess.Popen(cmd, cwd='/tmp/csgrs-r17-trace', env=env,
                            stdout=out, stderr=err, preexec_fn=limits, start_new_session=True)
    try:
        status = proc.wait(timeout=600)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        status = 'timeout'
rows = []
repetition = 0
for line in (record / 'run.stderr').read_text().splitlines():
    if line.startswith('R17_REPETITION '):
        repetition = int(line.split()[1])
    if line.startswith('R17_MEMORY '):
        row = json.loads(line[len('R17_MEMORY '):])
        row['repetition'] = repetition
        rows.append(row)
(record / 'snapshots.json').write_text(json.dumps(rows, indent=2) + '\n')
meta = {'purpose': purpose, 'command': cmd, 'status': status,
        'seconds': time.monotonic() - start, 'build': build,
        'limits': {'seconds': 600, 'address_space_bytes': 8 * 1024 ** 3, 'file_bytes': 2 * 1024 ** 3},
        'env': {k: v for k, v in env.items() if k.startswith(('EASYDUINO_', 'R17_'))},
        'snapshot_rows': len(rows), 'native_timing': False,
        'scope': 'Diagnostic ownership/lifetime only; all-board golden comparison is not run by this single-board filter.'}
(record / 'completion.json').write_text(json.dumps(meta, indent=2) + '\n')
if status == 0:
    if purpose == 'allocator-check':
        assert 'R17_ALLOCATOR_CHECK passed' in (record / 'run.stdout').read_text()
    elif purpose == 'lifecycle':
        assert [r['stage'] for r in rows].count('after-all-drops') == 2
        assert [r['stage'] for r in rows].count('report-projected') == 2
    elif purpose == 'held-report':
        assert rows[-1]['stage'] == 'report-projected'
    else:
        assert rows[-1]['stage'] == 'after-all-drops'
        assert '268 DRC findings; 6 release blockers' in (record / 'run.stdout').read_text()
(raw / ('latest-' + purpose + '.json')).write_text(json.dumps({'record': str(record), 'status': status}, indent=2) + '\n')
print('R17 TRACE COMPLETE', purpose, status, record, flush=True)
