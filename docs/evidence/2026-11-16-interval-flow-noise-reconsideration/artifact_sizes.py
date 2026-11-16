from pathlib import Path
import hashlib, json, re, shutil, subprocess

s=Path(__file__).parent
art=Path('/mnt/development/.interval-refactor-build/flow-noise-reconsideration/artifacts')
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
