from pathlib import Path
import ast,json,statistics
s=Path(__file__).parent
def parse(name):
 timing={};alloc={};resources={}
 for line in (s/(name+'.log')).read_text().splitlines():
  if line.startswith('TIMING '):
   key,value=line[7:].split(' ns_per_operation=');timing[key]=ast.literal_eval(value)
  if line.startswith('| ') and not line.startswith('| Case'):
   v=[x.strip() for x in line.split('|')[1:-1]]
   if len(v)==8:alloc[v[0]+'/'+v[1]]=v[2:]
  if line.startswith('RESOURCE '):
   v=line.split();resources[v[1]]=v[2:]
 return dict(timing=timing,alloc=alloc,resources=resources)
runs={v:[parse(f'warm-{v}-{i}') for i in range(1,5)] for v in ['control','direct','macro']};base=runs['control'][0]
for group in runs.values():
 for r in group:assert r['alloc']==base['alloc'] and r['resources']==base['resources']
rows=[]
for k in base['timing']:
 row={'case':k};old=statistics.median(sum([r['timing'][k] for r in runs['control']],[]));row['control_ns']=old
 for variant in ['direct','macro']:
  new=statistics.median(sum([r['timing'][k] for r in runs[variant]],[]));row[variant+'_ns']=new;row[variant+'_ratio']=new/old
 rows.append(row)
(s/'warm-comparison.json').write_text(json.dumps({'scope':'Four balanced process-order runs per variant; CPU 0 with identical two-second busy warm-up before each exec, adaptive schedutil governor unchanged. 124 samples (31x8 per run) per row/variant, all outputs and destruction included. Allocation and resource rows identical. Earlier unwarmed adverse runs retained, not discarded. Not a cold-start or universal performance claim.','rows':rows},indent=2)+'\n');print(json.dumps(rows,indent=2))
