from pathlib import Path
import json,math,random,statistics
p=Path(__file__).resolve().parent;out=p/'paired';manifest=json.loads((out/'manifest.json').read_text());assert manifest['status']=='completed'
random.seed(20261025);summary=[];all_rows=0;differences=[]
for kind,direction,policy in manifest['cases']:
 case=f'{kind}-{direction}-{policy}';data={v:[[json.loads(l) for l in (out/f'{pair:02}-{case}-{v}.jsonl').read_text().splitlines()] for pair in range(manifest['pairs'])] for v in ['baseline','candidate']}
 for pair,(a,b) in enumerate(zip(data['baseline'],data['candidate'])):
  assert len(a)==len(b)==20;all_rows+=40
  for x,y in zip(a,b):
   changed={k:[x[k],y[k]] for k in x if k!='ns' and x[k]!=y[k]}
   if changed:differences.append({'case':case,'pair':pair,'sample':x['sample'],'differences':changed})
 for cache,indexes in [('cold',[0]),('warm',range(10,20))]:
  med={v:[statistics.median(run[i]['ns'] for i in indexes) for run in runs] for v,runs in data.items()};ratios=[math.log(b/a) for a,b in zip(med['baseline'],med['candidate'])];boots=sorted(math.exp(statistics.mean(random.choices(ratios,k=len(ratios)))) for _ in range(5000))
  row={'case':case,'cache':cache,'baseline_median_ns':statistics.median(med['baseline']),'candidate_median_ns':statistics.median(med['candidate']),'paired_ratio':math.exp(statistics.mean(ratios)),'paired_bootstrap_95_ci':[boots[125],boots[4874]]}
  for metric in ['bytes','calls','peak_live_growth','result_live_growth','retained_after_drop']:
   row[metric]={v:{'median':statistics.median(run[i][metric] for run in runs for i in indexes),'min':min(run[i][metric] for run in runs for i in indexes),'max':max(run[i][metric] for run in runs for i in indexes)} for v,runs in data.items()}
  summary.append(row)
result={'completed_certified_rows':all_rows,'exact_case_pairs':manifest['pairs']*len(manifest['cases']),'non_timing_differences':differences,'bootstrap_seed':20261025,'bootstrap_resamples':5000,'rows':summary};(p/'paired-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print('Completed certified rows',all_rows,'Non-timing differences',len(differences))
for row in summary:
 if row['cache']=='warm':print(row['case'],round(row['paired_ratio'],4),*[round(x,4) for x in row['paired_bootstrap_95_ci']],row['bytes']['baseline']['median'],row['bytes']['candidate']['median'])
