import hashlib
import json
from pathlib import Path
import sys
import time
sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime

path = Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm')
engine = wasmtime.Engine()
module = wasmtime.Module.from_file(engine, str(path))
assert len(module.imports) == 0, list(module.imports)
store = wasmtime.Store(engine)
instance = wasmtime.Instance(store, module, [])
started = time.perf_counter()
result = instance.exports(store)['run_probe'](store)
elapsed = time.perf_counter() - started
assert result == 71, result
new_started=time.perf_counter()
new_result=instance.exports(store)['run_prism_probe'](store)
new_elapsed=time.perf_counter()-new_started
assert new_result==12,new_result
torus_started=time.perf_counter()
torus_result=instance.exports(store)['run_torus_probe'](store)
torus_elapsed=time.perf_counter()-torus_started
assert torus_result==7,torus_result
reconstruction_started=time.perf_counter()
reconstruction_result=instance.exports(store)['run_reconstruction_probe'](store)
reconstruction_elapsed=time.perf_counter()-reconstruction_started
assert reconstruction_result==4,reconstruction_result
print(json.dumps(dict(
    reconstruction_groups=reconstruction_result, reconstruction_elapsed_seconds=reconstruction_elapsed,
    probe_groups=result+new_result+torus_result+reconstruction_result, torus_groups=torus_result, torus_elapsed_seconds=torus_elapsed, preserved_groups=result, prism_groups=new_result,
    preserved_elapsed_seconds=elapsed, prism_elapsed_seconds=new_elapsed, imports=0, wasm_bytes=path.stat().st_size,
    wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    runtime='Wasmtime Python 38.0.0', elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed,
    scope='Four added rotated reconstruction/cold scalar groups. All seventy-one preserved groups (with explicit torus exchange capability migrations), twelve circular-prism groups, and seven native torus/STEP continuation, supplied-UV, periodic-image and failure/recovery groups. Workspace path dependencies, not a shipped JS or package consumer.',
), indent=2))
