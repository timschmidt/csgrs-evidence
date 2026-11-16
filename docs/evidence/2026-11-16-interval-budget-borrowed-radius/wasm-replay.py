from pathlib import Path
import wasmtime,json,sys,hashlib
wasm=Path(sys.argv[1]);native=Path(sys.argv[2]);expected={int(line.split(' ',2)[1]):line.split(' ',2)[2] for line in native.read_text().splitlines() if line.startswith('RESULT ')};identities={int(line.split(' ',2)[1]):line.split(' ',2)[2] for line in native.read_text().splitlines() if line.startswith('IDENTITY ')};assert len(expected)==len(identities)==7;serialized={int(line.split(' ',2)[1]):line.split(' ',2)[2] for line in native.read_text().splitlines() if line.startswith('SERIALIZED ')};assert len(serialized)==7;expected={i:v+'\n'+identities[i]+'\n'+serialized[i] for i,v in expected.items()}
config=wasmtime.Config();config.consume_fuel=True;engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(wasm))
def forbidden(*args):raise RuntimeError('profile consumer invoked a host import')
assert all(isinstance(x.type,wasmtime.FuncType) for x in module.imports)
stubs=[wasmtime.Func(store,x.type,forbidden) for x in module.imports];exports=wasmtime.Instance(store,module,stubs).exports(store);rows=[]
for index in range(7):
 store.set_fuel(100000000);assert exports['profile_run'](store,index)==1
 size=exports['profile_len'](store);assert 0<size<1000000
 values=[exports['profile_byte'](store,i) for i in range(size)];assert all(0<=x<=255 for x in values)
 actual=bytes(values).decode();assert actual==expected[index],(index,actual,expected[index])
 assert exports['profile_byte'](store,size)==256
 rows.append(dict(case=index,bytes=size,sha256=hashlib.sha256(actual.encode()).hexdigest(),fuel=100000000-store.get_fuel()))
assert exports['profile_run'](store,7)==0 and exports['profile_len'](store)==0
print(json.dumps(dict(wasm=str(wasm),bytes=wasm.stat().st_size,sha256=hashlib.sha256(wasm.read_bytes()).hexdigest(),cases=rows,imports=len(module.imports),host_calls=0,invalid_case_rejected=True,scope='Complete named-budget Debug/serialization transcript matches corresponding native consumer; supplemental to independent endpoint and canonical-lowering tests, not an independent full-profile oracle.'),indent=2))
