from pathlib import Path
import json,re,math,statistics
p=Path(__file__).resolve().parent/'callgrind-controls';target='hypercurve::bezier_region::offset_joins::exact_retained_parallel_tangent_cross_and_dot_vector';rows=[]
for f in sorted(p.glob('*.callgrind')):
 lines=f.read_text().splitlines();names={}
 for line in lines:
  m=re.match(r'(?:c)?fn=\((\d+)\) (.*)',line)
  if m:names[m[1]]=m[2]
 ids={i for i,n in names.items() if n==target};current=None;calls=0
 for line in lines:
  m=re.match(r'cfn=\((\d+)\)',line)
  if m:current=m[1]
  if line.startswith('fn='):current=None
  if line.startswith('calls=') and current in ids:calls+=int(line.split('=',1)[1].split()[0])
 rows.append({'file':f.name,'ir':int(next(line.split(':',1)[1] for line in lines if line.startswith('summary:'))),'joint_tangent_calls':calls})
summary=[]
for kind,policy in [(0,'approximate'),(2,'strict'),(3,'strict')]:
 a=[next(r for r in rows if r['file']==f'{i}-{kind}-{policy}-baseline.callgrind') for i in range(3)];b=[next(r for r in rows if r['file']==f'{i}-{kind}-{policy}-candidate.callgrind') for i in range(3)];ratios=[y['ir']/x['ir'] for x,y in zip(a,b)];summary.append({'kind':kind,'policy':policy,'ir_ratios':ratios,'geomean_ratio':math.exp(statistics.mean(map(math.log,ratios))),'baseline_joint_calls':[x['joint_tangent_calls'] for x in a],'candidate_joint_calls':[x['joint_tangent_calls'] for x in b]})
result={'rows':rows,'summary':summary,'call_scope':'20 stroke plus continuation samples per process; counts from call edges to the exact retained-parallel/vector joint helper','limitation':'Whole-process instruction counts include fixture construction, validation, JSON timing-field serialization and teardown; process hash/cache/layout variation remains. They are not native elapsed timings.'};(p/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(summary,indent=2))
