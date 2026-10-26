from pathlib import Path
from collections import Counter
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw=Path(__file__).resolve().parent
builds={v:json.loads((raw/n).read_text()) for v,n in [('baseline','latest-baseline-build.json'),('candidate','latest-probe-candidate.json')]}
candidate=json.loads((raw/'latest-candidate-runtime.json').read_text())
assert json.loads(Path(builds['candidate']['sources']).read_text())['crates/hyperreal/src/computable/node/representation.rs']==candidate['sha256']
for build in builds.values():
    assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
record=raw/('precision-matrix-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
(record/'builds.json').write_text(json.dumps(builds,indent=2)+'\n')
brackets=json.loads((raw/'pi-brackets.json').read_text())
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
rows=[]
def run(folder,variant,mode,operation):
    stem='-'.join([variant,mode,operation])
    command=['/usr/bin/time','-v',builds[variant]['binary'],mode,str(folder),operation]
    start=time.monotonic()
    with (folder/(stem+'.stdout')).open('w') as out,(folder/(stem+'.stderr')).open('w') as err:
        proc=subprocess.Popen(command,cwd='/tmp/csgrs-r19-trace',stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
        try:status=proc.wait(timeout=120)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    stages=[json.loads(line) for line in (folder/(stem+'.stdout')).read_text().splitlines()]
    result=next((s for s in stages if s['stage']=='complete'),None)
    row={'fixture':folder.name,'variant':variant,'mode':mode,'operation':operation,'command':command,
         'status':status,'seconds':time.monotonic()-start,'result':result,'stages':stages}
    rows.append(row)
    with (record/'results.jsonl').open('a') as out:out.write(json.dumps(row)+'\n')
    return row
for bracket in brackets['rows']:
    for side in ['below','above']:
        for negative in [False,True]:
            n,d=bracket[side]
            if negative:n=str(-int(n))
            expected='Negative' if (side=='below')!=negative else 'Positive'
            name=f"cot-{bracket['bits']}-{side}-{'negative' if negative else 'positive'}"
            folder=record/name;folder.mkdir()
            fixture={'name':name,'kind':'cot','bits':bracket['bits'],'side':side,'negative_argument':negative,
                     'numerator':n,'denominator':d,'expected':expected}
            (folder/'fixture.json').write_text(json.dumps(fixture,indent=2)+'\n')
            emit=run(folder,'baseline','emit','sign')
            if not all((folder/('value.'+s)).exists() for s in ['json','cbor']):
                print('R19 MATRIX NO NATIVE WIRE',name,emit['result'],flush=True);continue
            (folder/'wire-digests.json').write_text(json.dumps({n:{'bytes':(folder/n).stat().st_size,
                'sha256':hashlib.sha256((folder/n).read_bytes()).hexdigest()} for n in ['value.json','value.cbor']},indent=2)+'\n')
            for variant in ['baseline','candidate']:
                for mode in ['native','json','cbor','value']:
                    for operation in ['sign','divide','orient']:
                        run(folder,variant,mode,operation)
            counts=Counter()
            for r in rows:
                if r['fixture']!=name or r['mode']=='emit':continue
                result=r['result'] or {}
                outcome=result.get('consumer',{}).get('outcome',result.get('problem','missing'))
                counts[r['variant']+':'+outcome]+=1
            print('R19 PRECISION',name,dict(counts),flush=True)
index={(r['fixture'],r['variant'],r['mode'],r['operation']):r for r in rows if r['mode']!='emit'}
regressions=[];improvements=0
for key,row in index.items():
    if key[1]!='baseline':continue
    other=index[(key[0],'candidate',key[2],key[3])]
    a=(row['result'] or {}).get('consumer',{})
    b=(other['result'] or {}).get('consumer',{})
    if a.get('certainty')=='Exact' and a!=b:regressions.append([key,row,other])
    if a.get('certainty')!='Exact' and b.get('certainty')=='Exact':improvements+=1
summary={'complete':True,'processes':len(rows),'baseline_exact_regressions':regressions,
         'new_exact_consumer_cells':improvements,'nonzero_processes':[r for r in rows if r['status']!=0],
         'resource_contract':'120s/8GiB address/64MiB output/2MiB worker stack per process; external containment only.',
         'timing_claim':'None; diagnostics can overlap main R18 validation.'}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(raw/'latest-precision-matrix.json').write_text(json.dumps({'record':str(record)},indent=2)+'\n')
print('R19 PRECISION MATRIX COMPLETE',record,'new exact',improvements,'regressions',len(regressions),flush=True)
