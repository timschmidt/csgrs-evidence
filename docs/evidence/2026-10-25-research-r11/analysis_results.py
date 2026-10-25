from pathlib import Path
import json,statistics,hashlib
p=Path(__file__).resolve().parent
pairs=json.loads((p/'paired-manifest.json').read_text())['pairs'];out=[]
for mode in ['mixed','linear']:
 for count in [1,2,8,32]:
  rows=[(p/'rows'/f'{v}-{mode}-{count}-{pair}.json').read_bytes() for v in ['baseline','candidate'] for pair in range(pairs)]
  assert all(r==rows[0] for r in rows),(mode,count,'exact rows differ')
  entry={'mode':mode,'count':count,'identical_exact_bytes':len(rows[0]),'exact_sha256':hashlib.sha256(rows[0]).hexdigest()}
  all_samples={}
  for v in ['baseline','candidate']:
   samples=[dict(json.loads(line),pair=pair) for pair in range(pairs) for line in (p/f'{v}-{mode}-{count}-{pair}.jsonl').read_text().splitlines()]
   assert len(samples)==5*pairs
   all_samples[v]=samples
   entry[v]={cache:{key:statistics.median(s[key] for s in samples if (s['sample']==0)==(cache=='cold')) for key in samples[0] if key not in ['mode','components','sample','checksum','pair']} for cache in ['cold','warm']}
   entry[v]['checksums']=sorted(set(s['checksum'] for s in samples))
  assert entry['baseline']['checksums']==entry['candidate']['checksums']
  for key in ['boolean_bytes','boolean_calls','peak_live_growth']:
   entry[key+'_identical_every_sample']=all(a[key]==b[key] for a,b in zip(all_samples['baseline'],all_samples['candidate']))
  for key in ['boolean_ns','ten_queries_ns']:
   ratios=[]
   for pair in range(pairs):
    medians=[statistics.median(s[key] for s in all_samples[v] if s['sample']!=0 and s['pair']==pair) for v in ['baseline','candidate']]
    ratios.append(medians[1]/medians[0])
   entry[key+'_paired_warm_ratios']=ratios
   entry[key+'_median_paired_ratio']=statistics.median(ratios)
  out.append(entry)
  print(mode,count,'Boolean us',*[round(entry[v]['warm']['boolean_ns']/1000,2) for v in ['baseline','candidate']],'; ten queries us',*[round(entry[v]['warm']['ten_queries_ns']/1000,2) for v in ['baseline','candidate']],'; Boolean bytes',*[entry[v]['warm']['boolean_bytes'] for v in ['baseline','candidate']],'; query bytes',*[entry[v]['warm']['query_bytes'] for v in ['baseline','candidate']],'; result live',*[entry[v]['warm']['result_live_growth'] for v in ['baseline','candidate']])
(p/'paired-summary.json').write_text(json.dumps(out,indent=2)+'\n')
