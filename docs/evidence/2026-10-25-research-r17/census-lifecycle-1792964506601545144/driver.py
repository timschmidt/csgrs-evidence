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
assert purpose in ['check', 'report', 'lifecycle']
build = json.loads((raw / 'latest-census-build.json').read_text())
binary = Path(build['binary'])
assert hashlib.sha256(binary.read_bytes()).hexdigest() == build['sha256']
record = raw / ('census-' + purpose + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
assert 'UPDATE_HYPERCIRCUIT_EASYDUINO_RELEASE_SNAPSHOT' not in env
for key in ['EASYDUINO_STAGE', 'EASYDUINO_CHECK', 'R17_STOP_STAGE', 'R17_REPEATS', 'R17_ALLOCATOR_CHECK', 'R17_CACHE_CHECK']:
    env.pop(key, None)
env['EASYDUINO_BOARD'] = 'nano'
if purpose == 'check':
    env['R17_CACHE_CHECK'] = '1'
else:
    env['EASYDUINO_STAGE'] = 'profile'
    if purpose == 'report':
        env['R17_STOP_STAGE'] = 'report-projected'
    else:
        env['R17_REPEATS'] = '2'
cmd = ['/usr/bin/time', '-v', str(binary)]


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024 ** 3, 8 * 1024 ** 3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024 ** 2, 64 * 1024 ** 2))


start = time.monotonic()
with (record / 'stdout').open('w') as out, (record / 'stderr').open('w') as err:
    proc = subprocess.Popen(cmd, cwd='/tmp/csgrs-r17-trace', env=env, stdout=out,
                            stderr=err, preexec_fn=limits, start_new_session=True)
    try:
        status = proc.wait(timeout=600)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        status = 'timeout'
memory, census = [], []
repetition = 0
for line in (record / 'stderr').read_text().splitlines():
    if line.startswith('R17_REPETITION '):
        repetition = int(line.split()[1])
    for prefix, rows in [('R17_MEMORY ', memory), ('R17_CENSUS ', census)]:
        if line.startswith(prefix):
            row = json.loads(line[len(prefix):])
            row['repetition'] = repetition
            rows.append(row)
(record / 'memory.json').write_text(json.dumps(memory, indent=2) + '\n')
(record / 'census.json').write_text(json.dumps(census, indent=2) + '\n')
meta = {'purpose': purpose, 'command': cmd, 'status': status, 'seconds': time.monotonic() - start,
        'build': build, 'env': {k: v for k, v in env.items() if k.startswith(('EASYDUINO_', 'R17_'))},
        'limits': {'seconds': 600, 'address_space_bytes': 8 * 1024 ** 3, 'file_bytes': 64 * 1024 ** 2},
        'state_bits': {'approximation': 1, 'quadratic_tower': 2, 'declined_fixed_parser': 4},
        'scope': 'Private occupancy instrumentation only; no policy/layout change and no native timing comparison.'}
(record / 'completion.json').write_text(json.dumps(meta, indent=2) + '\n')
assert status == 0, record
if purpose == 'check':
    assert 'R17_CACHE_CHECK passed' in (record / 'stdout').read_text()
else:
    assert len(memory) == len(census)
    assert [(r['stage'], r['repetition']) for r in memory] == [(r['stage'], r['repetition']) for r in census]
    if purpose == 'report':
        assert census[-1]['stage'] == 'report-projected'
    else:
        assert sum(r['stage'] == 'after-all-drops' for r in census) == 2
(raw / ('latest-census-' + purpose + '.json')).write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R17 CENSUS COMPLETE', purpose, record, flush=True)
