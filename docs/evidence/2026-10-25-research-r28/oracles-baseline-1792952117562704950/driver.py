from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,sys,time
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r28-candidate');label=sys.argv[1]
record=raw/('oracles-'+label+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r28-candidate-target',CCACHE_DIR='/tmp/csgrs-r28-candidate-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r28-candidate-ccache/tmp',CARGO_BUILD_JOBS='2',PROPTEST_RNG_SEED='20261025');Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
def run(name,cmd,limit,mem=False):
    start=time.time()
    with (record/(name+'.stdout')).open('w') as stdout,(record/(name+'.stderr')).open('w') as stderr:
        def limits():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
        p=subprocess.Popen(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=limits if mem else None)
        try:status=p.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'name':name,'cmd':cmd,'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':limit,'memory_bytes':8*1024**3 if mem else None})+'\n')
    print(name,status,flush=True);return status
assert run('fmt',['cargo','fmt','--all'],120)==0
names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
names=[n for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])]
inventory=lambda:{n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
(record/'research_tests.rs').write_bytes((root/'crates/hypercurve/src/bezier_fit/research_tests.rs').read_bytes())
(record/'environment.json').write_text(json.dumps({'label':label,'rustc':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','CARGO_BUILD_JOBS','PROPTEST_RNG_SEED']}},indent=2)+'\n')
status=run('build',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','--no-run','--message-format=json'],1800)
if status==0:
    artifacts=[]
    for line in (record/'build.stdout').read_text().splitlines():
        try:row=json.loads(line)
        except json.JSONDecodeError:continue
        if row.get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='hypercurve':artifacts.append(row['executable'])
    assert len(artifacts)==1
    binary=Path(artifacts[0]);(record/'binary.json').write_text(json.dumps({'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size},indent=2)+'\n')
    status=run('oracles',[str(binary),'bezier_fit::research_tests','--test-threads=2','--nocapture'],300,True)
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
(record/'completion.json').write_text(json.dumps({'status':status,'sources_unchanged':True,'label':label},indent=2)+'\n')
print('ORACLES COMPLETE',record,flush=True)
