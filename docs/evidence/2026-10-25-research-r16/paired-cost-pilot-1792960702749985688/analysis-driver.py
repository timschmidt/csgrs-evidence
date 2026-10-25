from pathlib import Path
import json,math,statistics,sys
import numpy as np
from scipy.stats import t
record=Path(sys.argv[1]);meta=json.loads((record/'metadata.json').read_text());assert meta['complete']
(record/'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
n=meta['pairs'];rows={};latency=[];rss={'baseline':0,'candidate':0};trace={}
for kind in range(12):
 for policy in ['strict','approximate']:
  for pair in range(n):
   for variant in ['baseline','candidate']:
    p=record/f'pair-{pair:02}/{variant}-{kind:02}-{policy}'
    rows[variant,kind,policy,pair]=[json.loads(s) for s in p.with_suffix('.jsonl').read_text().splitlines()]
    stderr=p.with_suffix('.stderr').read_text()
    peak=int(next(s.split(':',1)[1].strip() for s in stderr.splitlines() if 'Maximum resident set size (kbytes)' in s));rss[variant]=max(rss[variant],peak)
   fields=['kind','policy','sample','iterations','certainty','sign','checksum']
   assert [{k:r[k] for k in fields} for r in rows['baseline',kind,policy,pair]]==[{k:r[k] for k in fields} for r in rows['candidate',kind,policy,pair]]
  trace[f'{kind}-{policy}']={v:rows[v,kind,policy,0][-1]['quotient_zero_hits'] for v in ['baseline','candidate']}
  if n>1:
   for phase in ['first','warm']:
    def observations(v):
     return [rows[v,kind,policy,p][0]['ns'] if phase=='first' else statistics.median(r['ns']/r['iterations'] for r in rows[v,kind,policy,p][1:]) for p in range(n)]
    a=observations('baseline');b=observations('candidate');logs=np.log(np.array(b)/np.array(a));center=float(logs.mean());sd=float(logs.std(ddof=1));se=sd/math.sqrt(n)
    def interval(level):
     q=float(t.ppf(level,n-1));return [math.exp(center-q*se),math.exp(center+q*se)]
    latency.append({'case':[kind,policy],'phase':phase,'ratio':math.exp(center),'ci95':interval(.975),'simultaneous_ci95':interval(1-.05/(2*48)),'paired_log_sd':sd,'baseline_median_ns':statistics.median(a),'candidate_median_ns':statistics.median(b),'baseline_process_ns':a,'candidate_process_ns':b})
summary={k:meta[k] for k in ['purpose','pairs','batches','total_certified_queries','exact_outcome_row_pairs']};summary['max_process_rss_kib']=rss
summary['probe_sizes']={v:{'file_bytes':d['bytes'],'text_bytes':int(next(s.split()[1] for s in d['sections'].splitlines() if s.split() and s.split()[0]=='.text')),'sha256':d['sha256']} for v,d in meta['builds'].items()}
if latency:
 compact=lambda r:{k:v for k,v in r.items() if not k.endswith('process_ns')}
 summary.update(protected_metrics=len(latency),literal_nonregression=all(r['simultaneous_ci95'][1]<=1 for r in latency),unproved_cells=[compact(r) for r in latency if r['simultaneous_ci95'][1]>1],marginal_adverse=[compact(r) for r in latency if r['ci95'][0]>1],simultaneous_adverse=[compact(r) for r in latency if r['simultaneous_ci95'][0]>1])
 (record/'latency.json').write_text(json.dumps(latency,indent=2)+'\n')
else:summary['route_counts']=trace
(record/'analysis.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k not in ['unproved_cells','marginal_adverse','simultaneous_adverse','route_counts']},indent=2))
if latency:print('ADVERSE',len(summary['marginal_adverse']),'marginal',len(summary['simultaneous_adverse']),'simultaneous; UNPROVED',len(summary['unproved_cells']))
