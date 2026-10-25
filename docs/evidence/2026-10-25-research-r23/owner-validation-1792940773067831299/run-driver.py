from pathlib import Path
import os, json, subprocess, hashlib, time, signal, resource

root = Path('/tmp/csgrs-r23-candidate')
record = Path(__file__).resolve().parent / ('owner-validation-' + str(time.time_ns()))
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
for name in ['curve_box_containment.rs','rational_box_containment.rs']:
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

checks=[
 ('fmt',['cargo','fmt','--all','--','--check'],300),
 ('clippy',['cargo','clippy','--locked','--offline','-p','hypercurve','--all-features','--all-targets','--','-D','warnings'],900),
 ('docs',['env','RUSTDOCFLAGS=-D warnings','cargo','doc','--locked','--offline','-p','hypercurve','--all-features','--no-deps'],600),
 ('full-hypercurve',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--no-fail-fast','--','--test-threads=2'],3600),
 ('modeling-continuation',['cargo','test','--locked','--offline','--release','-p','csgrs','--all-features','--test','downstream_profiles','--test','mixed_modeling_profiles','--test','receipt_composition','--test','adapter_curve_failures','--','--test-threads=2'],1200),
 ('diff-check',['git','diff','--check'],300),
]
failed=None
for name,cmd,limit in checks:
 status=run(name,cmd,limit)
 if status!=0:
  failed=name;break
after=inventory();(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert before==after,'source changed during owner validation'
(record/'completion.json').write_text(json.dumps({'failed':failed,'sources_unchanged':True},indent=2)+'\n')
print('OWNER CHECKS',record,failed,flush=True)
