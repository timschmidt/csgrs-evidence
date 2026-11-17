from pathlib import Path
import ast,gzip,hashlib,json,os,re,resource,subprocess,time
s=Path(__file__).parent;old=s.parent/'solver-five-repair-resources';started=time.monotonic();deadline=started+120
save=lambda n,d:(s/n).write_text(json.dumps(d,indent=2)+'\n');sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert not os.environ.get('LD_PRELOAD');assert not (s/'completion.json').exists()
builds={r['label']:r for r in json.loads((old/'builds.json').read_text()) if r['features']=='trace' and r['label'] in ['fixed','five']};assert set(builds)=={'fixed','five'}
rows=[];refs={};symbols={}
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
 assert time.monotonic()<deadline
 assert sum(p.stat().st_size for p in s.rglob('*') if p.is_file())<32*1024**2
 assert __import__('shutil').disk_usage('/mnt/development').free>=20*1024**3

def file_limit():resource.setrlimit(resource.RLIMIT_FSIZE,(8*1024**2,8*1024**2))
for b in builds.values():assert sha(b['artifacts']['resource']['path'])==b['artifacts']['resource']['sha256']
origin=s.parent/'residual-owner-review-attempt-01/trace-attribution'
for name in ['malloc_trace.c','malloc_trace.so']:assert (s/name).read_bytes()==(origin/name).read_bytes()
save('provenance.json',dict(images={k:b['artifacts']['resource'] for k,b in builds.items()},interposer={name:dict(source=str(origin/name),sha256=sha(s/name)) for name in ['malloc_trace.c','malloc_trace.so']},started=time.time(),deadline_seconds=120,original_resource_stage=str(old)))
try:
 for label,b in builds.items():
  image=b['artifacts']['resource']['path']
  for recording,pairs in [('active',12),('passive',2)]:
   for rep in range(pairs):
    for mode in ['plain','interposed']:
     guard();name=f'{label}-{recording}-{rep}-{mode}';cmd=[image,'0','observe','1','165',recording,'strict','reuse'];env=dict(os.environ)
     if mode=='interposed':env['LD_PRELOAD']=str(s/'malloc_trace.so')
     paths=[s/(name+'.stdout'),s/(name+'.stderr')];timed=False
     with paths[0].open('wb') as out,paths[1].open('wb') as err:
      p=subprocess.Popen(cmd,env=env,stdout=out,stderr=err,preexec_fn=file_limit)
      try:p.wait(timeout=min(20,deadline-time.monotonic()))
      except subprocess.TimeoutExpired:timed=True;p.kill();p.wait()
     contents=[path.read_bytes() for path in paths];logs=[]
     for path,raw in zip(paths,contents):
      compressed=Path(str(path)+'.gz')
      with gzip.open(compressed,'wb') as out:out.write(raw)
      logs.append(dict(path=compressed.name,bytes=len(raw),sha256=hashlib.sha256(raw).hexdigest()));path.unlink()
     row=dict(label=label,recording=recording,mode=mode,name=name,command=cmd,exit_code=p.returncode,timed_out=timed,logs=logs);rows.append(row);save('observations.json',rows)
     assert p.returncode==0 and not timed,(name,p.returncode)
     fields=dict(line.split(' ',1) for line in contents[0].decode().splitlines());output=fields['OUTPUT'],fields['TRACE']
     if recording in refs:assert refs[recording]==output,(name,'full output/trace mismatch')
     else:refs[recording]=output
     events=[];pattern=re.escape(image)+r'\(\+0x([0-9a-f]+)\)'
     for block in contents[1].decode().split('END_ALLOC632\n'):
      if not block.strip():continue
      assert block.startswith('ALLOC632 pointer=');offsets=re.findall(pattern,block);assert offsets;events.append(offsets)
     if mode=='plain':assert not events
     row.update(allocation=ast.literal_eval(fields['ALLOCATION']),cleanup=ast.literal_eval(fields['CLEANUP']),allocation_stacks=events,output_trace_sha256=hashlib.sha256(('\n'.join(output)).encode()).hexdigest());save('observations.json',rows)
 for label,b in builds.items():
  guard();offsets=sorted({o for r in rows if r['label']==label for stack in r['allocation_stacks'] for o in stack});image=b['artifacts']['resource']['path']
  text=subprocess.check_output(['addr2line','-C','-f','-e',image,*['0x'+o for o in offsets]],text=True,timeout=min(20,deadline-time.monotonic()));(s/(label+'-resolved.txt')).write_text(text);lines=text.splitlines();assert len(lines)==2*len(offsets)
  symbols[label]={o:dict(function=lines[2*i],source=lines[2*i+1]) for i,o in enumerate(offsets)};assert sha(image)==b['artifacts']['resource']['sha256']
 save('symbols.json',symbols)
 for row in rows:
  events=[]
  for offsets in row['allocation_stacks']:
   functions=[symbols[row['label']][o]['function'] for o in offsets];events.append(dict(offsets=offsets,functions=functions,trace_collection=any('dispatch_trace::collect_dispatch_counts' in f for f in functions),btree=any('alloc::collections::btree::' in f for f in functions),observed_epoch=any('solver_five_chain_resource::allocation::observe' in f for f in functions)))
  row.update(resolved_events=events,observed_epoch_632=sum(e['observed_epoch'] for e in events),all_captured_632_from_trace_btree=all(e['trace_collection'] and e['btree'] for e in events))
 save('classified.json',rows);assert len(rows)==56;guard()
 save('completion.json',dict(exit_code=0,processes=len(rows),full_output_trace_domains=len(refs),seconds=time.monotonic()-started,admitted=False));print('56 processes completed; independent verification pending')
except BaseException as e:
 save('completion.json',dict(exit_code=1,processes=len(rows),seconds=time.monotonic()-started,error=repr(e),admitted=False));raise
