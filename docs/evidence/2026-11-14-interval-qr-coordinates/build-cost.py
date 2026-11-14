from pathlib import Path
import os,subprocess,json,hashlib,shutil,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-qr-coordinates');art=Path('/mnt/development/.interval-refactor-build/qr-coordinates-artifacts');art.mkdir(exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/qr-coordinates-cost','CARGO_BUILD_JOBS':'4'}
commands=[('bench',['cargo','+1.95.0','bench','--locked','-p','hyperdynamics','--features','qr-coordinates','--bench','qr_coordinates','--no-run','--message-format=json']),('allocation',['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(s/'allocation/Cargo.toml'),'--message-format=json'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'cost-{name}.jsonl').open('w') as out,(s/f'cost-{name}.log').open('w') as err:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=err)
 row=dict(name=name,command=cmd,returncode=p.returncode,seconds=time.monotonic()-start,artifacts=[])
 if p.returncode==0:
  for line in (s/f'cost-{name}.jsonl').read_text().splitlines():
   m=json.loads(line)
   if m.get('reason')=='compiler-artifact' and m.get('executable'):
    src=Path(m['executable']);dst=art/(name+'-'+m['target']['name']);shutil.copy2(src,dst);row['artifacts'].append(dict(path=str(dst),bytes=dst.stat().st_size,sha256=hashlib.sha256(dst.read_bytes()).hexdigest()))
 rows.append(row);(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 assert p.returncode==0
