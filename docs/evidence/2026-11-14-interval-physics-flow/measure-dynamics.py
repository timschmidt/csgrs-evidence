from pathlib import Path
import subprocess,json,time
s=Path(__file__).parent;art={x['name']:x for x in json.loads((s/'cost-builds.json').read_text())};rows=[]
for i,name in enumerate(['dynamics-base','dynamics-candidate','dynamics-candidate','dynamics-base']):
 cmd=['taskset','-c','0','setarch','x86_64','-R',art[name]['path'],'--bench','constant/','--warm-up-time','1','--measurement-time','2','--sample-size','10','--noplot'];start=time.monotonic()
 with (s/f'dynamics-timing-{i}-{name}.log').open('w') as out:code=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,cwd='/mnt/development/.interval-refactor-build/physics-flow-artifacts').returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'dynamics-timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,name,code,flush=True);assert code==0
