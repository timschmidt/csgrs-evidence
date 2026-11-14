from pathlib import Path
import re,json,hashlib
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/sdf-enclosure-artifacts')
all_sections={};unions={}
for label in ['baseline-default','candidate-default']:
 data=(art/label).read_bytes();sections={}
 for line in (s/f'{label}-sections.txt').read_text().splitlines():
  m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+(\S+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+\S+\s+(\S+)\s+\d+\s+\d+\s+\d+',line)
  if not m:continue
  name,kind,addr,offset,size,flags=m.groups()
  if 'A' not in flags:continue
  n=int(size,16);payload=b'' if kind=='NOBITS' else data[int(offset,16):int(offset,16)+n]
  sections[name]=dict(address=int(addr,16),bytes=n,type=kind,flags=flags,sha256=hashlib.sha256(payload).hexdigest())
 all_sections[label]=sections
 spans=[];zero=0
 for line in (s/f'{label}-symbols.txt').read_text().splitlines():
  parts=line.split()
  if len(parts)>=7 and parts[3]=='FUNC' and parts[6]!='UND':
   start=int(parts[1],16);size=int(parts[2],0)
   if size:spans.append((start,start+size))
   else:zero+=1
 merged=[]
 for start,end in sorted(spans):
  if merged and start<=merged[-1][1]:merged[-1][1]=max(merged[-1][1],end)
  else:merged.append([start,end])
 unions[label]=dict(bytes=sum(b-a for a,b in merged),symbols=len(spans),zero_sized=zero,merged_spans=merged)
changes=[name for name,value in all_sections['baseline-default'].items() if all_sections['candidate-default'].get(name)!=value]
(s/'all-allocated-sections.json').write_text(json.dumps(dict(sections=all_sections,changed=changes),indent=2)+'\n');(s/'function-union.json').write_text(json.dumps(unions,indent=2)+'\n')
print('changed allocated sections',changes);print('function unions',{k:v['bytes'] for k,v in unions.items()})
