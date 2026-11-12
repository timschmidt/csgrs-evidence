from pathlib import Path
import hashlib,json,importlib.metadata
import wasmtime
path=Path('/tmp/interval-refactor/lattice-widths-wasm-target/wasm32-unknown-unknown/release/affine_no_alloc_consumer.wasm')
config=wasmtime.Config();config.consume_fuel=True
engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(path));assert not module.imports
instance=wasmtime.Instance(store,module,[]);exports=instance.exports(store)
count=0
for value in [*range(-1024,1025),-(2**31),2**31-1]:
 s=max(-256,min(256,value));expected=(2*s+1)+3*(2*s+6)+5*(s-5)+7*(s-1)
 store.set_fuel(1_000_000);assert exports['interval_affine_probe'](store,value)==expected
 store.set_fuel(1_000_000);assert exports['affine_correlation_probe'](store,value)==7
 for depth in [*range(33), 33, 255, 2**32-1]:
  n=depth%33;offset=n-n*(n-1)//2
  expected_chain=(s-n+offset)+3*(s+1+2*n+offset)+5*(-1-n)+7*(2-n)
  store.set_fuel(1_000_000);assert exports['affine_chain_probe'](store,value,depth)==expected_chain
 store.set_fuel(1_000_000);assert exports['interval_norm_probe'](store,value)==50-44*max(2,min(256,value))
 width_input=max(0,min(255,value))
 store.set_fuel(1_000_000);assert exports['interval_width_probe'](store,value)==(0 if width_input==0 else 3000+width_input)
 count+=1
print(json.dumps({'wasmtime':importlib.metadata.version('wasmtime'),'calls_per_static_export':count,'width_calls':count,'unique_width_inputs':256,'norm_calls':count,'unique_norm_inputs':255,'runtime_chain_calls':count*36,'runtime_depths':33,'unique_clamped_inputs':513,'exports_checked':['interval_affine_probe','affine_correlation_probe','affine_chain_probe','interval_norm_probe','interval_width_probe'],'imports':0,'fuel_limit_per_call':1000000,'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()},indent=2))
