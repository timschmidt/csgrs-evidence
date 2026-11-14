from pathlib import Path
import subprocess,sys,os,json,time,shutil,hashlib
s=Path(__file__).parent;variant=sys.argv[1];r=Path('/mnt/development/csgrs-taylor-model-composition'+('-base' if variant=='baseline' else ''))
art=Path('/mnt/development/.interval-refactor-build/taylor-model-composition-artifacts');art.mkdir(exist_ok=True)
cmd=['cargo','+1.95.0','bench','--locked','-p','hypersolve','--features','taylor-polynomial','--bench','taylor_polynomial','--no-run','--message-format=json','--target-dir','/mnt/development/.interval-refactor-build/taylor-model-composition-cost'];start=time.monotonic()
with (s/f'{variant}-control-build.jsonl').open('w') as out,(s/f'{variant}-control-build.log').open('w') as err:run=subprocess.run(cmd,cwd=r,env=os.environ|{'CARGO_BUILD_JOBS':'4'},stdout=out,stderr=err)
assert run.returncode==0
rows=[json.loads(x) for x in (s/f'{variant}-control-build.jsonl').read_text().splitlines()]
paths=[x['executable'] for x in rows if x.get('reason')=='compiler-artifact' and x.get('executable') and x['target']['name']=='taylor_polynomial'];assert len(paths)==1
p=art/f'{variant}-control';shutil.copy2(paths[0],p);meta=dict(command=cmd,cwd=str(r),returncode=0,seconds=time.monotonic()-start,path=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest(),bytes=p.stat().st_size)
(s/f'{variant}-control.json').write_text(json.dumps(meta,indent=2)+'\n');print(meta)
