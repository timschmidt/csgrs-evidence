from pathlib import Path
import subprocess,os,json,time,shutil,hashlib,statistics,re
p=Path(__file__).parent
wide=json.loads((p/'wide-comparison.json').read_text())
cases=[r['case'] for r in wide if r['provider-errors']['adverse_separated']]
assert cases
(p/'confirmation-selection.json').write_text(json.dumps(dict(rule='Every candidate case whose minimum lower mean CI exceeds the maximum upper mean CI across both baseline sweeps; screening, not family-wise significance.',cases=cases),indent=2)+'\n')
variants=['provider-errors','baseline','baseline','provider-errors']
pattern='^(?:'+'|'.join(re.escape(c) for c in cases)+')$'
runtime=Path('/tmp/interval-refactor/dynamics-provider-errors-confirm-runtime');common=Path('/tmp/interval-refactor/dynamics-provider-errors-executable');rows=[]
for index,variant in enumerate(variants):
    source=Path('/mnt/development/.interval-refactor-build/dynamics-provider-errors-artifacts')/variant
    shutil.copy2(source,common)
    if runtime.exists():shutil.rmtree(runtime)
    name=f'confirm-{index}-{variant}'
    cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common),'--bench',pattern,'--warm-up-time','1','--measurement-time','2','--sample-size','30','--save-baseline','sample','--noplot']
    start=time.monotonic()
    with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=os.environ|{'CRITERION_HOME':str(runtime)},stdout=log,stderr=subprocess.STDOUT,timeout=max(600,len(cases)*10))
    count=0
    for folder in runtime.rglob('sample'):
        if folder.is_dir():shutil.copytree(folder,p/(name+'-criterion')/folder.parent.relative_to(runtime));count+=1
    rows.append(dict(index=index,variant=variant,command=cmd,cwd='/tmp/interval-refactor',env={'CRITERION_HOME':str(runtime)},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=r.returncode,seconds=time.monotonic()-start,case_directories=count))
    (p/'confirm-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,count,flush=True)
    assert r.returncode==0 and count==len(cases)
out=[]
for case in cases:
    values=[json.loads((p/f'confirm-{i}-{v}-criterion'/case/'estimates.json').read_text())['mean'] for i,v in enumerate(variants)]
    baseline=[values[i] for i in [1,2]];candidate=[values[i] for i in [0,3]]
    out.append(dict(case=case,estimates=values,ratio=statistics.mean(x['point_estimate'] for x in candidate)/statistics.mean(x['point_estimate'] for x in baseline),adverse_separated=min(x['confidence_interval']['lower_bound'] for x in candidate)>max(x['confidence_interval']['upper_bound'] for x in baseline)))
(p/'confirmation-comparison.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([r for r in out if r['adverse_separated']],indent=2),flush=True)
