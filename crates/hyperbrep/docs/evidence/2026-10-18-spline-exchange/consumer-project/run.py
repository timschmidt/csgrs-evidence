"""Execute all new full regressions through a real WebAssembly consumer."""
import hashlib
import json
from pathlib import Path
import sys
import time

sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime

path = Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_spline_exchange_probe.wasm')
module = wasmtime.Module.from_file(engine := wasmtime.Engine(), str(path))
assert len(module.imports) == 0
store = wasmtime.Store(engine)
instance = wasmtime.Instance(store, module, [])
start = time.perf_counter()
groups = instance.exports(store)['run_probe'](store)
assert groups == 9, groups
print(json.dumps(dict(groups=groups, imports=0, elapsed_seconds=time.perf_counter()-start,
    wasm_bytes=path.stat().st_size, wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    runtime='Wasmtime Python 38.0.0', scope='Five complete spline exchange/control groups and four native geometry proof groups; source-path ABI consumer, not a published JavaScript binding.'), indent=2))
