from pathlib import Path
import ast,collections,gzip,hashlib,json,re,subprocess
s=Path(__file__).parent
read=lambda n:json.loads((s/n).read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
rows=read('builds.json'); commands=read('commands.json'); histories=read('lifetime-histories.json'); summary=read('lifetime-control-summary.json'); sizes=read('size-summary.json')
assert len(rows)==19 and len(histories)==258
for c in commands:
 assert c['exit_code']==c['expected_exit_code'] and not c['timed_out'],c['name']
 assert not re.search(r'^warning(?:\[|:)',(s/(c['name']+'.log')).read_text(),re.M),c['name']
assert sum(c['name'].startswith('clippy-') for c in commands)==4
source_hashes={p.name:sha(p.read_bytes()) for p in (s/'consumer').iterdir() if p.is_file()}
for name,v in read('monitor-provenance.json').items():
 assert (s/'consumer'/name).read_bytes()==Path(v['source']).read_bytes()
 assert source_hashes[name]==v['sha256']
subprocess.run(['python3',str(s/'verify-fixture.py')],check=True,stdout=subprocess.DEVNULL)
images=0;groups={};success=failed=0;calculated={}
for row in rows:
 assert row['source_sha256']==source_hashes
 for kind,a in row['artifacts'].items():
  p=Path(a['path']);raw=p.read_bytes();assert sha(raw)==a['sha256'] and len(raw)==a['file']
  # ELF section flags independently of the collector's objdump parser.
  sections=[]
  for line in subprocess.check_output(['readelf','-SW',str(p)],text=True).splitlines():
   m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+\S+\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([A-Za-z]*)\s+\d+\s+\d+\s+\d+',line)
   if m:sections.append((m[1],int(m[2],16),m[3]))
  assert sum(n for _,n,f in sections if 'A' in f)==a['allocated_bytes']
  assert sum(n for _,n,f in sections if 'X' in f)==a['executable_bytes']
  assert dict((n,b) for n,b,_ in sections)['.text']==a['text']
  symbols=gzip.decompress((s/'listings'/(p.name+'.symbols.gz')).read_bytes()).decode();unique={}
  for line in symbols.splitlines():
   fields=line.split()
   if len(fields)>=4 and fields[2] in ['t','T']:
    address=int(fields[0],16);length=int(fields[1],16)
    assert address not in unique or unique[address]==length
    unique[address]=length
  assert sum(unique.values())==a['named_text'];images+=1
 for c in row['controls']:
  matches=[v for v in commands if v['name']+'.log'==c['log']];assert matches and all(v['exit_code']==c['expected_exit_code'] for v in matches)
  lines=(s/c['log']).read_text().splitlines()
  if c['expected_exit_code']:
   assert c['case']==6 and row['reproduction_only'] and c['expected_exit_code']==101
   assert 'qualified ball receipt must remain unresolved' in '\n'.join(lines);failed+=1;continue
  out=tuple(l for l in lines if l.startswith('OUTPUT '));traces=tuple(l for l in lines if l.startswith('TRACE '));assert len(out)==1
  assert len(traces)==(32 if c['kind']=='lifetime' else 1)
  assert sha('\n'.join(out+traces).encode())==c['full_output_trace_sha256']
  key=(c['kind'],c['case'],c['policy'],row['features'],c['recording'])
  if key in groups:assert groups[key]==(out,traces)
  else:groups[key]=(out,traces)
  success+=1
  if c['kind']!='lifetime':continue
  data=[l for l in lines if l.startswith('CYCLE ')];assert len(data)==32
  m=collections.defaultdict(int);live=[0,0];cycles=[]
  for i,l in enumerate(data):
   prefix,idx,tuples=l.split(' ',2);assert int(idx)==i
   op,u,drop,du=ast.literal_eval('['+tuples.replace(') (','), (')+']')
   ends=[];peaks=[];increments=[]
   for z,(name,traffic,peak,end,dt,dp,de) in enumerate([('requested',op[3],op[4],op[5],drop[3],drop[4],drop[5]),('usable',u[0],u[1],u[2],du[0],du[1],du[2])]):
    retained=live[z]+end;whole_peak=max(live[z]+peak,retained+dp);inc=end+de;live[z]+=inc
    m[name+'_peak']=max(m[name+'_peak'],whole_peak);m[name+'_retained']=max(m[name+'_retained'],retained);m[name+'_persistent']=max(m[name+'_persistent'],live[z]);m[name+'_positive_retention']+=max(0,inc);m[name+'_traffic']+=traffic+dt
    assert retained>=0 and whole_peak>=0 and live[z]>=0
    if i>=2:assert inc==0
    ends.append(live[z]);peaks.append(whole_peak);increments.append(inc)
   for index,name in enumerate(['allocations','deallocations','reallocations']):m[name]+=op[index]+drop[index]
   cycles.append(dict(cycle=i,requested_increment=increments[0],usable_increment=increments[1],requested_persistent=ends[0],usable_persistent=ends[1],requested_peak=peaks[0],usable_peak=peaks[1]))
  h=next(h for h in histories if h['log']==c['log']);assert dict(m)==h['metrics'] and cycles==h['cycles'];calculated[c['log']]=dict(m)
assert (images,success,failed,len(groups))==(38,516,8,132)
assert success-len(groups)==384 and len(calculated)*32==8256
labels=[v[0] for v in read('boundaries.json')]
def verify_charges(detail,values,cap,percent,flag):
 baseline=values['fixed'];charge=0;passed=True
 for pos,inc in enumerate(detail['increments']):
  before,after=labels[pos:pos+2];delta=values[after]-values[before];positive=max(0,delta);charge+=positive
  ok=positive<=cap and charge<=cap and positive*100<=baseline*percent and charge*100<=baseline*percent
  assert inc==dict(before=before,after=after,delta=delta,positive_charge=positive,cumulative_positive_charge=charge,passed=ok)
  passed=passed and ok
 assert detail['cumulative_positive_charge']==charge and detail[flag]==passed
failures=[]
for account in summary['accounts']:
 group=[h for h in histories if not h['reproduction_only'] and all(h[k]==account[k] for k in ['features','case','policy','recording'])]
 for metric,d in account['metrics'].items():
  values={h['label']:calculated[h['log']][metric] for h in group};assert values==d['values']
  count=metric in ['allocations','deallocations','reallocations'];traffic=metric.endswith('traffic');persistent=metric.endswith('persistent');retained=metric.endswith('retained')
  cap=512 if count else 131072 if traffic else 512 if persistent or retained else 4096;percent=1 if count else 2
  assert cap==d['absolute_growth_cap'] and percent==d['percent_growth_cap']
  total=None if count else 32768 if persistent else (256 if account['case']==3 else 16)*1024**2*32 if traffic else (8 if account['case']==3 else 1)*1024**2
  assert d['total_cap']==total and d['total_pass']==(total is None or max(values.values())<=total)
  if not account['added']:
   assert d['relative_denominator']==values['fixed'];verify_charges(d,values,cap,percent,'growth_pass')
   assert d['remaining_absolute_allowance']==cap-d['cumulative_positive_charge']
   if not d['growth_pass']:failures.append(dict(features=account['features'],case=account['case'],policy=account['policy'],recording=account['recording'],metric=metric,charge=d['cumulative_positive_charge'],baseline=values['fixed']))
  else:assert d['growth_pass'] is None
assert len(failures)==10 and len({(f['features'],f['case'],f['policy'],f['recording']) for f in failures})==4
for a in sizes['accounts']:
 for metric,d in a['metrics'].items():
  values={label:v[metric] for label,v in a['artifacts'].items()};cap=32768 if metric in ['file','allocated_bytes'] else 16384
  verify_charges(d,values,cap,1,'passed');assert d['remaining_absolute_bytes']==cap-d['cumulative_positive_charge']
 assert a['remaining']==16777216-a['artifacts']['five']['file'] and a['remaining']>=2097152
assert sizes['all_caps_pass'] and sizes['all_headroom_pass'] and not summary['all_initial_growth_caps_pass']
assert all(h['zero_additional_retention_after_cycle_two'] and h['persistent_total_pass'] and h['nonnegative_tracked_footprints'] for h in histories)
old=s.with_name(s.name+'-attempt-01');retry=read('retry.json');original=json.loads((old/'hold.json').read_text())['started_unix'];release=read('release.json')
assert retry['original_deadline_unix']==original+3600 and release['time_unix']<=retry['original_deadline_unix']
assert json.loads((old/'completion.json').read_text())['exit_code']==1
assert (old/'consumer'/'fixture.rs').read_bytes()==(s/'consumer'/'fixture.rs').read_bytes()
for entry in read('relocation-map.json'):
 p=Path(entry['original_path']);assert p.is_symlink() and p.resolve()==Path(entry['ram_path'])
 data=p.read_bytes();assert len(data)==entry['bytes'] and sha(data)==entry['sha256'] and oct(p.stat().st_mode&0o777)==entry['mode']
 stored=subprocess.check_output(['git','-C','/mnt/development/csgrs-evidence','show',entry['archive_revision']+':'+entry['archive_path']]);assert gzip.decompress(stored)==data
result=dict(images=images,successful_controls=success,expected_failures=failed,full_output_trace_groups=len(groups),additional_comparisons=384,lifetime_histories=len(calculated),cycles=8256,lifetime_accounts=len(summary['accounts']),failed_growth_metrics=failures,all_size_caps_pass=True,all_initial_lifetime_totals_pass=True,no_persistent_growth_after_cycle_two=True,original_elapsed_seconds=release['time_unix']-original,unchanged_monitor_files=5,relocated_images=35,independent_elf_sections=True,raw_lifetime_reconstruction=True,admitted=False,stack_qualification=False,resource_campaign_complete=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='failed_growth_metrics'},indent=2))
