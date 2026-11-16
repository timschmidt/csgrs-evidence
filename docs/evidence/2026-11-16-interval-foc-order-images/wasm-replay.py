from pathlib import Path
import wasmtime,json,sys,hashlib
wasm=Path(sys.argv[1]);native=Path(sys.argv[2]);expected={int(line.split(' ',2)[1]):json.loads(line.split(' ',2)[2]) for line in native.read_text().splitlines() if line.startswith('RAW ')};assert len(expected)==4108
config=wasmtime.Config();config.consume_fuel=True;engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(wasm))
def forbidden(*args):raise RuntimeError('FOC consumer invoked a host import')
assert all(isinstance(x.type,wasmtime.FuncType) for x in module.imports)
stubs=[wasmtime.Func(store,x.type,forbidden) for x in module.imports];exports=wasmtime.Instance(store,module,stubs).exports(store);rows=[]
for index,want in expected.items():
 store.set_fuel(1000000);actual=[exports['foc_field'](store,index,slot) for slot in range(16)];assert actual==want,(index,actual,want);rows.append({'case':index,'fields':actual,'fuel':1000000-store.get_fuel()})
print(json.dumps({'wasm':str(wasm),'bytes':wasm.stat().st_size,'sha256':hashlib.sha256(wasm.read_bytes()).hexdigest(),'cases':rows,'imports':len(module.imports),'host_calls':0,'scope':'All 16 result/status components match the corresponding native corpus; no checksum-only equivalence or MCU performance claim.'},indent=2))
