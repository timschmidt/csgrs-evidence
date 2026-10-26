from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time
from runtime_manifest import assert_runtime
raw=Path(__file__).resolve().parent
builds={v:json.loads((raw/n).read_text()) for v,n in [('baseline','latest-baseline-build.json'),('candidate','latest-probe-candidate.json')]}
for variant,build in builds.items():
    assert_runtime(json.loads(Path(build['sources']).read_text()),variant)
    assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
record=raw/f'boundary-matrix-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
(record/'runtime_manifest.py').write_bytes((raw/'runtime_manifest.py').read_bytes())
(record/'builds.json').write_text(json.dumps(builds,indent=2)+'\n')
def header(major,n):
    assert n>=0
    if n<24:return bytes([major*32+n])
    for width,tag in [(1,24),(2,25),(4,26),(8,27)]:
        if n<1<<(8*width):return bytes([major*32+tag])+n.to_bytes(width,'big')
    raise ValueError('fixture integer exceeds encoder domain')
def cbor(value):
    if isinstance(value,int):return header(0,value) if value>=0 else header(1,-1-value)
    if isinstance(value,str):
        data=value.encode();return header(3,len(data))+data
    if isinstance(value,list):return header(4,len(value))+b''.join(map(cbor,value))
    if isinstance(value,dict):return header(5,len(value))+b''.join(cbor(k)+cbor(v) for k,v in value.items())
    raise ValueError(type(value))
def node(kind,arg):return {'internal':{kind:arg}}
one={'sign':1,'numerator':[1],'denominator':[1]}
argument=node('Offset',[node('Add',[node('Ratio',one),node('Constant','Pi')]),-2147483648])
cases=[]
for negative in [False,True]:
    arg=node('Negate',argument) if negative else argument
    for kind in ['PrescaledSin','PrescaledCos','PrescaledTan','PrescaledCot']:
        for reciprocal in [False,True]:
            image=node(kind,arg);graph=node('Inverse',image) if reciprocal else image
            expected='Negative' if negative and kind!='PrescaledCos' else 'Positive'
            cases.append((f'{kind}-{negative}-{reciprocal}',graph,expected))
cases.append(('inverse-rational-extreme-shift',node('Inverse',node('Offset',[node('Ratio',one),-2147483648])),'Positive'))
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(512<<20,512<<20));resource.setrlimit(resource.RLIMIT_FSIZE,(16<<20,16<<20));resource.setrlimit(resource.RLIMIT_CORE,(0,0))
def exact(row,expected):
    return row['status']==0 and any(s.get('stage')=='complete' and s.get('admission')=='Ok' and s.get('consumer')=={'outcome':'Decided','certainty':'Exact','sign':expected} for s in row['stages']) and row['stages'][-1].get('stage')=='dropped'
rows=[];regressions=[];candidate_failures=[];baseline_exact=0;candidate_exact=0
for name,graph,expected in cases:
    folder=record/name;folder.mkdir()
    (folder/'fixture.json').write_text(json.dumps({'name':name,'kind':'wire','expected':expected,'independent_oracle':'3<pi<4 implies0<2^MIN*(1+pi)<1. Sine/tangent/cotangent have argument sign; cosine is positive; reciprocals preserve nonzero signs; checked reciprocal product is exactly1.'},indent=2)+'\n')
    wire={'rational':one,'class':'Irrational','computable':graph}
    (folder/'value.json').write_text(json.dumps(wire,separators=(',',':')))
    (folder/'value.cbor').write_bytes(cbor(wire))
    hashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [folder/'value.json',folder/'value.cbor']}
    for mode in ['json','cbor','value']:
        for operation in ['sign','divide','orient']:
            target='Zero' if operation=='divide' else expected;pair={}
            for variant in ['baseline','candidate']:
                prefix=folder/f'{variant}-{mode}-{operation}';cmd=['/usr/bin/time','-v',builds[variant]['binary'],mode,str(folder),operation];start=time.monotonic()
                with prefix.with_suffix('.stdout').open('x') as out,prefix.with_suffix('.stderr').open('x') as err:
                    p=subprocess.Popen(cmd,stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
                    try:status=p.wait(timeout=15)
                    except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
                stages=[json.loads(line) for line in prefix.with_suffix('.stdout').read_text().splitlines()]
                row={'fixture':name,'mode':mode,'operation':operation,'variant':variant,'command':cmd,'status':status,'seconds':time.monotonic()-start,'stages':stages,'input_sha256':hashes}
                rows.append(row);pair[variant]=exact(row,target)
                with (record/'results.jsonl').open('a') as out:out.write(json.dumps(row)+'\n')
            baseline_exact+=pair['baseline'];candidate_exact+=pair['candidate']
            if pair['baseline'] and not pair['candidate']:regressions.append([name,mode,operation])
            if not pair['candidate']:candidate_failures.append([name,mode,operation])
    assert hashes=={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [folder/'value.json',folder/'value.cbor']}
    print('R19 BOUNDARY MATRIX',name,'complete',flush=True)
result={'record':str(record),'complete':True,'passed':not regressions and not candidate_failures,'processes':len(rows),'cases':len(cases),'baseline_exact':baseline_exact,'candidate_exact':candidate_exact,'new_exact':candidate_exact-baseline_exact,'regressions':regressions,'candidate_failures':candidate_failures,'containment':'15s/512MiBaddress/16MiBoutput/2MiBworkerstack/no core per fresh process','scope':'Functional public JSON/CBOR/Value import and STRICT sign, checked division identity, orientation and clean drop. No latency ratio; input CBOR generated independently from the same JSON value tree.'}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n');(raw/'latest-boundary-matrix.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result),flush=True)
raise SystemExit(0 if result['passed'] else 1)
