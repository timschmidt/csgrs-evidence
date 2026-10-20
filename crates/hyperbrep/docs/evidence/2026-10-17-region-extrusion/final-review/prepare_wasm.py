"""Preserve the 111-group consumer and add eight region acceptance groups."""
import hashlib
import json
from pathlib import Path

OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
OLD=OUT.parent/'2026-10-17-cone-exchange/wasm-probe'
PROJECT=Path('/tmp/hyperbrep-region-extrusion-wasm-probe')
assert not PROJECT.exists()
(PROJECT/'src').mkdir(parents=True)
(OUT/'wasm-probe').mkdir()
names=[
    'normalized_strokes_keep_native_circle_surfaces_and_exact_measures',
    'winding_owned_holes_islands_and_components_survive_replay_and_composition',
    'empty_material_is_composable_and_does_not_hide_invalid_heights',
    'extrusion_restores_ambient_receipts_and_cannot_refund_exhausted_work',
]
native_path=ROOT/'crates/hyperbrep/tests/region_extrusion.rs'
native=native_path.read_text()
for name in names:
    pattern='#[test]\nfn '+name
    assert native.count(pattern)==1
    native=native.replace(pattern,'pub fn '+name,1)
assert '#[test]' not in native
lib=(OLD/'lib.rs').read_text()+'''
mod native_regions;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/region_extrusion.rs"]
mod region_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_region_extrusion_probe() -> u32 {
'''
for name in names:lib+='    native_regions::'+name+'();\n'
lib+='''    for cap in [hypercurve::OffsetCap::Butt, hypercurve::OffsetCap::Round] {
        for reverse in [false, true] {
            let (step, native) = region_exchange::round_trip(cap, reverse).unwrap();
            assert!(!step.is_empty() && !native.is_empty());
        }
    }
    8
}
'''
manifest=(OLD/'Cargo.toml').read_text().replace('hyperbrep-cone-exchange-wasm-probe','hyperbrep-region-extrusion-wasm-probe')
manifest+='hypersolve = { path = "/mnt/development/csgrs/crates/hypersolve" }\n'
runner=(OLD/'run.py').read_text().replace('hyperbrep_cone_exchange_wasm_probe.wasm','hyperbrep_region_extrusion_wasm_probe.wasm')
anchor='print(json.dumps(dict(\n'
assert runner.count(anchor)==1
runner=runner.replace(anchor,'''region_started=time.perf_counter()
region_result=instance.exports(store)['run_region_extrusion_probe'](store)
region_elapsed=time.perf_counter()-region_started
assert region_result==8,region_result
print(json.dumps(dict(
    region_extrusion_groups=region_result, region_extrusion_elapsed_seconds=region_elapsed,
''',1)
runner=runner.replace('probe_groups=result+new_result+torus_result+reconstruction_result+cone_result+exchange_result,','probe_groups=result+new_result+torus_result+reconstruction_result+cone_result+exchange_result+region_result,',1)
runner=runner.replace('elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed+cone_elapsed+exchange_elapsed,','elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed+cone_elapsed+exchange_elapsed+region_elapsed,',1)
runner=runner.replace("scope='Eight added conical", "scope='Eight new normalized-region extrusion groups preserve all original 111 groups: four native component/geometry/policy/resource groups and four complete STEP/replay/Boolean workflows. Eight preceding conical",1)
for retained,copied,text in [('Cargo.toml','Cargo.toml',manifest),('lib.rs','src/lib.rs',lib),
    ('native_regions.rs','src/native_regions.rs',native),('run.py','run.py',runner),
    ('faceted.rs','src/faceted.rs',(OLD/'faceted.rs').read_text())]:
    (OUT/'wasm-probe'/retained).write_text(text)
    (PROJECT/copied).write_text(text)
record=dict(original={str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in OLD.glob('*') if path.is_file()},
    native_acceptance=dict(path=str(native_path),sha256=hashlib.sha256(native_path.read_bytes()).hexdigest(),
        adaptation='Remove #[test] and make exactly four named acceptance functions public; retain their full assertions and helper bodies.'),
    new_groups=8,preserved_groups=111,project=str(PROJECT),recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(OUT/'wasm-construction.json').write_text(json.dumps(record,indent=2)+'\n')
print('Prepared the 119-group source-path WASM consumer.')
