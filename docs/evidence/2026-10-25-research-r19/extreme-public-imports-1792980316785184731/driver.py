from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw=Path(__file__).resolve().parent
record=raw/('extreme-public-imports-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
builds={v:json.loads((raw/n).read_text()) for v,n in [('baseline','latest-baseline-build.json'),('candidate','latest-probe-candidate.json')]}
candidate=json.loads((raw/'latest-candidate-runtime.json').read_text())
assert json.loads(Path(builds['candidate']['sources']).read_text())['crates/hyperreal/src/computable/node/representation.rs']==candidate['sha256']
for build in builds.values():assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
(record/'builds.json').write_text(json.dumps(builds,indent=2)+'\n')
def node(kind,arg):return {'internal':{kind:arg}}
one={'sign':1,'numerator':[1],'denominator':[1]}
q=node('Ratio',one);pi=node('Constant','Pi')
argument=node('Offset',[node('Add',[q,pi]),-2147483648])
graphs={
 'inverse-sine-extreme-shift':node('Inverse',node('PrescaledSin',argument)),
 'cotangent-extreme-shift':node('PrescaledCot',argument),
 'tangent-extreme-shift':node('PrescaledTan',argument),
 'inverse-rational-extreme-shift':node('Inverse',node('Offset',[q,-2147483648])),
}
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(512*1024**2,512*1024**2))
    resource.setrlimit(resource.RLIMIT_FSIZE,(16*1024**2,16*1024**2))
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
rows=[]
for name,graph in graphs.items():
    folder=record/name;folder.mkdir()
    (folder/'fixture.json').write_text(json.dumps({'name':name,'kind':'wire','expected':'Positive',
        'independent_oracle':'0<2^(-2147483648)*(1+pi)<1 from3<pi<4; sine,tangent,cotangent and their indicated reciprocals are strictly positive. The rational inverse is positive.'},indent=2)+'\n')
    wire=json.dumps({'rational':one,'class':'Irrational','computable':graph},separators=(',',':'))
    (folder/'value.json').write_text(wire)
    for variant in ['baseline','candidate']:
        command=['/usr/bin/time','-v',builds[variant]['binary'],'json',str(folder),'sign']
        start=time.monotonic()
        with (folder/(variant+'.stdout')).open('w') as out,(folder/(variant+'.stderr')).open('w') as err:
            p=subprocess.Popen(command,cwd='/tmp/csgrs-r19-trace',stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
            try:status=p.wait(timeout=15)
            except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
        stages=[json.loads(line) for line in (folder/(variant+'.stdout')).read_text().splitlines()]
        row={'fixture':name,'variant':variant,'command':command,'status':status,'seconds':time.monotonic()-start,'stages':stages,'input_bytes':len(wire),'input_sha256':hashlib.sha256(wire.encode()).hexdigest()}
        rows.append(row);(record/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
        print('R19 EXTREME PUBLIC',name,variant,status,stages[-1:] or None,flush=True)
(record/'completion.json').write_text(json.dumps({'complete':True,'processes':len(rows),
    'scope':'Target-revision public JSON import and strict continuation audit. Functional/resource diagnostics only; no latency ratio.',
    'containment':'15s/512MiBaddress/16MiBoutput/no core/2MiBworkerstack per process. Does not establish internal bounds.'},indent=2)+'\n')
(raw/'latest-extreme-public-imports.json').write_text(json.dumps({'record':str(record)},indent=2)+'\n')
print('R19 EXTREME PUBLIC AUDIT COMPLETE',record,flush=True)
