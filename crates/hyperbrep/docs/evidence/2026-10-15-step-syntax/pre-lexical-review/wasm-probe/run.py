import json, sys, hashlib
from pathlib import Path
sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime
path=Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_step_wasm_probe.wasm')
engine=wasmtime.Engine()
module=wasmtime.Module.from_file(engine,str(path))
assert len(module.imports)==0, list(module.imports)
store=wasmtime.Store(engine)
instance=wasmtime.Instance(store,module,[])
result=instance.exports(store)['run_probe'](store)
assert result==7,result
print(json.dumps({'probe_groups':result,'imports':0,'wasm_bytes':path.stat().st_size,'wasm_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'runtime':'Wasmtime Python 38.0.0','scope':'exact numeric conversion, complex/forward records, write/read identity, depth rejection, 20000-level parse/write/clone/drop and every prefix truncation'},indent=2))
