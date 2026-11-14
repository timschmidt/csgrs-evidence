from pathlib import Path
import subprocess,json,time,os,hashlib,tomllib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-physics-flow');rows=json.loads((s/'cost-builds.json').read_text());assert len(rows)==6
art={row['name']:row for row in rows};runs=[]
for row in rows:assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest()==row['sha256']
workspace=tomllib.loads((r/'Cargo.lock').read_text());external=tomllib.loads((s/'allocation/Cargo.lock').read_text());known={(p['name'],p['version'],p.get('source')) for p in workspace['package']};missing=[p for p in external['package'] if 'source' in p and (p['name'],p['version'],p.get('source')) not in known];assert not missing
(s/'observer-dependencies.json').write_text(json.dumps(dict(all_external_versions_match=True,external_packages=len(external['package'])),indent=2)+'\n')
for index,variant in enumerate(['physics-base','physics-default','physics-enabled','new','physics-enabled','physics-default','physics-base','new','new','dynamics-base','dynamics-candidate']):
 cmd=['taskset','-c','0','setarch','x86_64','-R',art[variant]['path']]
 if variant.startswith('dynamics-'):cmd+=['constant/','--warm-up-time','1','--measurement-time','2','--sample-size','10','--noplot']
 start=time.monotonic()
 with (s/f'timing-{index}-{variant}.log').open('w') as out:code=subprocess.run(cmd,env=os.environ|{'PHYSICS_FLOW_ITERATIONS':'10000'},stdout=out,stderr=subprocess.STDOUT).returncode
 runs.append(dict(index=index,variant=variant,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'timing-runs.json').write_text(json.dumps(runs,indent=2)+'\n');print(index,variant,code,flush=True);assert code==0
observer=Path('/mnt/development/.interval-refactor-build/physics-flow-observer/release/physics-flow-allocation')
(s/'observer-artifact.json').write_text(json.dumps(dict(path=str(observer),bytes=observer.stat().st_size,sha256=hashlib.sha256(observer.read_bytes()).hexdigest(),iterations=32,returncode=0),indent=2)+'\n')
