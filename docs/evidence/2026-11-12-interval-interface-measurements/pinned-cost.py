import os,subprocess,csv,json,statistics,random
from pathlib import Path
root=Path('/tmp/interval-refactor/interface-measurements');bins=Path('/tmp/interval-refactor/interface-measurement-binaries')
allowed=sorted(os.sched_getaffinity(0));cpu=allowed[0];os.sched_setaffinity(0,{cpu});rows=[]
for tag in ['adopt-baseline','adopt-final']:
 with (root/('pinned-warmup-'+tag+'.csv')).open('w') as f:subprocess.run([str(bins/(tag+'-cost'))],stdout=f,check=True)
for repeat in range(20):
 for tag in (['adopt-baseline','adopt-final'] if repeat%2==0 else ['adopt-final','adopt-baseline']):
  file=f'pinned-{repeat}-{tag}.csv'
  with (root/file).open('w') as f:subprocess.run([str(bins/(tag+'-cost'))],stdout=f,check=True)
  data=list(csv.DictReader((root/file).open()));assert len(data)==160
  for row in data:
   assert row['completed']=='512' and row['allocation_calls']==row['allocated_bytes']=='0'
   rows.append(row|{'revision':tag,'repeat':repeat})
out=[];rng=random.Random(20261112)
for fixture in range(8):
 paired=[]
 for repeat in range(20):
  def median(tag):return statistics.median(int(r['elapsed_ns'])/512 for r in rows if r['revision']==tag and r['repeat']==repeat and r['fixture']==str(fixture))
  a,b=median('adopt-baseline'),median('adopt-final');paired.append({'baseline_ns':a,'final_ns':b,'ratio':b/a})
 ratios=[r['ratio'] for r in paired];bootstrap=sorted(statistics.median(rng.choices(ratios,k=20)) for _ in range(10000))
 out.append({'fixture':fixture,'samples_per_revision':400,'median_paired_ratio':statistics.median(ratios),'bootstrap_median_ratio_95_percentile':[bootstrap[250],bootstrap[9749]],'pairs':paired})
(root/'pinned-cost-summary.json').write_text(json.dumps({'cpu':cpu,'original_affinity':allowed,'rounds':20,'seed':20261112,'conditions':'one fixed allowed CPU, two full warmup runs; no frequency/governor control; shared host','results':out},indent=2)+'\n')
for r in out:print(r['fixture'],r['median_paired_ratio'],r['bootstrap_median_ratio_95_percentile'])
