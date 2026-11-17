from pathlib import Path
from collections import Counter,defaultdict
import ast,gzip,hashlib,itertools,json,re,time
s=Path(__file__).parent;start=time.monotonic();load=lambda p:json.loads(Path(p).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
completion=load(s/'completion.json');assert completion['exit_code']==0 and completion['restored'] and completion['seconds']<=3600;started=load(s/'started.json');assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256']
prepared=load(s/'prepared-sources.json')
for n,h in prepared.items():assert sha((s/n).read_bytes())==h
for n,h in started['sources'].items():assert h==prepared[n+'.rs']
assert load(s/'allocator-provenance.json')['sha256']==prepared['consumer/allocation.rs'];assert started['effective_rlimit_fsize'][0]==1024**3
commands=load(s/'commands.json');assert completion['commands']==len(commands)<=2000;by_name={c['name']:c for c in commands};assert len(by_name)==len(commands)
external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
raws={}
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];assert len(raw)<=1024**3
 if c['executable']:assert c['command'][0]=='trace-materialization-control' and c['seconds']<=60 and len(raw)<=64*1024**2
 if '-clippy' in c['name']:assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines())
 if c['name'].endswith('-owner-tests'):
  for name in ['dispatch_snapshot_preserves_order_and_counts_until_taken','dispatch_snapshot_merges_equal_labels_from_distinct_static_storage','concurrent_recording_scopes_keep_independent_snapshots']:assert f'test dispatch_trace::tests::{name} ... ok'.encode() in raw
  assert b'test result: ok.' in raw
 raws[c['log']]=raw.decode()
configs=[]
for n in [0,1,2,12,64,65,256,4096]:
 groups=[0] if n==0 else sorted({1,min(17,n),max(1,n//2),n})
 for g,mode,warm,repeat in itertools.product(groups,['snapshot','take'],[0,8],range(3)):configs.append(dict(n=n,groups=g,mode=mode,warm=warm,repeat=repeat))
assert load(s/'configurations.json')==configs;builds=load(s/'builds.json');assert [b['label'] for b in builds]==['control','batch','incremental']
for b in builds:
 raw=Path(b['image']['path']).read_bytes();assert len(raw)==b['image']['bytes'] and sha(raw)==b['image']['sha256'];assert b['source_sha256']==prepared[b['label']+'.rs'];assert raws[by_name[b['label']+'-revision']['log']].strip()==b['revision']
observations=load(s/'observations.json');assert len(observations)==completion['controls']==len(configs)*3;assert completion['images']==3;groups=defaultdict(lambda:defaultdict(list));outputs={};comparisons=0;all_rows=[]
pattern=r'DispatchCount \{ layer: "pilot", operation: "count", path: "(p\d{4})", count: (\d+) \}'
for label in ['control','batch','incremental']:
 selected=[o for o in observations if o['label']==label];assert [o['config'] for o in selected]==configs
 for o in selected:
  c=o['config'];key=(c['n'],c['groups'],c['mode'],c['warm']);raw=raws[o['log']];lines=raw.splitlines();output=next(x for x in lines if x.startswith('OUTPUT '));expected=[(f'p{i:04}',sum(1+j%3 for j in range(i,c['n'],c['groups']))) for i in range(c['groups'])]
  found=[(p,int(count)) for p,count in re.findall(pattern,output)];assert found==expected
  expected_output='OUTPUT ['+', '.join(f'DispatchCount {{ layer: "pilot", operation: "count", path: "{p}", count: {count} }}' for p,count in expected)+']';assert output==expected_output
  if key in outputs:assert outputs[key]==output;comparisons+=1
  else:outputs[key]=output
  stats={line.split(' ',1)[0]:ast.literal_eval(line.split(' ',1)[1]) for line in lines if not line.startswith('OUTPUT ')};assert stats['CAPACITY']>=c['groups'];m=stats['MATERIALIZATION'];u=stats['MATERIALIZATION_USABLE'];drop=stats['CLEANUP'];du=stats['CLEANUP_USABLE'];assert len(m)==len(drop)==6 and len(u)==len(du)==3
  assert m[5]+drop[5]==u[2]+du[2]==0 and m[5]==56*stats['CAPACITY'];assert drop[3]==du[0]==0
  row=dict(key=key,label=label,log=o['log'],repeat=c['repeat'],metrics=dict(requested_peak=m[4],usable_peak=u[1],requested_retained=m[5],usable_retained=u[2],requested_traffic=m[3]+drop[3],usable_traffic=u[0]+du[0],allocations=m[0]+drop[0],deallocations=m[1]+drop[1],reallocations=m[2]+drop[2]),phases=stats);groups[key][label].append(row);all_rows.append(row)
assert completion['full_output_domains']==len(outputs)==len(configs)//3
accounts=[];failed=Counter();fail_metrics=defaultdict(Counter);extrema=defaultdict(dict);variation=defaultdict(Counter)
for key,values in sorted(groups.items()):
 assert set(values)=={'control','batch','incremental'} and all(len(rows)==3 for rows in values.values())
 maxima={label:{metric:max(row['metrics'][metric] for row in rows) for metric in rows[0]['metrics']} for label,rows in values.items()}
 for label,rows in values.items():
  for metric in rows[0]['metrics']:
   if len({row['metrics'][metric] for row in rows})>1:variation[label][metric]+=1
 for label in ['batch','incremental']:
  a=dict(key=key,candidate=label,metrics={},failures=[])
  for metric,base in maxima['control'].items():
   value=maxima[label][metric];delta=value-base;charge=max(0,delta)
   if metric.endswith('retained'):cap,percent=512,2
   elif metric in ['allocations','deallocations','reallocations']:cap,percent=16,1
   else:cap,percent=4096,2
   passed=charge<=cap and charge*100<=percent*base;a['metrics'][metric]=dict(baseline=base,candidate=value,delta=delta,positive_charge=charge,absolute_cap=cap,percent_cap=percent,passed=passed)
   if not passed:a['failures'].append(metric);fail_metrics[label][metric]+=1
   low,high=extrema[label].get(metric,(delta,delta));extrema[label][metric]=(min(low,delta),max(high,delta))
  accounts.append(a);failed[label]+=bool(a['failures'])
summary=dict(commands=len(commands),all_direct_spawns_counted=True,controls=len(observations),configurations_per_source=len(configs),images=3,exact_expected_outputs=len(observations),full_output_comparisons=comparisons,distinct_output_domains=len(outputs),owner_test_invocations_per_source={b['label']:int(re.search(r'test result: ok\. (\d+) passed',raws[by_name[b['label']+'-owner-tests']['log']]).group(1)) for b in builds},owner_clippy_configurations=3,harness_clippy_configurations=3,accounts=len(accounts),failed_accounts=dict(failed),failed_metrics=dict(fail_metrics),delta_extrema=dict(extrema),within_source_variation=dict(variation),all_output_storage_released=True,retained_output_capacity_verified=True,prior_charges_unchanged=True,full_consumer_qualification=False,admitted=False,timing_claim=False,seconds=time.monotonic()-start)
for n,v in [('resource-observations.json',all_rows),('accounts.json',accounts),('verification.json',summary)]:save(n,v)
print(json.dumps(summary,indent=2))
