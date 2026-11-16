from pathlib import Path
import hashlib,json,re,subprocess
s=Path(__file__).parent;assert (s/'finalized.json').exists()
rows=[]
for r in json.loads((s/'comparison.json').read_text()):
 b=r['board'];data={};sections={};frames={}
 for kind,path in [('current',s),('baseline',s/'baseline')]:
  elf=(path/(b+'.elf')).read_bytes()
  secs=json.loads((path/(b+'-sections.json')).read_text())[0]['Sections'];parsed={}
  for item in secs:
   x=item['Section'];name=x['Name']['Name']
   if not x['Flags']['Value']&2:continue
   assert name not in parsed
   parsed[name]={'size':x['Size'],'address':x['Address'],'type':x['Type']['Name'],'flags':x['Flags']['Value']}
   if x['Type']['Name']!='SHT_NOBITS':
    blob=elf[x['Offset']:x['Offset']+x['Size']];assert len(blob)==x['Size']
    parsed[name]['sha256']=hashlib.sha256(blob).hexdigest()
  sections[kind]=parsed
  fs=json.loads((s/(kind+'-'+b+'-frames.json')).read_text());groups={}
  for f in fs:
   key=re.sub(r'::h[0-9a-f]{16}$','',f['symbol']);groups.setdefault(key,[]).append({'address':f['address'],'entry_frames':f['entry_frames'],'elf_function_symbol':f['elf_function_symbol']})
  frames[kind]=groups
  data[kind]={'elf_sha256':hashlib.sha256(elf).hexdigest(),'allocated_sections':parsed,'symbol_groups':len(groups)}
 diff=[k for k in set(sections['current'])|set(sections['baseline']) if sections['current'].get(k)!=sections['baseline'].get(k)]
 row={'board':b,'artifacts':data,'allocated_section_differences':diff,'identical_allocated_sections_and_addresses':not diff,'identical_normalized_frame_groups':frames['current']==frames['baseline'],'elf_byte_identical':data['current']['elf_sha256']==data['baseline']['elf_sha256'],'app_byte_identical':None}
 if r['current']['packaging_pass']:
  row['app_byte_identical']=(s/(b+'-app.bin')).read_bytes()==(s/'baseline'/(b+'-app.bin')).read_bytes()
  row['merged_byte_identical']=(s/(b+'.bin')).read_bytes()==(s/'baseline'/(b+'.bin')).read_bytes()
 row['scope']='No failure image is generated using an inflated flash size. Equal linked allocated bytes include exact code/data addresses, but this does not establish that ClockEstimator::observe remains as an independently callable linked routine.'
 rows.append(row);print(b,'allocated identity',not diff,'app identity',row['app_byte_identical'],'ELF identity',row['elf_byte_identical'],'frame groups',row['identical_normalized_frame_groups'])
(s/'binary-identities.json').write_text(json.dumps(rows,indent=2)+'\n')
