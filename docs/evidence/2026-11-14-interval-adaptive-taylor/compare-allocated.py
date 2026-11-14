from pathlib import Path
import struct,json,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/.interval-refactor-build/adaptive-taylor-artifacts')
def sections(name):
 data=(root/name).read_bytes();assert data[:6]==b'\x7fELF\x02\x01';h=struct.unpack_from('<16sHHIQQQIHHHHHH',data);offset,entry,count,names=h[6],h[11],h[12],h[13];rows=[struct.unpack_from('<IIQQQQIIQQ',data,offset+i*entry) for i in range(count)];n=rows[names];strings=data[n[4]:n[4]+n[5]];out={}
 for row in rows:
  if not row[2]&2:continue
  name=strings[row[0]:].split(b'\0')[0].decode();out[name]=dict(type=row[1],flags=row[2],address=row[3],offset=row[4],bytes=row[5],alignment=row[8],sha256=None if row[1]==8 else hashlib.sha256(data[row[4]:row[4]+row[5]]).hexdigest())
 return out
base=sections('base');out={}
for variant in ['default','enabled']:
 other=sections(variant);assert base.keys()==other.keys();changes={k:{'base':base[k],'candidate':other[k]} for k in base if base[k]!=other[k]};out[variant]=dict(allocated_sections=len(base),changed=changes)
(s/'allocated-section-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print({k:list(v['changed']) for k,v in out.items()})
assert list(out['default']['changed'])==['.note.gnu.build-id']
