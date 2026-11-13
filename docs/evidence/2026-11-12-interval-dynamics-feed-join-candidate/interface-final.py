from pathlib import Path
import subprocess,time,json
out=Path('/tmp/interval-refactor/dynamics-feed-join');rows=[];root='/mnt/development/alumina-interface'
for name,command in [('test',['cargo','+1.95.0','test','--locked','-p','alumina-interface-core']),('clippy',['cargo','+1.95.0','clippy','--locked','-p','alumina-interface-core','--all-targets','--','-D','warnings'])]:
 start=time.monotonic()
 with (out/f'interface-final-{name}.log').open('w') as f:r=subprocess.run(command,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(cwd=root,command=command,exit=r.returncode,seconds=time.monotonic()-start));(out/'interface-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True);assert r.returncode==0
