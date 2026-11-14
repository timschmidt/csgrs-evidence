from pathlib import Path
import json,re
s=Path(__file__).parent;rows={}
for file in (s/'default-criterion').rglob('new/benchmark.json'):
 relative=file.relative_to(s/'default-criterion');trial=int(relative.parts[0]);binary=relative.parts[1];info=json.loads(file.read_text());key=binary+'/'+info['full_id'];est=json.loads((file.parent/'estimates.json').read_text())['mean'];samples=json.loads((file.parent/'sample.json').read_text());assert len(samples['times'])==20
 rows.setdefault(key,{})[trial]=est
summary=[]
for name,measurements in sorted(rows.items()):
 assert set(measurements)==set(range(6)),(name,measurements)
 baseline=[measurements[i]['confidence_interval'] for i in [0,5]];row=dict(name=name,measurements=measurements)
 for variant,trials in [('factor',[1,4]),('candidate',[2,3])]:
  cis=[measurements[i]['confidence_interval'] for i in trials];row[variant+'_adverse_separation']=min(x['lower_bound'] for x in cis)>max(x['upper_bound'] for x in baseline);row[variant+'_mean_ratio']=sum(measurements[i]['point_estimate'] for i in trials)/sum(measurements[i]['point_estimate'] for i in [0,5])
 summary.append(row)
manual=[]
for trial,variant in enumerate(['baseline','factor','candidate','candidate','factor','baseline']):
 text=(s/f'timing-{trial}-{variant}-adaptive_taylor.log').read_text();values=re.findall(r'^(\S+): iterations=(\d+) total_ns=(\d+) ns_per_operation=(\d+)',text,re.M);assert len(values)==4
 manual.append(dict(trial=trial,variant=variant,rows=values))
(s/'default-timing-analysis.json').write_text(json.dumps(dict(criterion_rows=summary,manual_rows=manual,screen='both variant lower mean 95% bounds exceed both baseline upper mean bounds; observational screen, not family-wise significance'),indent=2)+'\n')
print('criterion rows',len(summary))
for r in summary:
 if r['factor_adverse_separation'] or r['candidate_adverse_separation']:print(r['name'],'factor',round(r['factor_mean_ratio'],5),r['factor_adverse_separation'],'candidate',round(r['candidate_mean_ratio'],5),r['candidate_adverse_separation'])
print('manual',manual)
