from pathlib import Path
from collections import defaultdict
from statistics import median
import ast,gzip,hashlib,json,time
s=Path(__file__).parent;start=time.monotonic();load=lambda p:json.loads(Path(p).read_text());sha=lambda b:hashlib.sha256(b).hexdigest();save=lambda n,v:(s/n).write_text(json.dumps(v,indent=2)+'\n')
done=load(s/'completion.json');started=load(s/'started.json');assert done['exit_code']==0 and done['seconds']<1200
assert sha((s/'run.py').read_bytes())==started['driver_sha256'] and sha((s/'PROTOCOL.md').read_bytes())==started['protocol_sha256'];external=[n.func.attr for n in ast.walk(ast.parse((s/'run.py').read_text())) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and isinstance(n.func.value,ast.Name) and n.func.value.id=='subprocess'];assert external==['Popen']
for name,v in load(s/'sources.json').items():assert (s/'consumer'/name).read_bytes()==Path(v['source']).read_bytes() and sha((s/'consumer'/name).read_bytes())==v['sha256']
for name,v in load(s/'harness.json').items():
 raw=(s/'consumer'/name).read_bytes();assert len(raw)==v['bytes'] and sha(raw)==v['sha256']
assert not (s/'consumer/allocation.rs').exists()
commands=load(s/'commands.json');assert len(commands)==done['commands']==197 and len({c['name'] for c in commands})==197;by_log={}
def read(c):
 stored=(s/c['log']).read_bytes();assert len(stored)==c['stored_bytes'] and sha(stored)==c['stored_sha256'];raw=gzip.decompress(stored);assert len(raw)==c['raw_bytes'] and sha(raw)==c['raw_sha256'];return raw.decode()
for c in commands:
 assert c['exit_code']==0 and not c['timeout'];by_log[c['log']]=c
 if c['executable']:assert c['command'][0]=='trace-shared-runtime-control' and c['cwd']==str(s/'consumer') and c['affinity']==[started['cpu']] and c['seconds']<=60 and c['raw_bytes']<=64*1024**2
 else:
  raw=read(c)
  if 'clippy' in c['name']:assert not any(line.startswith(('warning:','warning[')) for line in raw.splitlines())
image=load(s/'build.json')['image'];raw=Path(image['path']).read_bytes();assert len(raw)==image['bytes'] and sha(raw)==image['sha256']
configs=[dict(n=n,groups=g,length=length,mode=mode,rounds=(1048576+n-1)//n,repeat=rep,order='control-first' if rep%2==0 else 'borrowed-first') for n in [256,4096] for g in [17,n] for length in [5,256] for mode in ['snapshot','take'] for rep in range(12)];assert load(s/'configurations.json')==configs
observations=load(s/'observations.json');assert len(observations)==done['controls']==192 and len({o['log'] for o in observations})==192;assert {o['log'] for o in observations}=={c['log'] for c in commands if c['executable']};pairs=[];groups=defaultdict(list)
for o,cfg in zip(observations,configs,strict=True):
 assert o['config']==cfg;c=by_log[o['log']];args=[str(cfg[k]) for k in ['n','groups','length','mode','rounds','order']];assert c['command']==['trace-shared-runtime-control',*args] and c['executable']==image['path'];lines=read(c).splitlines();assert lines[0]=='CONFIG '+' '.join(args) and lines[-1]==f"COMPLETE {cfg['rounds']}"
 left=ast.literal_eval(lines[1].removeprefix('ITERATION_CONTROL '));right=ast.literal_eval(lines[2].removeprefix('ITERATION_BORROWED '));assert left==right and len(left)==cfg['n'] and len({k[4] for k,count in left})==cfg['n'];assert len({tuple(k[:4]) for k,count in left})==1 and all(k[1]==k[3]==5 and k[5]==cfg['length'] and count==1 for k,count in left)
 resolution=int(lines[3].removeprefix('CLOCK_RESOLUTION_NS '));assert resolution>0;blocks={};order=[];label=None
 for line in lines[4:-1]:
  if line.startswith('BEGIN '):label=line.split()[1];assert label not in blocks;blocks[label]=dict(rows=[]);order.append(label)
  elif line.startswith('ROW '):blocks[label]['rows'].append(line)
  else:
   key,value=line.split();assert key in ['CPU_NS','WALL_NS'] and key not in blocks[label];blocks[label][key]=int(value);assert int(value)>0
 assert order==(['control','borrowed'] if cfg['order']=='control-first' else ['borrowed','control'])
 expected=[f'ROW pilot|count|p{i:04}'+('x'*(cfg['length']-5))+'|'+str(len(range(i,cfg['n'],cfg['groups']))) for i in range(cfg['groups'])];assert blocks['control']['rows']==blocks['borrowed']['rows']==expected
 p=dict(config=cfg,control_cpu_ns=blocks['control']['CPU_NS'],borrowed_cpu_ns=blocks['borrowed']['CPU_NS'],delta_cpu_ns=blocks['borrowed']['CPU_NS']-blocks['control']['CPU_NS'],ratio_cpu=blocks['borrowed']['CPU_NS']/blocks['control']['CPU_NS'],control_wall_ns=blocks['control']['WALL_NS'],borrowed_wall_ns=blocks['borrowed']['WALL_NS'],resolution_ns=resolution);pairs.append(p);groups[tuple(cfg[k] for k in ['n','groups','length','mode'])].append(p)
summaries=[]
for key,ps in groups.items():
 assert len(ps)==12 and {p['config']['repeat'] for p in ps}==set(range(12))
 def stats(field):
  vs=[p[field] for p in ps];return dict(min=min(vs),median=median(vs),max=max(vs))
 summaries.append(dict(key=key,control_cpu_ns=stats('control_cpu_ns'),borrowed_cpu_ns=stats('borrowed_cpu_ns'),delta_cpu_ns=stats('delta_cpu_ns'),ratio_cpu=stats('ratio_cpu'),positive_pairs=sum(p['delta_cpu_ns']>0 for p in ps),by_order={order:dict(positive_pairs=sum(p['delta_cpu_ns']>0 for p in ps if p['config']['order']==order),median_ratio=median(p['ratio_cpu'] for p in ps if p['config']['order']==order)) for order in ['control-first','borrowed-first']}))
summary=dict(commands=197,controls=192,paired_full_output_matches=192,independent_expected_outputs=384,identical_iteration_pairs=192,domains=16,minimum_completed_events=min(c['n']*c['rounds'] for c in configs),production_modules_unchanged=True,no_allocator_interposer=True,all_twelve_slower_domains=[d['key'] for d in summaries if d['positive_pairs']==12],all_twelve_faster_domains=[d['key'] for d in summaries if d['positive_pairs']==0],minimum_cpu_ns=min(min(p['control_cpu_ns'],p['borrowed_cpu_ns']) for p in pairs),producer_seconds=done['seconds'],admitted=False,original_signal_preserved=True,seconds=time.monotonic()-start)
for name,v in [('paired-samples.json',pairs),('domain-summaries.json',summaries),('verification.json',summary)]:save(name,v)
print(json.dumps(summary,indent=2))
for d in summaries:print(d['key'],d['positive_pairs'],d['ratio_cpu'],d['delta_cpu_ns'])
