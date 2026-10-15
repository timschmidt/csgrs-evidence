import hashlib, json, sys, time
from pathlib import Path
sys.path.insert(0, "/tmp/hyperbrep-wasmtime")
import wasmtime
path=Path("/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_body_set_wasm_probe.wasm")
engine=wasmtime.Engine(); module=wasmtime.Module.from_file(engine,str(path))
assert len(module.imports)==0, list(module.imports)
store=wasmtime.Store(engine); instance=wasmtime.Instance(store,module,[])
start=time.monotonic(); groups=instance.exports(store)["run_probe"](store)
assert groups==9,groups
print(json.dumps(dict(groups=groups,imports=0,seconds=time.monotonic()-start,bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),runtime="Wasmtime Python 38.0.0"),indent=2))
