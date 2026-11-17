from pathlib import Path
import gzip, hashlib, json, re, subprocess
s=Path(__file__).parent
read=lambda n:json.loads((s/n).read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
completion=read('completion.json');assert completion['exit_code']==0
rows=read('builds.json');assert len(rows)==38
refs={};success=fail=matches=0;max_memory=0;images={}; warnings=[]
provenance=read('provenance.json');assert sha((s/'consumer/fixture.rs').read_bytes())==provenance['fixture_sha256'];assert sha((s/'consumer/operation.rs').read_bytes())==provenance['operation_slice_sha256']
assert (s/'consumer/fixture.rs').read_bytes()==Path(provenance['fixture_source']).read_bytes()
original=Path(provenance['operation_source']).read_text();assert (s/'consumer/operation.rs').read_text()==original[original.index('struct Input {'):original.index('struct Context {')]
source={p.name:sha(p.read_bytes()) for p in (s/'consumer').iterdir() if p.is_file()}
for result_path in sorted(s.glob('*-result.json')):
 result=json.loads(result_path.read_text());assert result['exit_code']==0 and not result['timeout']
 raw=gzip.decompress((s/(result['name']+'.log.gz')).read_bytes());assert sha(raw)==result['log_sha256']
 warnings.extend([dict(log=result['name'],line=line) for line in raw.decode().splitlines() if line.startswith(('warning:','warning['))])
assert not warnings
for b in rows:
 name=b['name'].removesuffix('-build');a=b['artifact'];raw=Path(a['path']).read_bytes();assert sha(raw)==a['sha256'] and len(raw)==a['file'];assert b['sources']==source
 if b['kind']=='native':
  listing=subprocess.check_output(['readelf','-WS',a['path']],text=True)
  with gzip.open(s/(name+'-readelf.txt.gz'),'wt') as f:f.write(listing)
  sections=[]
  for line in listing.splitlines():
   m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+\S+\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([A-Za-z]*)\s+\d+\s+\d+\s+\d+',line)
   if m:sections.append((m[1],int(m[2],16),m[3]))
  assert sum(n for _,n,f in sections if 'A' in f)==a['allocated'];assert sum(n for _,n,f in sections if 'X' in f)==a['executable'];assert dict((n,v) for n,v,_ in sections)['.text']==a['text']
  symbols={};listing=subprocess.check_output(['nm','-S','--defined-only',a['path']],text=True)
  with gzip.open(s/(name+'-nm.txt.gz'),'wt') as f:f.write(listing)
  for line in listing.splitlines():
   fields=line.split()
   if len(fields)>=4 and fields[2] in ['t','T']:
    address=int(fields[0],16);size=int(fields[1],16);assert address not in symbols or symbols[address]==size;symbols[address]=size
  assert sum(symbols.values())==a['named_text']
 else:
  assert raw[:8]==b'\x00asm\x01\x00\x00\x00';pos=8;code=0;sections=[]
  while pos<len(raw):
   kind=raw[pos];pos+=1;value=shift=0
   while True:
    v=raw[pos];pos+=1;value+=(v&127)<<shift
    if not v&128:break
    shift+=7;assert shift<=35
   assert pos+value<=len(raw);sections.append(dict(kind=kind,bytes=value,sha256=sha(raw[pos:pos+value])))
   if kind==10:code+=value
   pos+=value
  assert code==a['code'] and sections==a['sections']
 suffix='-controls.jsonl.gz' if b['kind']=='native' else '-controls.log.gz'
 matrix=read(name+'-configs.json');count=0
 with gzip.open(s/(name+suffix),'rt') as stream:
  for config,line in zip(matrix,stream,strict=True):
   observation=json.loads(line);assert config==observation['config'];count+=1
   case,policy,record,reuse,warm=config['args'];assert policy in [0,1] and reuse in [0,1] and warm in [0,1]
   if config['expected_failure']:
    assert b['label']=='reproduction' and case==6
    if b['kind']=='native':assert observation['exit_code']==101 and 'qualified ball receipt must remain unresolved' in observation['stderr']
    else:assert observation['expected_trap'] and observation['imports']==[]
    fail+=1;continue
   if b['kind']=='native':assert observation['exit_code']==0 and observation['stderr']==''
   else:
    assert not observation['expected_trap'] and observation['imports']==[]
    max_memory=max(max_memory,*[observation[k] for k in ['before','materialized','after']]);assert max_memory<=192*1024**2
   output=observation['output'];assert output.startswith('OUTPUT ') and '\nTRACE ' in output and output.endswith('\n')
   key=(b['features'],*config['args'])
   if key in refs:assert refs[key]==output,(name,config);matches+=1
   else:refs[key]=output
   success+=1
 assert count==b['control_count']
 images[(b['label'],b['features'],b['kind'])]=a
assert success==completion['successes']==2064 and fail==completion['expected_failures']==32 and matches==completion['full_matches']
assert len(read('checks.json'))==9 and all(c['exit_code']==0 for c in read('checks.json'))
assert read('restored.json')['revision']=='4a04dd9744bfecb578963b42fa3bffef5b7062b5'
accounts=[];headrooms=[];order=[x[0] for x in read('environment.json')['boundaries']]
for kind in ['native','wasm']:
 for features in ['', 'trace']:
  metrics=['file','allocated','text','named_text','executable'] if kind=='native' else ['file','code']
  for metric in metrics:
   values=[images[(label,features,kind)][metric] for label in order];denominator=values[0];cap=32768 if metric in ['file','allocated','code'] else 16384
   changes=[dict(before=order[i-1],after=order[i],delta=values[i]-values[i-1],charge=max(0,values[i]-values[i-1])) for i in range(1,len(order))]
   charges=[c['charge'] for c in changes];cumulative=sum(charges)
   passed=lambda n:n<=cap and (n*100<=denominator if denominator else n==0)
   accounts.append(dict(kind=kind,features=features,metric=metric,values=dict(zip(order,values)),fixed_denominator=denominator,absolute_cap=cap,percent_cap=1,changes=changes,cumulative_charge=cumulative,remaining_absolute=cap-cumulative,remaining_relative_bytes=denominator/100-cumulative,incremental_pass=all(passed(c) for c in charges),cumulative_pass=passed(cumulative)))
for (label,features,kind),a in images.items():
 capacity=(16 if kind=='native' else 8)*1024**2;used=max(a['file'],a.get('allocated',0));remaining=capacity-used
 headrooms.append(dict(label=label,features=features,kind=kind,capacity=capacity,used=used,remaining=remaining,reserve=2*1024**2,passed=remaining>=2*1024**2))
failed=[a for a in accounts if not a['incremental_pass'] or not a['cumulative_pass']]
summary=dict(successes=success,expected_failures=fail,images=len(rows),full_output_trace_comparisons=matches,distinct_full_output_groups=len(refs),max_wasm_linear_capacity=max_memory,accounts=len(accounts),failed_accounts=len(failed),all_image_headrooms_pass=all(h['passed'] for h in headrooms),strict_clippy_configurations=8,formatting_pass=True,original_fixture_and_operations_unchanged=True,source_restored=True,admitted=False)
for name,value in [('accounts.json',accounts),('headrooms.json',headrooms),('verification.json',summary)]: (s/name).write_text(json.dumps(value,indent=2)+'\n')
print(json.dumps(summary,indent=2))
