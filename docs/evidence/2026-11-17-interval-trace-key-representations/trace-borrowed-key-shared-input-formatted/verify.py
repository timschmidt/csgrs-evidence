from pathlib import Path
from collections import Counter,defaultdict
import ast,gzip,hashlib,json,time
s=Path(__file__).parent;start=time.monotonic();sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n');done=load(s/'completion.json');started=load(s/'started.json');assert done['exit_code']==0 and done['seconds']<1200 and done['original_elapsed_seconds']<1200 and done['aggregate_commands']==563
assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256']
external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
for label,v in load(s/'sources.json').items():
 raw=Path(v['source']).read_bytes();prefix=raw[:raw.index(b'#[cfg(test)]\nmod tests')];assert sha(raw)==v['source_sha256'] and sha(prefix)==v['prefix_sha256'] and len(prefix)==v['prefix_bytes'];assert (s/'consumer'/(label+'.rs')).read_bytes()==prefix+(s/'instrumentation.rs').read_bytes()
for name,v in load(s/'harness.json').items():
 raw=(s/'consumer'/name).read_bytes();assert sha(raw)==v['sha256'] and len(raw)==v['bytes']
assert (s/'consumer/allocation.rs').read_bytes()==(s.parent/'trace-materialization-pilot/consumer/allocation.rs').read_bytes()
commands=load(s/'commands.json');assert len(commands)==done['commands']==556 and len({c['name'] for c in commands})==556;raws={};by_log={}
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];raws[c['log']]=raw.decode();by_log[c['log']]=c
 if c['executable']:assert c['command'][0]=='trace-shared-input-control' and c['cwd']==str(s/'consumer') and c['seconds']<=60 and len(raw)<=64*1024**2
 if 'clippy' in c['name']:assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines())
image=load(s/'build.json')['image'];raw=Path(image['path']).read_bytes();assert len(raw)==image['bytes'] and sha(raw)==image['sha256']
configs=[dict(**cfg,order=order) for cfg in load(s.parent/'trace-materialization-pilot/configurations.json') for order in ['control-first','candidate-first']];assert load(s/'configurations.json')==configs
obs=load(s/'observations.json');assert len(obs)==done['controls']==552 and len({o['log'] for o in obs})==552;assert {o['log'] for o in obs}=={c['log'] for c in commands if c['executable']};pairs=[];failures=Counter();extrema=defaultdict(dict);counts_equal=0;record_requested_equal=0
for o,cfg in zip(obs,configs,strict=True):
 assert o['config']==cfg;command=by_log[o['log']];assert command['command']==['trace-shared-input-control',str(cfg['n']),str(cfg['groups']),cfg['mode'],str(cfg['warm']),cfg['order']] and command['executable']==image['path'];lines=raws[o['log']].splitlines();assert lines[-2:]==[f"IDENTICAL_ITERATION {cfg['n']}",'COMPLETE'];blocks={};order=[];current=None
 for line in lines[:-2]:
  if line.startswith('BEGIN '):current=line.split()[1];assert current not in blocks;blocks[current]={};order.append(current)
  else:
   name,value=line.split(' ',1);assert name not in blocks[current];blocks[current][name]=value if name=='OUTPUT' else ast.literal_eval(value)
 assert order==(['control','candidate'] if cfg['order']=='control-first' else ['candidate','control'])
 n=cfg['n'];g=cfg['groups'];expected='['+', '.join(f'DispatchCount {{ layer: "pilot", operation: "count", path: "p{i:04}", count: {sum(1+j%3 for j in range(i,n,g))} }}' for i in range(g))+']'
 assert blocks['control']['OUTPUT']==blocks['candidate']['OUTPUT']==expected
 assert blocks['control']['ITERATION']==blocks['candidate']['ITERATION'];iteration=blocks['control']['ITERATION'];assert len(iteration)==n
 assert len({x[0][4] for x in iteration})==n and Counter(x[1] for x in iteration)==Counter(1+i%3 for i in range(n))
 if n:assert len({tuple(x[0][:4]) for x in iteration})==1 and all(x[0][1]==x[0][3]==x[0][5]==5 for x in iteration)
 phases={}
 for label,b in blocks.items():
  assert set(b)=={'ITERATION','OUTPUT','CAPACITY','RECORDING','RECORDING_USABLE','MATERIALIZATION','MATERIALIZATION_USABLE','CLEANUP','CLEANUP_USABLE'};assert b['CAPACITY']==g and b['MATERIALIZATION'][5]==56*g and b['MATERIALIZATION'][5]+b['CLEANUP'][5]==b['MATERIALIZATION_USABLE'][2]+b['CLEANUP_USABLE'][2]==0
  phases[label]={}
  for phase,requested,usable in [('recording',b['RECORDING'],b['RECORDING_USABLE']),('materialization',b['MATERIALIZATION'],b['MATERIALIZATION_USABLE'])]:
   d=b['CLEANUP'] if phase=='materialization' else (0,)*6;u=b['CLEANUP_USABLE'] if phase=='materialization' else (0,)*3
   phases[label][phase]=dict(requested_peak=requested[4],usable_peak=usable[1],requested_retained=requested[5],usable_retained=usable[2],requested_traffic=requested[3]+d[3],usable_traffic=usable[0]+u[0],allocations=requested[0]+d[0],deallocations=requested[1]+d[1],reallocations=requested[2]+d[2])
 counts_equal+=all(phases['control'][phase][metric]==phases['candidate'][phase][metric] for phase in ['recording','materialization'] for metric in ['allocations','deallocations','reallocations'])
 record_requested_equal+=blocks['control']['RECORDING']==blocks['candidate']['RECORDING']
 for phase in ['recording','materialization']:
  account=dict(config=cfg,phase=phase,metrics={},failures=[])
  for metric,baseline in phases['control'][phase].items():
   value=phases['candidate'][phase][metric];delta=value-baseline;charge=max(0,delta)
   if metric.endswith('retained'):cap,percent=512,2
   elif metric in ['allocations','deallocations','reallocations']:cap,percent=16,1
   else:cap,percent=4096,2
   passed=charge<=cap and charge*100<=percent*baseline;account['metrics'][metric]=dict(baseline=baseline,candidate=value,delta=delta,positive_charge=charge,absolute_cap=cap,percent_cap=percent,passed=passed)
   if not passed:account['failures'].append(metric)
   lo,hi=extrema[phase].get(metric,(delta,delta));extrema[phase][metric]=(min(lo,delta),max(hi,delta))
  failures[phase]+=bool(account['failures']);pairs.append(account)
summary=dict(commands=556,controls=552,full_output_pairs=552,independent_expected_outputs=1104,identical_actual_iteration_pairs=552,equal_allocation_free_reallocation_pairs=counts_equal,identical_requested_recording_pairs=record_requested_equal,accounts=len(pairs),failed_accounts=dict(failures),delta_extrema=dict(extrema),production_prefixes_unchanged=True,allocator_unchanged=True,source_failures_preserved=True,admitted=False,timing_claim=False,whole_lifetime_claim=False,producer_seconds=done['seconds'],seconds=time.monotonic()-start)
save('paired-accounts.json',pairs);save('verification.json',summary);print(json.dumps(summary,indent=2))
