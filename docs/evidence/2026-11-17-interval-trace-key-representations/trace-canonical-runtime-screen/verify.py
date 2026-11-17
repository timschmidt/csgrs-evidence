from pathlib import Path
from statistics import median
import ast,gzip,hashlib,json,time
s=Path(__file__).parent;start=time.monotonic();load=lambda p:json.loads(Path(p).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
done=load(s/'completion.json');started=load(s/'started.json');assert done['exit_code']==0 and done['source_restored'] and done['seconds']<1200
assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256']
external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
for name,v in load(s/'harness.json').items():
 raw=(s/'consumer'/name).read_bytes();assert len(raw)==v['bytes'] and sha(raw)==v['sha256']
commands=load(s/'commands.json');assert len(commands)==done['commands']==400 and len({c['name'] for c in commands})==400;raws={};by_log={}
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];raws[c['log']]=raw.decode();by_log[c['log']]=c
 if c['executable']:assert c['command'][0]=='trace-runtime-control' and c['cwd']==str(s/'consumer') and c['affinity']==[started['cpu']] and c['seconds']<=60 and len(raw)<=64*1024**2
 if 'clippy' in c['name']:assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines())
configs=[dict(length=n,identities=i,mode=m) for n in [5,64,4096,32768] for i in [1,2] for m in ['active','passive']];assert load(s/'configurations.json')==configs
builds=load(s/'builds.json');assert [b['label'] for b in builds]==['control','canonical']
sources={'control':s.parent/'trace-materialization-pilot/control.rs','canonical':s.parent/'trace-canonical-capacity-pilot/candidate.rs'}
revisions={'control':'4f41bd58415d936968e1955dbd431f0cb5e988f0','canonical':'61298adca134f0c2cb7181b015e9d4d4ccc6684c'}
for b in builds:
 assert b['revision']==revisions[b['label']]==raws[b['label']+'-head.log.gz'].strip();assert b['source_sha256']==sha(sources[b['label']].read_bytes());raw=Path(b['image']['path']).read_bytes();assert len(raw)==b['image']['bytes'] and sha(raw)==b['image']['sha256']
observations=load(s/'observations.json');assert len(observations)==done['controls']==384;assert len({o['log'] for o in observations})==384;assert {c['log'] for c in commands if c['executable']}=={o['log'] for o in observations};cursor=0;pairs=[];summaries=[]
for di,cfg in enumerate(configs):
 domain_pairs=[]
 expected=[f'ROW {j} layer|operation|'+('x'*cfg['length'])+'|4096' for j in range(4)] if cfg['mode']=='active' else []
 for rep in range(12):
  obs={};outputs={};order=['control','canonical'] if rep%2==0 else ['canonical','control']
  for label in order:
   o=observations[cursor];cursor+=1;assert o['config']==cfg and o['domain']==di and o['rep']==rep and o['label']==label;c=by_log[o['log']];assert c['command']==['trace-runtime-control',str(cfg['length']),str(cfg['identities']),cfg['mode']];assert c['executable']==next(b['image']['path'] for b in builds if b['label']==label);lines=raws[o['log']].splitlines();assert lines[0]==f"CONFIG {cfg['length']} {cfg['identities']} {cfg['mode']} 4 4096" and lines[-1]=='COMPLETE'
   assert lines[4:-1]==expected and len(lines)==len(expected)+5
   for i,(field,prefix) in enumerate([('cpu_ns','CPU_NS'),('wall_ns','WALL_NS'),('clock_resolution_ns','CLOCK_RESOLUTION_NS')],1):
    assert lines[i]==f'{prefix} {o[field]}' and o[field]>0
   outputs[label]=lines[:1]+lines[4:];obs[label]=o
  assert outputs['control']==outputs['canonical'];p=dict(domain=di,config=cfg,rep=rep,order=order,control_cpu_ns=obs['control']['cpu_ns'],canonical_cpu_ns=obs['canonical']['cpu_ns'],delta_cpu_ns=obs['canonical']['cpu_ns']-obs['control']['cpu_ns'],control_wall_ns=obs['control']['wall_ns'],canonical_wall_ns=obs['canonical']['wall_ns'],resolution_ns=max(o['clock_resolution_ns'] for o in obs.values()));pairs.append(p);domain_pairs.append(p)
 def stats(field):
  v=[p[field] for p in domain_pairs];return dict(min=min(v),median=median(v),max=max(v))
 summaries.append(dict(domain=di,config=cfg,control_cpu_ns=stats('control_cpu_ns'),canonical_cpu_ns=stats('canonical_cpu_ns'),paired_delta_cpu_ns=stats('delta_cpu_ns'),positive_pairs=sum(p['delta_cpu_ns']>0 for p in domain_pairs),clock_resolution_ns=max(p['resolution_ns'] for p in domain_pairs)))
assert cursor==384 and raws['restored-head.log.gz'].strip()==revisions['control'] and raws['restored-clean.log.gz']==''
long=[d for d in summaries if d['config']['mode']=='active' and d['config']['length']>=4096]
summary=dict(commands=400,all_direct_spawns_counted=True,controls=384,paired_full_output_matches=192,independent_expected_outputs=384,domains=16,completed_rounds=1536,events_per_process=16384,harness_clippy_configurations=2,images=2,source_restored=True,long_active_domains_all_twelve_positive=all(d['positive_pairs']==12 for d in long),long_active_smallest_paired_increase_ns=min(d['paired_delta_cpu_ns']['min'] for d in long),producer_seconds=done['seconds'],admitted=False,whole_geometry_and_lifetime_qualification=False,prior_charges_unchanged=True,seconds=time.monotonic()-start)
for n,v in [('paired-samples.json',pairs),('domain-summaries.json',summaries),('verification.json',summary)]:save(n,v)
print(json.dumps(summary,indent=2))
for d in summaries:
 print(d['config'],d['paired_delta_cpu_ns'],d['positive_pairs'])
