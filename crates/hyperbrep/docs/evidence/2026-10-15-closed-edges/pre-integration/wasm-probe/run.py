import hashlib,json,sys,time
from pathlib import Path
sys.path.insert(0,'/tmp/hyperbrep-wasmtime')
import wasmtime
path=Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_closed_edges_wasm_probe.wasm')
engine=wasmtime.Engine();module=wasmtime.Module.from_file(engine,str(path))
assert len(module.imports)==0,list(module.imports)
store=wasmtime.Store(engine);instance=wasmtime.Instance(store,module,[])
started=time.perf_counter();result=instance.exports(store)['run_probe'](store);elapsed=time.perf_counter()-started
assert result==7,result
print(json.dumps(dict(probe_groups=result,imports=0,wasm_bytes=path.stat().st_size,wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),runtime='Wasmtime Python 38.0.0',elapsed_seconds=elapsed,scope='Seven groups: closed circle/replay/warm; seam parameter maps; circle/seam split/reflection; Boolean composition; ellipse edge; full-circle region Boolean/offset; invalid raw point and incomplete period'),indent=2))
