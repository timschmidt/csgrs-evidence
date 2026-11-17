from pathlib import Path
import gzip,hashlib,json,subprocess
s=Path(__file__).parent
completion=json.loads((s/'packaged-build-completion.json').read_text());assert completion['exit_code']==0
rows=json.loads((s/'packaged-builds.json').read_text());assert len(rows)==12
cases=json.loads((s/'corpus.json').read_text())['cases'];references={};matches=0;controls=0;active_nonempty=0;pages=[]
for row in rows:
 assert row['functional_exit_code']==0
 assert hashlib.sha256(Path(row['artifact']['path']).read_bytes()).hexdigest()==row['artifact']['sha256']
 assert row['sources']==rows[0]['sources'] and row['lock_sha256']==rows[0]['lock_sha256']
 name=f'packaged-{row["label"]}-{row["features"] or "default"}-{row["kind"]}'
 expected=[]
 for c in cases:
  if c['added'] and row['label'] not in ['pilot','candidate']:continue
  for policy in c['policies']:
   for recording in ([0,1] if row['features'] else [0]):
    for reuse in [0,1]:
     for warm in [0,1]:expected.append([c['case'],int(policy=='approx'),recording,reuse,warm])
 stream=gzip.open(s/(name+'-controls.jsonl.gz'),'rt') if row['kind']=='native' else (s/(name+'-controls.jsonl')).open()
 with stream:
  for args,line,check in zip(expected,stream,row['controls'],strict=True):
   r=json.loads(line);assert r['config']['args']==args and check['config']==r['config'];output=r['output']
   assert hashlib.sha256(output.encode()).hexdigest()==check['output_sha256']
   assert output.startswith('OUTPUT ') and '\nTRACE ' in output and output.endswith('\n')
   key=(row['features'],*args)
   if key in references:assert output==references[key];matches+=1
   else:references[key]=output
   if args[2]==1 and 'DispatchCount {' in output:active_nonempty+=1
   if row['kind']=='wasm':
    assert r['imports']==[]
    pages.append({k:r[k] for k in ['before','materialized','after']})
   else:assert r['exit_code']==0
   controls+=1
assert controls==completion['controls'] and matches==completion['full_output_trace_matches']
assert active_nonempty>0
accounts=[]
def account(values,inc,total):
 f,c,n=(values[k] for k in ['fixed','current','candidate']);prior=max(0,c-f);charge=max(0,n-c);cumulative=prior+charge
 return dict(values=values,prior_positive_charge=prior,incremental_positive_charge=charge,cumulative_positive_charge=cumulative,incremental_absolute_cap=inc,cumulative_absolute_cap=total,incremental_percent_cap=0.5,cumulative_percent_cap=1,incremental_denominator=c,cumulative_denominator=f,caps_pass=charge<=inc and cumulative<=total and (charge==0 or c>0 and 200*charge<=c) and (cumulative==0 or f>0 and 100*cumulative<=f))
# No netting and no invented denominator at zero.
assert account(dict(fixed=100000,current=100500,candidate=100100),8192,16384)['cumulative_positive_charge']==500
assert not account(dict(fixed=0,current=0,candidate=1),8192,16384)['caps_pass']
for features in ['', 'trace']:
 for kind in ['native','wasm']:
  group={r['label']:r for r in rows if r['features']==features and r['kind']==kind and r['label']!='pilot'};assert set(group)=={'fixed','current','candidate'}
  sizes={label:dict(r['artifact']) for label,r in group.items()}
  if kind=='native':
   for label,size in sizes.items():
    lines=subprocess.check_output(['objdump','-h',size['path']],text=True).splitlines();allocated=executable=0
    for i,line in enumerate(lines[:-1]):
     fields=line.split()
     if len(fields)>=7 and fields[0].isdigit():
      flags={f.strip() for f in lines[i+1].split(',')}
      if 'ALLOC' in flags:allocated+=int(fields[2],16)
      if 'CODE' in flags:executable+=int(fields[2],16)
    size.update(allocated=allocated,executable=executable)
   metrics=[('file',8192,16384),('allocated',8192,16384),('text',4096,8192),('executable',4096,8192),('named_text',4096,8192)]
   capacity,reserve=16*1024**2,2*1024**2
  else:
   metrics=[('file',8192,16384),('code',4096,8192)];capacity,reserve=8*1024**2,1024**2
  a=dict(features=features,kind=kind,sizes=sizes,capacity=capacity,reserve=reserve,remaining=capacity-sizes['candidate']['file'])
  a['metrics']={name:account({l:v[name] for l,v in sizes.items()},inc,total) for name,inc,total in metrics}
  a['caps_pass']=a['remaining']>=reserve and all(m['caps_pass'] for m in a['metrics'].values());accounts.append(a)
result=dict(artifacts=len(rows),controls=controls,full_output_trace_matches=matches,distinct_configurations=len(references),active_nonempty_trace_rows=active_nonempty,wasm_maximum_pages_bytes={k:max(r[k] for r in pages) for k in pages[0]},accounts=accounts,all_size_caps_pass=all(a['caps_pass'] for a in accounts),admitted=False,scope='Uninstrumented public report consumption, final native/WASM images and finite linear-memory observations. No runtime, live-payload bound, complete stack/cancellation or package admission.')
(s/'packaged-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='accounts'},indent=2))
print([(a['kind'],a['features'],a['caps_pass'],{k:v['cumulative_positive_charge'] for k,v in a['metrics'].items()}) for a in accounts])
