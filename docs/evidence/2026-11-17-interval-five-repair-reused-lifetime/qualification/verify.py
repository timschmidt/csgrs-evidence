from pathlib import Path
from collections import Counter,defaultdict
import ast,gzip,hashlib,itertools,json,re,subprocess
s=Path(__file__).parent;load=lambda n:json.loads((s/n).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();summary=load('summary.json');builds=load('builds.json');histories=load('histories.json');commands=load('commands.json');completion=load('completion.json');assert completion['exit_code']==0
source={p.name:sha(p.read_bytes()) for p in (s/'consumer').iterdir() if p.is_file()}
for name,v in load('provenance.json').items():assert (s/'consumer'/name).read_bytes()==Path(v['source']).read_bytes() and source[name]==v['sha256']
assert sum(c['name'].startswith('clippy-') for c in commands)==4
for c in commands:
 assert c['exit_code']==c['expected_exit_code'] and not c['timed_out'];raw=gzip.decompress((s/c['log']).read_bytes());assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];assert not any(line.startswith(b'warning:') or line.startswith(b'warning[') for line in raw.split(b'\n'))
checks={};references={};success=fail=0;control=s.parent/'solver-five-repair-resources';oldbuilds=json.loads((control/'builds.json').read_text())
for b in builds:
 assert b['source_sha256']==source;a=b['size'];p=Path(a['path']);raw=p.read_bytes();assert len(raw)==a['file'] and sha(raw)==a['sha256']
 sections=[]
 for l in gzip.decompress((s/'listings'/(p.name+'.sections.gz')).read_bytes()).decode().splitlines():
  m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+\S+\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([A-Za-z]*)\s+\d+\s+\d+\s+\d+',l)
  if m:sections.append((m[1],int(m[2],16),m[3]))
 assert sum(n for _,n,f in sections if 'A' in f)==a['allocated_bytes'] and sum(n for _,n,f in sections if 'X' in f)==a['executable_bytes']
 assert dict((name,n) for name,n,_ in sections)['.text']==a['text']
 symbols={}
 for line in gzip.decompress((s/'listings'/(p.name+'.symbols.gz')).read_bytes()).decode().splitlines():
  fields=line.split()
  if len(fields)>=4 and fields[2] in ['t','T']:
   address=int(fields[0],16);size=int(fields[1],16);assert address not in symbols or symbols[address]==size;symbols[address]=size
 assert sum(symbols.values())==a['named_text']
 for h in b['histories']:
  lines=gzip.decompress((s/h['log']).read_bytes()).decode().split('\n')
  if h['expected_exit_code']:
   assert h['expected_exit_code']==101 and h['case']==6 and b['reproduction_only'] and 'qualified ball receipt must remain unresolved' in '\n'.join(lines);fail+=1;continue
  success+=1;outputs=[v for v in lines if v.startswith('OUTPUT ')];traces=[v for v in lines if v.startswith('TRACE ')];assert len(outputs)==len(traces)==32
  for i,(o,t) in enumerate(zip(outputs,traces)):assert o.startswith(f'OUTPUT {i} ') and t.startswith(f'TRACE {i} ')
  key=(b['features'],h['case'],h['policy'],h['recording'])
  if key in references:assert references[key]==(outputs,traces)
  else:references[key]=(outputs,traces)
  old=next(row for row in oldbuilds if row['label']==b['label'] and row['features']==b['features']);c=next(row for row in old['controls'] if row['kind']=='resource' and row['case']==h['case'] and row['policy']==h['policy'] and row['recording']==h['recording']);first=[v for v in (control/c['log']).read_text().split('\n') if v.startswith('OUTPUT ')];assert len(first)==1 and outputs[0][9:]==first[0][7:]
  def tuples(line):return ast.literal_eval('['+line.replace(') (','), (')+']')
  setup=[v[6:] for v in lines if v.startswith('SETUP ')];end=[v[9:] for v in lines if v.startswith('TEARDOWN ')];assert len(setup)==len(end)==1
  epochs=[tuples(setup[0])];cycles=[]
  for line in lines:
   if line.startswith('CYCLE '):
    _,idx,data=line.split(' ',2);assert int(idx)==len(cycles);op,u,drop,du=tuples(data);cycles.append((op,u,drop,du));epochs.extend([(op,u),(drop,du)])
  epochs.append(tuples(end[0]));assert len(epochs)==66 and len(cycles)==32
  m={};negative=[];cumulative=[]
  for j,(prefix,t,p,l) in enumerate([('requested',3,4,5),('usable',0,1,2)]):
   ends=list(itertools.accumulate(epoch[j][l] for epoch in epochs));starts=[0]+ends[:-1];peaks=[before+epoch[j][p] for before,epoch in zip(starts,epochs)];cumulative.append(ends)
   m[prefix+'_peak']=max([0]+peaks);m[prefix+'_traffic']=sum(epoch[j][t] for epoch in epochs);m[prefix+'_retained']=max(ends[1:65:2]);m[prefix+'_input_retained']=max(ends[0:65:2]);m[prefix+'_persistent']=ends[-1]
   for i,(peak,live) in enumerate(zip(peaks,ends)):
    if peak<0 or live<0:negative.append((i,prefix,peak,live))
  for i,name in enumerate(['allocations','deallocations','reallocations']):m[name]=sum(e[0][i] for e in epochs)
  expected=next(row for row in histories if row['log']==h['log']);assert m==expected['metrics'] and bool(negative)==bool(expected['negative_footprints'])
  for i,(op,u,drop,du) in enumerate(cycles):assert expected['cycles'][i]==dict(cycle=i,requested_increment=op[5]+drop[5],usable_increment=u[2]+du[2],requested_retained=cumulative[0][2+2*i],usable_retained=cumulative[1][2+2*i])
  assert expected['no_retention_after_cycle_two']==all(op[5]+drop[5]==u[2]+du[2]==0 for op,u,drop,du in cycles[2:]);checks[h['log']]=m
