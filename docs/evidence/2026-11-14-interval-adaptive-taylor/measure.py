from pathlib import Path
import subprocess,json,time,os,hashlib,tomllib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-taylor');rows=json.loads((s/'cost-builds.json').read_text());assert len(rows)==4;art={x['name']:x for x in rows}
for row in rows:assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest()==row['sha256']
workspace=tomllib.loads((r/'Cargo.lock').read_text());external=tomllib.loads((s/'allocation/Cargo.lock').read_text());known={(p['name'],p['version'],p.get('source')) for p in workspace['package']};missing=[p for p in external['package'] if 'source' in p and (p['name'],p['version'],p.get('source')) not in known];assert not missing
(s/'observer-dependencies.json').write_text(json.dumps(dict(all_external_versions_match=True,external_packages=len(external['package'])),indent=2)+'\n')
runs=[]
for i,name in enumerate(['base','default','enabled','new','enabled','default','base','new','new']):
 cmd=['taskset','-c','0','setarch','x86_64','-R',art[name]['path']]
 if name!='new':cmd+=['--bench','constant/','--warm-up-time','1','--measurement-time','2','--sample-size','10','--noplot']
 start=time.monotonic()
 with (s/f'timing-{i}-{name}.log').open('w') as out:code=subprocess.run(cmd,cwd='/mnt/development/.interval-refactor-build/adaptive-taylor-artifacts',env=os.environ|{'ADAPTIVE_TAYLOR_ITERATIONS':'1000'},stdout=out,stderr=subprocess.STDOUT).returncode
 runs.append(dict(index=i,name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'timing-runs.json').write_text(json.dumps(runs,indent=2)+'\n');print(i,name,code,flush=True);assert code==0
observer=Path('/mnt/development/.interval-refactor-build/adaptive-taylor-observer/release/adaptive-taylor-allocation')
with (s/'allocation-results.log').open('w') as out:result=subprocess.run([str(observer)],env=os.environ|{'ADAPTIVE_TAYLOR_ITERATIONS':'32'},stdout=out,stderr=subprocess.STDOUT)
assert result.returncode==0
(s/'observer-artifact.json').write_text(json.dumps(dict(path=str(observer),bytes=observer.stat().st_size,sha256=hashlib.sha256(observer.read_bytes()).hexdigest(),iterations=32,returncode=result.returncode),indent=2)+'\n')
