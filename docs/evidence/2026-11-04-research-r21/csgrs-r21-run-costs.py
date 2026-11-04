from pathlib import Path
import os,subprocess,time,json,hashlib,statistics
dest=Path('/tmp/csgrs-r21-cost-samples');dest.mkdir(exist_ok=True)
cpu=min(os.sched_getaffinity(0))
metadata=[]
for pair in range(3):
    for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
        stem=dest/f'{pair}-{variant}'
        cmd=[f'/tmp/csgrs-r21-cost-{variant}-bin',str(stem.with_suffix('.rows')),'legacy']
        started=time.time()
        with stem.with_suffix('.tsv').open('w') as out,stem.with_suffix('.stderr').open('w') as err:
            result=subprocess.run(cmd,stdout=out,stderr=err,preexec_fn=lambda:os.sched_setaffinity(0,{cpu}),timeout=120)
        metadata.append({'pair':pair,'variant':variant,'command':cmd,'cpu':cpu,'started':started,'elapsed_seconds':time.time()-started,'status':result.returncode})
        (dest/'processes.json').write_text(json.dumps(metadata,indent=2)+'\n')
        assert result.returncode==0,(variant,stem)
        rows=[json.loads(s) for s in stem.with_suffix('.rows').read_text().splitlines()]
        assert len(rows)==8
        assert [r['case'] for r in rows if 'error' in r]==['backtracking-rejection']
        print(pair,variant,'completed',flush=True)
raws=[p.read_bytes() for p in sorted(dest.glob('[0-2]-*.rows'))]
assert len(raws)==6 and all(r==raws[0] for r in raws)
(dest/'row-hashes.json').write_text(json.dumps({p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(dest.glob('[0-2]-*.rows'))},indent=2)+'\n')
groups={}
for path in sorted(dest.glob('[0-2]-*.tsv')):
    variant=path.stem.split('-')[1]
    for line in path.read_text().splitlines():
        name,iteration,*values=line.split('\t');groups.setdefault((name,variant),[]).append(list(map(int,values)))
columns=['ns','requested_bytes','allocation_calls','peak_logical_bytes','retained_bytes','post_drop_delta']
summary=[]
for (name,variant),samples in sorted(groups.items()):
    row={'fixture':name,'variant':variant,'samples':len(samples)}
    row.update({key:statistics.median(s[i] for s in samples) if i==0 else sorted({s[i] for s in samples}) for i,key in enumerate(columns)})
    summary.append(row)
(dest/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
stem=dest/'candidate-new'
with stem.with_suffix('.tsv').open('w') as out,stem.with_suffix('.stderr').open('w') as err:
    result=subprocess.run(['/tmp/csgrs-r21-cost-candidate-bin',str(stem.with_suffix('.rows')),'new'],stdout=out,stderr=err,preexec_fn=lambda:os.sched_setaffinity(0,{cpu}),timeout=120)
assert result.returncode==0
assert all('error' not in json.loads(s) for s in stem.with_suffix('.rows').read_text().splitlines())
groups={}
for line in stem.with_suffix('.tsv').read_text().splitlines():
    name,iteration,*values=line.split('\t');groups.setdefault(name,[]).append(list(map(int,values)))
summary=[]
for name,samples in sorted(groups.items()):
    row={'fixture':name,'samples':len(samples)}
    row.update({key:statistics.median(s[i] for s in samples) if i==0 else sorted({s[i] for s in samples}) for i,key in enumerate(columns)})
    summary.append(row)
(dest/'new-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print('Identical legacy rows SHA256:',hashlib.sha256(raws[0]).hexdigest(),flush=True)
print('All five new workflows completed.',flush=True)
