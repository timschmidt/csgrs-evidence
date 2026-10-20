import hashlib
import json
from pathlib import Path
import sys
import time
sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime

path = Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_sector_wasm_probe.wasm')
engine = wasmtime.Engine()
module = wasmtime.Module.from_file(engine, str(path))
assert len(module.imports) == 0, list(module.imports)
store = wasmtime.Store(engine)
instance = wasmtime.Instance(store, module, [])
started = time.perf_counter()
result = instance.exports(store)['run_probe'](store)
elapsed = time.perf_counter() - started
assert result == 71, result
print(json.dumps(dict(
    probe_groups=result, imports=0, wasm_bytes=path.stat().st_size,
    wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    runtime='Wasmtime Python 38.0.0', elapsed_seconds=elapsed,
    scope='Five oblique conic/composition/STEP groups plus all sixty-six preceding groups. Workspace path dependencies, not a shipped JS or package consumer.',
), indent=2))
