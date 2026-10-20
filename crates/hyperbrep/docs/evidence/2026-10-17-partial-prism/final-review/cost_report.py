"""Report all observed costs, including adverse timings and allocation changes."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import statistics

OUT=Path(__file__).resolve().parents[1]
read=lambda n:json.loads((OUT/n).read_text())
c=read('cost-summary.json');rows=c['costs']
paired=[r for r in rows if 'ratio' in r];new=[r for r in rows if 'ratio' not in r]
adverse=[r for r in paired if r['ratio']>1.1]
alloc=[]
for row in paired:
    if 'baseline_allocations_per_iteration' not in row:continue
    a,b=row['baseline_allocations_per_iteration'],row['candidate_allocations_per_iteration']
    if any(b[k]>a[k] for k in a):alloc.append(dict(corpus=row['corpus'],case=row['case'],baseline=a,candidate=b,delta={k:b[k]-a[k] for k in a}))
samples=defaultdict(list)
for row in read('costs/commands.json'):
    corpus,side,trial=row['label'].rsplit('-',2)
    samples[(corpus,side)].append(row['resource'])
resources=[]
for (corpus,side),values in samples.items():
    resources.append(dict(corpus=corpus,side=side,processes=len(values),**{key:dict(min=min(r[key] for r in values),median=statistics.median(r[key] for r in values),max=max(r[key] for r in values)) for key in ['wall_seconds','user_seconds','system_seconds','maximum_rss_kib']}))
sizes=[]
for name,b in c['candidate'].items():
    row=dict(corpus=name,candidate=b['bytes'])
    if name in c['baseline']:row.update(baseline=c['baseline'][name]['bytes'],delta=b['bytes']-c['baseline'][name]['bytes'])
    sizes.append(row)
result=dict(source=c['source'],matched_cases=len(paired),new_cases=len(new),timing_ratio_median=statistics.median(r['ratio'] for r in paired),timing_ratio_range=[min(r['ratio'] for r in paired),max(r['ratio'] for r in paired)],adverse_timing_rows=adverse,increased_allocation_rows=alloc,process_resources=resources,executable_sizes=sizes,new_complete_workflows=new,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),scope='All original full harnesses and materialized receipts retained. Three alternating pairs; no task builds/tests overlap. Shared-host observations, including all adverse rows. Allocation requests and peak process RSS do not bound retained heap. Executables are harnesses, not distribution sizes. Absolute new-workflow costs have no comparison to a former failure.')
(OUT/'resource-summary.json').write_text(json.dumps(result,indent=2)+'\n')
lines=['# Complete-work cost observations','',result['scope'],'',f"{len(paired)} preserved cases and {len(new)} new cases; {c['commands']} fresh processes. All old deterministic receipts agree. Median case ratio {result['timing_ratio_median']:.6f}; range {result['timing_ratio_range'][0]:.6f}–{result['timing_ratio_range'][1]:.6f}.",'','## Rows above the 10% review marker','', '| Corpus / case | Baseline ms | Candidate ms | Ratio |','| --- | ---: | ---: | ---: |']
for r in adverse:lines.append(f"| {r['corpus']} / {r['case']} | {r['baseline_median_ns']/1e6:.9f} | {r['candidate_median_ns']/1e6:.9f} | {r['ratio']:.6f} |")
if not adverse:lines.append('| None | | | |')
lines+=['','## Increased allocation requests','', '| Corpus / case | Calls delta | Requested bytes delta |','| --- | ---: | ---: |']
for r in alloc:lines.append(f"| {r['corpus']} / {r['case']} | {r['delta']['calls']:.3f} | {r['delta']['requested_bytes']:.3f} |")
if not alloc:lines.append('| None | | |')
lines+=['','## New complete native/STEP workflows','', '| Case | Median ms | Calls / operation | Requested bytes / operation |','| --- | ---: | ---: | ---: |']
for r in new:
    a=r['candidate_allocations_per_iteration'];lines.append(f"| {r['case']} | {r['candidate_median_ns']/1e6:.6f} | {a['calls']:.3f} | {a['requested_bytes']:.3f} |")
lines+=['','All raw trials, full case rows, process RSS/CPU/wall observations and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Warmup and timing boundaries belong to each unchanged harness. OS/shared caches were not flushed. The new harness executes one warmup and three measured complete workflows per process, including independent exact checks and native/STEP materialization. No significant speedup or all-cohort timing admission is inferred.','']
(OUT/'costs.md').write_text('\n'.join(lines))
print(json.dumps({k:v for k,v in result.items() if k in ['matched_cases','new_cases','timing_ratio_median','timing_ratio_range']},indent=2))
print('Adverse timing rows:',len(adverse),'allocation increases:',len(alloc),flush=True)
