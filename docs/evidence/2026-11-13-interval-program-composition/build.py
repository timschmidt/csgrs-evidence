from pathlib import Path
import subprocess,os,json,time,hashlib,shutil,sys
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-program-composition');label=sys.argv[1]
cmd=['cargo','+1.95.0','bench','--locked','-p','hypersolve','--features','expression-program','--bench','expression_program','--no-run','--message-format=json']
env=os.environ|{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/program-composition'};start=time.monotonic()
with (p/(label+'-build.jsonl')).open('w') as out,(p/(label+'-build.log')).open('w') as err:r=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=err)
record=dict(command=cmd,cwd=str(root),env={k:env[k] for k in ['CARGO_BUILD_JOBS','CARGO_TARGET_DIR']},returncode=r.returncode,seconds=time.monotonic()-start)
if r.returncode==0:
 rows=[json.loads(l) for l in (p/(label+'-build.jsonl')).read_text().splitlines() if l.startswith('{')];paths=[m['executable'] for m in rows if m.get('reason')=='compiler-artifact' and m.get('target',{}).get('name')=='expression_program' and m.get('executable')];assert len(paths)==1
 dest=Path('/mnt/development/.interval-refactor-build/program-composition-artifacts')/label;dest.parent.mkdir(exist_ok=True);shutil.copy2(paths[0],dest);record.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
(p/(label+'-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True);raise SystemExit(r.returncode)
