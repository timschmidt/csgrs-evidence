from pathlib import Path
import hashlib,json,re,statistics,subprocess
s=Path('/tmp/interval-refactor/sdf-lipschitz')
art=Path('/mnt/development/.interval-refactor-build/sdf-lipschitz-artifacts')
data=json.loads((s/'matrix-artifact-summary.json').read_text())
for name in ['vector-default','vector-probe']:
    p=art/name
    symbols=subprocess.check_output(['readelf','-Ws',str(p)],text=True)
    (s/f'{name}-symbols.txt').write_text(symbols)
    sections=subprocess.check_output(['readelf','-SW',str(p)],text=True)
    (s/f'{name}-sections.txt').write_text(sections)
    intervals=[]
    for line in symbols.splitlines():
        f=line.split()
        if len(f)>=8 and f[3]=='FUNC' and f[6]!='UND' and int(f[2]):
            start=int(f[1],16);intervals.append((start,start+int(f[2])))
    merged=[]
    for a,b in sorted(intervals):
        if merged and a<=merged[-1][1]:merged[-1][1]=max(b,merged[-1][1])
        else:merged.append([a,b])
    data[name]=dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest(),function_union_bytes=sum(b-a for a,b in merged),intervals=merged)
(s/'artifact-summary.json').write_text(json.dumps(data,indent=2)+'\n')
for k,v in data.items():print(k,{a:b for a,b in v.items() if not isinstance(b,(dict,list))})
tests={}
for name in ['owner','default','vector-owner','vector-default','asan','asan-vector']:
    counts=[int(x) for x in re.findall(r'(\d+) passed; 0 failed;', (s/f'{name}.log').read_text())]
    tests[name]=dict(binary_counts=counts,raw_including_replay_children=sum(counts))
(s/'test-summary.json').write_text(json.dumps(tests,indent=2)+'\n');print(tests)
timings=[]
for i in range(4):
    cases={}
    for p in (s/'criterion-owner'/str(i)).rglob('new/estimates.json'):
        identity=json.loads((p.parent/'benchmark.json').read_text())['full_id']
        estimates=json.loads(p.read_text());entry=estimates.get('slope') or estimates['mean']
        cases[identity]=entry
    timings.append(cases)
assert all(set(t)==set(timings[0]) for t in timings) and len(timings[0])==46
results={}
for name in sorted(timings[0]):
    candidate=[timings[i][name] for i in [0,3]];baseline=[timings[i][name] for i in [1,2]]
    c=[x['point_estimate'] for x in candidate];b=[x['point_estimate'] for x in baseline]
    results[name]=dict(candidate=candidate,baseline=baseline,median_ratio=statistics.median(c)/statistics.median(b),candidate_lower_exceeds_baseline_upper=min(x['confidence_interval']['lower_bound'] for x in candidate)>max(x['confidence_interval']['upper_bound'] for x in baseline))
(s/'owner-comparison.json').write_text(json.dumps(results,indent=2)+'\n')
print('owner cases',len(results),'adverse separated',[(k,v['median_ratio']) for k,v in results.items() if v['candidate_lower_exceeds_baseline_upper']])
