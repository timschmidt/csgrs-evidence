from pathlib import Path
import subprocess,re,json,hashlib,collections
p=Path(__file__).parent
roots=['hyperpath::routing::certify_differential_pair_skew','hyperpath::specctra::import_specctra_trace_record','hyperpath::specctra::parse_specctra_grid_trace_records']
report={}
for variant in ['baseline','candidate']:
 binary=json.loads((p/(variant+'-binary.json')).read_text())['path'];symbols={};byname={}
 for l in (p/(variant+'-symbols.txt')).read_text().splitlines():
  m=re.fullmatch(r'([0-9a-f]+) ([0-9a-f]+) [tTwW] (.*)',l)
  if m:
   a,n,name=int(m[1],16),int(m[2],16),m[3]
   symbols.setdefault(a,{'bytes':n,'names':[]})['names'].append(name);byname.setdefault(name,[]).append(a)
 relocations={}
 raw=subprocess.check_output(['readelf','-rW',binary],text=True);(p/(variant+'-relocations.txt')).write_text(raw)
 for l in raw.splitlines():
  m=re.match(r'([0-9a-f]+)\s+[0-9a-f]+\s+R_X86_64_RELATIVE\s+([0-9a-f]+)',l)
  if m:relocations[int(m[1],16)]={'address':int(m[2],16)};continue
  m=re.match(r'([0-9a-f]+)\s+[0-9a-f]+\s+R_X86_64_(?:GLOB_DAT|JUMP_SLOT)\s+[0-9a-f]+\s+(\S+)',l)
  if m:relocations[int(m[1],16)]={'external':m[2]}
 def names(a):return symbols.get(a,{}).get('names',[])
 def describe(a,save=False):
  n=symbols[a]['bytes'];cmd=['objdump','-d','-C','--no-show-raw-insn',f'--start-address={a}',f'--stop-address={a+n}',binary]
  raw=subprocess.check_output(cmd,text=True)
  if save:(p/(variant+'-'+names(a)[0].rsplit('::',1)[-1]+'.asm')).write_text(raw)
  instructions=[];calls=[]
  for l in raw.splitlines():
   m=re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)',l)
   if not m:continue
   pc,op,args=int(m[1],16),m[2],m[3];normalized=re.sub(r'\s+#.*','',args)
   normalized=re.sub(r'-?0x[0-9a-f]+(?=\(%rip\))','RIP_DISP',normalized)
   target=re.match(r'([0-9a-f]+) <',args)
   if target:
    dest=int(target[1],16)
    replacement=('LOCAL+'+str(dest-a)) if a<=dest<a+n else 'TARGET:'+repr(names(dest))
    normalized=re.sub(r'^[0-9a-f]+ <.*>',replacement,normalized)
   if op.startswith('call'):
    row={'offset':pc-a,'instruction':op+' '+args}
    if target:
     dest=int(target[1],16);row.update(address=dest,names=names(dest),kind='direct')
    else:
     slot=re.search(r'# ([0-9a-f]+)',args)
     if slot:
      address=int(slot[1],16);r=relocations.get(address,{});row.update(slot=address,kind='RIP-indirect',**r)
      if 'address' in r:row['names']=names(r['address'])
     else:row['kind']='register-indirect-unresolved'
    calls.append(row)
   instructions.append(op+' '+normalized)
  return {'address':a,**symbols[a],'instruction_count':len(instructions),'normalized_hash':hashlib.sha256('\n'.join(instructions).encode()).hexdigest(),'calls':calls}
 rows=[]
 for name in roots:
  assert len(byname[name])==1
  root=describe(byname[name][0],True);targets=sorted({c['address'] for c in root['calls'] if c.get('address') in symbols})
  rows.append({'root':root,'immediate_callees':[describe(a) for a in targets]})
 report[variant]=rows
report['scope']='Actual direct and RIP-relative function-pointer targets resolved from ELF relocations. Immediate callees are inventoried. Register-indirect calls remain explicit. Normalized addresses/static counts are not a semantic-equivalence or dynamic-cost proof; original disassembly and relocation tables remain.'
(p/'resolved-hot-targets.json').write_text(json.dumps(report,indent=2)+'\n')
for variant in ['baseline','candidate']:
 for row in report[variant]:
  r=row['root'];print(variant,r['names'][0],r['bytes'],r['instruction_count'],'callees',len(row['immediate_callees']),'unresolved',sum(c['kind']=='register-indirect-unresolved' for c in r['calls']))
