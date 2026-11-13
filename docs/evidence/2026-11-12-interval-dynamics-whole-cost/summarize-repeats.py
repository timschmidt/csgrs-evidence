from pathlib import Path
import json,statistics,sys
out=Path('/tmp/interval-refactor/dynamics-whole-cost');prefix=sys.argv[1];data={}
for i in range(4):data[i]={str(p.parent.relative_to(out/f'{prefix}-{i}-criterion')):json.loads(p.read_text())['mean'] for p in (out/f'{prefix}-{i}-criterion').rglob('estimates.json')}
assert all(set(d)==set(data[0]) for d in data.values());rows=[]
for name in sorted(data[0]):
 b=[data[i][name]['point_estimate'] for i in [1,2]];c=[data[i][name]['point_estimate'] for i in [0,3]];rows.append(dict(name=name,baseline_ns=b,candidate_ns=c,mean_ratio=statistics.mean(c)/statistics.mean(b),estimates=[data[i][name] for i in range(4)]))
(out/(prefix+'-summary.json')).write_text(json.dumps(rows,indent=2)+'\n')
for r in rows:print(r['name'],round(r['mean_ratio'],4),*[round(n,2) for n in r['baseline_ns']+r['candidate_ns']])