assert (len(builds),success,fail,len(references))==(19,726,4,66)
labels=[v[0] for v in load('boundaries.json')]
def charges(d,values,cap,percent,flag):
 baseline=values['fixed'];total=0;passed=True
 for i,entry in enumerate(d['increments']):
  before,after=labels[i:i+2];delta=values[after]-values[before];charge=max(0,delta);total+=charge;ok=baseline>=0 and charge<=cap and total<=cap and 100*charge<=percent*baseline and 100*total<=percent*baseline;passed=passed and ok
  assert entry==dict(before=before,after=after,delta=delta,positive_charge=charge,cumulative_positive_charge=total,passed=ok)
 assert d['cumulative_positive_charge']==total and d['remaining_absolute_allowance']==cap-total and d[flag]==passed
failed=Counter();post_two_failures=negatives=0
for a in summary['accounts']:
 group=[h for h in histories if not h['reproduction_only'] and all(h[k]==a[k] for k in ['features','case','policy','recording'])];expected=['five'] if a['added'] else labels;failures=[]
 no_growth=all(h['no_retention_after_cycle_two'] for h in group);nonnegative=not any(h['negative_footprints'] for h in group);assert a['no_retention_after_cycle_two']==no_growth and a['nonnegative_footprints']==nonnegative
 if not no_growth:failures.append('retention-after-cycle-two');post_two_failures+=1
 if not nonnegative:failures.append('negative-footprint');negatives+=1
 for metric,d in a['metrics'].items():
  values={label:max(checks[h['log']][metric] for h in group if h['label']==label) for label in expected};assert values==d['values']
  count=metric in ['allocations','deallocations','reallocations'];traffic=metric.endswith('traffic');persistent=metric.endswith('persistent');retained=metric.endswith('retained');cap=512 if count else 131072 if traffic else 512 if retained or persistent else 4096;percent=1 if count else 2
  total=None if count else 32768 if persistent else (256 if a['case']==3 else 16)*1024**2*32 if traffic else (8 if a['case']==3 else 1)*1024**2
  assert d['absolute_growth_cap']==cap and d['percent_growth_cap']==percent and d['total_cap']==total and d['total_pass']==(total is None or max(values.values())<=total)
  if not d['total_pass']:failures.append(metric+':total')
  if not a['added']:
   assert d['baseline']==values['fixed'];charges(d,values,cap,percent,'growth_pass')
   if not d['growth_pass']:failures.append(metric+':growth')
  else:assert d['growth_pass'] is None
 assert failures==a['failures'];failed.update(failures)
for a in summary['size_accounts']:
 for metric,d in a['metrics'].items():
  values={label:image[metric] for label,image in a['images'].items()};cap=32768 if metric in ['file','allocated_bytes'] else 16384;charges(d,values,cap,1,'passed')
 assert a['remaining']==16777216-a['images']['five']['file'] and a['headroom_pass']==(a['remaining']>=2097152)
assert len(summary['accounts'])==66 and summary['additional_history_comparisons']==660
original=load('hold.json')['started_unix'];release=load('release.json');assert release['time_unix']-original<3600
prior=load('prior-same-image-charges.json')['observations'];oldsummary=json.loads((s.parent/'solver-five-repair-measurements/summary.json').read_text())
assert len(prior)==12
for row in prior:
 account=next(a for a in oldsummary['groups'] if all(a[k]==row[k] for k in ['case','policy','lifetime','config','warm']))
 metric=account['metrics'][row['metric']];assert not metric['passed'];increment=next(i for i in metric['increments'] if i['before']==row['before'] and i['after']==row['after']);assert all(row[k]==v for k,v in increment.items()) and row['positive_charge']>0
 features='trace' if row['config']!='default' else ''
 images=[next(b for b in oldbuilds if b['label']==label and b['features']==features)['artifacts']['resource'] for label in [row['before'],row['after']]]
 assert images[0]['sha256']==images[1]['sha256']==row['before_image_sha256']==row['after_image_sha256'] and Path(images[0]['path']).read_bytes()==Path(images[1]['path']).read_bytes()
result=dict(prior_failed_metric_same_image_positive_charges=12,images=19,successful_histories=success,cycles=success*32,expected_failures=fail,full_history_groups=66,additional_full_history_comparisons=660,cold_control_output_comparisons=726,accounts=66,failed_accounts=len(summary['failed_accounts']),failed_metrics=dict(failed),retention_after_cycle_two_failed_accounts=post_two_failures,negative_footprint_accounts=negatives,all_size_caps_pass=summary['all_size_caps_pass'],all_image_headroom_pass=summary['all_image_headroom_pass'],fixture_and_allocator_unchanged=True,all_raw_histories_and_charges_verified=True,original_total_deadline_preserved=True,admitted=False,timing_claim=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
