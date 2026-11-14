from pathlib import Path
import subprocess,json,time,shutil,hashlib
s=Path(__file__).parent;art={x['name']:x for x in json.loads((s/'cost-builds.json').read_text())};root=Path('/mnt/development/.interval-refactor-build/adaptive-taylor-artifacts');active=root/'active-control';rows=[]
for i,name in enumerate(['base','default','enabled','enabled','default','base']):
 shutil.copy2(art[name]['path'],active);assert hashlib.sha256(active.read_bytes()).hexdigest()==art[name]['sha256']
 cmd=['taskset','-c','0','setarch','x86_64','-R',str(active),'--bench','constant/','--warm-up-time','1','--measurement-time','2','--sample-size','10','--noplot'];start=time.monotonic()
 with (s/f'same-path-{i}-{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=root,stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(index=i,name=name,command=cmd,sha256=art[name]['sha256'],returncode=code,seconds=time.monotonic()-start));(s/'same-path-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,name,code,flush=True);assert code==0
