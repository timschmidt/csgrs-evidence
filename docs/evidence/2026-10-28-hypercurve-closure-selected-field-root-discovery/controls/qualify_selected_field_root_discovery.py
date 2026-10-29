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
checkout=r/'selected-field-root-discovery'
record=c/'selected-field-root-discovery-qualification-final5'
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypersolve-selected-field-root-discovery-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','test','--locked','--release','--all-features']
commands=[
 ('discovery',base+['-p','hypersolve','--test','selected_polynomial_root_discovery','--test','selected_polynomial_replay','--test','selected_polynomial_bounds','--test','selected_polynomial_joins','--test','selected_polynomial_fields']),
 ('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),
 ('stack-msrv-clippy',['cargo','+1.95.0','clippy','--locked','--release','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','csgrs','--all-targets','--all-features','--','-D','warnings']),
 ('solver-full',base+['-p','hypersolve','--all-targets']),
 ('solver-core',['cargo','check','--locked','--release','--no-default-features','-p','hypersolve']),
 ('solver-minimal',['cargo','test','--locked','--release','--no-default-features','-p','hypersolve']),
 ('curve-consumers',base+['-p','hypercurve',*sum((['--test',name] for name in [
  'polynomial_curves','polynomial_algebraic_pairs','polynomial_curve_pairs','polynomial_rational_sections',
  'polynomial_point_order','polynomial_generated_lines','polynomial_closure_composition','fiber_point_incidence',
  'rational_point_forms','rational_point_images','selected_point_definitions','svg_point_replay','svg_circle_replay','selected_polynomial_points']),[])]),
 ('model-consumers',base+['-p','csgrs','--test','downstream_profiles','--test','svg_point_replay','--test','scalar_certificate_failures']),
 ('brep-consumers',base+['-p','hyperbrep','--test','selected_query_archive']),
 ('solver-docs',['cargo','doc','--locked','--release','--no-deps','--all-features','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','csgrs']),
 ('solver-fuzz',['cargo','+1.95.0','clippy','--locked','--manifest-path','crates/hypersolve/fuzz/Cargo.toml','--bins','--','-D','warnings']),
 ('solver-allocations',['cargo','run','--locked','--release','--all-features','-p','hypersolve','--example','allocation_profile','--','4']),
 ('typos',['typos']),
 ('repository-budget',['scripts/check-repository-budget.sh']),
 ('diff',['git','diff','--check']),
]

rows=[]
for name,command in commands:
    assert e.source_snapshot()[0]==source
    print('START',name,flush=True)
    started=time.time()
    run_env={**env}
    if 'msrv' in name: run_env['CARGO_TARGET_DIR'] += '-msrv'
    if name=='solver-docs':run_env['RUSTDOCFLAGS']='-D warnings'
    if name=='solver-fuzz':run_env['CARGO_TARGET_DIR'] += '-solver-fuzz'
    with (record/(name+'.log')).open('w') as log:
        p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,env=run_env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record/'active.json',{'pid':p.pid,'name':name,'command':command,'started_epoch':started})
        try:code=p.wait(timeout=21600)
        except subprocess.TimeoutExpired:
            os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
    after,af,_=e.source_snapshot()
    row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':21600,'settings':{k:v for k,v in run_env.items() if k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','RUSTDOCFLAGS','HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}}
    rows.append(row)
    e.save_json(record/'results.json',rows)
    e.save_json(record/'source-after.json',after)
    e.save_json(record/'files-after.json',af)
    print(row,flush=True)
    assert code==0 and row['source_stable']
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Additive complete ordered-field root discovery over admitted exact coefficient fields, including repeated/reducible polynomials and original-equation selectors. Full Hypersolve all-target and minimal suites, strict four-package MSRV lint, fourteen selected curve consumers, model and native archive consumers, strict docs/fuzz lint, allocation lifetime control and hygiene. Existing Bernstein/root-count behavior is unchanged; geometry algorithms do not yet call the new discovery API. General geometric operation closure and the complete pre-push campaign remain pending.','epoch':time.time()})
