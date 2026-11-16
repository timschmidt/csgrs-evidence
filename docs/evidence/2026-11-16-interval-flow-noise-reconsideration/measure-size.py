from artifact_sizes import *
old=json.loads((s/'size-account-before.json').read_text());previous={x['artifact']:x for x in old['accounts']}
b={x['source']:x for x in json.loads((s/'baseline-binaries.json').read_text())};c=json.loads((s/'candidate-binaries.json').read_text());rows=[];failures=[]
for x in c:
 key=x['source'].split('/csgrs/',1)[1]
 if x['source'] not in b:continue
 before=native(b[x['source']]['path']);after=native(x['path']);prior=previous[key];metrics={}
 for metric in ['file','text','named_text']:
  account=prior['metrics'][metric];caps=account['caps'];fixed=account['baseline'];delta=after[metric]-before[metric];total=after[metric]-fixed
  ok=delta<=caps['incremental_bytes'] and 100*delta/before[metric]<=caps['incremental_percent'] and total<=caps['cumulative_bytes'] and 100*total/fixed<=caps['cumulative_percent']
  metrics[metric]={'fixed':fixed,'baseline':before[metric],'candidate':after[metric],'incremental_bytes':delta,'cumulative_bytes':total,'incremental_percent':100*delta/before[metric],'cumulative_percent':100*total/fixed,'caps':caps,'passes':ok}
  if not ok:failures.append([key,metric])
 rows.append({'artifact':key,'baseline':before,'candidate':after,'metrics':metrics})
result={'baseline_commit':old['baseline_commit'],'artifacts':rows,'failures':failures};(s/'native-size-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'failures':failures,'changes':[(x['artifact'],{k:v['incremental_bytes'] for k,v in x['metrics'].items()}) for x in rows if any(v['incremental_bytes'] for v in x['metrics'].values())]}))
