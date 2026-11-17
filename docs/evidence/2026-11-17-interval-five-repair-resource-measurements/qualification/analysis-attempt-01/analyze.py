from pathlib import Path
from collections import defaultdict
import ast,gzip,hashlib,json,re
s=Path(__file__).parent;control=s.parent/'solver-five-repair-resources';assert json.loads((s/'completion.json').read_text())['exit_code']==0
rows=[json.loads(l) for l in (s/'observations.jsonl').read_text().splitlines()];plan=json.loads((s/'plan.json').read_text());assert len(rows)==len(plan['jobs'])==12600 and len({r['index'] for r in rows})==12600
labels=['fixed','current','alpha','linalg','jacobian','domain','four','five'];sha=lambda b:hashlib.sha256(b).hexdigest()
def read_log(row):
 p=Path(row['log']);stored=p.read_bytes();raw=gzip.decompress(stored) if p.suffix=='.gz' else stored
 if 'stored_sha256' in row:assert sha(stored)==row['stored_sha256'] and len(stored)==row['stored_bytes']
 if 'raw_sha256' in row:assert sha(raw)==row['raw_sha256'] and len(raw)==row['raw_bytes']
 return raw.decode()
def fields(text):
 result={}
 for name in ['OUTPUT','TRACE','ALLOCATION','USABLE','CLEANUP','USABLE_CLEANUP','INPUT_CLEANUP','INPUT_USABLE_CLEANUP','STACK','HEADROOM']:
  found=re.findall(r'^'+name+r' (.*)$',text,re.M)
  if found:
   assert len(found)==1
   result[name]=found[0] if name in ['OUTPUT','TRACE'] else [int(x) for x in found[0].split()] if name=='HEADROOM' else list(ast.literal_eval(found[0])) if name!='STACK' else int(found[0])
 return result
# Import matching original controls losslessly; do not overwrite frozen records.
supplement=[]
for b in json.loads((control/'builds.json').read_text()):
 if b['reproduction_only']:continue
 for c in b['controls']:
  if c['kind']!='resource' or c['expected_exit_code']!=0:continue
  added='added' in b['features']
  if added and c['case']<4:continue
  config='active' if c['recording']=='active' else 'passive' if 'trace' in b['features'] else 'default'
  raw=(control/c['log']).read_bytes();parsed=fields(raw.decode());a=b['artifacts']['resource']
  row=dict(label=b['label'],case=c['case'],policy=c['policy'],lifetime='reuse',config=config,warm=0,repeat=-1,mode='observe',pattern=165,added=added,features=b['features'],binary=a['path'],binary_sha256=a['sha256'],index='control:'+c['log'],log=str(control/c['log']),raw_bytes=len(raw),raw_sha256=sha(raw),exit_code=0,supplement=True)
  for k,v in parsed.items():row[k+'_sha256' if k in ['OUTPUT','TRACE'] else k]=sha(v.encode()) if k in ['OUTPUT','TRACE'] else v
  supplement.append(row)
old=control.with_name(control.name+'-attempt-01');raw=(old/'fixed-default-resource-0-strict-passive.log').read_bytes();parsed=fields(raw.decode());base=next(r for r in supplement if r['label']=='fixed' and r['config']=='default' and r['case']==0 and r['policy']=='strict');extra=base|dict(index='initial-collector:fixed-default-resource-0-strict-passive',log=str(old/'fixed-default-resource-0-strict-passive.log'),repeat=-2,raw_bytes=len(raw),raw_sha256=sha(raw))
for k,v in parsed.items():extra[k+'_sha256' if k in ['OUTPUT','TRACE'] else k]=sha(v.encode()) if k in ['OUTPUT','TRACE'] else v
supplement.append(extra);assert len(supplement)==211
(s/'supplementary-controls.json').write_text(json.dumps(supplement,indent=2)+'\n')
groups=defaultdict(list)
for r in rows+supplement:
 assert r['exit_code']==0 and not r.get('parse_error')
 if not r.get('supplement'):assert all(r[k]==v for k,v in plan['jobs'][r['index']].items())
 parsed=fields(read_log(r))
 for key,v in parsed.items():
  if key in ['OUTPUT','TRACE']:assert sha(v.encode())==r[key+'_sha256']
  else:assert v==r[key],(r['index'],key)
 groups[tuple(r[k] for k in ['case','policy','lifetime','config','warm','added'])].append(r)
