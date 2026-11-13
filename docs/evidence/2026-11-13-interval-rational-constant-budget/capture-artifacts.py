from pathlib import Path
import subprocess,re,hashlib,json
out=Path(__file__).parent
paths={
 'point-control':Path('/tmp/interval-refactor/rational-constant-point-control'),
 'point-current':Path('/mnt/development/csgrs/target/release/deps/expression_program-7e1e8d72933907e6'),
 'field-control':Path('/tmp/interval-refactor/rational-constant-field-control'),
 'field-current':Path('/tmp/interval-refactor/rational-constant-field-target/release/expression-field-cost-probe'),
 'rejection-control':Path('/tmp/interval-refactor/rational-admission-control'),
 'rejection-current':Path('/tmp/interval-refactor/rational-admission-target/release/rational-admission-probe'),
}

rows=[]
for label,p in paths.items():
 if not p.exists():continue
 raw=subprocess.check_output(['nm','-S','--defined-only','--demangle',str(p)]).decode();(out/(label+'-symbols.txt')).write_text(raw)
 intervals=[];unsized=[]
 for line in raw.splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tTwW] (.*)',line)
  if m:
   a,n,name=m.groups();a=int(a,16);n=int(n,16)
   if n:intervals.append((a,a+n))
   else:unsized.append(name)
  else:
   m=re.match(r'[0-9a-f]+ [tTwW] (.*)',line)
   if m:unsized.append(m.group(1))
 total=end=0
 for a,b in sorted(intervals):total+=max(0,b-max(a,end));end=max(end,b)
 data=p.read_bytes();sections={}
 raw_sections=subprocess.check_output(['readelf','-SW',str(p)]).decode();(out/(label+'-sections.txt')).write_text(raw_sections)
 for line in raw_sections.splitlines():
  m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+PROGBITS\s+\S+\s+(\S+)\s+(\S+)',line)
  if m:
   name,offset,n=m.groups()
   if name in ['.text','.rodata','.data.rel.ro']:
    a=int(offset,16);n=int(n,16);sections[name]={'bytes':n,'sha256':hashlib.sha256(data[a:a+n]).hexdigest()}
 (out/(label+'-size.txt')).write_bytes(subprocess.check_output(['size',str(p)]))
 rows.append(dict(label=label,path=str(p),bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),sized_function_interval_union_bytes=total,sized_function_intervals=len(set(intervals)),unsized_functions=unsized,sections=sections))
(out/'artifacts.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps([{k:v for k,v in r.items() if k not in ['unsized_functions','sections']} for r in rows],indent=2))
