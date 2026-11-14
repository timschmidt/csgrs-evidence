from pathlib import Path
import json,re
s=Path(__file__).parent;rows={}
for file in (s/'typed-controlled-criterion').rglob('new/benchmark.json'):
 relative=file.relative_to(s/'typed-controlled-criterion');trial=int(relative.parts[0]);binary=relative.parts[1];info=json.loads(file.read_text());key=binary+'/'+info['full_id'];est=json.loads((file.parent/'estimates.json').read_text())['mean'];samples=json.loads((file.parent/'sample.json').read_text());assert len(samples['times'])==30
 rows.setdefault(key,{})[trial]=est
summary=[]
for name,measurements in sorted(rows.items()):
 assert set(measurements)==set(range(4)),(name,measurements)
 baseline=[measurements[i]['confidence_interval'] for i in [0,3]];row=dict(name=name,measurements=measurements)
 for variant,trials in [('candidate',[1,2])]:
  cis=[measurements[i]['confidence_interval'] for i in trials];row[variant+'_adverse_separation']=min(x['lower_bound'] for x in cis)>max(x['upper_bound'] for x in baseline);row[variant+'_mean_ratio']=sum(measurements[i]['point_estimate'] for i in trials)/sum(measurements[i]['point_estimate'] for i in [0,3])
 summary.append(row)
manual=[]
for trial,variant in enumerate(['baseline','candidate','candidate','baseline']):
 text=(s/f'typed-controlled-{trial}-{variant}-adaptive_taylor.log').read_text();values=re.findall(r'^(\S+): iterations=(\d+) total_ns=(\d+) ns_per_operation=(\d+)',text,re.M);assert len(values)==4
 manual.append(dict(trial=trial,variant=variant,rows=values))
(s/'typed-controlled-timing-analysis.json').write_text(json.dumps(dict(criterion_rows=summary,manual_rows=manual,screen='both variant lower mean 95% bounds exceed both baseline upper mean bounds; observational screen, not family-wise significance'),indent=2)+'\n')
print('criterion rows',len(summary))
for r in summary:
 if r['candidate_adverse_separation']:print(r['name'],'candidate',round(r['candidate_mean_ratio'],5),r['candidate_adverse_separation'])
print('manual',manual)