accounts=[];failures=[];full_comparisons=0
for key,data in sorted(groups.items()):
 case,policy,lifetime,config,warm,added=key;expected=['five'] if added else labels
 account=dict(case=case,policy=policy,lifetime=lifetime,config=config,warm=warm,added=added,observations=len(data),metrics={},failures=[])
 pairs=defaultdict(list);reference={};values={}
 for r in data:
  parsed=fields(read_log(r));pair=(r['mode'],r['pattern'],r['repeat']);pairs[pair].append((parsed['OUTPUT'],parsed['TRACE']))
  # Supplementary control prehistory equals cold/reuse observation. Compare
  # full output/trace to all fresh observe repetitions for the same source.
  if r['mode']=='observe':
   value=(parsed['OUTPUT'],parsed['TRACE'])
   if r['label'] in reference:assert reference[r['label']]==value,(key,r['label'],'repeated observe output/trace')
   else:reference[r['label']]=value
 account['output_equal']=all(all(x[0]==g[0][0] for x in g) for g in pairs.values());account['trace_equal']=all(all(x[1]==g[0][1] for x in g) for g in pairs.values());account['comparison_groups']=len(pairs)
 full_comparisons+=sum(len(g)-1 for g in pairs.values())
 if not account['output_equal']:account['failures'].append('output')
 if not account['trace_equal']:account['failures'].append('trace')
 for label in expected:
  items=[r for r in data if r['label']==label];heap=[r for r in items if r['mode']=='observe'];stack=[r for r in items if r['mode']=='stack'];drop=[r for r in items if r['mode']=='stack-drop']
  assert len(stack)==len(drop)==6 and sum(not r.get('supplement',False) for r in heap)==3
  for row in stack+drop:
   mapping,guard,caller,peak,remaining=row['HEADROOM'];assert mapping==2*1024**2 and guard>0 and caller>0 and peak==row['STACK'] and peak>0 and caller+peak+guard+remaining==mapping
  v=dict(stack=max(r['STACK'] for r in stack),cleanup_stack=max(r['STACK'] for r in drop),worker_headroom=min(r['HEADROOM'][4] for r in stack+drop))
  operation={}
  for name,source,index in [('allocations','ALLOCATION',0),('deallocations','ALLOCATION',1),('reallocations','ALLOCATION',2),('requested_traffic','ALLOCATION',3),('requested_peak','ALLOCATION',4),('requested_retained','ALLOCATION',5),('usable_traffic','USABLE',0),('usable_peak','USABLE',1),('usable_retained','USABLE',2)]:operation[name]=max(r[source][index] for r in heap)
  v.update(operation)
  for metric,index in [('allocations',0),('deallocations',1),('reallocations',2),('requested_traffic',3)]:v[metric]=max(sum(r[k][index] for k in ['ALLOCATION','CLEANUP','INPUT_CLEANUP']) for r in heap)
  v['usable_traffic']=max(sum(r[k][0] for k in ['USABLE','USABLE_CLEANUP','INPUT_USABLE_CLEANUP']) for r in heap)
  for name,op,cleanup,inp,peak,live in [('requested','ALLOCATION','CLEANUP','INPUT_CLEANUP',4,5),('usable','USABLE','USABLE_CLEANUP','INPUT_USABLE_CLEANUP',1,2)]:
   v[name+'_peak']=max(max(r[op][peak],r[op][live]+r[cleanup][peak],r[op][live]+r[cleanup][live]+r[inp][peak]) for r in heap)
   signed=[sum(r[k][live] for k in [op,cleanup,inp]) for r in heap];v[name+'_postdrop_min']=min(signed);v[name+'_postdrop_max']=max(signed)
  allowance,reserve=(32*1024**2,16*1024**2) if case==3 else (8*1024**2,4*1024**2)
  v['payload_headroom']=allowance-2*1024**2-max(v['requested_peak'],v['usable_peak']);v['payload_capacity']=allowance;v['payload_required_reserve']=reserve
  limits=dict(stack=65536 if case==3 else 32768,cleanup_stack=65536 if case==3 else 32768,requested_peak=(8 if case==3 else 1)*1024**2,usable_peak=(8 if case==3 else 1)*1024**2,requested_retained=(8 if case==3 else 1)*1024**2,usable_retained=(8 if case==3 else 1)*1024**2,requested_traffic=(256 if case==3 else 16)*1024**2,usable_traffic=(256 if case==3 else 16)*1024**2)
  for metric,limit in limits.items():
   if v[metric]>limit:account['failures'].append(f'{label}:{metric}:total')
  if v['worker_headroom']<1024**2:account['failures'].append(label+':stack-headroom')
  if v['payload_headroom']<reserve:account['failures'].append(label+':payload-headroom')
  account.setdefault('operation_only_maxima',{})[label]=operation;values[label]=v
 account['observed_maxima']=values
 if not added:
  for metric in ['stack','cleanup_stack','allocations','deallocations','reallocations','requested_traffic','requested_peak','requested_retained','usable_traffic','usable_peak','usable_retained']:
   cap,percent=(256,4) if 'stack' in metric else (16,1) if metric in ['allocations','deallocations','reallocations'] else (512,2) if 'retained' in metric else (4096,2)
   baseline=values['fixed'][metric];assert baseline>=0
   charge=0;increments=[]
   for before,after in zip(labels,labels[1:]):
    delta=values[after][metric]-values[before][metric];positive=max(0,delta);charge+=positive;ok=positive<=cap and charge<=cap and 100*positive<=percent*baseline and 100*charge<=percent*baseline
    increments.append(dict(before=before,after=after,delta=delta,positive_charge=positive,cumulative_positive_charge=charge,passed=ok))
   passed=all(i['passed'] for i in increments);account['metrics'][metric]=dict(baseline=baseline,cap_bytes_or_count=cap,cap_percent=percent,cumulative_positive_charge=charge,remaining_absolute_allowance=cap-charge,increments=increments,passed=passed)
   if not passed:account['failures'].append(metric+':growth')
 if account['failures']:failures.append(dict(key=key,failures=account['failures']))
 accounts.append(account)
assert len(accounts)==168
result=dict(processes=len(rows),supplementary_controls=len(supplement),accounts=len(accounts),full_source_comparisons=full_comparisons,all_caps_and_outputs_pass=not failures,failures=failures,groups=accounts,admitted=False,timing_claim=False,previous_lifetime_failed_metrics=10,previous_charges_preserved=True)
(s/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(dict(processes=len(rows),accounts=len(accounts),failed_accounts=len(failures),failed_growth_metrics=sum(len(a['failures']) for a in accounts),full_source_comparisons=full_comparisons,all_outputs_equal=all(a['output_equal'] for a in accounts),all_traces_equal=all(a['trace_equal'] for a in accounts)),indent=2))
