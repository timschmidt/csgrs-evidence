from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
original=json.loads((root/'fiber-point-order-baseline2-attribution.json').read_text())
lib=Path(original['library']);assert hashlib.sha256(lib.read_bytes()).hexdigest()==original['library_sha256']
artifacts=[json.loads(line) for line in (root/'fiber-point-order-baseline2-build.jsonl').read_text().splitlines()]
solver=Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']=='hypersolve' for f in a['filenames'] if f.endswith('.rlib')))
source=root/'fiber-point-order-witness-baseline.rs';source.write_bytes((checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_bytes())
binary=root/'fiber-point-order-witness-baseline'
command=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(source),'--crate-name','fiber_point_incidence','-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(lib),'--extern','hypersolve='+str(solver),'-o',str(binary)]
with (root/'fiber-point-order-witness-baseline-compile.log').open('w') as log:subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'fiber-point-order-witness-baseline.log').open('w') as log:result=subprocess.run([str(binary),'--nocapture'],stdout=log,stderr=subprocess.STDOUT,timeout=120)
record={'command':command,'run':[str(binary),'--nocapture'],'library_sha256':original['library_sha256'],'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'exit_code':result.returncode,'elapsed_seconds':time.time()-start,'source_library_attribution':original}
(root/'fiber-point-order-witness-baseline.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({'exit_code':result.returncode,'elapsed_seconds':record['elapsed_seconds']}));print((root/'fiber-point-order-witness-baseline.log').read_text()[:5000])
assert result.returncode==101
