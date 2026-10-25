from pathlib import Path
import os, json, subprocess, time, signal, hashlib, resource, sys

root = Path('/tmp/csgrs-r15-trace')
record = Path(__file__).resolve().parent / ('trace-' + str(time.time_ns()))
record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r15-trace-target',
           CCACHE_DIR='/tmp/csgrs-r15-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r15-trace-ccache/tmp', PROPTEST_RNG_SEED='20261025')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
def inventory():
    names = subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock'])}
before = inventory()
(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
meta={'compiler':subprocess.check_output(['rustc','-Vv'],text=True), 'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','PROPTEST_RNG_SEED']},'runs':[]}
def bounded():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
def run(name,cmd,limit,bound=False):
    print('START',name,flush=True);start=time.time()
    with (record/(name+'.log')).open('w') as out:
        proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=bounded if bound else None)
        try:status=proc.wait(timeout=limit)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    meta['runs'].append({'name':name,'command':cmd,'status':status,'seconds':time.time()-start,'timeout_seconds':limit,'address_space_bytes':8*1024**3 if bound else None})
    (record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n');print('FINISH',name,status,flush=True);return status
status=run('build',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','--no-run','--message-format=json'],1200)
if status==0:
    bins=[row['executable'] for line in (record/'build.log').read_text().splitlines() if line.startswith('{') and (row:=json.loads(line)).get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='hypercurve']
    assert len(bins)==1
    binary=Path(bins[0]);meta['binary']={'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size}
    run('library',[str(binary),*sys.argv[1:],'--test-threads=2','--nocapture'],1200,True)
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
meta['sources_unchanged']=True;(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
print('TRACE COMPLETE',record,flush=True)
