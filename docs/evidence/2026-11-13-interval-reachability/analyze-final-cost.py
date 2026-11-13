from pathlib import Path
import json,re,math,random,statistics
p=Path(__file__).parent;runs=json.loads((p/'native-pair-runs.json').read_text());assert len(runs)==24 and all(r['returncode']==0 for r in runs)
cases={};allocations=[]
for run in runs:
 lines=(p/f'native-pair-{run["pair"]:02}-{run["variant"]}.log').read_text().splitlines()
 allocations.append([l for l in lines if l.startswith('|') or l.startswith('RESOURCE')])
 for line in lines:
  m=re.match(r'TIMING (\S+) ns_per_operation=(.*)',line)
  if m:cases.setdefault(m[1],{}).setdefault(run['pair'],{})[run['variant']]=statistics.median(json.loads(m[2]))
assert all(a==allocations[0] for a in allocations)
rng=random.Random(7421);indices=[[rng.randrange(12) for _ in range(12)] for _ in range(20000)];rows=[]
for case,pairs in cases.items():
 assert len(pairs)==12
 logs=[math.log(r['native']/r['baseline']) for _,r in sorted(pairs.items())]
 samples=sorted(math.exp(statistics.mean(logs[i] for i in trial)) for trial in indices)
 interval=[samples[500],samples[19499]]
 rows.append(dict(case=case,paired_run_medians=[dict(pair=i,**r) for i,r in sorted(pairs.items())],geometric_mean_paired_ratio=math.exp(statistics.mean(logs)),bootstrap_95_interval=interval,interval_above_one=interval[0]>1))
(p/'native-pair-comparison.json').write_text(json.dumps(dict(pairs=12,bootstrap_samples=20000,seed=7421,unit='one paired run, each summarized by its 31 eight-operation sample medians',all_cases_retained=True,resource_and_allocation_rows_identical=True,rows=rows),indent=2)+'\n')
for r in rows:print(r['case'],round(r['geometric_mean_paired_ratio'],6),[round(v,6) for v in r['bootstrap_95_interval']],r['interval_above_one'])
cover_runs=json.loads((p/'cover-cost-runs.json').read_text());assert len(cover_runs)==2 and all(r['returncode']==0 for r in cover_runs)
resources=[];allocations=[];times={}
for run in cover_runs:
 lines=(p/f'cover-cost-{run["trial"]}.log').read_text().splitlines();resources.append([re.sub(r' cold_ns=\d+','',l) for l in lines if l.startswith(('COMPLETE','STOPPED'))]);allocations.append([l for l in lines if l.startswith('|')])
 for line in lines:
  m=re.match(r'TIMING (\S+) iterations=(\d+) ns_per_operation=(.*)',line)
  if m:times.setdefault(m[1],[]).append(dict(trial=run['trial'],iterations=int(m[2]),samples=len(json.loads(m[3])),median_ns=statistics.median(json.loads(m[3]))))
assert resources[0]==resources[1] and allocations[0]==allocations[1]
(p/'cover-cost-comparison.json').write_text(json.dumps(dict(completed_cases=6,stopped_resource_controls=12,resource_rows=resources[0],allocation_rows=allocations[0],resource_and_allocation_rows_identical=True,timing=times,claim='New workload absolute costs. Not a speedup or same-workload size comparison to legacy evolution.'),indent=2)+'\n')
print('\n'.join(resources[0]));print(json.dumps(times,indent=2))
