from pathlib import Path
import json,re,ast,statistics,hashlib
out=Path(__file__).parent;s=(out/'cost-qualified.log').read_text();rows=[]
for line in s.splitlines():
 if line.startswith('TIMING '):
  name,values=line[7:].split(' ns_per_operation=');values=ast.literal_eval(values)
  rows.append(dict(case=name,samples=len(values),iterations_per_sample=8,median_ns=statistics.median(values),min_ns=min(values),max_ns=max(values)))
alloc=[]
for line in s.splitlines():
 if line.startswith('| ') and not line.startswith('| Case'):
  fields=[v.strip() for v in line.split('|')[1:-1]]
  if len(fields)==8:
   alloc.append(dict(case=fields[0],operation=fields[1],allocations=float(fields[2]),frees=float(fields[3]),bytes=float(fields[4]),reallocations=float(fields[5]),peak=int(fields[6]),live=int(fields[7])))
assert len(rows)==42 and len(alloc)==126
assert all(r['live']==0 for r in alloc)
resource=[]
for line in s.splitlines():
 m=re.match(r'RESOURCE (\S+) graph=(\d+) arithmetic=(\d+) output=(.*)',line)
 if m:
  name,gb,db,output=m.groups();resource.append(dict(case=name,graph_work=int(gb),arithmetic_work=int(db),output=output))
assert len(resource)==42
result=dict(scope='Absolute warm completed image/output-check/drop workloads, no speedup or validated-flow claim. Preparation and source compilation excluded. Exact rational constants only. 8 warmups and 32 allocation iterations; 31 timing samples of 8 iterations; CPU 0. 16,384-bit per-stage arithmetic reservation, 1e12 arithmetic work; 100,000 graph entries and 1e6 graph work. Neither budget bounds Hyperreal refinement or total heap bytes.',timings=rows,allocations=alloc,resources=resource)
(out/'cost.json').write_text(json.dumps(result,indent=2)+'\n')
print('cases',len(rows),'median_ns_range',min(r['median_ns'] for r in rows),max(r['median_ns'] for r in rows))
print('peak_max',max(r['peak'] for r in alloc),'graph_max',max(r['graph_work'] for r in resource),'arithmetic_max',max(r['arithmetic_work'] for r in resource))
for r in alloc:
 if r['case'].startswith('degree_128') and r['operation']=='evaluate':print(r)
