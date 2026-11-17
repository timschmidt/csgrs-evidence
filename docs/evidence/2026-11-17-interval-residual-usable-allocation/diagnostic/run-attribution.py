from pathlib import Path
import collections,hashlib,json,os,resource,signal,subprocess,time
from analyze import analyze
s=Path(__file__).parent
started=time.monotonic();deadline=started+900
rows=[];reference=None;held=False

def save(n,v): (s/n).write_text(json.dumps(v,indent=2)+'\n')
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def limits(): resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))
def ingest(row):
 global reference
 a=analyze(s/row['log'],row['mode']=='interposed')
 full=(a.pop('output'),a.pop('trace'))
 if reference is None: reference=full
 else: assert reference==full
 a['full_output_trace_sha256']=hashlib.sha256('\n'.join(full).encode()).hexdigest()
 rows.append(dict(**row,**a))
 save('observations.json',rows)

assert not (s/'completion.json').exists()
assert not os.environ.get('LD_PRELOAD')
images=json.loads((s/'original-images.json').read_text())
try:
 for r in images:
  assert hashlib.sha256(Path(r['path']).read_bytes()).hexdigest()==r['sha256']
 for row in json.loads((s/'pilot.json').read_text())['results']: ingest(row)
 assert state(1621335,'38218939')=='T' and state(3416600,'45823480')=='S'
 os.kill(3416600,signal.SIGSTOP);held=True
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 save('hold.json',dict(pid=os.getpid(),started_unix=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939'))
 for rep in range(24):
  for r in images:
   for mode in ['plain','interposed']:
    assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
    remaining=deadline-time.monotonic();assert remaining>0
    assert sum(p.stat().st_size for p in s.iterdir() if p.is_file())<512*1024**2
    env=dict(os.environ)
    if mode=='interposed':env.update(LD_PRELOAD=str(s/'malloc_trace.so'),RESIDUAL_ENABLED_OFFSET=r['offset'])
    name=f"{r['label']}-{rep:02}-{mode}.log"
    cmd=[r['path'],'24','observe','0','165','passive','strict','rebuild']
    with (s/name).open('wb') as out:
     p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=min(30,remaining),preexec_fn=limits)
    row=dict(label=r['label'],mode=mode,command=cmd,log=name,exit_code=p.returncode)
    assert p.returncode==0,row
    ingest(row)
 groups=[]
 for label in ['fixed','current','candidate']:
  for mode in ['plain','interposed']:
   selected=[r for r in rows if (r['label'],r['mode'])==(label,mode)]
   hist=collections.Counter()
   for r in selected:
    for h in r['histograms'][0]:hist[(h['kind'],h['requested'],h['usable'])]+=h['count']
   by_request=collections.defaultdict(set)
   for kind,n,u in hist:by_request[(kind,n)].add(u)
   variations=[dict(kind=k,requested=n,usable=sorted(us)) for (k,n),us in sorted(by_request.items()) if len(us)>1]
   groups.append(dict(label=label,mode=mode,processes=len(selected),epochs=[dict(epoch=selected[0]['epochs'][i]['epoch'],allocation_tuples=sorted(set(tuple(r['epochs'][i]['allocation']) for r in selected)),usable_tuples=sorted(set(tuple(r['epochs'][i]['usable']) for r in selected))) for i in range(3)],request_sequence_digests=sorted(set(r['event_request_sequence_sha256'] for r in selected if r['event_request_sequence_sha256'])),same_request_usable_variations=variations))
 assert len(rows)==146 and time.monotonic()<=deadline
 save('summary.json',dict(processes=len(rows),plain_processes=73,interposed_processes=73,reconciled_epochs=219,groups=groups,all_full_output_trace_equal=True,original_hashes_preserved=True,original_charges_subtracted=False,cap_revision=False,admitted=False,timing_claim=False,scope='Case 24 STRICT passive cold rebuilt input, three original no-feature binaries; requested allocation traffic and usable-byte accounting only. Instrumentation may perturb layout.'))
 save('completion.json',dict(terminal=True,exit_code=0,processes=len(rows),seconds=time.monotonic()-started))
 print(json.dumps(dict(processes=len(rows),reconciled_epochs=219,full_output_trace_equal=True)))
except BaseException as e:
 save('completion.json',dict(terminal=True,exit_code=1,error=repr(e),processes=len(rows),seconds=time.monotonic()-started));raise
finally:
 if held:
  assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
  os.kill(3416600,signal.SIGCONT)
  save('release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
