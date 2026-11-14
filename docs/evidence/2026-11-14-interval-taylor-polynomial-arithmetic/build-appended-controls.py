from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
s=Path(__file__).parent
root=Path('/mnt/development/csgrs-taylor-polynomial-arithmetic')
build=Path('/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-controls')
artifacts=Path('/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-artifacts');artifacts.mkdir(exist_ok=True)
rows=[]
def command(label,name,args):
    start=time.monotonic()
    with (s/f'{label}-{name}-build.jsonl').open('w') as out,(s/f'{label}-{name}-build.log').open('w') as err:
        result=subprocess.run(args,cwd=root,env=os.environ|{'CARGO_BUILD_JOBS':'4'},stdout=out,stderr=err)
    row=dict(label=label,name=name,command=args,cwd=str(root),returncode=result.returncode,seconds=time.monotonic()-start,artifacts=[])
    if result.returncode==0:
        messages=[json.loads(l) for l in (s/f'{label}-{name}-build.jsonl').read_text().splitlines() if l.startswith('{')]
        for m in messages:
            if m.get('reason')!='compiler-artifact' or not m.get('executable'):continue
            source=Path(m['executable']);dest=artifacts/f'{label}-{name}-{m["target"]["name"]}';shutil.copy2(source,dest)
            row['artifacts'].append(dict(target=m['target']['name'],path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()))
    rows.append(row);(s/'appended-control-builds.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(label,name,result.returncode,flush=True);assert result.returncode==0
def build_all(label):
    for name,binary in [('old-native-cost','dyadic-evolution-cost-probe'),('model-cost','taylor-model-cost-probe'),('affine-cost','taylor-model-cost-probe')]:
        command(label,name,['cargo','+1.95.0','build','--release','--offline','--locked','--manifest-path',str(s/name/'Cargo.toml'),'--bin',binary,'--target-dir',str(build/name),'--message-format=json'])
    command(label,'owner',['cargo','+1.95.0','bench','--locked','-p','hypersolve','--features','coordinate-program,default,dispatch-trace,expression-program,float-proposal-program,interval-lattice,interval-program,serde,taylor-affine,taylor-model','--no-run','--target-dir',str(build/'owner'),'--message-format=json'])

build_all('appended')
original=json.loads((s/'control-builds.json').read_text())
comparison=[]
for row in rows:
    baseline=next(r for r in original if r['label']=='baseline' and r['name']==row['name'])
    for b in baseline['artifacts']:
        c=next(a for a in row['artifacts'] if a['target']==b['target'])
        comparison.append(dict(name=row['name'],target=b['target'],baseline=b,candidate=c,identical=b['sha256']==c['sha256']))
(s/'appended-control-artifact-comparison.json').write_text(json.dumps(comparison,indent=2)+'\n')
print([(r['name'],r['target'],r['identical'],r['candidate']['bytes']-r['baseline']['bytes']) for r in comparison],flush=True)
