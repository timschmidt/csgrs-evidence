from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
build = json.loads((raw / 'latest-baseline-build.json').read_text())
assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest() == build['sha256']
record = raw / ('initial-reproduction-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
brackets = json.loads((raw / 'pi-brackets.json').read_text())
fixtures = []
for row in brackets['rows']:
    if row['bits'] not in [2048, 2304]:
        continue
    for side in ['below', 'above']:
        n, d = row[side]
        fixtures.append({'name': f"cot-{row['bits']}-{side}", 'kind': 'cot', 'bits': row['bits'],
            'side': side, 'numerator': n, 'denominator': d,
            'expected': 'Negative' if side == 'below' else 'Positive'})
fixtures.append({'name': 'quantile-cdf-1000', 'kind': 'quantile', 'expected': 'Positive'})
(record / 'metadata.json').write_text(json.dumps({'build': build, 'source_status': build['source_status'],
    'fixtures': fixtures, 'limits': {'seconds_per_process': 120, 'address_bytes': 8 * 1024**3,
    'output_file_bytes': 64 * 1024**2, 'rust_worker_stack_bytes': 2 * 1024**2},
    'scope': 'Functional source-preservation reproduction. R18 primary checks run separately; elapsed/RSS diagnostics are not native performance comparisons.',
    'complete': False}, indent=2) + '\n')

def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))

results = []
for fixture in fixtures:
    folder = record / fixture['name']
    folder.mkdir()
    (folder / 'fixture.json').write_text(json.dumps(fixture, indent=2) + '\n')
    for mode in ['emit', 'json', 'cbor', 'value']:
        if mode != 'emit' and not all((folder / ('value.' + suffix)).exists() for suffix in ['json', 'cbor']):
            results.append({'fixture': fixture['name'], 'mode': mode, 'status': 'no-complete-native-wire'})
            continue
        command = ['/usr/bin/time', '-v', build['binary'], mode, str(folder), 'sign']
        start = time.monotonic()
        with (folder / (mode + '.stdout')).open('w') as out, (folder / (mode + '.stderr')).open('w') as err:
            process = subprocess.Popen(command, cwd='/tmp/csgrs-r19-trace', stdout=out, stderr=err,
                                       preexec_fn=limits, start_new_session=True)
            try:
                status = process.wait(timeout=120)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                status = 'timeout'
        stages = []
        for line in (folder / (mode + '.stdout')).read_text().splitlines():
            stages.append(json.loads(line))
        result = {'fixture': fixture['name'], 'mode': mode, 'command': command,
            'status': status, 'seconds': time.monotonic() - start, 'stages': stages}
        results.append(result)
        (record / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
        print('R19 INITIAL', fixture['name'], mode, status,
              next((s for s in reversed(stages) if s['stage'] == 'complete'), stages[-1:] or None), flush=True)
    wires = {}
    for name in ['value.json', 'value.cbor']:
        p = folder / name
        if p.exists(): wires[name] = {'bytes': p.stat().st_size, 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()}
    (folder / 'wire-digests.json').write_text(json.dumps(wires, indent=2) + '\n')
meta = json.loads((record / 'metadata.json').read_text())
meta['complete'] = True
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / 'latest-initial-reproduction.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R19 INITIAL COMPLETE', record, flush=True)
