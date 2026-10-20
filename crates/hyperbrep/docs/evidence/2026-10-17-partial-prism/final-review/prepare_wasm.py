"""Retain all 119 preceding groups and add the axial proof/consumer groups."""
import hashlib
import json
from pathlib import Path

OUT=Path(__file__).resolve().parents[1]
OLD=OUT.parent/'2026-10-17-region-extrusion/wasm-probe'
PROJECT=Path('/tmp/hyperbrep-partial-prism-wasm-probe')
assert not PROJECT.exists()
(PROJECT/'src').mkdir(parents=True)
(OUT/'wasm-probe').mkdir()
lib=(OLD/'lib.rs').read_text()+'''
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/axial_cuts.rs"]
mod axial_native;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/axial_cuts.rs"]
mod axial_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_axial_probe() -> u32 {
    axial_native::partial_stages();
    axial_native::periodic_traces();
    for disjoint in [false, true] {
        axial_native::unchanged_cut(disjoint);
        for reflected in [false, true] {
            let (step, native) = axial_exchange::round_trip(disjoint, reflected).unwrap();
            assert!(!step.is_empty() && !native.is_empty());
        }
    }
    8
}
'''
manifest=(OLD/'Cargo.toml').read_text().replace('hyperbrep-region-extrusion-wasm-probe','hyperbrep-partial-prism-wasm-probe')
runner=(OLD/'run.py').read_text().replace('hyperbrep_region_extrusion_wasm_probe.wasm','hyperbrep_partial_prism_wasm_probe.wasm')
anchor='print(json.dumps(dict(\n'
assert runner.count(anchor)==1
runner=runner.replace(anchor,'''axial_started=time.perf_counter()
axial_result=instance.exports(store)['run_axial_probe'](store)
axial_elapsed=time.perf_counter()-axial_started
assert axial_result==8,axial_result
print(json.dumps(dict(
    axial_groups=axial_result, axial_elapsed_seconds=axial_elapsed,
''',1)
runner=runner.replace('exchange_result+region_result,','exchange_result+region_result+axial_result,',1)
runner=runner.replace('exchange_elapsed+region_elapsed,','exchange_elapsed+region_elapsed+axial_elapsed,',1)
runner=runner.replace("scope='Eight new normalized", "scope='Eight new axial groups: partial-depth partition/selection with explicit unsupported shell admission; shifted periodic traces; two complete native continuations; four complete STEP exchanges. All original 119 groups retained. Eight preceding normalized",1)
files=[('Cargo.toml','Cargo.toml',manifest),('lib.rs','src/lib.rs',lib),('run.py','run.py',runner)]
for name in ['faceted.rs','native_regions.rs']:files.append((name,'src/'+name,(OLD/name).read_text()))
for retained,copied,text in files:
    (OUT/'wasm-probe'/retained).write_text(text)
    (PROJECT/copied).write_text(text)
(OUT/'wasm-construction.json').write_text(json.dumps(dict(original={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in OLD.glob('*') if p.is_file()},new_groups=8,preserved_groups=119,project=str(PROJECT),recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
print('Prepared 127 source-path WASM groups.')
