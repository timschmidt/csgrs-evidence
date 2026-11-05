from pathlib import Path
import subprocess,json,hashlib,time
prefix='/tmp/hyperbrep-tensor-inverse-reflected-fixture'
assert 'Finished `test` profile' in Path('/tmp/hyperbrep-tensor-inverse-final-brep.log').read_text(), 'Wait for the current BRep library build'
meta=Path('target/debug/.fingerprint/hyperbrep-8890edd528543e42/lib-hyperbrep.json');j=json.loads(meta.read_text());dependency=next(d[3] for d in j['deps'] if d[1]=='hypercurve')
libraries=[]
for p in Path('target/debug/.fingerprint').glob('hypercurve-*/lib-hypercurve'):
 lib=Path('target/debug/deps/lib'+p.parent.name+'.rlib')
 if lib.exists() and int.from_bytes(bytes.fromhex(p.read_text()),'little')==dependency:libraries.append(lib)
assert len(libraries)==1,libraries
source=Path('crates/hyperbrep/tests/tensor_image_selected_locations.rs').read_text()
source=source.replace(', NurbsCurve2','')+'''
fn main() {
 let (model,patch)=paraboloid_face();let cut=section(&patch);
 let partition=model.faces().next().unwrap().split_by_surface_curve(&cut,SurfaceIntersectionOperand::First).unwrap();
 let edge=partition.model().edges().find(|edge|edge.curve().kind()==Curve3Kind::TensorImage).unwrap();
 let query=native_parabola().point_at(&alpha()).unwrap();let found=params(&edge.curve(),&query);assert_eq!(found.len(),1);
 let split=edge.split(found[0].clone()).unwrap();let original=reload(split.model());
 let reflected=reload(&original.transformed(&transform()).unwrap());
 std::fs::write("/tmp/hyperbrep-tensor-inverse-reflected-fixture-original.json",original.to_json().unwrap()).unwrap();
 std::fs::write("/tmp/hyperbrep-tensor-inverse-reflected-fixture-model.json",reflected.to_json().unwrap()).unwrap();
 continue_replayed_model(&original);
 println!("exact selected face-edge fixtures captured; cold original/reflected replay and further split pass");
}
'''
Path(prefix+'.rs').write_text(source)
lib=Path('target/debug/deps/libhyperbrep-8890edd528543e42.rlib')
cmd=['rustc','-D','warnings','--edition=2024','--crate-name','reflected_tensor_fixture',prefix+'.rs','--extern','hyperbrep='+str(lib),'--extern','hypercurve='+str(libraries[0]),'-L','dependency=target/debug/deps','-o',prefix+'-bin']
start=time.time()
with open(prefix+'-compile.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
assert r.returncode==0,Path(prefix+'-compile.log').read_text()
with open(prefix+'.log','w') as f:run=subprocess.run([prefix+'-bin'],stdout=f,stderr=subprocess.STDOUT)
info={'compile_command':cmd,'compile_status':r.returncode,'run_command':[prefix+'-bin'],'run_status':run.returncode,'seconds':time.time()-start,'generator_source_sha256':hashlib.sha256(Path(prefix+'.rs').read_bytes()).hexdigest(),'integration_source_sha256':hashlib.sha256(Path('crates/hyperbrep/tests/tensor_image_selected_locations.rs').read_bytes()).hexdigest(),'library_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [lib,libraries[0]]},'artifacts':{p.name:{'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in [Path(prefix+'-original.json'),Path(prefix+'-model.json')]}}
Path(prefix+'-capture.json').write_text(json.dumps(info,indent=2)+'\n');assert run.returncode==0,Path(prefix+'.log').read_text();print(Path(prefix+'.log').read_text())
