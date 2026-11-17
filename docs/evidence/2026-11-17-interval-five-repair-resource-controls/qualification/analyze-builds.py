from pathlib import Path
import ast,collections,gzip,hashlib,json,re,subprocess
s=Path(__file__).parent
assert json.loads((s/'completion.json').read_text())['exit_code']==0
rows=json.loads((s/'builds.json').read_text());labels=[x[0] for x in json.loads((s/'boundaries.json').read_text())]
assert labels==['fixed','current','alpha','linalg','jacobian','domain','four','five'] and len(rows)==19
for r in rows:
 for a in r['artifacts'].values():assert hashlib.sha256(Path(a['path']).read_bytes()).hexdigest()==a['sha256']
size_accounts=[]
for kind in ['resource','lifetime']:
 for features in ['', 'trace','added','trace,added']:
  selected=[r for r in rows if not r['reproduction_only'] and r['features']==features];expected=['five'] if 'added' in features else labels
  assert [r['label'] for r in selected]==expected
  sizes={r['label']:r['artifacts'][kind] for r in selected};metrics={}
  if 'added' not in features:
   for metric in ['file','text','named_text','allocated_bytes','executable_bytes']:
    baseline=sizes['fixed'][metric];cap=32768 if metric in ['file','allocated_bytes'] else 16384;cumulative=0;increments=[]
    for before,after in zip(labels,labels[1:]):
     delta=sizes[after][metric]-sizes[before][metric];charge=max(0,delta);cumulative+=charge
     increments.append(dict(before=before,after=after,delta=delta,positive_charge=charge,cumulative_positive_charge=cumulative,passed=charge<=cap and cumulative<=cap and 100*charge<=baseline and 100*cumulative<=baseline))
    metrics[metric]=dict(fixed_baseline=baseline,absolute_cap=cap,percent_cap=1,increments=increments,cumulative_positive_charge=cumulative,remaining_absolute_bytes=cap-cumulative,passed=all(x['passed'] for x in increments))
  size_accounts.append(dict(kind=kind,features=features,artifacts=sizes,capacity=16*1024**2,reserve=2*1024**2,remaining=16*1024**2-sizes['five']['file'],headroom_pass=16*1024**2-sizes['five']['file']>=2*1024**2,metrics=metrics))
size=dict(accounts=size_accounts,all_caps_pass=all(m['passed'] for a in size_accounts for m in a['metrics'].values()),all_headroom_pass=all(a['headroom_pass'] for a in size_accounts),admitted=False)
(s/'size-summary.json').write_text(json.dumps(size,indent=2)+'\n')
# Reconstruct whole-owned footprints from paired per-cycle epochs.
histories=[];full_groups=collections.defaultdict(list);success=fail=0
for r in rows:
 for c in r['controls']:
  lines=(s/c['log']).read_text().splitlines()
  if c['expected_exit_code']:
   assert 'qualified ball receipt must remain unresolved' in '\n'.join(lines);fail+=1;continue
  success+=1;out=[l for l in lines if l.startswith('OUTPUT ')];trace=[l for l in lines if l.startswith('TRACE ')]
  assert len(out)==1 and len(trace)==(32 if c['kind']=='lifetime' else 1)
  full_groups[(c['kind'],c['case'],c['policy'],r['features'],c['recording'])].append((r['label'],out,trace))
  if c['kind']!='lifetime':continue
  cycle_lines=[l for l in lines if l.startswith('CYCLE ')];assert len(cycle_lines)==32
  cycles=[];persistent=usable_persistent=0;metrics=collections.Counter();positive_retention=usable_positive=0
  for i,line in enumerate(cycle_lines):
   match=re.fullmatch(r'CYCLE (\d+) (\([^\n]+?\)) (\([^\n]+?\)) (\([^\n]+?\)) (\([^\n]+?\))',line);assert match and int(match[1])==i
   op,usable,drop,drop_usable=map(ast.literal_eval,match.groups()[1:]);assert len(op)==len(drop)==6 and len(usable)==len(drop_usable)==3
   peak=max(persistent+op[4],persistent+op[5]+drop[4]);up=max(usable_persistent+usable[1],usable_persistent+usable[2]+drop_usable[1])
   metrics['requested_peak']=max(metrics['requested_peak'],peak);metrics['usable_peak']=max(metrics['usable_peak'],up)
   metrics['requested_retained']=max(metrics['requested_retained'],persistent+op[5]);metrics['usable_retained']=max(metrics['usable_retained'],usable_persistent+usable[2])
   increment=op[5]+drop[5];ui=usable[2]+drop_usable[2];persistent+=increment;usable_persistent+=ui
   metrics['requested_persistent']=max(metrics['requested_persistent'],persistent);metrics['usable_persistent']=max(metrics['usable_persistent'],usable_persistent)
   positive_retention+=max(0,increment);usable_positive+=max(0,ui)
   metrics['requested_traffic']+=op[3]+drop[3];metrics['usable_traffic']+=usable[0]+drop_usable[0]
   for key,index in [('allocations',0),('deallocations',1),('reallocations',2)]:metrics[key]+=op[index]+drop[index]
   cycles.append(dict(cycle=i,requested_increment=increment,usable_increment=ui,requested_persistent=persistent,usable_persistent=usable_persistent,requested_peak=peak,usable_peak=up))
  metrics['requested_positive_retention']=positive_retention;metrics['usable_positive_retention']=usable_positive
  histories.append(dict(label=r['label'],features=r['features'],reproduction_only=r['reproduction_only'],case=c['case'],policy=c['policy'],recording=c['recording'],log=c['log'],metrics=dict(metrics),cycles=cycles,nonnegative_tracked_footprints=all(v['requested_persistent']>=0 and v['usable_persistent']>=0 and v['requested_peak']>=0 and v['usable_peak']>=0 for v in cycles),zero_additional_retention_after_cycle_two=all(v['requested_increment']==v['usable_increment']==0 for v in cycles[2:]),persistent_total_pass=max(metrics['requested_persistent'],metrics['usable_persistent'])<=32768))
