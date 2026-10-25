from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time

raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r28-trace')
record=raw/('candidate-board-trace-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r28-trace-target',CCACHE_DIR='/tmp/csgrs-r28-trace-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r28-trace-ccache/tmp',CARGO_BUILD_JOBS='2')
assert 'UPDATE_HYPERCIRCUIT_EASYDUINO_RELEASE_SNAPSHOT' not in env
def run(name,cmd,limit,mem=False):
    start=time.time()
    with (record/(name+'.stdout')).open('w') as stdout,(record/(name+'.stderr')).open('w') as stderr:
        def limits():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
        p=subprocess.Popen(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=limits if mem else None)
        try:status=p.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'name':name,'cmd':cmd,'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':limit,'memory_bytes':8*1024**3 if mem else None})+'\n')
    print(name,status,flush=True);return status
cmd=['cargo','bench','--locked','--offline','-p','hypercircuit','--features','drc interchange','--bench','easyduino_full_pipeline','--no-run','--message-format=json']
if run('build',cmd,1800)!=0:raise SystemExit('board trace build failed')
artifacts=[]
for line in (record/'build.stdout').read_text().splitlines():
    try:row=json.loads(line)
    except json.JSONDecodeError:continue
    if row.get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='easyduino_full_pipeline':artifacts.append(row['executable'])
assert len(artifacts)==1
binary=Path(artifacts[0]);(record/'binary.json').write_text(json.dumps({'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size},indent=2)+'\n')
env.update(EASYDUINO_BOARD='nano')
status=run('nano',['/usr/bin/time','-v',str(binary)],600,True)
(record/'completion.json').write_text(json.dumps({'status':status,'board':'nano','stage':'complete existing release-pipeline benchmark','instrumented':True,'scope':'route reproduction; no native performance claim; fixture/snapshot update disabled'},indent=2)+'\n')
print('BOARD TRACE COMPLETE',record,flush=True)
