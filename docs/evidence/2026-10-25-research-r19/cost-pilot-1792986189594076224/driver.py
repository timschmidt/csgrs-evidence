from runtime_manifest import assert_runtime, runtime_sources
from pathlib import Path
import hashlib
import json
import os
import random
import resource
import signal
import subprocess
import sys
import time

raw=Path(__file__).resolve().parent
purpose=sys.argv[1]
assert purpose in ['baseline-check','functional','pilot','final','allocations','completion']
pairs={'baseline-check':1,'functional':1,'pilot':5,'final':30,'allocations':5,'completion':1}[purpose]
variants=['baseline'] if purpose=='baseline-check' else ['candidate'] if purpose=='completion' else ['baseline','candidate']
mode='allocations' if purpose=='allocations' else 'native'
if purpose in ['baseline-check','pilot','final']:
    from cost_gate import assert_cost_eligible
    assert_cost_eligible()
record=raw/('cost-'+purpose+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
builds={v:json.loads((raw/f'latest-cost-build-{v}-{mode}.json').read_text()) for v in variants}
for build in builds.values():
    assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
if 'candidate' in builds:
    candidate=json.loads((raw/'latest-candidate-runtime.json').read_text())
    assert_runtime(json.loads(Path(builds['candidate']['sources']).read_text()),'candidate')
if len(variants)==2:
    for key in ['harness_sha256','allocator_sha256','lock_sha256']:
        assert builds['baseline'][key]==builds['candidate'][key]
    sources={v:json.loads(Path(builds[v]['sources']).read_text()) for v in variants}
    assert sources['baseline'].keys()==sources['candidate'].keys()
    for variant in variants:assert_runtime(sources[variant],variant)
    assert {k for k in sources['baseline'] if sources['baseline'][k]!=sources['candidate'][k]}==set(runtime_sources('candidate'))
cells=[(kind,path) for kind in (range(10,12) if purpose=='completion' else range(10)) for path in ['json','cbor','value']]
if purpose in ['pilot','final']:
    batches=json.loads((raw/'cost-batches.json').read_text())['batches']
else:
    batches={f'{k}-{p}':8 if purpose=='allocations' else 1 for k,p in cells}
if purpose=='final':
    design=json.loads((raw/'cost-final-design.json').read_text());assert design['pairs']==pairs and design['batches']==batches
cpu=min(os.sched_getaffinity(0));rng=random.Random(20261025)
orders={f'{k}-{p}':[0,1]*(pairs//2)+([rng.randrange(2)] if pairs%2 else []) for k,p in cells}
for order in orders.values():rng.shuffle(order)
def read(path):
    try:return Path(path).read_text()
    except OSError:return None
fixtures=raw/'cost-fixtures'
digests={str(p.relative_to(fixtures)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(fixtures.rglob('*')) if p.is_file()}
meta={'purpose':purpose,'pairs':pairs,'builds':builds,'batches':batches,'cpu':cpu,'seed':20261025,
      'cpuinfo':read('/proc/cpuinfo'),'governor':read(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),
      'loadavg_start':read('/proc/loadavg'),'complete':False,'protected_metrics':90,'family_metrics':118,'protected_cases':list(range(10)),
      'completion_cases':[10,11],'input_sha256':digests,'mode':mode,
      'scope':'First process import then seven fresh-graph batches. Only import/admission is timed; strict continuation and exact wire verification/drop are outside. No failed/successful latency ratio.'}
(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2));resource.setrlimit(resource.RLIMIT_CORE,(0,0));os.sched_setaffinity(0,{cpu})
def checksum(outcome,count):
    code={'ExactPositive':1,'ExactNegative':2,'UnknownCertificate':3,'ParseError':4}[outcome];value=14695981039346656037
    for _ in range(count):value=(value*1099511628211)%(1<<64)^code
    return str(value)
queries=0;row_count=0
for pair in range(pairs):
    folder=record/f'pair-{pair:02}';folder.mkdir();shuffled=cells.copy();rng.shuffle(shuffled)
    for kind,path in shuffled:
        cell=f'{kind}-{path}';order=variants if orders[cell][pair]==0 else list(reversed(variants));comparison=[]
        expected=json.loads((fixtures/str(kind)/'fixture.json').read_text())['expected']
        for variant in order:
            prefix=folder/f'{variant}-{cell}'
            command=['/usr/bin/time','-v',builds[variant]['binary'],str(fixtures/str(kind)),path,str(batches[cell])]
            start=time.monotonic()
            with prefix.with_suffix('.stdout').open('w') as out,prefix.with_suffix('.stderr').open('w') as err:
                proc=subprocess.Popen(command,cwd=raw/'cost',stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
                try:status=proc.wait(timeout=120)
                except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
            with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'pair':pair,'kind':kind,'path':path,'variant':variant,'order':order,'command':command,'status':status,'seconds':time.monotonic()-start})+'\n')
            assert status==0,(record,cell,variant,status)
            rows=[json.loads(line) for line in prefix.with_suffix('.stdout').read_text().splitlines()];assert len(rows)==8
            for sample,row in enumerate(rows):
                assert row['kind']==kind and row['path']==path and row['sample']==sample
                assert row['phase']==('first' if sample==0 else 'warm')
                assert row['iterations']==(1 if sample==0 else batches[cell])
                assert row['outcome']==expected and row['checksum']==checksum(expected,row['iterations'])
                assert row['allocation_instrumented']==(mode=='allocations') and row['ns']>0
                queries+=row['iterations'];row_count+=1
            prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(row)+'\n' for row in rows))
            comparison.append([{k:r[k] for k in ['kind','path','phase','sample','iterations','outcome','checksum']} for r in rows])
        if len(comparison)==2:assert comparison[0]==comparison[1]
    print('R19 COST',purpose,'PAIR',pair+1,'complete',flush=True)
assert digests=={str(p.relative_to(fixtures)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(fixtures.rglob('*')) if p.is_file()}
meta.update(complete=True,verified_import_results=queries,outcome_rows=row_count,loadavg_end=read('/proc/loadavg'))
(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
(raw/f'latest-cost-{purpose}.json').write_text(json.dumps({'record':str(record)},indent=2)+'\n')
print('R19 COST COMPLETE',record,queries,'verified imports',flush=True)
