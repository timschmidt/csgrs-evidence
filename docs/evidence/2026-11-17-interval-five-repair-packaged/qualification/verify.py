from pathlib import Path
import gzip,hashlib,json,re,subprocess,tarfile
s=Path(__file__).parent;old=s.parent/'solver-five-repair-portable';work=Path('/dev/shm/interval-five-repair-packaged');r=work/'source';candidate='4a04dd9744bfecb578963b42fa3bffef5b7062b5'
load=lambda p:json.loads(p.read_text());sha=lambda data:hashlib.sha256(data).hexdigest()
completion=load(s/'completion.json');assert completion['exit_code']==0 and completion['controls']==528
assert load(old/'completion.json')['exit_code']==0 and load(old/'verification.json')['successes']==2064
assert load(s.parent/'five-portable-finalizer-result.json')['exit_code']==0
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
for name in ['fixture.rs','operation.rs','lib.rs','main.rs','invoke.cjs']:
 assert (s/'consumer'/name).read_bytes()==(old/'consumer'/name).read_bytes()==(work/'consumer'/name).read_bytes()
archives=load(s/'package-archives.json');assert len(archives)==6;checked_files=0
for a in archives:
 raw=Path(a['path']).read_bytes();assert len(raw)==a['bytes'] and sha(raw)==a['sha256']
 with tarfile.open(a['path']) as tar:
  members=tar.getmembers();prefix=f"{a['name']}-{a['version']}/";assert all(m.isfile() and m.name.startswith(prefix) for m in members)
  contents={m.name[len(prefix):]:tar.extractfile(m).read() for m in members};assert len(contents)==len(members)
 vcs=json.loads(contents['.cargo_vcs_info.json']);assert vcs==a['vcs'] and vcs['git']['sha1']==candidate and not vcs['git'].get('dirty',False)
 recorded={f['path']:f for f in a['source_files']};assert set(contents)-{'Cargo.toml','Cargo.lock','.cargo_vcs_info.json'}==set(recorded)
 for name,f in recorded.items():
  relative=(r/'crates'/a['name']/('Cargo.toml' if name=='Cargo.toml.orig' else name)).resolve().relative_to(r).as_posix()
  assert contents[name]==subprocess.check_output(['git','show',candidate+':'+relative],cwd=r)
  assert sha(contents[name])==f['sha256'] and len(contents[name])==f['bytes'];checked_files+=1
for c in load(s/'commands.json'):
 assert c['exit_code']==0 and not c['timeout']
 for log in c['logs']:
  raw=gzip.decompress((s/log['path']).read_bytes());assert len(raw)==log['raw_bytes'] and sha(raw)==log['raw_sha256']
  warnings=[line for line in raw.decode().splitlines() if line.startswith(('warning:','warning['))]
  if warnings:
   assert c['name']=='verified-packages' and all('ignoring ' in line and 'not included in the published package' in line for line in warnings), (c['name'],warnings)
