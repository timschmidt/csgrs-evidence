from pathlib import Path
import json,subprocess,os,time,hashlib
s=Path(__file__).parent
binary=Path('/mnt/development/.interval-refactor-build/taylor-model-composition-artifacts/final-benchmark-taylor_composition')
rows=[]
for trial in range(3):
    dest=s/'criterion'/f'trial-{trial}';dest.mkdir(parents=True,exist_ok=True)
    cmd=['taskset','-c','0','setarch','x86_64','-R',str(binary),'--bench','--warm-up-time','1','--measurement-time','2','--sample-size','30','--noplot']
    start=time.monotonic()
    with (s/f'new-timing-{trial}.log').open('w') as out:
        result=subprocess.run(cmd,cwd=s,env=os.environ|{'CRITERION_HOME':str(dest)},stdout=out,stderr=subprocess.STDOUT)
    rows.append(dict(trial=trial,command=cmd,binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),returncode=result.returncode,seconds=time.monotonic()-start))
    (s/'new-timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(trial,result.returncode,flush=True);assert result.returncode==0
results=[]
for trial in range(3):
    for path in sorted((s/'criterion'/f'trial-{trial}').rglob('new/estimates.json')):
        data=json.loads(path.read_text());results.append(dict(trial=trial,case=str(path.parent.parent.relative_to(s/'criterion'/f'trial-{trial}')),mean=data['mean'],median=data['median']))
(s/'new-timing-summary.json').write_text(json.dumps(results,indent=2)+'\n');print(len(results),'completed measurements')
