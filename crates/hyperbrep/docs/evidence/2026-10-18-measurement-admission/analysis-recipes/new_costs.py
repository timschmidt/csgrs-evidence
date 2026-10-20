"""Absolute cost of new completed native work; no ratio against a former error."""
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
source=hashes()
qualified=json.loads((OUT/'consumers.json').read_text())
assert qualified['source']==source
binary=qualified['binaries']['new_native']
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert sha(binary['path'])==binary['sha256']
sampler=Path(__file__).with_name('measure.py')
inputs={str(p):sha(p) for p in [Path(__file__),sampler]}
dest=OUT/'new-costs';dest.mkdir(exist_ok=False)
cpu=min(os.sched_getaffinity(0));trials=[]
for index in range(3):
    resource=dest/f'trial-{index}-resources.json'
    log=dest/f'trial-{index}.log'
    command=['python3',str(sampler),str(resource),'taskset','-c',str(cpu),binary['path'],'measure']
    with log.open('w') as output:
        result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*command],cwd=ROOT,env=ENV,stdout=output,stderr=subprocess.STDOUT)
    trial=dict(command=command,exit_code=result.returncode,log=str(log.relative_to(OUT)),external_timeout_seconds=900,resources=json.loads(resource.read_text()))
    trials.append(trial)
    (dest/'trials.json').write_text(json.dumps(trials,indent=2)+'\n')
    assert result.returncode==trial['resources']['exit_code']==0
    trial['rows']=[json.loads(line) for line in log.read_text().splitlines() if line.startswith('{')]
    assert len(trial['rows'])==7 and all(row['iterations']==3 for row in trial['rows'])
    assert hashes()==source and sha(binary['path'])==binary['sha256']
    assert all(sha(p)==h for p,h in inputs.items())
    print('new native cost trial',index,'complete',flush=True)
rows=[]
for index,first in enumerate(trials[0]['rows']):
    values=[trial['rows'][index] for trial in trials]
    assert all((r['case'],r['outcome'],r['iterations'])==(first['case'],first['outcome'],first['iterations']) for r in values)
    rows.append(dict(case=first['case'],outcome=first['outcome'],iterations=3,
        median_ns=statistics.median(r['elapsed_ns']/3 for r in values),
        allocation_calls=statistics.median(r['allocation_calls']/3 for r in values),
        requested_bytes=statistics.median(r['requested_bytes']/3 for r in values)))
(OUT/'new-cost-summary.json').write_text(json.dumps(dict(source=source,binary=binary,inputs=inputs,cpu=cpu,trials=trials,rows=rows,
    scope='Three fresh CPU-pinned processes; each full regression group runs once before three timed repetitions. Complete exact assertions, materialization, replay and supported continuation remain. Seven full measurement admission and exchange groups retain successful workflows and expected-rejection controls. No comparison to former errors. Cumulative allocation requests are not retained heap; process RSS and timings are local shared-host observations. No task builds/tests overlap.'),indent=2)+'\n')
