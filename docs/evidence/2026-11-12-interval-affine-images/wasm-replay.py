from pathlib import Path
import hashlib,json,importlib.metadata
import wasmtime
path=Path('/tmp/interval-refactor/affine-images-wasm-target/wasm32-unknown-unknown/release/affine_no_alloc_consumer.wasm')
config=wasmtime.Config();config.consume_fuel=True
engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(path));assert not module.imports
instance=wasmtime.Instance(store,module,[]);exports=instance.exports(store)
count=0
for value in [*range(-1024,1025),-(2**31),2**31-1]:
 s=max(-256,min(256,value));expected=(2*s+1)+3*(2*s+6)+5*(s-5)+7*(s-1)
 store.set_fuel(1_000_000);assert exports['interval_affine_probe'](store,value)==expected
 store.set_fuel(1_000_000);assert exports['affine_correlation_probe'](store,value)==7
 count+=1
print(json.dumps({'wasmtime':importlib.metadata.version('wasmtime'),'calls_per_export':count,'unique_clamped_inputs':513,'exports_checked':['interval_affine_probe','affine_correlation_probe'],'imports':0,'fuel_limit_per_call':1000000,'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()},indent=2))
