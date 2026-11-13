from pathlib import Path
import json,re,statistics
out=Path('/tmp/interval-refactor/dynamics-feed-join');data={}
for label in ['baseline','candidate']:
 data[label]={}
 for p in (out/(label+'-criterion')).rglob('estimates.json'):
  data[label][str(p.parent.relative_to(out/(label+'-criterion')))]=json.loads(p.read_text())['mean']
assert set(data['baseline'])==set(data['candidate']);assert len(data['baseline'])==194
rows=[]
for name,b in data['baseline'].items():
 c=data['candidate'][name];rows.append(dict(name=name,baseline_ns=b['point_estimate'],candidate_ns=c['point_estimate'],ratio=c['point_estimate']/b['point_estimate'],baseline_ci=b['confidence_interval'],candidate_ci=c['confidence_interval']))
rows.sort(key=lambda r:r['name']);(out/'owner-benchmark-summary.json').write_text(json.dumps(rows,indent=2)+'\n')
print('cases',len(rows),'median',statistics.median(r['ratio'] for r in rows),'range',min(r['ratio'] for r in rows),max(r['ratio'] for r in rows))
for r in rows:
 if any(s in r['name'] for s in ['jerk','lookahead','parse_256']):print(r['name'],round(r['baseline_ns'],2),round(r['candidate_ns'],2),round(r['ratio'],3))
