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
checkout=r/'selected-query-derivatives'
import argparse
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
record=c/('selected-query-derivatives-qualification-'+args.attempt)
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-query-derivatives-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','test','--locked','--release','--all-features']
commands=[
 ('selected-derivatives',base+['-p','hypercurve','--test','selected_query_derivatives']),
 ('predecessors',base+['-p','hypercurve','--test','hypercurve_derivative_completeness','--test','selected_polynomial_points','--test','svg_point_replay']),
 ('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),
 ('msrv-clippy',['cargo','+1.95.0','clippy','--locked','--release','-p','hypercurve','-p','hyperbrep','-p','csgrs','--all-targets','--all-features','--','-D','warnings']),
 ('core-check',['cargo','check','--locked','--release','--no-default-features','-p','hypercurve','-p','hyperbrep']),
 ('docs',['cargo','doc','--locked','--release','--no-deps','--all-features','-p','hypercurve','-p','csgrs','-p','hyperbrep']),
 ('curve-full',base+['-p','hypercurve','--no-fail-fast']),
 ('model-full',base+['-p','csgrs','--no-fail-fast']),
]
commands += [('dependent-'+package,base+['-p',package,'--no-fail-fast']) for package in ['hyperbrep','hyperbrep-io','hypercircuit','hyperdrc','hypergraphics','hyperpack']]
commands += [
 ('curve-fuzz',['cargo','+1.95.0','clippy','--locked','--manifest-path','crates/hypercurve/fuzz/Cargo.toml','--bins','--','-D','warnings']),
 ('matrix-guards',['python3','crates/hypercurve/scripts/test_capability_matrix.py']),
 ('matrix',['python3','crates/hypercurve/scripts/capability_matrix.py','--output',str(record/'capabilities')]),
 ('typos',['typos']),
 ('repository-budget',['scripts/check-repository-budget.sh']),
 ('diff',['git','diff','--check']),
]
assert len(commands)==20

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
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Selected query rational derivatives, original guards, exact higher orders, source-chart scaling, side selection, retained restrictions/reversal/similarity and fresh replay. Full curve/model/six consumer suites, MSRV lint, minimal checks, strict docs/fuzz lint, capability matrix and hygiene. No Hypersolve implementation change in this increment. General parallel/implicit derivatives and region offset/corner closure remain unqualified.','epoch':time.time()})
