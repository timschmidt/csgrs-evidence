"""Absolute costs of the twelve newly admitted complete acceptance groups."""
import hashlib
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes

source = hashes()
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
consumer = json.loads((OUT/'consumers.json').read_text())
assert consumer['source'] == source
assert not json.loads((OUT/'qualification-driver.json').read_text())['failures']
binary = consumer['binaries']['new_native']
assert sha(binary['path']) == binary['sha256']
sampler = Path(__file__).with_name('measure.py')
inputs = {str(p): sha(p) for p in [Path(__file__), sampler]}
cpu = min(os.sched_getaffinity(0))
dest = OUT/'new-costs'
dest.mkdir(exist_ok=False)
trials = []
for trial in range(3):
    log = dest/f'trial-{trial}.log'
    resource = dest/f'trial-{trial}-resources.json'
    command = ['python3', str(sampler), str(resource), 'taskset', '-c', str(cpu), binary['path'], 'measure']
    print('Running new complete groups', trial, flush=True)
    with log.open('w') as output:
        result = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '900s', *command], cwd=ROOT, env=ENV, stdout=output, stderr=subprocess.STDOUT)
    rows = [json.loads(line) for line in log.read_text().splitlines() if line.startswith('{')]
    trials.append(dict(trial=trial, command=command, exit_code=result.returncode,
                       log=str(log.relative_to(OUT)), resource=json.loads(resource.read_text()), rows=rows))
    (dest/'trials.json').write_text(json.dumps(trials, indent=2)+'\n')
    assert result.returncode == trials[-1]['resource']['exit_code'] == 0 and len(rows) == 12
    assert hashes() == source and sha(binary['path']) == binary['sha256']
    assert all(sha(p) == value for p, value in inputs.items())
strip = lambda rows: [{k: v for k, v in row.items() if k not in ['elapsed_ns', 'allocation_calls', 'requested_bytes']} for row in rows]
assert all(strip(trial['rows']) == strip(trials[0]['rows']) for trial in trials)
summary = []
for index, row in enumerate(trials[0]['rows']):
    values = [trial['rows'][index] for trial in trials]
    summary.append(dict(case=row['case'], outcome=row['outcome'], iterations=row['iterations'],
                        median={key: statistics.median(value[key]/value['iterations'] for value in values)
                                for key in ['elapsed_ns', 'allocation_calls', 'requested_bytes']}))
(OUT/'new-costs.json').write_text(json.dumps(dict(source=source, inputs=inputs, binary=binary,
    cpu=cpu, platform=platform.platform(), rustc=subprocess.check_output(['rustc', '-Vv'], env=ENV, text=True),
    trials=trials, rows=summary, scope='Absolute complete-workflow costs, including independently checked geometry, replay, supported continuation and expected typed controls. Three CPU-pinned processes, one warmup plus three measured repetitions per group per process. No task builds/tests overlap; shared host and warm OS caches. No error-to-success comparison or general speedup claim. Allocation requests and RSS do not bound retained heap, coefficient bits, total work or cancellation.'), indent=2)+'\n')
