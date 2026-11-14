from pathlib import Path
import subprocess,os,time,json
s=Path('/tmp/interval-refactor/sdf-subdivision');env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-enclosure-main',CARGO_BUILD_JOBS='4');rows=[]
for name,cmd in [
 ('acceptance',['cargo','+1.95.0','test','--locked','-p','hypersdf','--all-features','--test','enclosure_program','--test','enclosure_primitives','--test','enclosure_subdivision']),
 ('format',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('budget',['bash','scripts/check-repository-budget.sh'])]:
 t=time.monotonic()
 with (s/f'main-closeout-{name}.log').open('w') as out:r=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-t));(s/'main-closeout-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
