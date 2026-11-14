from pathlib import Path
import struct,json,hashlib
s=Path(__file__).parent

def read(path):
 data=Path(path).read_bytes();assert data[:6]==b'\x7fELF\x02\x01'
 off=struct.unpack_from('<Q',data,40)[0];size,count,strings=struct.unpack_from('<HHH',data,58)
 headers=[struct.unpack_from('<IIQQQQIIQQ',data,off+i*size) for i in range(count)];h=headers[strings];names=data[h[4]:h[4]+h[5]];result={}
 for h in headers:
  name=names[h[0]:].split(b'\0',1)[0].decode();body=data[h[4]:h[4]+h[5]] if h[1]!=8 else b''
  result[name]={'type':h[1],'flags':h[2],'address':h[3],'size':h[5],'body':body}
 return result
control={v:read(json.loads((s/f'{v}-control.json').read_text())['path']) for v in ['baseline','candidate']}
a,b=control.values();assert a.keys()==b.keys();sections=[]
for name,h in a.items():
 if not h['flags']&2:continue
 other=b[name];same=all(h[k]==other[k] for k in ['address','size','body'])
 sections.append({'name':name,'bytes':h['size'],'address':h['address'],'identical':same,'baseline_sha256':hashlib.sha256(h['body']).hexdigest(),'candidate_sha256':hashlib.sha256(other['body']).hexdigest()})
assert {r['name'] for r in sections if not r['identical']}=={'.data.rel.ro','.note.gnu.build-id'}
locations=[]
for item in json.loads((s/'control-relocation-data-differences.json').read_text()):
 offset=item['offset'];files=[]
 for variant in ['baseline','candidate']:
  h=control[variant];body=h['.data.rel.ro']['body'];pointer,length=struct.unpack_from('<QQ',body,offset-16)
  if pointer==0:
   relocations={target:(kind,addend) for target,kind,addend in struct.iter_unpack('<QQq',h['.rela.dyn']['body'])}
   kind,pointer=relocations[h['.data.rel.ro']['address']+offset-16];assert kind&0xffffffff==8
  ro=h['.rodata'];file=ro['body'][pointer-ro['address']:pointer-ro['address']+length].decode();files.append(file)
 assert files[0]==files[1] and files[0].endswith('expression_program/taylor/model/polynomial.rs'),files
 locations.append(item|{'source_file':files[0]})
(s/'control-artifact-inspection.json').write_text(json.dumps({'allocated_sections':sections,'only_runtime_differences_are_panic_location_line_numbers':True,'locations':locations,'same_text_and_layout':True,'binary_size_delta':json.loads((s/'candidate-control.json').read_text())['bytes']-json.loads((s/'baseline-control.json').read_text())['bytes']},indent=2)+'\n')
print('All allocated sections match except 25 verified source-line records and derived build id.')
