from pathlib import Path
import subprocess,os,json,time,shutil,hashlib,statistics
p=Path(__file__).parent;runtime=Path('/tmp/interval-refactor/dynamics-current-cost-criterion-runtime');common=Path('/tmp/interval-refactor/dynamics-current-cost-executable');rows=[]
assert (p/'observer-comparison.json').exists()
variants=['baseline','extraction','provider-control','provider-control','extraction','baseline']
for index,variant in enumerate(variants):
 source=Path('/mnt/development/.interval-refactor-build/dynamics-current-cost-artifacts')/variant;shutil.copy2(source,common)
 if runtime.exists():shutil.rmtree(runtime)
 name=f'wide-{index}-{variant}'
 cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common),'--bench','--warm-up-time','0.1','--measurement-time','0.2','--sample-size','10','--save-baseline','sample','--noplot'];start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:run=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=os.environ|{'CRITERION_HOME':str(runtime)},stdout=log,stderr=subprocess.STDOUT,timeout=600)
 count=0
 for folder in runtime.rglob('sample'):
  if folder.is_dir():shutil.copytree(folder,p/(name+'-criterion')/folder.parent.relative_to(runtime));count+=1
 rows.append(dict(index=index,variant=variant,command=cmd,cwd='/tmp/interval-refactor',env={'CRITERION_HOME':str(runtime)},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=run.returncode,seconds=time.monotonic()-start,case_directories=count));(p/'wide-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,run.returncode,count,flush=True);assert run.returncode==0 and count==194
names=sorted(str(f.parent.relative_to(p/'wide-0-baseline-criterion')) for f in (p/'wide-0-baseline-criterion').rglob('estimates.json'));assert len(names)==194
out=[]
for name in names:
 values=[json.loads((p/f'wide-{i}-{v}-criterion'/name/'estimates.json').read_text())['mean'] for i,v in enumerate(variants)]
 baseline=[values[i] for i in [0,5]]
 row=dict(case=name,estimates=values)
 for label,indices in [('extraction',[1,4]),('provider-control',[2,3])]:
  data=[values[i] for i in indices];row[label]=dict(ratio=statistics.mean(x['point_estimate'] for x in data)/statistics.mean(x['point_estimate'] for x in baseline),adverse_separated=min(x['confidence_interval']['lower_bound'] for x in data)>max(x['confidence_interval']['upper_bound'] for x in baseline))
 out.append(row)
(p/'wide-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print({v:sum(x[v]['adverse_separated'] for x in out) for v in ['extraction','provider-control']},flush=True)
