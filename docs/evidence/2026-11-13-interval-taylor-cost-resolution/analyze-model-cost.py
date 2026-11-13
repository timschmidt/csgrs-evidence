from pathlib import Path
import re,json,statistics
p=Path(__file__).parent;runs=json.loads((p/'model-cost-runs.json').read_text());assert len(runs)==2 and all(r['returncode']==0 for r in runs)
resources=[];allocations=[];times={}
for run in runs:
 lines=(p/f'model-cost-{run["trial"]}.log').read_text().splitlines();resources.append([re.sub(r' cold_ns=\d+','',l) for l in lines if l.startswith(('COMPLETE','RETAINED','IMAGE'))]);allocations.append([l for l in lines if l.startswith('|')])
 for line in lines:
  m=re.match(r'TIMING (\S+) ns_per_operation=(.*)',line)
  if m:times.setdefault(m[1],[]).append(dict(trial=run['trial'],samples=len(json.loads(m[2])),median_ns=statistics.median(json.loads(m[2]))))
assert resources[0]==resources[1] and allocations[0]==allocations[1]
result=dict(completed_cases=4,stopped_resource_controls=16,resource_rows=resources[0],allocation_rows=allocations[0],resource_and_allocation_rows_identical=True,timing=times,claim='Absolute costs of completed construction, subdomain reuse and validated source replay. Retention is incremental over existing shared field/source. Not a speedup over natural images or whole-resource bound.')
(p/'model-cost-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print('\n'.join(resources[0]));print(json.dumps(times,indent=2))
