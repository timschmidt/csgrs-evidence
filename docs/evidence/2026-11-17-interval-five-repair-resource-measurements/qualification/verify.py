from pathlib import Path
from collections import defaultdict,Counter
import ast,gzip,hashlib,json,re
s=Path(__file__).parent;load=lambda n:json.loads((s/n).read_text());sha=lambda b:hashlib.sha256(b).hexdigest()
completion=load('completion.json');summary=load('summary.json');assert completion['exit_code']==0 and completion['processes']==12600 and not completion['failed'] and not completion['stop_reason']
rows=[json.loads(l) for l in (s/'observations.jsonl').read_text().splitlines()];supplement=load('supplementary-controls.json');plan=load('plan.json');assert len(rows)==len(plan['jobs'])==12600 and len(supplement)==211
assert {r['index'] for r in rows}==set(range(12600));assert completion['seconds']<=7200
assert sum(p.stat().st_size for p in s.rglob('*') if p.is_file())<640*1024**2
bins={r['binary']:r['binary_sha256'] for r in rows};assert len(bins)==18
for path,digest in bins.items():assert sha(Path(path).read_bytes())==digest
by_group=defaultdict(list);comparison={};comparisons=0;stored_bytes=0;peak_output=0
for row in rows+supplement:
 stored=Path(row['log']).read_bytes();raw=gzip.decompress(stored) if row['log'].endswith('.gz') else stored
 assert sha(raw)==row['raw_sha256'] and len(raw)==row['raw_bytes']
 if not row.get('supplement'):
  assert sha(stored)==row['stored_sha256'] and len(stored)==row['stored_bytes'];stored_bytes+=len(stored);peak_output=max(peak_output,len(raw));assert len(raw)<=8388608
  assert row['exit_code']==0 and not row['external_containment'] and not row.get('parse_error')
  assert all(row[k]==v for k,v in plan['jobs'][row['index']].items())
 values={}
 for line in raw.decode().splitlines():
  tag,_,v=line.partition(' ')
  if tag in ['OUTPUT','TRACE','ALLOCATION','USABLE','CLEANUP','USABLE_CLEANUP','INPUT_CLEANUP','INPUT_USABLE_CLEANUP','STACK','HEADROOM']:
   assert tag not in values
   values[tag]=v if tag in ['OUTPUT','TRACE'] else [int(t) for t in v.split()] if tag=='HEADROOM' else ast.literal_eval(v)
 for name in ['OUTPUT','TRACE']:assert sha(values[name].encode())==row[name+'_sha256']
 key=tuple(row[k] for k in ['case','policy','lifetime','config','warm','added']);pair=key+tuple(row[k] for k in ['mode','pattern','repeat']);full=(values['OUTPUT'],values['TRACE'])
 if pair in comparison:assert comparison[pair]==full;comparisons+=1
 else:comparison[pair]=full
 for tag,v in values.items():
  if tag not in ['OUTPUT','TRACE']:assert (list(v) if isinstance(v,tuple) else v)==row[tag]
 # Keep only small numeric data between groups.
 by_group[key].append((row,{k:v for k,v in values.items() if k not in ['OUTPUT','TRACE']}))
