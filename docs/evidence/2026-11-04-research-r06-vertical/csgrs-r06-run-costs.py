# Retained from the inline Python campaign. Process commands/times are in processes.json.
from pathlib import Path
import json,os,subprocess,statistics,time,hashlib
out=Path('/tmp/csgrs-r06-cost-samples');out.mkdir(exist_ok=False)
cpu=max(os.sched_getaffinity(0));processes=[]
for pair in range(3):
 for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
  stem=out/f'{pair}-{variant}';command=[f'/tmp/csgrs-r06-cost-{variant}-bin',str(stem.with_suffix('.rows')),'legacy'];started=time.time()
  with stem.with_suffix('.tsv').open('w') as o,stem.with_suffix('.stderr').open('w') as e:
   r=subprocess.run(command,stdout=o,stderr=e,preexec_fn=lambda:os.sched_setaffinity(0,{cpu}),timeout=120)
  processes.append({'pair':pair,'variant':variant,'command':command,'cpu':cpu,'started':started,'elapsed':time.time()-started,'status':r.returncode});(out/'processes.json').write_text(json.dumps(processes,indent=2)+'\n');assert r.returncode==0
  print(pair,variant,'done',flush=True)
rows=[p.read_bytes() for p in sorted(out.glob('[0-2]-*.rows'))];assert len(rows)==6 and all(x==rows[0] for x in rows)
print('All nine legacy outcome/artifact rows match:',hashlib.sha256(rows[0]).hexdigest(),flush=True)
(out/'row-hashes.json').write_text(json.dumps({p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(out.glob('[0-2]-*.rows'))},indent=2)+'\n')
columns=['ns','requested_bytes','allocation_calls','peak_logical_bytes','retained_bytes','post_drop_delta']
def summarize(paths,variants):
 groups={}
 for path in paths:
  for line in path.read_text().splitlines():
   name,iteration,*values=line.split('\t');key=(name,path.stem.split('-')[1] if variants else 'candidate');groups.setdefault(key,[]).append(list(map(int,values)))
 result=[]
 for (name,variant),samples in sorted(groups.items()):
  row={'fixture':name,'variant':variant,'samples':len(samples)};row.update({k:statistics.median(s[i] for s in samples) if i==0 else sorted({s[i] for s in samples}) for i,k in enumerate(columns)});result.append(row)
 return result
(out/'summary.json').write_text(json.dumps(summarize(sorted(out.glob('[0-2]-*.tsv')),True),indent=2)+'\n')
stem=out/'candidate-new'
with stem.with_suffix('.tsv').open('w') as o,stem.with_suffix('.stderr').open('w') as e:
 r=subprocess.run(['/tmp/csgrs-r06-cost-candidate-bin',str(stem.with_suffix('.rows')),'new'],stdout=o,stderr=e,preexec_fn=lambda:os.sched_setaffinity(0,{cpu}),timeout=120)
assert r.returncode==0
assert all(x['curve_admission']=='Unsupported' for x in map(json.loads,stem.with_suffix('.rows').read_text().splitlines()))
(out/'new-summary.json').write_text(json.dumps(summarize([stem.with_suffix('.tsv')],False),indent=2)+'\n')
print('Four new solver component workflows complete; native admission remains explicitly Unsupported.',flush=True)
