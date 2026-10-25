from pathlib import Path
import hashlib,json,os,random,resource,signal,subprocess,sys,time
raw=Path(__file__).resolve().parent;purpose=sys.argv[1]
assert purpose in ['functional','pilot','final']
pairs={'functional':1,'pilot':5,'final':30}[purpose]
record=raw/('paired-cost-'+purpose+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
builds={v:json.loads((raw/('latest-cost-'+v+'.json')).read_text()) for v in ['baseline','candidate']}
assert builds['baseline']['harness_sha256']==builds['candidate']['harness_sha256']
for d in builds.values():
 assert hashlib.sha256(Path(d['binary']).read_bytes()).hexdigest()==d['sha256']
 d['sections']=subprocess.check_output(['size','-A',d['binary']],text=True)
cases=[(kind,policy) for kind in range(12) for policy in ['strict','approximate']]
if purpose=='functional':batches={str(k):1 for k in range(12)}
else:batches=json.loads((raw/'cost-batches.json').read_text())['batches']
if purpose=='final':assert (raw/'cost-final-design.json').exists()
cpu=min(os.sched_getaffinity(0));rng=random.Random(20261025)
orders={case:[0,1]*(pairs//2)+([rng.randrange(2)] if pairs%2 else []) for case in cases}
for seq in orders.values():rng.shuffle(seq)
def read(path):
 try:return Path(path).read_text()
 except OSError:return None
metadata={'purpose':purpose,'pairs':pairs,'batches':batches,'builds':builds,'cpu':cpu,'seed':20261025,'cpuinfo':read('/proc/cpuinfo'),'governor':read(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),'loadavg_start':read('/proc/loadavg'),'complete':False,'mode':'native','protected_metrics':48,'scope':'Complete private selected-incidence predicate with exact sign/receipt validation; first after construction plus seven warm batches; original workflows separate; no higher-priority extension inferred from timeout.'}
(record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
signs=['Zero','Positive','Negative','Positive','Zero','Zero','Positive','Negative','Zero','Zero','Zero','Negative']
def limits():
 resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));os.sched_setaffinity(0,{cpu})
def checksum(sign,n):
 c=14695981039346656037;code={'Negative':1,'Zero':2,'Positive':3}[sign]
 for _ in range(n):c=((c*1099511628211)&((1<<64)-1))^code
 return str(c)
queries=0
for pair in range(pairs):
 folder=record/f'pair-{pair:02}';folder.mkdir();shuffled=cases.copy();rng.shuffle(shuffled)
 for kind,policy in shuffled:
  order=['baseline','candidate'] if orders[kind,policy][pair]==0 else ['candidate','baseline'];comparison=[]
  for variant in order:
   prefix=folder/f'{variant}-{kind:02}-{policy}'
   env=os.environ.copy();env.update(R16_COST_KIND=str(kind),R16_COST_POLICY=policy,R16_COST_BATCH=str(batches[str(kind)]))
   env.pop('R16_COST_TRACE',None)
   if purpose=='functional':env['R16_COST_TRACE']='1'
   cmd=['/usr/bin/time','-v',builds[variant]['binary'],'bezier_offset::fiber_sign::tests::r16_cost_probe','--ignored','--exact','--test-threads=1','--nocapture']
   start=time.monotonic()
   with prefix.with_suffix('.stdout').open('w') as out,prefix.with_suffix('.stderr').open('w') as err:
    p=subprocess.Popen(cmd,env=env,stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
    try:status=p.wait(timeout=120)
    except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
   with (record/'commands.jsonl').open('a') as f:f.write(json.dumps({'pair':pair,'case':[kind,policy],'variant':variant,'order':order,'command':cmd,'status':status,'seconds':time.monotonic()-start})+'\n')
   assert status==0,(pair,kind,policy,variant,status)
   rows=[json.loads(line.split('R16_SAMPLE ',1)[1]) for line in prefix.with_suffix('.stderr').read_text().splitlines() if 'R16_SAMPLE ' in line]
   assert len(rows)==8
   for i,row in enumerate(rows):
    n=1 if i==0 else batches[str(kind)]
    assert row['kind']==kind and row['policy']==policy and row['sample']==i and row['iterations']==n
    assert row['certainty']=='Certified' and row['sign']==signs[kind] and row['checksum']==checksum(signs[kind],n)
    assert row['trace']==(purpose=='functional');queries+=n
   prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(r)+'\n' for r in rows))
   comparison.append([{k:r[k] for k in ['kind','policy','sample','iterations','certainty','sign','checksum']} for r in rows])
  assert comparison[0]==comparison[1]
 print('COST',purpose,'PAIR',pair+1,'complete',flush=True)
metadata.update(complete=True,total_certified_queries=queries,exact_outcome_row_pairs=pairs*len(cases)*8,loadavg_end=read('/proc/loadavg'))
(record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
(raw/('latest-cost-'+purpose+'.json')).write_text(json.dumps({'record':str(record)},indent=2)+'\n')
print('COST COMPLETE',record,flush=True)
