from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
build = json.loads((raw / 'latest-original-build.json').read_text())
binary = Path(build['binary'])
assert hashlib.sha256(binary.read_bytes()).hexdigest() == build['sha256']
record = raw / ('original-runs-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
rows = []
for case in ['binary64', 'decimal']:
    cmd = ['/usr/bin/time', '-v', str(binary), case + '_compound_round_trip_union_matches_unit_cube',
           '--exact', '--test-threads=1', '--nocapture']
    start = time.monotonic()
    with (record / (case + '.stdout')).open('w') as out, (record / (case + '.stderr')).open('w') as err:
        proc = subprocess.Popen(cmd, cwd='/home/tim/Documents/GitHub/workspace/csgrs', stdout=out,
                                stderr=err, preexec_fn=limits, start_new_session=True)
        try:
            status = proc.wait(timeout=300)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    stderr = (record / (case + '.stderr')).read_text()
    rows.append({'case': case, 'command': cmd, 'status': status, 'seconds': time.monotonic() - start,
                 'stages': [line for line in stderr.splitlines() if line.startswith('R18_')],
                 'limits': {'seconds': 300, 'address_space_bytes': 8 * 1024**3, 'file_bytes': 64 * 1024**2}})
    (record / 'results.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R18 ORIGINAL', case, status, record, flush=True)
result = {'record': str(record), 'build': build, 'runs': rows,
          'scope': 'Fresh processes, original strict union before any coordinate proof query. Successful outcomes must pass cube half-space/volume oracle and continued exact difference. External limits are not an internal resource contract.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-original-runs.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R18 ORIGINAL REPRODUCTION COMPLETE', record, flush=True)
