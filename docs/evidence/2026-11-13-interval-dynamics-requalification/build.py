from pathlib import Path
import subprocess,json,sys,time,re,shutil,hashlib
p=Path(__file__).parent;variant=sys.argv[1];root=Path('/mnt/development/csgrs-dynamics-requal')
cmd=['cargo','+1.95.0','bench','--locked','--manifest-path',str(root/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/dynamics-requal-target','-p','hyperpath','--bench','path_predicates','--no-run']
start=time.monotonic()
with (p/(variant+'-build.log')).open('w') as log:r=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
rows=json.loads((p/'builds.json').read_text()) if (p/'builds.json').exists() else []
rows.append(dict(variant=variant,command=cmd,cwd=str(root),returncode=r.returncode,seconds=time.monotonic()-start));(p/'builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
m=re.search(r'Executable benches/path_predicates.rs \(([^)]+)\)',(p/(variant+'-build.log')).read_text());assert m
exe=Path(m[1]);dest=Path('/tmp/interval-refactor/dynamics-requal-binaries')/variant;dest.parent.mkdir(exist_ok=True);shutil.copy2(exe,dest)
meta=dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest());(p/(variant+'-binary.json')).write_text(json.dumps(meta,indent=2)+'\n')
(p/(variant+'-symbols.txt')).write_bytes(subprocess.check_output(['nm','-S','--defined-only','--demangle',str(dest)]));(p/(variant+'-sections.txt')).write_bytes(subprocess.check_output(['readelf','-SW',str(dest)]))
(p/(variant+'-Cargo.lock')).write_bytes((root/'Cargo.lock').read_bytes());print(json.dumps(meta),flush=True)
