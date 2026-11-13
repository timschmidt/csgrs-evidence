from pathlib import Path
import struct,json,hashlib
p=Path(__file__).parent;bins=Path('/tmp/interval-refactor/machine-profile-binaries')
def sections(path):
 data=path.read_bytes();assert data[:6]==b'\x7fELF\x02\x01'
 off=struct.unpack_from('<Q',data,40)[0];size,count,index=struct.unpack_from('<HHH',data,58)
 headers=[struct.unpack_from('<IIQQQQIIQQ',data,off+i*size) for i in range(count)]
 names=data[headers[index][4]:headers[index][4]+headers[index][5]];out={}
 for h in headers:
  name=names[h[0]:].split(b'\0',1)[0].decode();out[name]=data[h[4]:h[4]+h[5]] if h[1]!=8 else b''
 return out
out={}
for name in ['probe','cost']:
 a=sections(bins/('final-baseline-measurement-'+name));b=sections(bins/('unsigned-candidate-measurement-'+name));assert a.keys()==b.keys()
 out[name]={key:dict(baseline_bytes=len(a[key]),candidate_bytes=len(b[key]),equal=a[key]==b[key],changed_byte_positions=[i for i,(x,y) in enumerate(zip(a[key],b[key])) if x!=y][:100]) for key in a}
p.joinpath('measurement-section-comparison.json').write_text(json.dumps(out,indent=2)+'\n')
for name,rows in out.items():print(name,[(k,v['baseline_bytes'],v['candidate_bytes'],v['changed_byte_positions']) for k,v in rows.items() if not v['equal']])
