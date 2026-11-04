from pathlib import Path
import json,os,subprocess,time,statistics,hashlib
out=Path('/tmp/csgrs-r06-field-cost-drop-samples');out.mkdir()
cpu=max(os.sched_getaffinity(0));processes=[];cases=['rational3','swapped3','singular3','pivot_free2','pivot_free3','pivot_free4']
for pair in range(3):
 for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
  for case in cases:
   stem=out/f'{pair}-{variant}-{case}';cmd=['/tmp/csgrs-r06-field-'+variant+'.bin',case,str(stem.with_suffix('.rows'))];start=time.time()
   with stem.with_suffix('.tsv').open('w') as log,stem.with_suffix('.stderr').open('w') as err:
    result=subprocess.run(cmd,stdout=log,stderr=err,preexec_fn=lambda:os.sched_setaffinity(0,{cpu}),timeout=60)
   processes.append(dict(pair=pair,variant=variant,case=case,command=cmd,cpu=cpu,elapsed=time.time()-start,exit_code=result.returncode));(out/'processes.json').write_text(json.dumps(processes,indent=2)+'\n');assert result.returncode==0,(variant,case)
  print(pair,variant,'completed',flush=True)
for case in cases:
 rows=[p.read_bytes() for p in out.glob('*-'+case+'.rows')];assert len(rows)==6 and all(v==rows[0] for v in rows)
columns=['ns','requested_bytes','allocation_calls','peak_logical_bytes','post_drop_delta'];groups={}
for p in out.glob('*.tsv'):
 _,variant,case=p.stem.split('-',2)
 for row in p.read_text().splitlines():
  _,i,*values=row.split('\t');groups.setdefault((variant,case),[]).append(list(map(int,values)))
summary=[]
for (variant,case),samples in sorted(groups.items()):
 assert len(samples)==60
 row=dict(variant=variant,case=case,samples=len(samples));row.update({key:statistics.median(x[i] for x in samples) if i==0 else sorted({x[i] for x in samples}) for i,key in enumerate(columns)});summary.append(row)
(out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(out/'row-hashes.json').write_text(json.dumps({p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(out.glob('*.rows'))},indent=2)+'\n')
print('Six legacy exact-native outcome rows identical across all process pairs.',flush=True)
