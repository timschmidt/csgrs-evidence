from pathlib import Path
import wasmtime,hashlib,json,random
stage=Path('/tmp/interval-refactor/servo-migration');config=wasmtime.Config();config.consume_fuel=True;engine=wasmtime.Engine(config)
values=[-(1<<63),-(1<<63)+1,-(1<<32),-1,0,1,1<<32,(1<<63)-2,(1<<63)-1]
pairs=[(a,b) for a in values for b in values if a<=b];rng=random.Random(637)
for _ in range(1000):pairs.append(tuple(sorted([rng.randrange(-(1<<63),1<<63),rng.randrange(-(1<<63),1<<63)])))
results={}
for name in ['baseline','candidate']:
 path=Path('/mnt/development/.interval-refactor-build')/f'servo-position-wasm-{name}/wasm32-unknown-unknown/release/servo_wasm_consumer.wasm'
 module=wasmtime.Module.from_file(engine,str(path));assert not list(module.imports)
 store=wasmtime.Store(engine);instance=wasmtime.Instance(store,module,[]);exports=instance.exports(store);maximum=0
 for a,b in pairs:
  for operation,expected in [('midpoint',(a+b)//2),('width',b-a)]:
   store.set_fuel(10000);got=exports[operation](store,a,b);maximum=max(maximum,10000-store.get_fuel())
   if operation=='width':got&=(1<<64)-1
   assert got==expected,(operation,a,b,got,expected)
 results[name]={'completed_calls':2*len(pairs),'imports':0,'fuel_limit':10000,'maximum_fuel':maximum,'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(stage/'servo-wasm-replay.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
