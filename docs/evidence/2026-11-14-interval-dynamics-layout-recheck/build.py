from pathlib import Path
import hashlib,json,os,shutil,subprocess,sys,time
stage=Path(__file__).parent; tree=Path('/mnt/development/csgrs-dynamics-layout-recheck');name=sys.argv[1]
target='/mnt/development/.interval-refactor-build/dynamics-layout-recheck';artifacts=Path('/mnt/development/.interval-refactor-build/dynamics-layout-recheck-artifacts');artifacts.mkdir(exist_ok=True)
cmd=['cargo','+1.95.0','bench','--locked','--target-dir',target,'-p','hyperpath','--bench','path_predicates','--no-run','--message-format=json']
start=time.monotonic()
with (stage/(name+'-build.jsonl')).open('w') as out,(stage/(name+'-build.log')).open('w') as err:r=subprocess.run(cmd,cwd=tree,env=dict(os.environ,CARGO_BUILD_JOBS='4'),stdout=out,stderr=err)
meta={'variant':name,'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-start,'cwd':str(tree)}
if r.returncode==0:
 rows=[json.loads(x) for x in (stage/(name+'-build.jsonl')).read_text().splitlines() if x.startswith('{')]
 executables=[x['executable'] for x in rows if x.get('reason')=='compiler-artifact' and x.get('target',{}).get('name')=='path_predicates' and x.get('executable')];assert len(executables)==1
 dest=artifacts/name;shutil.copy2(executables[0],dest);meta.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
 (stage/(name+'-sections.txt')).write_bytes(subprocess.check_output(['readelf','-SW',str(dest)]))
 (stage/(name+'-symbols.txt')).write_bytes(subprocess.check_output(['nm','-S','--defined-only','--demangle',str(dest)]))
 (stage/(name+'-Cargo.lock')).write_bytes((tree/'Cargo.lock').read_bytes())
(stage/(name+'-build.json')).write_text(json.dumps(meta,indent=2)+'\n');print(json.dumps(meta),flush=True);raise SystemExit(r.returncode)
