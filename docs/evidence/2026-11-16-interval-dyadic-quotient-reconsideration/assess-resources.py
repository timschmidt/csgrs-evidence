from pathlib import Path
import json,collections
s=Path(__file__).parent;results=[]
for lock in ['pinned','external']:
 v=json.loads((s/f'{lock}-resource-comparison.json').read_text());rows=[]
 for row in v['summary']:
  if row['mode']!='allocation':continue
  a=[json.loads(x) for x in row['baseline']];b=[json.loads(x) for x in row['candidate']];assert len(a)==len(b)==1,(lock,row['case']);a=a[0];b=b[0]
  metrics={metric:b[metric]-a[metric] for metric in ['live_bytes','peak_live_bytes']}
  metrics['allocation_and_reallocation_events']=b['allocation_count']+b['reallocation_count']-a['allocation_count']-a['reallocation_count']
  metrics['requested_allocation_and_reallocation_bytes']=b['allocated_bytes']+b['reallocated_bytes']-a['allocated_bytes']-a['reallocated_bytes']
  assert all(x<=0 for x in metrics.values()),(lock,row['case'],metrics)
  rows.append({'case':row['case'],'deltas':metrics})
 stack=[x for x in v['summary'] if x['mode']=='stack'];increased_maxima=[x['case'] for x in stack if max(x['candidate'])>max(x['baseline'])]
 results.append({'lock':lock,'rows':rows,'increased_stack_maxima':increased_maxima,'raw_counter_increases':v['adverse_count']})
assert not results[0]['increased_stack_maxima']
assert len(results[1]['increased_stack_maxima'])==12
(s/'resource-assessment.json').write_text(json.dumps({'decision':'Reject: external dependency configuration increases measured stack maxima for12completed cases; size-only exception does not waive stack gate.','observations':results,'limitations':'Raw reallocation counter increases are preserved; totals, retained payload and peak payload do not rise. Stack tests use four paint patterns and3fresh repetitions at0/16main-thread prewarms. The external scaled_quotient local reservation grows0x118 to0x128 with unchanged6register pushes, corroborating repeatable16byte full-call changes. One-byte cosine paint differences and larger rational individual deltas remain in raw data; no universal stack bound or single-dependency/compiler causal attribution. No runtime samples taken.'},indent=2)+'\n')
print('Resource decision recorded: external stack regression; no timing scheduled.')
