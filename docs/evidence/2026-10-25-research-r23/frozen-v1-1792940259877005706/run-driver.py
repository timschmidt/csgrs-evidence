from pathlib import Path
import os, json, subprocess, hashlib, time, signal, resource

root = Path('/tmp/csgrs-r23-candidate')
record = Path(__file__).resolve().parent / ('frozen-v1-' + str(time.time_ns()))
record.mkdir()
(record/'run-driver.py').write_bytes(Path(__file__).read_bytes())
target = '/tmp/csgrs-r23-candidate-frozen-target'
env = os.environ.copy()
env.update(CARGO_TARGET_DIR=target, CCACHE_DIR='/tmp/csgrs-r23-candidate-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r23-candidate-ccache/tmp', PROPTEST_RNG_SEED='20261025')

def inventory():
    names = subprocess.check_output(['git', 'ls-files', '--cached', '--others', '--exclude-standard'], cwd=root, text=True).splitlines()
    return {n: hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names
            if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml', 'Cargo.lock', 'config.toml'])}

before = inventory()
(record/'sources-before.json').write_text(json.dumps(before, indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
for name in ['research_containment.rs','research_containment_extended.rs']:
    (record/name).write_bytes((root/'crates/hypercurve/tests'/name).read_bytes())
(record/'environment.json').write_text(json.dumps({'compiler':subprocess.check_output(['rustc','-Vv'],text=True),
    'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','PROPTEST_RNG_SEED']},
    'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()},indent=2)+'\n')

def memory_limit():
    resource.setrlimit(resource.RLIMIT_AS, (8*1024**3,8*1024**3))

def run(name, cmd, limit, bounded=False):
    start=time.time();print('START',name,flush=True)
    with (record/'commands.jsonl').open('a') as log:
        log.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'epoch':start,'timeout_seconds':limit,'address_space_bytes':8*1024**3 if bounded else None})+'\n')
    with (record/(name+'.log')).open('w') as log:
        proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=memory_limit if bounded else None)
        try: status=proc.wait(timeout=limit)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    with (record/'commands.jsonl').open('a') as log:
        log.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n')
    print('FINISH',name,status,flush=True)
    return status

build=['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features',
       '--test','research_containment','--test','research_containment_extended','--test','curve_box_containment',
       '--no-run','--message-format=json']
status=run('build',build,900)
if status==0:
    artifacts={}
    for line in (record/'build.log').read_text().splitlines():
        if line.startswith('{'):
            row=json.loads(line)
            if row.get('reason')=='compiler-artifact' and row.get('executable'):
                p=Path(row['executable']);artifacts[row['target']['name']]={'path':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'bytes':p.stat().st_size}
    (record/'artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
    run('exact-peak',[artifacts['research_containment']['path'],'--nocapture','--test-threads=1'],180,True)
    for name in ['irrational_extrema_survive_signed_weights_knots_and_reversal',
                 'repeated_derivative_root_and_constant_coordinate_keep_exact_tangency',
                 'selected_extremum_witness_survives_similarity_and_source_drop',
                 'a_pole_cannot_be_certified_as_a_finite_contained_curve',
                 'selected_trims_keep_only_extrema_in_the_active_source_chart',
                 'exhausted_root_work_remains_retryable_under_a_larger_budget',
                 'periodic_rational_spans_keep_the_exact_seam_extrema',
                 'a_pole_outside_a_selected_trim_does_not_remove_its_finite_extrema']:
        run(name,[artifacts['research_containment_extended']['path'],name,'--exact','--nocapture','--test-threads=1'],300,True)
    run('existing-containment',[artifacts['curve_box_containment']['path'],'--nocapture','--test-threads=1'],300,True)
after=inventory();(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert before==after,'source changed during frozen build/test'
print('FROZEN SOURCES MATCH',record,flush=True)
