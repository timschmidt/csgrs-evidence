from pathlib import Path
import subprocess,os,json,time,shutil,hashlib
p=Path(__file__).parent;runtime=Path('/tmp/interval-refactor/dynamics-criterion-runtime');common=Path('/tmp/interval-refactor/dynamics-benchmark-executable');rows=[]
for index,variant in enumerate(['candidate','baseline','baseline','candidate']):
 source=Path('/tmp/interval-refactor/dynamics-requal-binaries')/variant;shutil.copy2(source,common)
 if runtime.exists():shutil.rmtree(runtime)
 name=f'wide-{index}-{variant}'
 cmd=['taskset','-c','0','python3',str(p/'warm-exec.py'),str(common),'--bench','--warm-up-time','0.1','--measurement-time','0.2','--sample-size','10','--save-baseline','sample','--noplot'];start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=os.environ|{'CRITERION_HOME':str(runtime)},stdout=log,stderr=subprocess.STDOUT,timeout=600)
 count=0
 for source_dir in runtime.rglob('sample'):
  if source_dir.is_dir():shutil.copytree(source_dir,p/(name+'-criterion')/source_dir.parent.relative_to(runtime));count+=1
 rows.append(dict(index=index,variant=variant,command=cmd,cwd='/tmp/interval-refactor',env={'CRITERION_HOME':str(runtime)},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=r.returncode,seconds=time.monotonic()-start,case_directories=count));(p/'wide-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,count,round(time.monotonic()-start,2),flush=True);assert r.returncode==0 and count==194
