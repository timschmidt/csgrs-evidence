from pathlib import Path
import subprocess,json,hashlib,re,tempfile
s=Path(__file__).parent;rows=json.loads((s/'final-artifacts.json').read_text());summary={}
for row in rows:
 p=Path(row['path']);assert hashlib.sha256(p.read_bytes()).hexdigest()==row['sha256'];details={}
 for name,cmd in [('sections',['readelf','-SW',str(p)]),('sizes',['size','-A',str(p)]),('symbols',['nm','-S','--size-sort','--demangle',str(p)])]:
  proc=subprocess.run(cmd,capture_output=True,text=True);assert proc.returncode==0;(s/f"{row['name']}-{name}.log").write_text(proc.stdout)
 with tempfile.TemporaryDirectory(prefix='qr-evolution-sections-') as temp:
  for line in (s/f"{row['name']}-sections.log").read_text().splitlines():
   m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+(\S+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+\S+\s+(\S+)',line)
   if not m:continue
   name,kind,address,offset,size,flags=m.groups()
   if 'A' not in flags:continue
   data=bytes(int(size,16)) if kind=='NOBITS' else p.read_bytes()[int(offset,16):int(offset,16)+int(size,16)]
   details[name]=dict(address=int(address,16),bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
 summary[row['name']]=dict(bytes=p.stat().st_size,sha256=row['sha256'],allocated_sections=details)
(s/'artifact-sections.json').write_text(json.dumps(summary,indent=2)+'\n')
comparisons={}
for name in ['default','enabled']:
 a=summary['base']['allocated_sections'];b=summary[name]['allocated_sections'];comparisons[name]={key:dict(base=a.get(key),candidate=b.get(key)) for key in sorted(a.keys()|b.keys()) if a.get(key)!=b.get(key)}
(s/'artifact-differences.json').write_text(json.dumps(comparisons,indent=2)+'\n');print({n:list(v) for n,v in comparisons.items()})
