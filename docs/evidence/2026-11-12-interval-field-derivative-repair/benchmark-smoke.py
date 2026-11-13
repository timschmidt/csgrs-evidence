from pathlib import Path
import subprocess,time,json
out=Path('/tmp/interval-refactor/dynamics-field-derivative');rows=[]
for index,(package,bench) in enumerate([('hypersolve','certification'),('hyperpath','path_predicates')]):
 c=['cargo','+1.95.0','bench','--locked','-p',package,'--bench',bench,'--','--test'];start=time.monotonic()
 with (out/f'benchmark-smoke-{index}.log').open('w') as f:r=subprocess.run(c,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'benchmark-smoke.json').write_text(json.dumps(rows,indent=2)+'\n');print(package,r.returncode,flush=True);assert r.returncode==0
