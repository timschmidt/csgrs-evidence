import hashlib
import json
from pathlib import Path
import sys
import time
sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime

path = Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_edge_image_proof_wasm_probe.wasm')
engine = wasmtime.Engine()
module = wasmtime.Module.from_file(engine, str(path))
assert len(module.imports) == 0, list(module.imports)
store = wasmtime.Store(engine)
instance = wasmtime.Instance(store, module, [])
started = time.perf_counter()
result = instance.exports(store)['run_probe'](store)
elapsed = time.perf_counter() - started
assert result == 13, result
print(json.dumps(dict(
    probe_groups=result, imports=0, wasm_bytes=path.stat().st_size,
    wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    runtime='Wasmtime Python 38.0.0', elapsed_seconds=elapsed,
    scope='Five new whole-image query groups plus eight preserved STEP groups. Exact analytic import and replay; directed source parameters and seam uses; partial arcs, reversed normals, oblique/radical frames and senses; length/angle units; split/reflection/Boolean/empty continuation; typed invalid and unsupported sources; ownership, source accounting and resource limits.',
), indent=2))
