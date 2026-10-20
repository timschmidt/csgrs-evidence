"""Prepare reproducible final-source consumers and matched workload recipes."""
from pathlib import Path
import shutil

ROOT = Path('/mnt/development/csgrs')
D = ROOT/'crates/hyperbrep/docs/evidence/2026-10-17-cone-exchange'
OLD = D.parent/'2026-10-17-cone-continuation'
W = Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
(W/'src').mkdir(parents=True, exist_ok=True)
(D/'wasm-probe').mkdir(exist_ok=True)
for name in ['Cargo.toml', 'Cargo.lock', 'lib.rs', 'faceted.rs']:
    s = (OLD/'wasm-probe'/name).read_text()
    s = s.replace('hyperbrep-cone-wasm-probe', 'hyperbrep-cone-exchange-wasm-probe')
    if name == 'lib.rs':
        s = s.replace('seam_export::failures_and_recovery()', 'seam_export::exchange_and_recovery()')
        s = s.replace('coplanar_export::failures_and_recovery()', 'coplanar_export::exchange_and_recovery()')
        s += '''
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/cone_exchange.rs"]
mod cone_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_cone_exchange_probe() -> u32 {
    cone_exchange::complete_workflows();
    cone_exchange::shifted_apex_and_units();
    cone_exchange::manual_line_inputs();
    cone_exchange::transformed_frames_and_explicit_encoding_limits();
    cone_exchange::inputs::reversed_generators_axes_units_and_source_maps();
    cone_exchange::inputs::supplied_pcurve_parameters();
    cone_exchange::inputs::failures_and_limits();
    cone_exchange::inputs::existing_surface_maps();
    8
}
'''
    (D/'wasm-probe'/name).write_text(s)
    (W/('src' if name.endswith('.rs') else '')/name).write_text(s)
s = (OLD/'wasm-probe/run.py').read_text()
s = s.replace('hyperbrep_cone_wasm_probe.wasm', 'hyperbrep_cone_exchange_wasm_probe.wasm')
s = s.replace('print(json.dumps(dict(', '''exchange_started=time.perf_counter()
exchange_result=instance.exports(store)['run_cone_exchange_probe'](store)
exchange_elapsed=time.perf_counter()-exchange_started
assert exchange_result==8,exchange_result
print(json.dumps(dict(
    cone_exchange_groups=exchange_result, cone_exchange_elapsed_seconds=exchange_elapsed,''')
s = s.replace('probe_groups=result+new_result+torus_result+reconstruction_result+cone_result,', 'probe_groups=result+new_result+torus_result+reconstruction_result+cone_result+exchange_result,')
s = s.replace('elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed+cone_elapsed,', 'elapsed_seconds=elapsed+new_elapsed+torus_elapsed+reconstruction_elapsed+cone_elapsed+exchange_elapsed,')
s = s.replace("scope='Nine added", "scope='Eight added conical STEP and source-map groups with complete modeling, supplied pcurves, units, transformed frames and explicit failure/recovery. Original 103 groups preserved, including explicit migration of original cone exchange rejections. Nine prior")
(D/'wasm-probe/run.py').write_text(s)
(W/'run.py').write_text(s)

for name in ['occt_read.py', 'torus_occt.py']:
    shutil.copy2(OLD/name, D/name)
s = (OLD/'build_benchmarks.py').read_text().replace('cone-continuation', 'cone-exchange')
s = s.replace("assert phase in ('baseline', 'candidate')", "assert phase == 'candidate', 'baseline binaries were frozen prospectively'")
s = s.replace("names.append('torus_exchange')", "names.extend(['torus_exchange', 'cone_exchange'])")
(D/'build_benchmarks.py').write_text(s)
s = (OLD/'benchmark.py').read_text().replace('cone-continuation', 'cone-exchange')
s = s.replace("'prism_exchange','torus_exchange'", "'prism_exchange','torus_exchange','cone_exchange'")
s = s.replace("sectors=(9 if side=='baseline' else 12)", 'sectors=12')
s = s.replace('torus_exchange=3)', 'torus_exchange=3,cone_exchange=1)')
s = s.replace("expected_new=['sectors/rotated_cone_reconstruction_false','sectors/rotated_cone_reconstruction_true','sectors/rotated_cone_band'] if kind=='sectors' else []", 'expected_new=[]')
s = s.replace('three new repeated cone continuation cases', 'one new complete cone STEP workflow')
(D/'benchmark.py').write_text(s)
s = (OLD/'analysis-recipes/dependency_costs.py').read_text()
s = s.replace('hyperbrep-cone-', 'hyperbrep-cone-exchange-')
(D/'analysis-recipes/dependency_costs.py').write_text(s)
print('Prepared 111 WASM groups, 175 preserved + 1 new main cost cases, 196 dependency cases.')
