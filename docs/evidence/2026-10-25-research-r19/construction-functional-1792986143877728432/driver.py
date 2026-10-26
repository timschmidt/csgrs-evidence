from pathlib import Path
import hashlib, json, os, random, resource, signal, subprocess, sys, time
from runtime_manifest import assert_runtime, runtime_sources

raw=Path(__file__).resolve().parent
purpose=sys.argv[1]
assert purpose in ['functional','baseline-check','pilot','final','allocations']
pairs={'functional':1,'baseline-check':1,'pilot':5,'final':30,'allocations':5}[purpose]
variants=['baseline'] if purpose=='baseline-check' else ['baseline','candidate']
mode='allocations' if purpose=='allocations' else 'native'
if purpose in ['baseline-check','pilot','final']:
    from cost_gate import assert_cost_eligible
    assert_cost_eligible()
record=raw/f'construction-{purpose}-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
builds={v:json.loads((raw/f'latest-construction-build-{v}-{mode}.json').read_text()) for v in variants}
sources={v:json.loads(Path(b['sources']).read_text()) for v,b in builds.items()}
for variant,build in builds.items():
    assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
    assert_runtime(sources[variant],variant)
if len(variants)==2:
    for key in ['harness_sha256','allocator_sha256','lock_sha256']:
        assert builds['baseline'][key]==builds['candidate'][key]
    assert sources['baseline'].keys()==sources['candidate'].keys()
    assert {k for k in sources['baseline'] if sources['baseline'][k]!=sources['candidate'][k]}==set(runtime_sources('candidate'))
batches=json.loads((raw/'construction-batches.json').read_text())['batches'] if purpose in ['pilot','final'] else {str(k):8 if purpose=='allocations' else 1 for k in range(8)}
if purpose=='final':
    design=json.loads((raw/'construction-final-design.json').read_text())
    assert design['pairs']==pairs and design['batches']==batches and design['family_metrics']==118
cpu=min(os.sched_getaffinity(0));rng=random.Random(20261025)
orders={k:[0,1]*(pairs//2)+([rng.randrange(2)] if pairs%2 else []) for k in range(8)}
for order in orders.values():rng.shuffle(order)
meta={'purpose':purpose,'pairs':pairs,'mode':mode,'builds':builds,'batches':batches,'cpu':cpu,'seed':20261025,
      'complete':False,'protected_metrics':24,'family_metrics':118,
      'cpuinfo':Path('/proc/cpuinfo').read_text(),'loadavg_start':Path('/proc/loadavg').read_text(),
      'plan_sha256':hashlib.sha256((raw/'native-construction-plan.json').read_bytes()).hexdigest(),
      'scope':'Prepared operands and checked inverse admission outside timing; fresh result clone/multiply/preallocated write timed. Every output validated under STRICT and serialized outside timing. Intended shared reciprocal One representation changes only cases 2 and 7.'}
(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))
    resource.setrlimit(resource.RLIMIT_CORE,(0,0));os.sched_setaffinity(0,{cpu})
def checksum(code,count):
    value=14695981039346656037
    for _ in range(count):value=(value*1099511628211)%(1<<64)^code
    return str(value)
verified=0;artifact_changes=[]
for pair in range(pairs):
    folder=record/f'pair-{pair:02}';folder.mkdir();cases=list(range(8));rng.shuffle(cases)
    for kind in cases:
        order=variants if orders[kind][pair]==0 else list(reversed(variants));comparison={}
        expected='ExactNegative' if kind==0 else 'ExactZero' if kind==4 else 'ExactPositive'
        for variant in order:
            prefix=folder/f'{variant}-{kind}'
            command=['/usr/bin/time','-v',builds[variant]['binary'],str(kind),str(batches[str(kind)])]
            start=time.monotonic()
            with prefix.with_suffix('.stdout').open('x') as out,prefix.with_suffix('.stderr').open('x') as err:
                proc=subprocess.Popen(command,cwd=raw/'construction',stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
                try:status=proc.wait(timeout=120)
                except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
            with (record/'commands.jsonl').open('a') as out:
                out.write(json.dumps({'pair':pair,'kind':kind,'variant':variant,'order':order,'command':command,'status':status,'seconds':time.monotonic()-start})+'\n')
            assert status==0,(record,pair,kind,variant,status)
            rows=[json.loads(line) for line in prefix.with_suffix('.stdout').read_text().splitlines()];assert len(rows)==8
            for sample,row in enumerate(rows):
                assert row['kind']==kind and row['sample']==sample
                assert row['phase']==('first' if sample==0 else 'warm')
                assert row['iterations']==(1 if sample==0 else batches[str(kind)]) and row['ns']>0
                assert row['outcome']==expected
                assert row['checksum']==checksum(2 if kind==0 else 3 if kind==4 else 1,row['iterations'])
                assert row['allocation_instrumented']==(mode=='allocations')
                assert row['input']==rows[0]['input'] and row['wire']==rows[0]['wire']
                verified+=row['iterations']
            prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(row)+'\n' for row in rows))
            comparison[variant]=rows[0]
        if len(comparison)==2:
            baseline,candidate=comparison['baseline'],comparison['candidate']
            assert baseline['input']==candidate['input']
            if kind in [2,7]:
                assert candidate['wire']['computable']['internal']=='One',(kind,candidate['wire'])
                assert 'Multiply' in baseline['wire']['computable']['internal'],(kind,baseline['wire'])
                artifact_changes.append({'pair':pair,'kind':kind,'baseline':baseline['wire'],'candidate':candidate['wire'],'proof':'Every output minus exact one is STRICT ExactZero in both variants.'})
            else:
                assert baseline['wire']==candidate['wire'],(kind,'unexpected representation change')
                if kind in [3,5,6]:assert 'Multiply' in candidate['wire']['computable']['internal']
    print('R19 CONSTRUCTION',purpose,'PAIR',pair+1,'complete',flush=True)
meta.update(complete=True,verified_construction_results=verified,loadavg_end=Path('/proc/loadavg').read_text())
(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
(record/'intentional-representation-changes.json').write_text(json.dumps(artifact_changes,indent=2)+'\n')
(raw/f'latest-construction-{purpose}.json').write_text(json.dumps({'record':str(record)},indent=2)+'\n')
print('R19 CONSTRUCTION COMPLETE',record,verified,'verified outputs',flush=True)
