"""Matched ABBA timing of complete source-bound matrix projection and norm."""
import ast, hashlib, json, os, pathlib, platform, random, shutil, statistics, subprocess, time
root=pathlib.Path(__file__).resolve().parent
artifacts=pathlib.Path('/tmp/interval-refactor/jacobian-matrix-binaries')
out=root/'timing-warmed'; out.mkdir(exist_ok=True)
active=artifacts/'layout-timing-active'
env=dict(os.environ,TIMING='1')
metadata={'host':platform.uname()._asdict(),'cpu':pathlib.Path('/proc/cpuinfo').read_text(),'allowed_cpus':sorted(os.sched_getaffinity(0)),'start_loadavg':pathlib.Path('/proc/loadavg').read_text(),'limitations':['No control of host activity or clock/frequency','Small empty/unit cases approach timer overhead','Repeated projection of already constructed regular evidence; source construction excluded'],'runs':[]}
cpu=min(os.sched_getaffinity(0)); expected=None; cases={}
for block in range(6):
 for slot,name in enumerate(['manual','shared','shared','manual']):
  source=artifacts/('layout-'+name); shutil.copy2(source,active)
  command=['setarch',platform.machine(),'-R','taskset','-c',str(cpu),str(active)]
  warm_command=['taskset','-c',str(cpu),'python3','-c','import time; end=time.perf_counter()+1.0\nwhile time.perf_counter()<end: pass']
  subprocess.run(warm_command,check=True)
  start=time.monotonic()
  p=subprocess.run(command,env=env,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True,check=True,timeout=180)
  tag=f'{block:02d}-{slot}-{name}'
  (out/(tag+'.stdout')).write_text(p.stdout);(out/(tag+'.stderr')).write_text(p.stderr)
  rows=p.stdout.splitlines(); stable=[row for row in rows if not row.startswith('TIME ')]
  if expected is None: expected=stable
  assert stable==expected,tag
  values={}
  for row in rows:
   if row.startswith('TIME '):
    parts=row.split(' ',5); key=' '.join(parts[1:5]); samples=ast.literal_eval(parts[5]);assert len(samples)==31
    values[key]=samples; cases.setdefault(key,{})[(block,slot)]=statistics.median(samples)
  assert len(values)==12
  metadata['runs'].append({'block':block,'slot':slot,'kind':name,'file':tag+'.stdout','seconds':time.monotonic()-start,'returncode':p.returncode,'binary_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'command':command,'warm_command':warm_command})
  (out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
  print(tag,flush=True)
summary={};rng=random.Random(20261113)
for key,values in cases.items():
 ratios=[statistics.mean([values[(block,1)],values[(block,2)]])/statistics.mean([values[(block,0)],values[(block,3)]]) for block in range(6)]
 boots=sorted(statistics.mean(rng.choices(ratios,k=6)) for _ in range(10000))
 summary[key]={'manual_median_ns':statistics.median(v for (b,s),v in values.items() if s in (0,3)),'shared_median_ns':statistics.median(v for (b,s),v in values.items() if s in (1,2)),'shared_over_manual_block_ratios':ratios,'mean_ratio':statistics.mean(ratios),'bootstrap_95_percent_mean_ratio':[boots[249],boots[9749]]}
metadata['end_loadavg']=pathlib.Path('/proc/loadavg').read_text();(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
(out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
