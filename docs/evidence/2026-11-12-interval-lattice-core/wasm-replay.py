from pathlib import Path
import hashlib,json,importlib.metadata
import wasmtime
path=Path('/tmp/interval-refactor/lattice-core-wasm-target/wasm32-unknown-unknown/release/lattice_no_alloc_consumer.wasm')
engine=wasmtime.Engine();store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(path))
assert not module.imports
instance=wasmtime.Instance(store,module,[])
function=instance.exports(store)['interval_affine_probe']
count=0
for value in range(-1024,1025):
 s=max(-256,min(256,value));expected=(2*s+1)+3*(2*s+6)+5*(s-5)+7*(s-1)
 assert function(store,value)==expected
 count+=1
print(json.dumps({'wasmtime':importlib.metadata.version('wasmtime'),'completed_cases':count,'imports':0,'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()},indent=2))
