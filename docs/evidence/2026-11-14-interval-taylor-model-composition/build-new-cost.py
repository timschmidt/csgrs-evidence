from pathlib import Path
import json,subprocess,os,time,hashlib,shutil
s=Path(__file__).parent
r=Path('/mnt/development/csgrs-taylor-model-composition')
target=Path('/mnt/development/.interval-refactor-build/taylor-model-composition')
artifacts=Path('/mnt/development/.interval-refactor-build/taylor-model-composition-artifacts')
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'4'}
commands=[('allocation',['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(s/'allocation/Cargo.toml'),'--message-format=json']),('benchmark',['cargo','+1.95.0','bench','--locked','-p','hypersolve','--features','taylor-composition','--bench','taylor_composition','--no-run','--message-format=json'])]
rows=[]
for name,cmd in commands:
    start=time.monotonic()
    with (s/f'new-{name}-build.jsonl').open('w') as out,(s/f'new-{name}-build.log').open('w') as err:
        result=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=err)
    row=dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,artifacts=[])
    if result.returncode==0:
        for line in (s/f'new-{name}-build.jsonl').read_text().splitlines():
            m=json.loads(line)
            if m.get('reason')!='compiler-artifact' or not m.get('executable'):continue
            f=Path(m['executable']);dest=artifacts/f'final-{name}-{m["target"]["name"]}';shutil.copy2(f,dest)
            row['artifacts'].append(dict(path=str(dest),sha256=hashlib.sha256(dest.read_bytes()).hexdigest(),bytes=dest.stat().st_size))
    rows.append(row);(s/'new-cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(name,result.returncode,flush=True);assert result.returncode==0
