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
checkout=r/'selected-polynomial-replay'
record=c/'selected-polynomial-replay-fix2'
record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-selected-circle-points-admission'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp')}
base=['cargo','test','--locked','--release','--all-features','-p','hypersolve']
commands=[]
commands += [('replay-'+name,base+['--test','selected_polynomial_replay',name,'--','--exact','--nocapture']) for name in [
 'dependent_polynomial_graph_replay_retains_joint_authority',
 'native_and_repeated_polynomial_relations_survive_replay',
 'replayed_nearby_selections_remain_distinct_and_joinable',
 'graph_replay_rejects_invalid_references_selectors_and_denominators',
 'native_replay_rechecks_root_ownership_and_radical_preconditions',
 'graph_limits_refuse_atomically_and_retry_without_approximation',
 'graph_encoding_shares_repeated_outputs_and_replays_in_a_fresh_process',
 'elliptic_contact_graph_replays_original_curve_distance_and_side',
]]
commands += [('existing-selected-fields',base+['--test','selected_polynomial_fields','--test','selected_polynomial_joins','--test','selected_polynomial_bounds']),('existing-native-fields',base+['--test','recursive_quadratic_fields','--test','recursive_quadratic_field_signs','--test','recursive_quadratic_field_embeddings','--test','recursive_polynomial_substitution'])]
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
e.save_json(record/'complete.json',{'all_passed':True,'source':source,'groups':len(commands),'scope':'Focused strict scalar graph replay witnesses, including a fresh process and the original elliptic contact, and existing selected/native-field consumers. Broader qualification and geometric integration remain pending.','epoch':time.time()})
