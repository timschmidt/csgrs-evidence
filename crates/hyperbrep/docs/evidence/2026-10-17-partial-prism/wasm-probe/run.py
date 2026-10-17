import hashlib
import json
from pathlib import Path
import sys
import time
sys.path.insert(0, '/tmp/hyperbrep-wasmtime')
import wasmtime

path = Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_partial_prism_wasm_probe.wasm')
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
cone_started=time.perf_counter()
cone_result=instance.exports(store)['run_cone_probe'](store)
cone_elapsed=time.perf_counter()-cone_started
assert cone_result==9,cone_result
exchange_started=time.perf_counter()
exchange_result=instance.exports(store)['run_cone_exchange_probe'](store)
exchange_elapsed=time.perf_counter()-exchange_started
assert exchange_result==8,exchange_result
region_started=time.perf_counter()
region_result=instance.exports(store)['run_region_extrusion_probe'](store)
region_elapsed=time.perf_counter()-region_started
assert region_result==8,region_result
axial_started=time.perf_counter()
axial_result=instance.exports(store)['run_axial_probe'](store)
axial_elapsed=time.perf_counter()-axial_started
assert axial_result==8,axial_result
print(json.dumps(dict(
    axial_groups=axial_result, axial_elapsed_seconds=axial_elapsed,
    region_extrusion_groups=region_result, region_extrusion_elapsed_seconds=region_elapsed,
    cone_exchange_groups=exchange_result, cone_exchange_elapsed_seconds=exchange_elapsed,
    cone_groups=cone_result, cone_elapsed_seconds=cone_elapsed,
    reconstruction_groups=reconstruction_result, reconstruction_elapsed_seconds=reconstruction_elapsed,
    probe_groups=result+new_result+torus_result+reconstruction_result+cone_result+exchange_result+region_result+axial_result, torus_groups=torus_result, torus_elapsed_seconds=torus_elapsed, preserved_groups=result, prism_groups=new_result,
    preserved_elapsed_seconds=elapsed, prism_elapsed_seconds=new_elapsed, imports=0, wasm_bytes=path.stat().st_size,
    wasm_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    runtime='Wasmtime Python 38.0.0', elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed+cone_elapsed+exchange_elapsed+region_elapsed+axial_elapsed,
    scope='Eight new axial groups: partial-depth partition/selection with explicit unsupported shell admission; shifted periodic traces; two complete native continuations; four complete STEP exchanges. All original 119 groups retained. Eight preceding normalized-region extrusion groups preserve all original 111 groups: four native component/geometry/policy/resource groups and four complete STEP/replay/Boolean workflows. Eight preceding conical STEP and source-map groups with complete modeling, supplied pcurves, units, transformed frames and explicit failure/recovery. Original 103 groups preserved, including explicit migration of original cone exchange rejections. Nine prior cone continuation, cold replay, native contact and scalar groups. All four preserved rotated reconstruction/cold scalar groups. All seventy-one preserved groups (with explicit torus exchange capability migrations), twelve circular-prism groups, and seven native torus/STEP continuation, supplied-UV, periodic-image and failure/recovery groups. Workspace path dependencies, not a shipped JS or package consumer.',
), indent=2))
