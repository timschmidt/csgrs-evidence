from pathlib import Path
import subprocess,shutil,time,json,os,statistics
s=Path('/tmp/interval-refactor/sdf-lipschitz');art=Path('/mnt/development/.interval-refactor-build/sdf-lipschitz-artifacts');rows=[]
for i,label in enumerate(['vector-default','baseline-default','baseline-default','vector-default']):
 target=art/'measured-owner';shutil.copy2(art/label,target);directory=s/'criterion-owner'/str(i)
 cmd=['taskset','-c','0','setarch','x86_64','-R','python3',str(s/'warm-exec.py'),str(target),'--bench','--sample-size','10','--warm-up-time','0.25','--measurement-time','0.5','--noplot']
 t=time.monotonic()
 with (s/f'owner-timing-{i}-{label}.log').open('w') as out:r=subprocess.run(cmd,cwd=s,env=dict(os.environ,CRITERION_HOME=str(directory),HYPERREAL_SKIP_BENCHMARK_REPORTS='1'),stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(index=i,label=label,command=cmd,criterion_home=str(directory),returncode=r.returncode,seconds=time.monotonic()-t));(s/'owner-timing-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,label,r.returncode,flush=True);assert r.returncode==0
