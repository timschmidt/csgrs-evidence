from pathlib import Path
from statistics import median
import ast,gzip,hashlib,json,time
s=Path(__file__).parent;start=time.monotonic();load=lambda p:json.loads(Path(p).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
done=load(s/'completion.json');started=load(s/'started.json');assert done['exit_code']==0 and done['source_restored'] and done['seconds']<2400
assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256']
external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
for name,v in load(s/'harness.json').items():
 raw=(s/'consumer'/name).read_bytes();assert len(raw)==v['bytes'] and sha(raw)==v['sha256']
commands=load(s/'commands.json');assert len(commands)==done['commands']==1360 and len({c['name'] for c in commands})==1360;by_log={};tool_raw={}
def read(c):
 stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];return raw.decode()
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];by_log[c['log']]=c
 if c['executable']:assert c['command'][0]=='trace-borrowed-runtime-control' and c['cwd']==str(s/'consumer') and c['affinity']==[started['cpu']] and c['seconds']<=60 and c['raw_bytes']<=64*1024**2
 else:
  raw=read(c);tool_raw[c['log']]=raw
  if 'clippy' in c['name']:assert not any(line.startswith(('warning:','warning[')) for line in raw.splitlines())
configs=[]
for n in [1,12,65,256,4096]:
 for groups in sorted({1,min(17,n),n}):
  for length in [5,256]:
   for mode in ['snapshot','take']:configs.append(dict(n=n,groups=groups,length=length,mode=mode,trace='active',rounds=(1048576+n-1)//n))
for n in [1,4096]:
 for length in [5,256]:
  for mode in ['snapshot','take']:configs.append(dict(n=n,groups=1,length=length,mode=mode,trace='passive',rounds=(1048576+n-1)//n))
assert load(s/'configurations.json')==configs and len(configs)==56
builds=load(s/'builds.json');assert [b['label'] for b in builds]==['control','borrowed']
sources={'control':s.parent/'trace-materialization-pilot/control.rs','borrowed':s.parent/'trace-borrowed-key-pilot/candidate.rs'}
revisions={'control':'4f41bd58415d936968e1955dbd431f0cb5e988f0','borrowed':'d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0'}
for b in builds:
 assert b['revision']==revisions[b['label']]==tool_raw[b['label']+'-head.log.gz'].strip();assert b['source_sha256']==sha(sources[b['label']].read_bytes());raw=Path(b['image']['path']).read_bytes();assert len(raw)==b['image']['bytes'] and sha(raw)==b['image']['sha256']
observations=load(s/'observations.json');assert len(observations)==done['controls']==1344 and len({o['log'] for o in observations})==1344;assert {c['log'] for c in commands if c['executable']}=={o['log'] for o in observations};cursor=0;pairs=[];summaries=[]
for di,cfg in enumerate(configs):
 domain_pairs=[];args=[str(cfg[k]) for k in ['n','groups','length','mode','trace','rounds']]
 expected=[f'ROW pilot|count|p{i:04}'+('x'*(cfg['length']-5))+'|'+str(sum(1 for j in range(cfg['n']) if j%cfg['groups']==i)) for i in range(cfg['groups'])] if cfg['trace']=='active' else []
 for rep in range(12):
  obs={};outputs={};order=['control','borrowed'] if rep%2==0 else ['borrowed','control']
  for label in order:
   o=observations[cursor];cursor+=1;assert o['config']==cfg and o['domain']==di and o['rep']==rep and o['label']==label;c=by_log[o['log']];assert c['command']==['trace-borrowed-runtime-control',*args];assert c['executable']==next(b['image']['path'] for b in builds if b['label']==label);lines=read(c).splitlines();assert lines[0]=='CONFIG '+' '.join(args) and lines[-1]==f"COMPLETE {cfg['rounds']}"
   assert lines[4:-1]==expected and len(lines)==len(expected)+5
   for i,(field,prefix) in enumerate([('cpu_ns','CPU_NS'),('wall_ns','WALL_NS'),('clock_resolution_ns','CLOCK_RESOLUTION_NS')],1):assert lines[i]==f'{prefix} {o[field]}' and o[field]>0
   outputs[label]=lines[:1]+lines[4:];obs[label]=o
  assert outputs['control']==outputs['borrowed'];p=dict(domain=di,config=cfg,rep=rep,order=order,control_cpu_ns=obs['control']['cpu_ns'],borrowed_cpu_ns=obs['borrowed']['cpu_ns'],delta_cpu_ns=obs['borrowed']['cpu_ns']-obs['control']['cpu_ns'],ratio_cpu=obs['borrowed']['cpu_ns']/obs['control']['cpu_ns'],control_wall_ns=obs['control']['wall_ns'],borrowed_wall_ns=obs['borrowed']['wall_ns'],resolution_ns=max(o['clock_resolution_ns'] for o in obs.values()));pairs.append(p);domain_pairs.append(p)
 def stats(field):
  v=[p[field] for p in domain_pairs];return dict(min=min(v),median=median(v),max=max(v))
 summaries.append(dict(domain=di,config=cfg,control_cpu_ns=stats('control_cpu_ns'),borrowed_cpu_ns=stats('borrowed_cpu_ns'),paired_delta_cpu_ns=stats('delta_cpu_ns'),paired_ratio_cpu=stats('ratio_cpu'),positive_pairs=sum(p['delta_cpu_ns']>0 for p in domain_pairs),clock_resolution_ns=max(p['resolution_ns'] for p in domain_pairs)))
assert cursor==1344 and tool_raw['restored-head.log.gz'].strip()==revisions['control'] and tool_raw['restored-clean.log.gz']==''
summary=dict(commands=1360,all_direct_spawns_counted=True,controls=1344,paired_full_output_matches=672,independent_expected_outputs=1344,domains=56,completed_rounds=sum(o['config']['rounds'] for o in observations),minimum_completed_events=min(o['config']['rounds']*o['config']['n'] for o in observations),harness_clippy_configurations=2,images=2,source_restored=True,all_twelve_slower_domains=[d['domain'] for d in summaries if d['positive_pairs']==12],all_twelve_faster_domains=[d['domain'] for d in summaries if d['positive_pairs']==0],minimum_cpu_ns=min(o['cpu_ns'] for o in observations),maximum_cpu_ns=max(o['cpu_ns'] for o in observations),producer_seconds=done['seconds'],admitted=False,whole_geometry_and_lifetime_qualification=False,prior_charges_unchanged=True,seconds=time.monotonic()-start)
for n,v in [('paired-samples.json',pairs),('domain-summaries.json',summaries),('verification.json',summary)]:save(n,v)
print(json.dumps(summary,indent=2))
for d in summaries:
 if d['positive_pairs']==12:print('ALL_SLOWER',d['domain'],d['config'],d['paired_delta_cpu_ns'],d['paired_ratio_cpu'])
