from pathlib import Path
import struct,json,hashlib
p=Path(__file__).parent
# Inspect bytes only; never rewrite ELF files while extracting sections.
def elf(path):
 data=path.read_bytes();assert data[:6]==b'\x7fELF\x02\x01'
 h=struct.unpack_from('<16sHHIQQQIHHHHHH',data)
 sections=[struct.unpack_from('<IIQQQQIIQQ',data,h[6]+i*h[11]) for i in range(h[12])]
 s=sections[h[13]];names=data[s[4]:s[4]+s[5]];out={}
 for s in sections[1:]:
  name=names[s[0]:].split(b'\0')[0].decode()
  out[name]=(s,b'' if s[1]==8 else data[s[4]:s[4]+s[5]])
 return data,out
rows=[]
for project in ['old-native-cost','old-native-semantic']:
 baseline=Path('/tmp/interval-refactor/taylor-binaries')/('pristine-baseline-'+project)
 final=Path('/tmp/interval-refactor/taylor-resolution-binaries')/('arity-'+project)
 x,xs=elf(baseline);y,ys=elf(final);diff=[]
 for name,(s,content) in xs.items():
  t,other=ys[name]
  if s!=t or content!=other:
   diff.append({'section':name,'flags':s[2],'metadata_equal':s==t,'differing_bytes':sum(u!=v for u,v in zip(content,other)),'size_equal':len(content)==len(other)})
 assert {r['section'] for r in diff}=={'.note.gnu.build-id','.strtab'}
 assert all(r['metadata_equal'] and r['size_equal'] for r in diff)
 nx=bytearray(x);ny=bytearray(y)
 for name in ['.note.gnu.build-id','.strtab']:
  s=xs[name][0];nx[s[4]:s[4]+s[5]]=b'\0'*s[5];ny[s[4]:s[4]+s[5]]=b'\0'*s[5]
 assert nx==ny
 rows.append({'project':project,'bytes':len(x),'baseline_sha256':hashlib.sha256(x).hexdigest(),'final_sha256':hashlib.sha256(y).hexdigest(),'differing_sections':diff,'all_other_file_bytes_identical':True,'allocated_code_data_unwind_relocations_identical_except_build_id':True})
old=json.loads((p/'legacy-artifact-comparison.json').read_text());assert rows==old
print('Both legacy consumers: all file bytes except build ID and nonallocated symbol strings match')
