from pathlib import Path
import subprocess,os,json,time,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-flow')
target=Path('/mnt/development/.interval-refactor-build/taylor-flow-cost')
a=Path('/mnt/development/.interval-refactor-build/taylor-flow-artifacts')
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'4'}
rows=[]
for name,cmd in [('benchmark',['cargo','+1.95.0','bench','--locked','-p','hyperdynamics','--features','taylor-flow','--bench','taylor_flow','--no-run','--message-format=json']),('allocation',['cargo','+1.95.0','build','--release','--offline','--locked','--manifest-path',str(s/'flow-allocation/Cargo.toml'),'--message-format=json'])]:
    start=time.monotonic()
    with (s/f'new-{name}-build.jsonl').open('w') as out,(s/f'new-{name}-build.log').open('w') as err:
        result=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=err)
    row=dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,artifacts=[])
    if not result.returncode:
        for line in (s/f'new-{name}-build.jsonl').read_text().splitlines():
            m=json.loads(line)
            if m.get('reason')!='compiler-artifact' or not m.get('executable'):continue
            source=Path(m['executable']);dest=a/f'final-{name}-{m["target"]["name"]}';shutil.copy2(source,dest)
            row['artifacts'].append(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()))
    rows.append(row);(s/'new-cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
    assert result.returncode==0
