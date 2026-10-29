from pathlib import Path
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1]
c=r/'controls'
checkout=r/'selected-point-fillets'
import argparse
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
record=c/('selected-point-fillets-tail-'+args.attempt)
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-point-fillets-native'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','test','--locked','--release','--all-features']
commands=[('curve-tail', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--no-fail-fast', '--test', 'polynomial_line_components', '--test', 'polynomial_point_locations', '--test', 'polynomial_point_order', '--test', 'polynomial_rational_sections', '--test', 'polynomial_region_admission', '--test', 'polynomial_selected_abscissas', '--test', 'qualified_closure', '--test', 'qualified_region_queries', '--test', 'rational_box_containment', '--test', 'rational_point_forms', '--test', 'rational_point_images', '--test', 'ray_filter_extreme_coordinates', '--test', 'readme', '--test', 'retained_bezier_images', '--test', 'selected_fiber_images', '--test', 'selected_point_definitions', '--test', 'similarity_policy_closure', '--test', 'span_parameter_transport', '--test', 'svg_chord_replay', '--test', 'svg_circle_replay', '--test', 'svg_parallel_replay', '--test', 'svg_point_replay', '--test', 'svg_region_replay', '--test', 'svg_scalar_failures', '--test', 'svg_selected_replay', '--test', 'tangent_relations', '--test', 'work_budget', '--test', 'selected_polynomial_points'])]

rows=[]
for name,command in commands:
    assert e.source_snapshot()[0]==source
    print('START',name,flush=True)
    started=time.time()
    run_env={**env}
    if 'msrv' in name: run_env['CARGO_TARGET_DIR'] += '-msrv'
    if name=='docs':run_env['RUSTDOCFLAGS']='-D warnings'
    if name.endswith('-fuzz'):run_env['CARGO_TARGET_DIR'] += '-'+name
    with (record/(name+'.log')).open('w') as log:
        p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,env=run_env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record/'active.json',{'pid':p.pid,'name':name,'command':command,'started_epoch':started})
        try:code=p.wait(timeout=900)
        except subprocess.TimeoutExpired:
            os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
    after,af,_=e.source_snapshot()
    row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':900,'settings':{k:v for k,v in run_env.items() if k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','RUSTDOCFLAGS','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}}
    rows.append(row)
    e.save_json(record/'results.json',rows)
    e.save_json(record/'source-after.json',after)
    e.save_json(record/'files-after.json',af)
    print(row,flush=True)
    assert code==0 and row['source_stable']
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Additional unchanged downstream curve consumers after the generated-line dispatch correction, plus selected polynomial points. Original parent targets retained; no full-suite or universal completion claim.','epoch':time.time()})