control=gzip.decompress((s/'package-cache-control.stdout.gz').read_bytes()).decode()
assert 'negative control: cleared compiler artifacts still use stale synthetic-registry source' in control and 'package-cache acceptance passed' in control
builds=load(s/'builds.json');assert len(builds)==8;original=load(old/'builds.json');matches=0;max_memory=0;source_accounts=load(old/'accounts.json');accounts=[];headrooms=[]
for b in builds:
 name=b['name'].removesuffix('-build');kind=b['kind'];features=b['features'];label='five-added' if 'added' in features else 'five'
 before=next(a for a in original if a['label']==label and a['features']==features and a['kind']==kind)
 prior=before['name'].removesuffix('-build');a=b['artifact'];raw=Path(a['path']).read_bytes();assert sha(raw)==a['sha256'] and len(raw)==a['file']
 source={p.name:sha(p.read_bytes()) for p in (s/'consumer').iterdir() if p.is_file()};assert b['sources']==source
 if kind=='native':
  listing=subprocess.check_output(['readelf','-WS',a['path']],text=True);sections=[]
  with gzip.open(s/(name+'-readelf.txt.gz'),'wt') as stream:stream.write(listing)
  for line in listing.splitlines():
   m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+\S+\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([A-Za-z]*)\s+\d+\s+\d+\s+\d+',line)
   if m:sections.append((m[1],int(m[2],16),m[3]))
  assert sum(n for _,n,f in sections if 'A' in f)==a['allocated'] and sum(n for _,n,f in sections if 'X' in f)==a['executable']
  assert dict((n,size) for n,size,_ in sections)['.text']==a['text'];symbols={};listing=subprocess.check_output(['nm','-S','--defined-only',a['path']],text=True)
  with gzip.open(s/(name+'-nm.txt.gz'),'wt') as stream:stream.write(listing)
  for line in listing.splitlines():
   fields=line.split()
   if len(fields)>=4 and fields[2] in ['t','T']:
    address=int(fields[0],16);size=int(fields[1],16);assert address not in symbols or symbols[address]==size;symbols[address]=size
  assert sum(symbols.values())==a['named_text']
 else:
  assert raw[:8]==b'\x00asm\x01\x00\x00\x00';pos=8;code=0;sections=[]
  while pos<len(raw):
   kind_id=raw[pos];pos+=1;value=shift=0
   while True:
    v=raw[pos];pos+=1;value+=(v&127)<<shift
    if not v&128:break
    shift+=7;assert shift<=35
   assert pos+value<=len(raw);sections.append(dict(kind=kind_id,bytes=value,sha256=sha(raw[pos:pos+value])))
   if kind_id==10:code+=value
   pos+=value
  assert code==a['code'] and sections==a['sections']
 metadata=load(s/(name+'-metadata-verified.json'));assert metadata['no_workspace_libraries'] and metadata['versions_match']
 data=json.loads(gzip.decompress((s/(name+'-metadata.stdout.gz')).read_bytes()));active={n['id'] for n in data['resolve']['nodes']};local=[]
 for p in data['packages']:
  if p['id'] not in active:continue
  path=Path(p['manifest_path'])
  if p['name']=='solver-five-portable':assert path==work/'consumer/Cargo.toml'
  elif p['source'] is None or p['name'].startswith('hyper'):
   archived=next(x for x in archives if x['name']==p['name']);assert p['source'] is None and p['version']==archived['version']
   assert path==work/'packages'/f"{p['name']}-{p['version']}"/'Cargo.toml';local.append(p['name'])
 assert sorted(local)==['hyperlattice','hyperlimit','hyperreal','hypersolve']
 actual_suffix='-controls.jsonl.gz' if kind=='native' else '-controls.stdout.gz';prior_suffix='-controls.jsonl.gz' if kind=='native' else '-controls.log.gz';configs=load(s/(name+'-configs.json'));count=0
 with gzip.open(s/(name+actual_suffix),'rt') as actual,gzip.open(old/(prior+prior_suffix),'rt') as expected:
  for config,line,prior_line in zip(configs,actual,expected,strict=True):
   x,y=json.loads(line),json.loads(prior_line);assert config==x['config']==y['config'] and not config['expected_failure']
   if x['output']!=y['output']:
    (s/'output-mismatch.json').write_text(json.dumps(dict(name=name,config=config,actual=x['output'],expected=y['output']),indent=2)+'\n');raise AssertionError('Complete source/package output or trace mismatch')
   if kind=='native':assert x['exit_code']==0 and x['stderr']=='' and not x['timeout']
   else:
    assert x['imports']==[] and not x['expected_trap'];max_memory=max(max_memory,*[x[k] for k in ['before','materialized','after']]);assert max_memory<=192*1024**2
   count+=1;matches+=1
 assert count==b['control_count']
 capacity=(16 if kind=='native' else 8)*1024**2;used=max(a['file'],a.get('allocated',0));headrooms.append(dict(features=features,kind=kind,used=used,capacity=capacity,reserve=2*1024**2,headroom=capacity-used,passed=capacity-used>=2*1024**2))
 if 'added' not in features:
  for metric in (['file','allocated','text','named_text','executable'] if kind=='native' else ['file','code']):
   old_account=next(x for x in source_accounts if x['features']==features and x['kind']==kind and x['metric']==metric);assert old_account['values']['five']==before['artifact'][metric]
   delta=a[metric]-before['artifact'][metric];charge=max(0,delta);cumulative=old_account['cumulative_charge']+charge;denominator=old_account['fixed_denominator'];cap=old_account['absolute_cap']
   def passed(n):return n<=cap and (n*100<=denominator if denominator else n==0)
   accounts.append(dict(features=features,kind=kind,metric=metric,source_account=old_account,source_final=before['artifact'][metric],package_final=a[metric],delta=delta,packaging_positive_charge=charge,prior_positive_charge=old_account['cumulative_charge'],cumulative_positive_charge=cumulative,fixed_denominator=denominator,absolute_cap=cap,percent_cap=1,incremental_pass=old_account['incremental_pass'] and passed(charge),cumulative_pass=passed(cumulative),remaining_absolute=cap-cumulative,remaining_relative_bytes=denominator/100-cumulative))
assert matches==528 and len(accounts)==14
checks=load(s/'checks.json');assert len(checks)==9 and all(c['exit_code']==0 for c in checks)
summary=dict(verified_archives=6,verified_source_files=checked_files,images=8,controls=matches,full_source_package_output_trace_matches=matches,metadata_configurations=8,strict_clippy_configurations=8,formatting_pass=True,max_wasm_linear_capacity=max_memory,size_accounts=len(accounts),failed_accounts=sum(not a['incremental_pass'] or not a['cumulative_pass'] for a in accounts),all_headrooms_pass=all(h['passed'] for h in headrooms),prior_positive_charges_preserved=True,admitted=False)
for name,value in [('accounts.json',accounts),('headrooms.json',headrooms),('verification.json',summary)]: (s/name).write_text(json.dumps(value,indent=2)+'\n')
print(json.dumps(summary,indent=2))
