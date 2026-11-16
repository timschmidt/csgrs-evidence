from pathlib import Path
import hashlib,json,struct
s=Path(__file__).parent;rows=[]
def sha(x):return hashlib.sha256(x).hexdigest()
for r in json.loads((s/'binary-identities.json').read_text()):
 board=r['board'];variants={};alloc_diffs=[]
 for kind,p in [('current',s),('baseline',s/'baseline')]:
  elf=(p/(board+'.elf')).read_bytes();secs={x['Section']['Name']['Name']:x['Section'] for x in json.loads((p/(board+'-sections.json')).read_text())[0]['Sections']}
  variants[kind]={'elf':elf,'sections':secs,'source':(p/'clock-source.rs').read_text().splitlines()}
 c,b=variants['current'],variants['baseline'];assert len(c['elf'])==len(b['elf'])
 for name in r['allocated_section_differences']:
  assert name=='.rodata';cs=c['sections'][name];bs=b['sections'][name]
  assert cs['Size']==bs['Size'] and cs['Offset']==bs['Offset'] and cs['Address']==bs['Address']
  x=c['elf'][cs['Offset']:cs['Offset']+cs['Size']];y=b['elf'][bs['Offset']:bs['Offset']+bs['Size']]
  diffs=[i for i,(a,z) in enumerate(zip(x,y)) if a!=z];assert len(diffs)==8
  for i in diffs:
   off=cs['Offset']+i;current=struct.unpack_from('<IIII',c['elf'],off-8);baseline=struct.unpack_from('<IIII',b['elf'],off-8)
   assert current[:2]==baseline[:2] and current[3]==baseline[3]==9
   assert current[2]==baseline[2]+3
   ptr,n=current[:2];filename=x[ptr-cs['Address']:ptr-cs['Address']+n].decode();assert filename=='crates/alumina-clock/src/lib.rs'
   ct=c['source'][current[2]-1];bt=b['source'][baseline[2]-1];assert ct==bt and 'encoded[offset' in ct
   alloc_diffs.append({'file_offset':off,'address':cs['Address']+i,'filename':filename,'baseline_line':baseline[2],'current_line':current[2],'column':9,'identical_source_line':ct.strip()})
 # Executable section bytes and placements must agree even when diagnostics differ.
 for name,cs in c['sections'].items():
  if cs['Flags']['Value']&4:
   bs=b['sections'][name];assert cs['Address']==bs['Address'] and cs['Size']==bs['Size']
   assert c['elf'][cs['Offset']:cs['Offset']+cs['Size']]==b['elf'][bs['Offset']:bs['Offset']+bs['Size']]
 row={'board':board,'all_executable_sections_and_addresses_identical':True,'allocated_differences':alloc_diffs,'scope':'Classic ESP32 differs only in eight panic source line numbers in unchanged read_u64 indexing; emitted executable bytes are identical. ELF/debug and packaged artifact hashes are intentionally not treated as identical.'}
 if (s/(board+'-app.bin')).exists():
  apps={};details={}
  for kind,p in [('current',s),('baseline',s/'baseline')]:
   app=(p/(board+'-app.bin')).read_bytes();assert app[0]==0xe9
   count=app[1];pos=24;checksum=0xef;segments=[]
   for _ in range(count):
    address,n=struct.unpack_from('<II',app,pos);pos+=8;segments.append({'address':address,'length':n,'data_offset':pos})
    for byte in app[pos:pos+n]:checksum^=byte
    pos+=n
   checksum_offset=((pos+16)//16)*16-1
   assert app[checksum_offset]==checksum
   assert checksum_offset+1==len(app)-32
   assert app[-32:]==hashlib.sha256(app[:-32]).digest()
   assert app[176:208]==hashlib.sha256(variants[kind]['elf']).digest()
   details[kind]={'elf_sha256':sha(variants[kind]['elf']),'embedded_elf_hash_offset':176,'checksum_offset':checksum_offset,'checksum':checksum,'sha256_offset':len(app)-32,'image_digest':app[-32:].hex(),'segments':segments}
   apps[kind]=app
  assert details['current']['segments']==details['baseline']['segments']
  diff={i for i,(x,y) in enumerate(zip(apps['current'],apps['baseline'])) if x!=y}
  allowed=set(range(176,208))|{details['current']['checksum_offset']}|set(range(len(apps['current'])-32,len(apps['current'])))
  for loc in alloc_diffs:
   seg=next(x for x in details['current']['segments'] if x['address']<=loc['address']<x['address']+x['length'])
   allowed.add(seg['data_offset']+loc['address']-seg['address'])
  assert diff<=allowed,(board,sorted(diff-allowed))
  row.update(packaged_differences=len(diff),all_packaged_differences_attributed=True,package=details)
 rows.append(row);print(board,'panic locations',len(alloc_diffs),'package differing bytes',row.get('packaged_differences'))
(s/'byte-difference-attribution.json').write_text(json.dumps(rows,indent=2)+'\n')
