from pathlib import Path
import subprocess,json,hashlib,time
prefix='/tmp/hyperbrep-selected-spline-next-tensor-probe'
log=Path('/tmp/hyperbrep-selected-spline-final-brep.log').read_text()
assert 'Finished `test` profile' in log, 'Wait for final BRep build before probing its library'
libraries=[]
for p in Path('target/debug/.fingerprint').glob('hyperbrep-*/lib-hyperbrep.json'):
 j=json.loads(p.read_text());suffix=p.parent.name.removeprefix('hyperbrep-')
 lib=Path('target/debug/deps/libhyperbrep-'+suffix+'.rlib')
 if j['features']=='["default", "tessellation"]' and lib.is_file():libraries.append(lib)
assert len(libraries)==1,libraries
source=prefix+'.rs';binary=prefix+'-bin'
cmd=['rustc','--edition=2024','--crate-name','selected_tensor_frontier',source,'--extern','hyperbrep='+str(libraries[0]),'-L','dependency=target/debug/deps','-o',binary]
start=time.time()
with open(prefix+'-compile.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
assert r.returncode==0,Path(prefix+'-compile.log').read_text()
with open(prefix+'.log','w') as f:run=subprocess.run([binary],stdout=f,stderr=subprocess.STDOUT)
info={'compile_command':cmd,'compile_status':r.returncode,'run_command':[binary],'run_status':run.returncode,'seconds':time.time()-start,'source_sha256':hashlib.sha256(Path(source).read_bytes()).hexdigest(),'library_sha256':hashlib.sha256(libraries[0].read_bytes()).hexdigest(),'outcome':'UnsupportedParameterLocation on generated TensorImage; native rational positive control has exactly one matching selected preimage','completion':False,'scope':'Public API independent selected point on a regular paraboloid section. Unsupported is an implementation gap, never exact completion.'}
Path(prefix+'.json').write_text(json.dumps(info,indent=2)+'\n')
assert run.returncode==0,Path(prefix+'.log').read_text()
print(Path(prefix+'.log').read_text())
