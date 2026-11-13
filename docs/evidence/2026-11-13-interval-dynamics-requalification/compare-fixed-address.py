from pathlib import Path
import json,statistics
p=Path(__file__).parent;rows=[]
for name in json.loads((p/'fixed-address-selection.json').read_text())['names']:
 ds=[json.loads((p/f'fixed-address-{i}-{v}-criterion'/name/'estimates.json').read_text())['mean'] for i,v in enumerate(['baseline','candidate','candidate','baseline'])]
 c=[ds[i]['point_estimate'] for i in [1,2]];b=[ds[i]['point_estimate'] for i in [0,3]]
 rows.append(dict(case=name,baseline=b,candidate=c,ratio=statistics.mean(c)/statistics.mean(b),ranges_separated=min(c)>max(b),confidence_ranges_separated=min(ds[i]['confidence_interval']['lower_bound'] for i in [1,2])>max(ds[i]['confidence_interval']['upper_bound'] for i in [0,3]),estimates=ds))
(p/'fixed-address-comparison.json').write_text(json.dumps(rows,indent=2)+'\n')
print('cases',len(rows),'median',statistics.median(r['ratio'] for r in rows),'range',min(r['ratio'] for r in rows),max(r['ratio'] for r in rows),'slower',sum(r['ratio']>1 for r in rows),'separated',sum(r['confidence_ranges_separated'] for r in rows))
for r in sorted(rows,key=lambda r:r['ratio'],reverse=True)[:35]:print(r['case'],round(r['ratio'],5),r['confidence_ranges_separated'])
