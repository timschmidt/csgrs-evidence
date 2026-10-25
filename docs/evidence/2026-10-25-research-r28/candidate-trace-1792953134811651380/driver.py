from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time

raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r28-trace')
record=raw/('candidate-trace-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r28-trace-target',CCACHE_DIR='/tmp/csgrs-r28-trace-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r28-trace-ccache/tmp',CARGO_BUILD_JOBS='2',PROPTEST_RNG_SEED='20261025')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
paths=['crates/hypercurve/src/bezier_fit.rs','crates/hypercurve/src/rational_bezier_general.rs','crates/hypercurve/src/curve_region_boolean.rs']
inventory=lambda:{p:hashlib.sha256((root/p).read_bytes()).hexdigest() for p in paths}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'environment.json').write_text(json.dumps({'rustc':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','CARGO_BUILD_JOBS','PROPTEST_RNG_SEED']},'timing_status':'instrumented route reproduction; concurrent primary validation; not native performance evidence'},indent=2)+'\n')
def execute(name,cmd,settings,limit,mem=False):
    start=time.time()
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'name':name,'event':'start','cmd':cmd,'env_overrides':settings,'timeout_seconds':limit,'memory_bytes':8*1024**3 if mem else None})+'\n')
    runtime=env|settings
    with (record/(name+'.stdout')).open('w') as stdout,(record/(name+'.stderr')).open('w') as stderr:
        def limits():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
        proc=subprocess.Popen(cmd,cwd=root,env=runtime,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=limits if mem else None)
        try:status=proc.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'name':name,'event':'finish','status':status,'elapsed_seconds':time.time()-start})+'\n')
    print(name,status,flush=True);return status
cmd=['cargo','bench','--locked','--offline','-p','hypercurve','--all-features','--bench','curve_region_boolean_batch','--no-run','--message-format=json']
if execute('build',cmd,{},1800)!=0:raise SystemExit('trace build failed')
artifacts=[]
for line in (record/'build.stdout').read_text().splitlines():
    try:row=json.loads(line)
    except json.JSONDecodeError:continue
    if row.get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='curve_region_boolean_batch':artifacts.append(row['executable'])
assert len(artifacts)==1
binary=Path(artifacts[0]);(record/'binary.json').write_text(json.dumps({'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size},indent=2)+'\n')
statuses={}
for fixture in ['circles','elevated-circles','capsules','point-touch-rectangles','aligned-conic-overlap','nonlinear-line-overlap','analytic-curved-cap','mobius-cubic-overlap']:
    for policy in ['strict','approximate-512']:
        name=fixture+'-'+policy
        statuses[name]=execute(name,['/usr/bin/time','-v',str(binary)],{'HYPERCURVE_CURVE_REGION_BATCH_FIXTURE':fixture,'HYPERCURVE_CURVE_REGION_BATCH_POLICY':policy,'HYPERCURVE_CURVE_REGION_BATCH_ITERATIONS':'1','HYPERCURVE_CURVE_REGION_BATCH_MODE':'shared'},180,True)
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
(record/'completion.json').write_text(json.dumps({'statuses':statuses,'sources_unchanged':True,'scope':'existing benchmark dispatch/outcome reproduction only; benchmark validates boundary counts, not a new independent exact oracle'},indent=2)+'\n')
print('TRACE COMPLETE',record,flush=True)
