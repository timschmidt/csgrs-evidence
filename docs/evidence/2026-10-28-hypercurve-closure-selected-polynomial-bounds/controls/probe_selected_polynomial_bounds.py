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
checkout=r/'selected-polynomial-bounds'
record=c/'selected-polynomial-bounds-fix1'
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-polynomial-bounds-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp')}
base=['cargo','test','--locked','--release','--all-features','-p','hypersolve']
commands=[]
commands += [('bounds-'+name,base+['--test','selected_polynomial_bounds',name,'--','--exact','--nocapture']) for name in [
 'dependent_root_bounds_have_independent_rational_certificates',
 'rational_images_negative_values_and_exact_zero_keep_their_meaning',
 'authored_bounds_are_checked_including_closed_endpoints',
 'near_values_are_separated_without_merging_their_fields',
 'bounds_refusal_retries_and_never_consumes_approximation',
]]
commands += [('existing-selected-fields',base+['--test','selected_polynomial_fields','--test','selected_polynomial_joins'])]
commands += [('msrv-clippy',['cargo','+1.95.0','clippy','--locked','--release','--all-features','--all-targets','-p','hypersolve','--','-D','warnings'])]

rows=[]
for name,command in commands:
    assert e.source_snapshot()[0]==source
    print('START',name,flush=True)
    started=time.time()
    run_env={**env}
    if 'msrv' in name:run_env['CARGO_TARGET_DIR'] += '-msrv'
    with (record/(name+'.log')).open('w') as log:
        p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,env=run_env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record/'active.json',{'pid':p.pid,'name':name,'command':command,'started_epoch':started})
        try:code=p.wait(timeout=600)
        except subprocess.TimeoutExpired:
            os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
    after,af,_=e.source_snapshot()
    row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':600,'settings':{k:v for k,v in run_env.items() if k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR']}}
    rows.append(row)
    e.save_json(record/'results.json',rows)
    e.save_json(record/'source-after.json',after)
    e.save_json(record/'files-after.json',af)
    print(row,flush=True)
    assert code==0 and row['source_stable']
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Focused exact enclosure witnesses and existing selected/joined-field consumers. Broader qualification and geometric point integration remain pending.','epoch':time.time()})
