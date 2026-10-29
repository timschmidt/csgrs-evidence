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
checkout=r/'selected-closure-integration'
import argparse
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
record=c/('selected-closure-integration-qualification-'+args.attempt)
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-closure-integration-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','test','--locked','--release','--all-features']
commands=[
 ('selected-fibers',base+['-p','hypercurve','--test','polynomial_query_fibers','--test','polynomial_selected_abscissas','--test','polynomial_point_locations','--test','selected_polynomial_points','--test','svg_point_replay','--test','selected_query_derivatives','--test','rational_query_guards']),
 ('selected-roots',base+['-p','hypersolve','--test','selected_polynomial_root_discovery','--test','selected_polynomial_join_retention','--test','selected_polynomial_joins','--test','selected_polynomial_replay']),
 ('brep-replay',base+['-p','hyperbrep','--test','selected_query_archive']),
 ('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),
 ('solver-full',base+['-p','hypersolve','--all-targets']),
 ('solver-minimal',['cargo','test','--locked','--release','--no-default-features','-p','hypersolve']),
 ('msrv-clippy',['cargo','+1.95.0','clippy','--locked','--release','-p','hypersolve','-p','hypercurve','-p','csgrs','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
 ('core-check',['cargo','check','--locked','--release','--no-default-features','-p','hypersolve','-p','hypercurve','-p','hyperbrep']),
 ('docs',['cargo','doc','--locked','--release','--no-deps','--all-features','-p','hypersolve','-p','hypercurve','-p','csgrs','-p','hyperbrep']),
 ('curve-full',base+['-p','hypercurve','--no-fail-fast']),
 ('model-full',base+['-p','csgrs','--no-fail-fast']),
]
commands += [('dependent-'+package,base+['-p',package,'--no-fail-fast']) for package in ['hyperbrep','hyperbrep-io','hypercircuit','hyperdrc','hypergraphics','hyperpack']]
commands += [
 ('solver-fuzz',['cargo','+1.95.0','clippy','--locked','--manifest-path','crates/hypersolve/fuzz/Cargo.toml','--bins','--','-D','warnings']),
 ('curve-fuzz',['cargo','+1.95.0','clippy','--locked','--manifest-path','crates/hypercurve/fuzz/Cargo.toml','--bins','--','-D','warnings']),
 ('solver-allocations',['cargo','run','--locked','--release','--all-features','-p','hypersolve','--example','allocation_profile','--','4']),
 ('matrix-guards',['python3','crates/hypercurve/scripts/test_capability_matrix.py']),
 ('matrix',['python3','crates/hypercurve/scripts/capability_matrix.py','--output',str(record/'capabilities')]),
 ('typos',['typos']),
 ('repository-budget',['scripts/check-repository-budget.sh']),
 ('diff',['git','diff','--check']),
]

msrv=next(item for item in commands if item[0]=='msrv-clippy')
commands.remove(msrv);commands.insert(3,msrv)

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
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Integrated dependent fibers, rational derivatives, original denominator guards, retained selected-field joins, complete root discovery and native replay. Four new cross-increment witnesses preserve source equations, further consumption and cold replay; all predecessor fixtures remain. Full solver/curve/model and six consumer suites, strict MSRV lint, minimal checks, strict docs/fuzz lint, allocation lifetime profile, capability matrix and hygiene. This does not qualify general implicit-region offsets, corner edits or universal closure; publication still requires the separate full pre-push contract.','epoch':time.time()})
