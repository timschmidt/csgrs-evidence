from pathlib import Path
import subprocess,os,json,time,shutil,hashlib,statistics
p=Path(__file__).parent;runtime=Path('/tmp/interval-refactor/program-composition-criterion-runtime');common=Path('/tmp/interval-refactor/program-composition-executable');variants=['baseline','method-inline','method-inline','baseline'];rows=[]
assert json.loads((p/'observer-comparison.json').read_text())['exact_match']
for index,variant in enumerate(variants):
 source=Path('/mnt/development/.interval-refactor-build/program-composition-artifacts')/variant;shutil.copy2(source,common)
 if runtime.exists():shutil.rmtree(runtime)
 name=f'timing-{index}-{variant}';cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common),'--bench','--warm-up-time','1','--measurement-time','2','--sample-size','30','--save-baseline','sample','--noplot'];start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=os.environ|{'CRITERION_HOME':str(runtime)},stdout=log,stderr=subprocess.STDOUT,timeout=300)
 count=0
 for folder in runtime.rglob('sample'):
  if folder.is_dir():shutil.copytree(folder,p/(name+'-criterion')/folder.parent.relative_to(runtime));count+=1
 rows.append(dict(index=index,variant=variant,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start,case_directories=count,sha256=hashlib.sha256(source.read_bytes()).hexdigest(),env={'CRITERION_HOME':str(runtime)}));(p/'timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,count,flush=True);assert r.returncode==0 and count==12
names=sorted(str(f.parent.relative_to(p/'timing-0-baseline-criterion')) for f in (p/'timing-0-baseline-criterion').rglob('estimates.json'));assert len(names)==12
out=[]
for name in names:
 values=[json.loads((p/f'timing-{i}-{v}-criterion'/name/'estimates.json').read_text())['mean'] for i,v in enumerate(variants)];baseline=[values[0],values[3]];candidate=[values[1],values[2]]
 out.append(dict(case=name,estimates=values,ratio=statistics.mean(x['point_estimate'] for x in candidate)/statistics.mean(x['point_estimate'] for x in baseline),adverse_separated=min(x['confidence_interval']['lower_bound'] for x in candidate)>max(x['confidence_interval']['upper_bound'] for x in baseline)))
(p/'timing-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print([(r['case'],r['ratio'],r['adverse_separated']) for r in out],flush=True)
