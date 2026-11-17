from pathlib import Path
from collections import defaultdict,Counter
import ast,gzip,hashlib,json,re,time
s=Path(__file__).parent;old=s.parent/'trace-materialization-pilot';load=lambda p:json.loads(Path(p).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');start=time.monotonic();done=load(s/'completion.json');started=load(s/'started.json');prepared=load(s/'prepared-source.json');assert done['exit_code']==0 and done['restored'] and done['seconds']<1800;assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256'];assert sha((s/'candidate.rs').read_bytes())==prepared['candidate_sha256']
for n,h in prepared['consumer'].items():assert sha((s/'consumer'/n).read_bytes())==h and (s/'consumer'/n).read_bytes()==(old/'consumer'/n).read_bytes()
for first,last in [('impl Hasher for DispatchHasher','type ActiveCounts'),('#[inline]\npub fn record(','#[cold]')]:
 before=(old/'control.rs').read_text();after=(s/'candidate.rs').read_text();assert before[before.index(first):before.index(last,before.index(first))]==after[after.index(first):after.index(last,after.index(first))]
external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
commands=load(s/'commands.json');assert len(commands)==done['commands']<=500;assert len({c['name'] for c in commands})==len(commands);raws={}
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];raws[c['log']]=raw.decode()
 if c['executable']:assert c['command'][0]=='trace-materialization-control' and c['cwd']==str(old/'consumer') and c['seconds']<=60 and len(raw)<=64*1024**2
 if 'clippy' in c['name']:assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines())
assert 'test result: ok. 9 passed; 0 failed' in raws['owner-tests.log.gz'];assert 'dispatch_snapshot_preserves_order_and_counts_until_taken ... ok' in raws['owner-tests.log.gz']
build=load(s/'build.json');assert build['revision']==done['revision']==raws['candidate-head.log.gz'].strip() and build['source_sha256']==prepared['candidate_sha256'];baseline=load(s/'baseline.json');assert baseline['verification_sha256']==sha((old/'verification.json').read_bytes())
for b in [build,baseline['build']]:
 data=Path(b['image']['path']).read_bytes();assert len(data)==b['image']['bytes'] and sha(data)==b['image']['sha256']
observations=load(s/'observations.json');configs=load(s/'configurations.json');assert configs==load(old/'configurations.json') and len(observations)==len(configs)==276;assert [o['config'] for o in observations]==configs;old_commands={c['log']:c for c in load(old/'commands.json')};groups=defaultdict(lambda:defaultdict(list));rows=[]
for o,p in zip(observations,baseline['observations'],strict=True):
 assert o['config']==p['config'] and o['prior_log']==p['log'];c=o['config'];key=(c['n'],c['groups'],c['mode'],c['warm']);pcommand=old_commands[p['log']];encoded=(old/p['log']).read_bytes();assert sha(encoded)==pcommand['stored_sha256'];prior=gzip.decompress(encoded);assert sha(prior)==pcommand['raw_sha256'];new=raws[o['log']];outputs=[]
 for label,text in [('control',prior.decode()),('canonical',new)]:
  lines=text.splitlines();output=next(x for x in lines if x.startswith('OUTPUT '));outputs.append(output);pairs=[(f'p{i:04}',sum(1+j%3 for j in range(i,c['n'],c['groups']))) for i in range(c['groups'])];expected='OUTPUT ['+', '.join(f'DispatchCount {{ layer: "pilot", operation: "count", path: "{path}", count: {count} }}' for path,count in pairs)+']';assert output==expected
  f={x.split(' ',1)[0]:ast.literal_eval(x.split(' ',1)[1]) for x in lines if not x.startswith('OUTPUT ')};m=f['MATERIALIZATION'];d=f['CLEANUP'];u=f['MATERIALIZATION_USABLE'];du=f['CLEANUP_USABLE'];assert m[5]==56*f['CAPACITY'] and f['CAPACITY']>=c['groups'] and m[5]+d[5]==u[2]+du[2]==0
  phases={}
  for phase,rs,us in [('recording',f['RECORDING'],f['RECORDING_USABLE']),('materialization',m,u)]:
   phases[phase]=dict(requested_peak=rs[4],usable_peak=us[1],requested_retained=rs[5],usable_retained=us[2],requested_traffic=rs[3]+(d[3] if phase=='materialization' else 0),usable_traffic=us[0]+(du[0] if phase=='materialization' else 0),allocations=rs[0]+(d[0] if phase=='materialization' else 0),deallocations=rs[1]+(d[1] if phase=='materialization' else 0),reallocations=rs[2]+(d[2] if phase=='materialization' else 0))
  row=dict(key=key,label=label,repeat=c['repeat'],capacity=f['CAPACITY'],phases=phases,raw_fields=f);groups[key][label].append(row);rows.append(row)
 assert outputs[0]==outputs[1]
accounts=[];failures=Counter();metrics=defaultdict(Counter);extrema=defaultdict(dict)
for key,by_label in sorted(groups.items()):
 assert set(by_label)=={'control','canonical'} and all(len(rs)==3 for rs in by_label.values())
 for phase in ['recording','materialization']:
  values={label:{m:max(row['phases'][phase][m] for row in rs) for m in rs[0]['phases'][phase]} for label,rs in by_label.items()};a=dict(key=key,phase=phase,metrics={},failures=[])
  for metric,baseline_value in values['control'].items():
   value=values['canonical'][metric];delta=value-baseline_value;charge=max(0,delta)
   if metric.endswith('retained'):cap,percent=512,2
   elif metric in ['allocations','deallocations','reallocations']:cap,percent=16,1
   else:cap,percent=4096,2
   passed=charge<=cap and charge*100<=percent*baseline_value;a['metrics'][metric]=dict(baseline=baseline_value,candidate=value,delta=delta,positive_charge=charge,absolute_cap=cap,percent_cap=percent,passed=passed)
   if not passed:a['failures'].append(metric);metrics[phase][metric]+=1
   lo,hi=extrema[phase].get(metric,(delta,delta));extrema[phase][metric]=(min(lo,delta),max(hi,delta))
  failures[phase]+=bool(a['failures']);accounts.append(a)
summary=dict(commands=len(commands),all_direct_spawns_counted=True,controls=len(observations),full_output_matches=276,independent_expected_outputs=552,owner_tests=9,strict_clippy_configurations=2,source_restored=True,accounts=len(accounts),failed_accounts=dict(failures),failed_metrics=dict(metrics),delta_extrema=dict(extrema),all_report_storage_released=True,inactive_guard_and_hash_writer_unchanged=True,producer_seconds=done['seconds'],runtime_qualification_pending=True,whole_lifetime_and_geometry_qualification_pending=True,prior_charges_unchanged=True,admitted=False,timing_claim=False,seconds=time.monotonic()-start)
for n,v in [('resource-observations.json',rows),('accounts.json',accounts),('verification.json',summary)]:save(n,v)
print(json.dumps(summary,indent=2))
