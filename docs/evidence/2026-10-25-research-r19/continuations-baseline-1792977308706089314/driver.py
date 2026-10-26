from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
build = json.loads((raw/('latest-baseline-build.json' if variant=='baseline' else 'latest-probe-candidate.json')).read_text())
assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
fixtures=Path(json.loads((raw/'latest-initial-reproduction.json').read_text())['record'])
record=raw/('continuations-'+variant+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
(record/'build.json').write_text(json.dumps(build,indent=2)+'\n')
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
rows=[]
for name in ['cot-2048-below','cot-2048-above','cot-2304-below','cot-2304-above']:
    for mode in ['native','json','cbor','value']:
        for operation in ['sign','divide','orient']:
            stem='-'.join([name,mode,operation])
            command=['/usr/bin/time','-v',build['binary'],mode,str(fixtures/name),operation]
            start=time.monotonic()
            with (record/(stem+'.stdout')).open('w') as out,(record/(stem+'.stderr')).open('w') as err:
                proc=subprocess.Popen(command,cwd='/tmp/csgrs-r19-trace',stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
                try:status=proc.wait(timeout=120)
                except subprocess.TimeoutExpired:
                    os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
            stages=[json.loads(line) for line in (record/(stem+'.stdout')).read_text().splitlines()]
            result=next((s for s in stages if s['stage']=='complete'),None)
            rows.append({'name':name,'mode':mode,'operation':operation,'command':command,'status':status,
                         'seconds':time.monotonic()-start,'stages':stages})
            (record/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
            print('R19 CONTINUATION',variant,name,mode,operation,status,result,flush=True)
passed=all(r['status']==0 and any(s.get('consumer',{}).get('certainty')=='Exact' for s in r['stages']) for r in rows)
(record/'completion.json').write_text(json.dumps({'all_exact':passed,'rows':len(rows),'complete':True,
    'resource_contract':'120s/8GiB address space/64MiB output/2MiB worker stack. External containment, not an internal cumulative bound.'},indent=2)+'\n')
(raw/('latest-continuations-'+variant+'.json')).write_text(json.dumps({'record':str(record),'all_exact':passed},indent=2)+'\n')
print('R19 CONTINUATIONS COMPLETE',variant,passed,record,flush=True)
