from pathlib import Path
import subprocess,json,hashlib,time
prefix='/tmp/hyperbrep-tensor-inverse-mixed-projections-probe'
meta=Path('target/debug/.fingerprint/hyperbrep-8890edd528543e42/lib-hyperbrep.json');j=json.loads(meta.read_text());dependency=next(d[3] for d in j['deps'] if d[1]=='hypercurve');libraries=[]
for p in Path('target/debug/.fingerprint').glob('hypercurve-*/lib-hypercurve'):
 lib=Path('target/debug/deps/lib'+p.parent.name+'.rlib')
 if lib.exists() and int.from_bytes(bytes.fromhex(p.read_text()),'little')==dependency:libraries.append(lib)
assert len(libraries)==1,libraries
lib=Path('target/debug/deps/libhyperbrep-8890edd528543e42.rlib')
cmd=['rustc','-D','warnings','--edition=2024','--crate-name','mixed_projection_frontier',prefix+'.rs','--extern','hyperbrep='+str(lib),'--extern','hypercurve='+str(libraries[0]),'-L','dependency=target/debug/deps','-o',prefix+'-bin']
start=time.time()
with open(prefix+'-compile.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
assert r.returncode==0,Path(prefix+'-compile.log').read_text()
with open(prefix+'.log','w') as f:run=subprocess.run([prefix+'-bin'],stdout=f,stderr=subprocess.STDOUT)
info={'compile_command':cmd,'compile_status':r.returncode,'run_command':[prefix+'-bin'],'run_status':run.returncode,'seconds':time.time()-start,'source_sha256':hashlib.sha256(Path(prefix+'.rs').read_bytes()).hexdigest(),'library_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [lib,libraries[0]]},'outcome':'Unsupported despite exact finite spatial preimage {0,1/3,2/3,1}, because every coordinate projection has a mixed continuous/discrete preimage','completion':False,'scope':'Admitted positive-weight degree-two tensor and native C0 spline UV source. Independent piecewise equations prove the four spatial roots. A richer planar parameter-set result and component intersection are required; this expected blocker is not geometric completion.'}
Path(prefix+'.json').write_text(json.dumps(info,indent=2)+'\n');assert run.returncode==0,Path(prefix+'.log').read_text();print(Path(prefix+'.log').read_text())
