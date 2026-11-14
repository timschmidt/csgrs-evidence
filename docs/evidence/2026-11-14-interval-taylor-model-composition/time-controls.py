from pathlib import Path
import json,os,subprocess,shutil,time,hashlib,statistics
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/taylor-model-composition-artifacts');common=art/'control-executable';variants=['baseline','candidate','candidate','baseline'];rows=[]
assert len(json.loads((s/'new-timing-runs.json').read_text()))==3
for index,variant in enumerate(variants):
 source=art/f'{variant}-control';shutil.copy2(source,common);dest=s/'controls'/f'{index}-{variant}';dest.mkdir(parents=True)
 cmd=['taskset','-c','0','setarch','x86_64','-R',str(common),'--bench','--warm-up-time','1','--measurement-time','2','--sample-size','30','--noplot'];start=time.monotonic()
 with (s/f'control-timing-{index}.log').open('w') as out:r=subprocess.run(cmd,cwd=s,env=os.environ|{'CRITERION_HOME':str(dest)},stdout=out,stderr=subprocess.STDOUT)
 assert r.returncode==0
 paths=list(dest.rglob('new/estimates.json'));assert len(paths)==6
 rows.append(dict(index=index,variant=variant,command=cmd,returncode=0,seconds=time.monotonic()-start,binary_sha256=hashlib.sha256(source.read_bytes()).hexdigest()))
 (s/'control-timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(index,variant,'pass',flush=True)
results=[]
for p in sorted((s/'controls/0-baseline').rglob('new/estimates.json')):
 case=p.parent.parent.relative_to(s/'controls/0-baseline');values=[json.loads((s/'controls'/f'{i}-{v}'/case/'new/estimates.json').read_text())['mean'] for i,v in enumerate(variants)]
 baseline=[values[i] for i in [0,3]];candidate=[values[i] for i in [1,2]]
 results.append(dict(case=str(case),means=values,ratio=statistics.mean(x['point_estimate'] for x in candidate)/statistics.mean(x['point_estimate'] for x in baseline),adverse_separated=min(x['confidence_interval']['lower_bound'] for x in candidate)>max(x['confidence_interval']['upper_bound'] for x in baseline)))
(s/'control-timing-comparison.json').write_text(json.dumps(results,indent=2)+'\n');print(results,flush=True)
