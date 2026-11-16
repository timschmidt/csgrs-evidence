from pathlib import Path
import hashlib, json, re, shutil, subprocess

s=Path(__file__).parent
art=Path('/mnt/development/.interval-refactor-build/matrix-scale-reconsideration/artifacts')
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def native(path):
 path=Path(path)
 sections=subprocess.check_output(['size','-A',str(path)],text=True)
 sizes={a[0]:int(a[1]) for line in sections.splitlines() if len(a:=line.split())==3 and a[0].startswith('.')}
 symbols=subprocess.check_output(['nm','-S','--defined-only',str(path)],text=True)
 addresses={}
 for line in symbols.splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] ',line)
  if m:
   addr,n=m.groups();n=int(n,16)
   if addr in addresses and addresses[addr]!=n: raise RuntimeError('symbol alias size mismatch')
   addresses[addr]=n
 # Store section bytes separately: identical machine code is stronger than
 # identical sizes, but does not substitute for the benchmark gates.
 hashes={}
 for name in ('.text','.rodata','.data','.bss'):
  if name not in sizes:continue
  if name=='.bss':continue
  temp=s/('section-'+name[1:]+'.tmp')
  subprocess.run(['objcopy','--dump-section',name+'='+str(temp),str(path),'/dev/null'],check=True,capture_output=True)
  hashes[name]=sha(temp);temp.unlink()
 return {'path':str(path),'file':path.stat().st_size,'sha256':sha(path),'text':sizes.get('.text',0),'rodata':sizes.get('.rodata',0),'data':sizes.get('.data',0),'bss':sizes.get('.bss',0),'named_text':sum(addresses.values()),'sections':sizes,'section_hashes':hashes}

def wasm(path):
 path=Path(path);data=path.read_bytes()
 if data[:8]!=b'\x00asm\x01\x00\x00\x00':raise RuntimeError('not a wasm module')
 pos=8;sections=[]
 while pos<len(data):
  kind=data[pos];pos+=1;length=shift=0
  while True:
   v=data[pos];pos+=1;length|=(v&127)<<shift
   if v<128:break
   shift+=7
  if pos+length>len(data):raise RuntimeError('truncated section')
  sections.append({'kind':kind,'bytes':length,'sha256':hashlib.sha256(data[pos:pos+length]).hexdigest()});pos+=length
 return {'path':str(path),'file':len(data),'sha256':sha(path),'code':sum(r['bytes'] for r in sections if r['kind']==10),'sections':sections}

base=json.loads((s/'baseline-binaries.json').read_text());candidate=json.loads((s/'candidate-binaries.json').read_text())
if len(base)!=42 or {r['source'] for r in base}!={r['source'] for r in candidate}:raise RuntimeError('artifact coverage changed')
by_source={r['source']:r for r in candidate}
rows=[]
for b in base:
 rows.append({'artifact':b['source'],'target':'x86_64-unknown-linux-gnu','kind':'native','baseline':native(b['path']),'candidate':native(by_source[b['source']]['path'])})
source=Path('/mnt/development/.interval-refactor-build/matrix-scale-probe/release/matrix-scale-cost')
shutil.copy2(source,art/'candidate-scale-cost')
rows.append({'artifact':'paired-completed-matrix-scale','target':'x86_64-unknown-linux-gnu','kind':'native','baseline':native(art/'baseline-scale-cost'),'candidate':native(art/'candidate-scale-cost')})
root=art.parent
rows.append({'artifact':'successive_operations','target':'x86_64-unknown-linux-gnu','kind':'native','baseline':native(root/'successive-baseline/successive_operations'),'candidate':native(root/'successive-candidate/successive_operations')})
shutil.copy2('/mnt/development/.interval-refactor-build/matrix-scale-wasm/wasm32-unknown-unknown/release/centered_interval_wasm.wasm',art/'candidate-centered.wasm')
rows.append({'artifact':'centered-interval-wasm','target':'wasm32-unknown-unknown','kind':'wasm','baseline':wasm(art/'baseline-centered.wasm'),'candidate':wasm(art/'candidate-centered.wasm')})
rows.append({'artifact':'paired-completed-matrix-scale-wasm','target':'wasm32-unknown-unknown','kind':'wasm','baseline':wasm(art/'baseline-matrix-scale.wasm'),'candidate':wasm(art/'candidate-matrix-scale.wasm'),'comparison_scope':'new operation: manual scalar sequence versus matrix API at the same candidate source; existing centered boundary remains the revision comparison'})
budget=json.loads((s/'size-budget.json').read_text());failures=[]
for row in rows:
 deltas={}
 metrics=['file','text','named_text'] if row['kind']=='native' else ['file','code']
 if row['kind']=='native':
  # Memory is not covered by the size exception.
  for metric in ['data','bss']:
   if row['candidate'][metric]>row['baseline'][metric]: failures.append([row['artifact'],metric,'memory grew'])
 for metric in metrics:
  name='wasm_final_file_and_code' if row['kind']=='wasm' else 'native_monomorphized_text_sum' if metric=='named_text' else 'native_final_file_and_allocated_sections'
  caps=budget['limits'][name];b=row['baseline'][metric];c=row['candidate'][metric];d=c-b
  percent=100*d/b if b else 0 if not c else None
  individual=d<=caps['incremental_bytes'] and (percent is not None and percent<=caps['incremental_percent'])
  cumulative=d<=caps['cumulative_bytes'] and (percent is not None and percent<=caps['cumulative_percent'])
  deltas[metric]={'baseline':b,'candidate':c,'delta':d,'percent':percent,'caps':caps,'individual_pass':individual,'cumulative_pass':cumulative,'cumulative_positive_growth':max(0,d),'remaining_cumulative_bytes':caps['cumulative_bytes']-max(0,d),'remaining_cumulative_percent':caps['cumulative_percent']-max(0,percent or 0)}
  if not individual or not cumulative:failures.append([row['artifact'],metric,'size cap exceeded'])
 row['account']=deltas
out={'program':budget['program'],'fixed_baseline_commit':budget['baseline_commit'],'comparison':'first exception: individual and combined cumulative candidate coincide; no prior accepted growth','artifacts':rows,'failures':failures,'size_pass':not failures,'retention':'not yet decided: other gates pending'}
(s/'size-account.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'artifacts':len(rows),'growth':[{ 'artifact':r['artifact'],'metrics':{k:v['delta'] for k,v in r['account'].items() if v['delta']}} for r in rows if any(v['delta'] for v in r['account'].values())],'failures':failures}))
