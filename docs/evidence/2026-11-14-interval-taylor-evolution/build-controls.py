from pathlib import Path
import subprocess,os,json,time,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-evolution')
build=Path('/mnt/development/.interval-refactor-build/taylor-evolution-controls')
artifacts=Path('/mnt/development/.interval-refactor-build/taylor-evolution-artifacts');artifacts.mkdir(exist_ok=True)
paths=['crates/hyperdynamics/Cargo.toml','crates/hyperdynamics/src/field/taylor_flow.rs'];saved={p:(r/p).read_bytes() for p in paths}
rows=[]
def build_all(label):
    for name,binary in [('old-native-cost','dyadic-evolution-cost-probe'),('flow-cost','taylor_flow'),('qr-cost','qr-coordinates-allocation')]:
        if name=='flow-cost':
            cmd=['cargo','+1.95.0','bench','--locked','-p','hyperdynamics','--features','taylor-flow','--bench','taylor_flow','--no-run','--target-dir',str(build/'consumers'),'--message-format=json']
        else:
            cmd=['cargo','+1.95.0','build','--release','--offline','--locked','--manifest-path',str(s/name/'Cargo.toml'),'--bin',binary,'--target-dir',str(build/'consumers'),'--message-format=json']
        start=time.monotonic()
        with (s/f'{label}-{name}-build.jsonl').open('w') as out,(s/f'{label}-{name}-build.log').open('w') as err:
            result=subprocess.run(cmd,cwd=r,env=os.environ|{'CARGO_BUILD_JOBS':'4'},stdout=out,stderr=err)
        row=dict(label=label,name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,artifacts=[])
        if result.returncode==0:
            for line in (s/f'{label}-{name}-build.jsonl').read_text().splitlines():
                m=json.loads(line)
                if m.get('reason')!='compiler-artifact' or not m.get('executable'):continue
                source=Path(m['executable']);dest=artifacts/f'{label}-{name}-{m["target"]["name"]}';shutil.copy2(source,dest)
                row['artifacts'].append(dict(target=m['target']['name'],path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()))
        rows.append(row);(s/'control-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,name,result.returncode,flush=True);assert result.returncode==0
try:
    for path in paths:(r/path).write_bytes(subprocess.check_output(['git','show','HEAD:'+path],cwd=r))
    build_all('baseline')
finally:
    for path,data in saved.items():(r/path).write_bytes(data)
(s/'controls-source-restored.json').write_text(json.dumps({p:hashlib.sha256(v).hexdigest() for p,v in saved.items()},indent=2)+'\n')
build_all('candidate')
comparison=[]
for b in [x for x in rows if x['label']=='baseline']:
    c=next(x for x in rows if x['label']=='candidate' and x['name']==b['name'])
    for old in b['artifacts']:
        new=next(x for x in c['artifacts'] if x['target']==old['target'])
        comparison.append(dict(name=b['name'],target=old['target'],baseline=old,candidate=new,identical=old['sha256']==new['sha256']))
(s/'candidate-control-artifact-comparison.json').write_text(json.dumps(comparison,indent=2)+'\n')
print([(x['name'],x['identical'],x['candidate']['bytes']-x['baseline']['bytes']) for x in comparison],flush=True)
