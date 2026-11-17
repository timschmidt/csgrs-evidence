from pathlib import Path
from collections import Counter,defaultdict
import ast,gzip,hashlib,json
s=Path(__file__).parent;load=lambda n:json.loads((s/n).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();assert load('completion.json')['exit_code']==0
builds=load('builds.json');commands=load('commands.json');labels=[x[0] for x in load('boundaries.json')];histories=[];references={};success=fail=0
for c in commands:
 assert c['exit_code']==c['expected_exit_code'] and not c['timed_out'];stored=(s/c['log']).read_bytes();assert sha(stored)==c['stored_sha256'] and len(stored)==c['stored_bytes'];raw=gzip.decompress(stored);assert sha(raw)==c['raw_sha256'] and len(raw)==c['raw_bytes']
for b in builds:
 assert sha(Path(b['size']['path']).read_bytes())==b['size']['sha256']
 for h in b['histories']:
  raw=gzip.decompress((s/h['log']).read_bytes()).decode();lines=raw.split('\n')
  if h['expected_exit_code']:
   assert b['reproduction_only'] and h['case']==6 and 'qualified ball receipt must remain unresolved' in raw;fail+=1;continue
  success+=1;outputs=[];traces=[];cycles=[];setup=teardown=None
  for line in lines:
   tag,_,tail=line.partition(' ')
   if tag=='OUTPUT':idx,value=tail.split(' ',1);assert int(idx)==len(outputs);outputs.append(value)
   elif tag=='TRACE':idx,value=tail.split(' ',1);assert int(idx)==len(traces);traces.append(value)
   elif tag=='CYCLE':idx,value=tail.split(' ',1);assert int(idx)==len(cycles);cycles.append(ast.literal_eval('['+value.replace(') (','), (')+']'))
   elif tag in ['SETUP','TEARDOWN']:
    value=ast.literal_eval('['+tail.replace(') (','), (')+']')
    if tag=='SETUP':assert setup is None;setup=value
    else:assert teardown is None;teardown=value
  assert len(outputs)==len(traces)==len(cycles)==32 and setup is not None and teardown is not None
  key=(b['features'],h['case'],h['policy'],h['recording'])
  if key in references:assert (outputs,traces)==references[key]
  else:references[key]=(outputs,traces)
  metric=Counter();live=[0,0];history=[];negative=[]
  def epoch(requested,usable,phase):
   for j,(prefix,values,traffic,peak,retained) in enumerate([('requested',requested,3,4,5),('usable',usable,0,1,2)]):
    observed=live[j]+values[peak];live[j]+=values[retained];metric[prefix+'_peak']=max(metric[prefix+'_peak'],observed);metric[prefix+'_traffic']+=values[traffic]
    if observed<0 or live[j]<0:negative.append(dict(phase=phase,kind=prefix,peak=observed,live=live[j]))
   for name,idx in [('allocations',0),('deallocations',1),('reallocations',2)]:metric[name]+=requested[idx]
  epoch(*setup,'setup')
  for prefix,value in zip(['requested','usable'],live):metric[prefix+'_input_retained']=value
  for i,(op,u,drop,du) in enumerate(cycles):
   before=live.copy();epoch(op,u,f'operation:{i}')
   for prefix,value in zip(['requested','usable'],live):metric[prefix+'_retained']=max(metric[prefix+'_retained'],value)
   epoch(drop,du,f'cleanup:{i}');increment=[live[j]-before[j] for j in range(2)]
   for prefix,value in zip(['requested','usable'],live):metric[prefix+'_input_retained']=max(metric[prefix+'_input_retained'],value)
   history.append(dict(cycle=i,requested_increment=increment[0],usable_increment=increment[1],requested_retained=live[0],usable_retained=live[1]))
  epoch(*teardown,'teardown');metric['requested_persistent']=live[0];metric['usable_persistent']=live[1]
  histories.append(dict(label=b['label'],features=b['features'],reproduction_only=b['reproduction_only'],**h,metrics=dict(metric),cycles=history,negative_footprints=negative,no_retention_after_cycle_two=all(v['requested_increment']==v['usable_increment']==0 for v in history[2:])))
assert (success,fail,len(references))==(726,4,66)
accounts=[];failed=[]
keys=sorted({(h['features'],h['case'],h['policy'],h['recording']) for h in histories if not h['reproduction_only']})
for key in keys:
 features,case,policy,recording=key;added='added' in features;expected=['five'] if added else labels;group=[h for h in histories if not h['reproduction_only'] and (h['features'],h['case'],h['policy'],h['recording'])==key];by_label={label:[h for h in group if h['label']==label] for label in expected};assert all(len(v)==3 for v in by_label.values())
 account=dict(features=features,case=case,policy=policy,recording=recording,added=added,metrics={},failures=[],no_retention_after_cycle_two=all(h['no_retention_after_cycle_two'] for h in group),nonnegative_footprints=not any(h['negative_footprints'] for h in group))
 if not account['no_retention_after_cycle_two']:account['failures'].append('retention-after-cycle-two')
 if not account['nonnegative_footprints']:account['failures'].append('negative-footprint')
 for metric in ['requested_peak','usable_peak','requested_retained','usable_retained','requested_input_retained','usable_input_retained','requested_persistent','usable_persistent','requested_traffic','usable_traffic','allocations','deallocations','reallocations']:
  values={label:max(h['metrics'][metric] for h in items) for label,items in by_label.items()};count=metric in ['allocations','deallocations','reallocations'];traffic=metric.endswith('traffic');persistent=metric.endswith('persistent');retained=metric.endswith('retained');cap=512 if count else 131072 if traffic else 512 if retained or persistent else 4096;percent=1 if count else 2
  total=None if count else 32768 if persistent else (256 if case==3 else 16)*1024**2*32 if traffic else (8 if case==3 else 1)*1024**2
  detail=dict(values=values,absolute_growth_cap=cap,percent_growth_cap=percent,total_cap=total,total_pass=total is None or max(values.values())<=total)
  if not detail['total_pass']:account['failures'].append(metric+':total')
  if not added:
   baseline=values['fixed'];charge=0;increments=[]
   for before,after in zip(labels,labels[1:]):
    delta=values[after]-values[before];positive=max(0,delta);charge+=positive;valid=baseline>=0 and positive<=cap and charge<=cap and 100*positive<=percent*baseline and 100*charge<=percent*baseline
    increments.append(dict(before=before,after=after,delta=delta,positive_charge=positive,cumulative_positive_charge=charge,passed=valid))
   passed=all(i['passed'] for i in increments);detail.update(baseline=baseline,increments=increments,cumulative_positive_charge=charge,remaining_absolute_allowance=cap-charge,growth_pass=passed)
   if not passed:account['failures'].append(metric+':growth')
  else:detail['growth_pass']=None
  account['metrics'][metric]=detail
 if account['failures']:failed.append(dict(key=key,failures=account['failures']))
 accounts.append(account)
size_accounts=[]
for features in ['','trace','added','trace,added']:
 selected=[b for b in builds if not b['reproduction_only'] and b['features']==features];values={b['label']:b['size'] for b in selected};metrics={}
 if 'added' not in features:
  for metric in ['file','text','named_text','allocated_bytes','executable_bytes']:
   baseline=values['fixed'][metric];cap=32768 if metric in ['file','allocated_bytes'] else 16384;charge=0;increments=[]
   for before,after in zip(labels,labels[1:]):
    delta=values[after][metric]-values[before][metric];positive=max(0,delta);charge+=positive;valid=positive<=cap and charge<=cap and 100*positive<=baseline and 100*charge<=baseline;increments.append(dict(before=before,after=after,delta=delta,positive_charge=positive,cumulative_positive_charge=charge,passed=valid))
   metrics[metric]=dict(baseline=baseline,absolute_growth_cap=cap,percent_growth_cap=1,cumulative_positive_charge=charge,remaining_absolute_allowance=cap-charge,increments=increments,passed=all(i['passed'] for i in increments))
 size_accounts.append(dict(features=features,images=values,metrics=metrics,remaining=16*1024**2-values['five']['file'],headroom_pass=16*1024**2-values['five']['file']>=2*1024**2))
summary=dict(successful_histories=success,expected_failures=fail,cycles=success*32,full_history_groups=len(references),additional_history_comparisons=success-len(references),accounts=accounts,failed_accounts=failed,size_accounts=size_accounts,all_size_caps_pass=all(m['passed'] for a in size_accounts for m in a['metrics'].values()),all_image_headroom_pass=all(a['headroom_pass'] for a in size_accounts),admitted=False,timing_claim=False)
(s/'histories.json').write_text(json.dumps(histories,indent=2)+'\n');(s/'summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(dict(successful_histories=success,cycles=success*32,accounts=len(accounts),failed_accounts=len(failed),failed_metrics=dict(Counter(f for a in accounts for f in a['failures'])),size_caps_pass=summary['all_size_caps_pass'],image_headroom_pass=summary['all_image_headroom_pass']),indent=2))
