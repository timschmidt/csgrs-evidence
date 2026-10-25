from pathlib import Path
import json,math,random,statistics,hashlib
p=Path(__file__).resolve().parent;out=p/'paired'
manifest=json.loads((out/'manifest.json').read_text());assert manifest['status']=='completed'
random.seed(20261025);summary=[];all_rows=0
for kind,direction,policy in manifest['cases']:
 case=f'{kind}-{direction}-{policy}';data={}
 for variant in ['baseline','candidate']:
  data[variant]=[[json.loads(l) for l in (out/f'{pair:02}-{case}-{variant}.jsonl').read_text().splitlines()] for pair in range(manifest['pairs'])]
  assert all(len(run)==20 for run in data[variant]);all_rows+=sum(map(len,data[variant]))
 for a,b in zip(data['baseline'],data['candidate']):
  for x,y in zip(a,b):
   assert (x['status'],x['certainty'],x['output_size'],x['checksum'])==(y['status'],y['certainty'],y['output_size'],y['checksum'])
 for cache,indexes in [('cold',[0]),('warm',list(range(10,20)))]:
  row={'case':case,'cache':cache,'pairs':manifest['pairs'],'samples_per_variant':len(indexes)*manifest['pairs']}
  for metric in ['ns','continuation_ns','total_ns']:
   med={v:[statistics.median((run[i]['ns']+run[i]['continuation_ns']) if metric=='total_ns' else run[i][metric] for i in indexes) for run in runs] for v,runs in data.items()}
   ratios=[math.log(b/a) for a,b in zip(med['baseline'],med['candidate'])]
   bootstrap=sorted(math.exp(statistics.mean(random.choices(ratios,k=len(ratios)))) for _ in range(5000))
   row[metric]={'baseline_median':statistics.median(med['baseline']),'candidate_median':statistics.median(med['candidate']),'paired_geomean_ratio':math.exp(statistics.mean(ratios)),'paired_bootstrap_95_ci':[bootstrap[125],bootstrap[4874]]}
  for metric in ['bytes','calls','peak_live_growth','result_live_growth','continuation_bytes','continuation_calls','retained_after_drop']:
   vals={v:[run[i][metric] for run in runs for i in indexes] for v,runs in data.items()}
   row[metric]={v:{'median':statistics.median(values),'min':min(values),'max':max(values)} for v,values in vals.items()}
   row[metric]['paired_equal']=all(a==b for a,b in zip(vals['baseline'],vals['candidate']))
  summary.append(row)
result={'completed_certified_rows':all_rows,'exact_case_pairs':manifest['pairs']*len(manifest['cases']),'bootstrap_seed':20261025,'bootstrap_resamples':5000,'rows':summary}
(p/'paired-summary.json').write_text(json.dumps(result,indent=2)+'\n')
for r in summary:
 if r['cache']=='warm':
  t=r['ns'];b=r['bytes'];total=r['total_ns'];print(r['case'],'stroke ns',round(t['baseline_median']),round(t['candidate_median']),'ratio',round(t['paired_geomean_ratio'],4),'CI',*[round(x,4) for x in t['paired_bootstrap_95_ci']],'bytes',b['baseline']['median'],b['candidate']['median'],'total ratio',round(total['paired_geomean_ratio'],4))
print('Completed certified rows',all_rows)
