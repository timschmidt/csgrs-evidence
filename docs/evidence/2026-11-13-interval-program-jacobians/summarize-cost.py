from pathlib import Path
import re,json,statistics,ast
out=Path(__file__).parent;s=(out/'cost-final.log').read_text();timing=[];alloc=[];resources=[]
for line in s.splitlines():
 if line.startswith('TIMING '):
  case,samples=line[7:].split(' ns_per_operation=');samples=ast.literal_eval(samples);timing.append(dict(case=case,samples=31,iterations_per_sample=8,median_ns=statistics.median(samples),min_ns=min(samples),max_ns=max(samples)))
 if line.startswith('| ') and not line.startswith('| Case'):
  v=[c.strip() for c in line.split('|')[1:-1]]
  if len(v)==8:alloc.append(dict(case=v[0],operation=v[1],allocations=float(v[2]),frees=float(v[3]),bytes=float(v[4]),reallocations=float(v[5]),peak=int(v[6]),live=int(v[7])))
 m=re.match(r'RESOURCE (\S+) source_nodes=(\d+) generated_nodes=(\d+) graph_work=(\d+)',line)
 if m:
  case,n,d,w=m.groups();resources.append(dict(case=case,source_nodes=int(n),generated_nodes=int(d),graph_work=int(w)))
assert len(timing)==16 and len(alloc)==28 and len(resources)==4
assert all(row['live']==0 for row in alloc)
result=dict(scope='Absolute warm completed construction/replay/evaluation and destruction probe, no matched speedup claim. Preparation excluded; replay includes definition clone and validation. 8 allocation warmups then 32 iterations; timing 31x8 iterations; CPU 0; 1e6 graph entries, 1e8 graph work; interval precision -32, 16384 bits/stage and 1e12 native work. Hyperreal scalar payload/refinement accounting remains separate.',timings=timing,allocations=alloc,resources=resources)
(out/'cost.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