assert stored_bytes==completion['stored_log_bytes'] and comparisons==summary['full_source_comparisons'];del comparison
failures=[];metric_failures=Counter();max_stack=max_cleanup=0;min_untouched=2**64;min_payload=2**64
labels=['fixed','current','alpha','linalg','jacobian','domain','four','five']
for a in summary['groups']:
 key=tuple(a[k] for k in ['case','policy','lifetime','config','warm','added']);items=by_group[key];expected=['five'] if a['added'] else labels;measured={};f=[]
 assert len(items)==a['observations'] and a['output_equal'] and a['trace_equal']
 for label in expected:
  group=[(r,v) for r,v in items if r['label']==label];heap=[(r,v) for r,v in group if r['mode']=='observe'];stacks=[v for r,v in group if r['mode']=='stack'];drops=[v for r,v in group if r['mode']=='stack-drop']
  assert len(stacks)==len(drops)==6 and sum(not r.get('supplement',False) for r,v in heap)==3
  m={};operation={}
  for name,tags,traffic,peak,live in [('requested',['ALLOCATION','CLEANUP','INPUT_CLEANUP'],3,4,5),('usable',['USABLE','USABLE_CLEANUP','INPUT_USABLE_CLEANUP'],0,1,2)]:
   peaks=[];traffic_sums=[];live_sums=[];oppeaks=[];retained=[];optraffic=[]
   for _,v in heap:
    start=0;p=0;t=0
    for tag in tags:
     p=max(p,start+v[tag][peak]);start+=v[tag][live];t+=v[tag][traffic]
    peaks.append(p);traffic_sums.append(t);live_sums.append(start);oppeaks.append(v[tags[0]][peak]);retained.append(v[tags[0]][live]);optraffic.append(v[tags[0]][traffic])
   m[name+'_peak']=max(peaks);m[name+'_traffic']=max(traffic_sums);m[name+'_postdrop_min']=min(live_sums);m[name+'_postdrop_max']=max(live_sums);m[name+'_retained']=max(retained)
   operation[name+'_peak']=max(oppeaks);operation[name+'_traffic']=max(optraffic);operation[name+'_retained']=max(retained)
  for i,name in enumerate(['allocations','deallocations','reallocations']):
   m[name]=max(sum(v[tag][i] for tag in ['ALLOCATION','CLEANUP','INPUT_CLEANUP']) for _,v in heap);operation[name]=max(v['ALLOCATION'][i] for _,v in heap)
  m['stack']=max(v['STACK'] for v in stacks);m['cleanup_stack']=max(v['STACK'] for v in drops);m['worker_headroom']=min(v['HEADROOM'][-1] for v in stacks+drops)
  for v in stacks+drops:
   total,guard,caller,used,unused=v['HEADROOM'];assert total==2097152 and guard>0 and caller>0 and used==v['STACK'] and used>0 and guard+caller+used+unused==total
  stress=a['case']==3;capacity=(32 if stress else 8)*1024**2;reserve=(16 if stress else 4)*1024**2
  m['payload_headroom']=capacity-2097152-max(m['requested_peak'],m['usable_peak']);m['payload_capacity']=capacity;m['payload_required_reserve']=reserve
  assert m==a['observed_maxima'][label] and operation==a['operation_only_maxima'][label]
  for metric,limit in [('stack',65536 if stress else 32768),('cleanup_stack',65536 if stress else 32768),*[(p+n,(8 if stress else 1)*1024**2) for p in ['requested_','usable_'] for n in ['peak','retained']],*[(p+'traffic',(256 if stress else 16)*1024**2) for p in ['requested_','usable_']]]:
   if m[metric]>limit:f.append(label+':'+metric+':total')
  if m['worker_headroom']<1048576:f.append(label+':stack-headroom')
  if m['payload_headroom']<reserve:f.append(label+':payload-headroom')
  max_stack=max(max_stack,m['stack']);max_cleanup=max(max_cleanup,m['cleanup_stack']);min_untouched=min(min_untouched,m['worker_headroom']);min_payload=min(min_payload,m['payload_headroom']);measured[label]=m
 for metric,detail in a['metrics'].items():
  cap,percent=(256,4) if metric in ['stack','cleanup_stack'] else (16,1) if metric in ['allocations','deallocations','reallocations'] else (512,2) if metric.endswith('retained') else (4096,2)
  baseline=measured['fixed'][metric];total=0;passed=True;assert detail['baseline']==baseline and detail['cap_bytes_or_count']==cap and detail['cap_percent']==percent
  for i,increment in enumerate(detail['increments']):
   before,after=labels[i:i+2];delta=measured[after][metric]-measured[before][metric];positive=max(0,delta);total+=positive;ok=positive<=cap and total<=cap and positive*100<=percent*baseline and total*100<=percent*baseline;passed=passed and ok
   assert increment==dict(before=before,after=after,delta=delta,positive_charge=positive,cumulative_positive_charge=total,passed=ok)
  assert detail['cumulative_positive_charge']==total and detail['remaining_absolute_allowance']==cap-total and detail['passed']==passed
  if not passed:f.append(metric+':growth');metric_failures[metric]+=1
 assert sorted(f)==sorted(a['failures'])
 if f:failures.append(dict(key=list(key),failures=a['failures']))
assert failures==summary['failures'] and len(by_group)==168
old=json.loads((s.parent/'solver-five-repair-resources/lifetime-control-summary.json').read_text());assert sum(v.get('growth_pass') is False for a in old['accounts'] for v in a['metrics'].values())==10
result=dict(processes=12600,supplementary_controls=211,accounts=168,full_source_comparisons=comparisons,all_outputs_and_traces_equal=True,failed_accounts=len(failures),failed_growth_metrics=dict(metric_failures),total_or_headroom_failures=sum(not x.endswith(':growth') for f in failures for x in f['failures']),maximum_operation_stack=max_stack,maximum_cleanup_stack=max_cleanup,minimum_untouched_stack=min_untouched,minimum_payload_headroom=min_payload,all_images_unchanged=True,maximum_output_bytes=peak_output,stored_log_bytes=stored_bytes,prior_lifetime_failed_metrics_preserved=10,admitted=False,timing_claim=False,reused_input_whole_owned_lifetime_qualified=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
