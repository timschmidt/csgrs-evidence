from pathlib import Path
import subprocess,json,hashlib,time
prefix='/tmp/hyperbrep-tensor-inverse-next-components-probe'
receipts=json.loads(Path('/tmp/hyperbrep-tensor-inverse-final-validation.json').read_text())
assert any(r['name']=='curve' and r['status']==0 and r['source_unchanged'] for r in receipts), 'Wait for final curve build/tests before probing its library'
libraries=[]
for p in Path('target/debug/.fingerprint').glob('hypercurve-*/lib-hypercurve.json'):
 j=json.loads(p.read_text());suffix=p.parent.name.removeprefix('hypercurve-');lib=Path('target/debug/deps/libhypercurve-'+suffix+'.rlib')
 if 'comparative-benchmarks' in j['features'] and lib.is_file():libraries.append((lib,j))
assert len(libraries)==1,libraries
lib,meta=libraries[0];dependency=next(d[3] for d in meta['deps'] if d[1]=='hypersolve')
solve=[]
for p in Path('target/debug/.fingerprint').glob('hypersolve-*/lib-hypersolve'):
 suffix=p.parent.name.removeprefix('hypersolve-');candidate=Path('target/debug/deps/libhypersolve-'+suffix+'.rlib')
 if candidate.exists() and int.from_bytes(bytes.fromhex(p.read_text()),'little')==dependency:solve.append(candidate)
assert len(solve)==1,solve
cmd=['rustc','--edition=2024','--crate-name','parameter_component_frontier',prefix+'.rs','--extern','hypercurve='+str(lib),'--extern','hypersolve='+str(solve[0]),'-L','dependency=target/debug/deps','-o',prefix+'-bin']
start=time.time()
with open(prefix+'-compile.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
assert r.returncode==0,Path(prefix+'-compile.log').read_text()
with open(prefix+'.log','w') as f:run=subprocess.run([prefix+'-bin'],stdout=f,stderr=subprocess.STDOUT)
info={'compile_command':cmd,'compile_status':r.returncode,'run_command':[prefix+'-bin'],'run_status':run.returncode,'seconds':time.time()-start,'source_sha256':hashlib.sha256(Path(prefix+'.rs').read_bytes()).hexdigest(),'library_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [lib,solve[0]]},'outcome':'Unsupported on a valid finite native NURBS with exact preimage [0,1] union {5/2}','completion':False,'scope':'A jointly selected zero query on the authored degree-one spline. Knots/control points independently define its constant interval and later isolated preimage. Expected blocker is not geometric completion.'}
Path(prefix+'.json').write_text(json.dumps(info,indent=2)+'\n');assert run.returncode==0,Path(prefix+'.log').read_text();print(Path(prefix+'.log').read_text())
