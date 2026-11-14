from pathlib import Path
import subprocess,os,json,hashlib
s=Path(__file__).parent;target=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-typed-binaries');rows=[]
def sizes(p):
 output=subprocess.check_output(['size','-A',str(p)]).decode();sections={}
 for line in output.splitlines():
  bits=line.split()
  if len(bits)==3 and bits[1].isdigit() and bits[0].startswith('.'):sections[bits[0]]=int(bits[1])
 symbols=subprocess.check_output(['nm','-S','--defined-only','-C',str(p)]).decode();groups=set();owner=set()
 for line in symbols.splitlines():
  bits=line.split(maxsplit=3)
  if len(bits)==4 and bits[2] in ('t','T'):
   key=(int(bits[0],16),int(bits[1],16));groups.add(key)
   if 'hyperdynamics::' in bits[3]:owner.add(key)
 return output,symbols,dict(sections=sections,all_text_symbol_bytes=sum(n for _,n in groups),owner_text_symbol_bytes=sum(n for _,n in owner))
for original in json.loads((s/'baseline-binaries.json').read_text()):
 name=original['name']
 if name.startswith('lib'):continue
 candidates=[p for p in target.glob(name+'-*') if p.is_file() and os.access(p,os.X_OK)];assert len(candidates)==1,(name,candidates);p=candidates[0]
 data=p.read_bytes();row=dict(name=name,baseline=original,candidate=dict(path=str(p),bytes=len(data),sha256=hashlib.sha256(data).hexdigest()))
 for variant,path in [('baseline',Path(original['path'])),('candidate',p)]:
  out,symbols,info=sizes(path);(s/f'typed-{variant}-size-{name}.txt').write_text(out);(s/f'typed-{variant}-symbols-{name}.txt').write_text(symbols);row[variant].update(info)
 row['raw_growth']=row['candidate']['bytes']-row['baseline']['bytes'];row['text_growth']=row['candidate']['sections']['.text']-row['baseline']['sections']['.text'];row['owner_symbols_growth']=row['candidate']['owner_text_symbol_bytes']-row['baseline']['owner_text_symbol_bytes'];rows.append(row)
(s/'typed-binary-comparison.json').write_text(json.dumps(rows,indent=2)+'\n')
print([(x['name'],x['raw_growth'],x['text_growth'],x['owner_symbols_growth']) for x in rows])