for key,group in full_groups.items():assert all(row[1:]==group[0][1:] for row in group),key
assert success==516 and fail==8 and len(histories)==258 and len(full_groups)==132
accounts=[]
for key in sorted({(h['features'],h['case'],h['policy'],h['recording']) for h in histories if not h['reproduction_only']}):
 features,case,policy,recording=key;group=[h for h in histories if not h['reproduction_only'] and (h['features'],h['case'],h['policy'],h['recording'])==key];expected=['five'] if 'added' in features else labels;assert [h['label'] for h in group]==expected
 added='added' in features;stress=case==3;values={h['label']:h['metrics'] for h in group};metrics={}
 for metric in ['requested_peak','usable_peak','requested_retained','usable_retained','requested_persistent','usable_persistent','requested_traffic','usable_traffic','allocations','deallocations','reallocations']:
  traffic=metric.endswith('traffic');count=metric in ['allocations','deallocations','reallocations'];persistent=metric.endswith('persistent');retained=metric.endswith('retained')
  cap=16*32 if count else 4096*32 if traffic else 512 if persistent or retained else 4096
  percent=1 if count else 2
  total=None if count else 32768 if persistent else (256 if stress else 16)*1024**2*32 if traffic else (8 if stress else 1)*1024**2
  absolute_values={label:values[label][metric] for label in expected};detail=dict(values=absolute_values,absolute_growth_cap=cap,percent_growth_cap=percent,total_cap=total,total_pass=total is None or max(absolute_values.values())<=total)
  if not added:
   baseline=absolute_values['fixed'];cumulative=0;increments=[]
   for before,after in zip(labels,labels[1:]):
    delta=absolute_values[after]-absolute_values[before];charge=max(0,delta);cumulative+=charge
    relative=(100*charge<=percent*baseline and 100*cumulative<=percent*baseline) if baseline>0 else charge==cumulative==0
    increments.append(dict(before=before,after=after,delta=delta,positive_charge=charge,cumulative_positive_charge=cumulative,passed=charge<=cap and cumulative<=cap and relative))
   detail.update(relative_denominator=baseline,increments=increments,cumulative_positive_charge=cumulative,remaining_absolute_allowance=cap-cumulative,growth_pass=all(i['passed'] for i in increments))
  else:detail['growth_pass']=None
  metrics[metric]=detail
 accounts.append(dict(features=features,case=case,policy=policy,recording=recording,added=added,stress=stress,metrics=metrics,zero_additional_retention_after_cycle_two=all(h['zero_additional_retention_after_cycle_two'] for h in group),persistent_total_pass=all(h['persistent_total_pass'] for h in group)))
summary=dict(successful_controls=success,expected_failed_controls=fail,full_output_trace_groups=len(full_groups),matching_additional_group_members=sum(len(g)-1 for g in full_groups.values()),successful_lifetime_processes=len(histories),complete_cycles=len(histories)*32,accounts=accounts,all_initial_growth_caps_pass=all(m['growth_pass'] is not False for a in accounts for m in a['metrics'].values()),all_total_caps_pass=all(m['total_pass'] for a in accounts for m in a['metrics'].values()),all_histories_zero_additional_retention_after_cycle_two=all(h['zero_additional_retention_after_cycle_two'] for h in histories),all_persistent_total_caps_pass=all(h['persistent_total_pass'] for h in histories),all_tracked_footprints_nonnegative=all(h['nonnegative_tracked_footprints'] for h in histories),admitted=False,scope='One fresh 32-cycle control history per source/features/case/policy/recording configuration. This is the build-control corpus, not the pending multi-process resource/stack campaign. Earlier accounts and failures are preserved separately.')
(s/'lifetime-histories.json').write_text(json.dumps(histories,indent=2)+'\n');(s/'lifetime-control-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(dict(images=38,size_caps_pass=size['all_caps_pass'],image_headroom_pass=size['all_headroom_pass'],successful_controls=success,expected_failures=fail,full_comparison_groups=len(full_groups),lifetime_processes=len(histories),cycles=len(histories)*32,lifetime_growth_caps_pass=summary['all_initial_growth_caps_pass'],lifetime_totals_pass=summary['all_total_caps_pass'],no_retention_after_cycle_two=summary['all_histories_zero_additional_retention_after_cycle_two']),indent=2))
