from pathlib import Path
import hashlib,json,os,shutil,subprocess,sys,time
s=Path(__file__).parent;tree=Path('/mnt/development/interval-profile-static/csgrs');name=sys.argv[1]
target='/mnt/development/.interval-refactor-build/profile-typed-fraction/owner';art=Path('/mnt/development/.interval-refactor-build/path-dynamics-current-admission/artifacts');art.mkdir(parents=True,exist_ok=True)
cmd=['cargo','+1.95.0','bench','--locked','--target-dir',target,'-p','hyperpath','--bench','path_predicates','--no-run','--message-format=json'];start=time.monotonic()
with (s/(name+'-build.jsonl')).open('w') as out,(s/(name+'-build.log')).open('w') as err:r=subprocess.run(cmd,cwd=tree,env=os.environ|{'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'},stdout=out,stderr=err)
meta={'variant':name,'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-start,'cwd':str(tree)}
if r.returncode==0:
 rows=[json.loads(l) for l in (s/(name+'-build.jsonl')).read_text().splitlines()];exes=[x['executable'] for x in rows if x.get('reason')=='compiler-artifact' and x.get('target',{}).get('name')=='path_predicates' and x.get('executable')];assert len(exes)==1
 dest=art/name;shutil.copy2(exes[0],dest);meta.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
 (s/(name+'-sections.txt')).write_bytes(subprocess.check_output(['size','-A',str(dest)]))
 (s/(name+'-symbols.txt')).write_bytes(subprocess.check_output(['nm','-S','--defined-only','--demangle',str(dest)]))
 (s/(name+'-Cargo.lock')).write_bytes((tree/'Cargo.lock').read_bytes())
(s/(name+'-build.json')).write_text(json.dumps(meta,indent=2)+'\n');print(json.dumps(meta),flush=True);raise SystemExit(r.returncode)
