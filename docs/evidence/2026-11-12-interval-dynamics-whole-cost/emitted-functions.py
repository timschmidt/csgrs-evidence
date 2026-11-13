from pathlib import Path
import subprocess,re,json
out=Path('/tmp/interval-refactor/dynamics-whole-cost');paths={'original':Path('/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a'),'control':Path('/tmp/interval-refactor/dynamics-cost-binaries/whole-control'),'selected':Path('/tmp/interval-refactor/dynamics-cost-binaries/whole-inline-reports')};records={}
for label,p in paths.items():
 text=subprocess.check_output(['readelf','--wide','--symbols','--demangle',str(p)],text=True);(out/(label+'-elf-symbols.txt')).write_text(text)
 sections=subprocess.check_output(['readelf','--wide','--section-headers',str(p)],text=True);(out/(label+'-elf-sections.txt')).write_text(sections)
 functions={};unsized=[]
 for line in text.splitlines():
  fields=line.split(None,7)
  if len(fields)<8 or not fields[0].endswith(':') or fields[3]!='FUNC' or fields[6]=='UND':continue
  address=int(fields[1],16);size=int(fields[2],16 if fields[2].startswith('0x') else 10);section=fields[6];name=fields[7]
  if size==0:unsized.append(dict(address=address,section=section,name=name));continue
  row=functions.setdefault((section,address,size),dict(address=address,bytes=size,section=section,names=[]))
  if name not in row['names']:row['names'].append(name)
 # Include every defined FUNC symbol from .symtab/.dynsym, not a favorable
 # generic-name subset. Merge aliases/overlapping ranges to count bytes once.
 by_section={}
 for (section,address,size) in functions:by_section.setdefault(section,[]).append((address,address+size))
 covered=0
 for ranges in by_section.values():
  stop=0
  for start,end in sorted(ranges):covered+=max(0,end-max(start,stop));stop=max(stop,end)
 text_match=re.search(r'^\s*\[\s*(\d+)\]\s+\.text\s+\S+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([0-9a-f]+)',sections,re.M);assert text_match
 records[label]=dict(path=str(p),defined_sized_function_ranges=len(functions),union_function_bytes=covered,unsized_function_symbols=unsized,text_section_bytes=int(text_match[3],16),functions=list(functions.values()))
(out/'emitted-functions.json').write_text(json.dumps(records,indent=2)+'\n')
summary={k:{key:value for key,value in r.items() if key!='functions'} for k,r in records.items()};(out/'emitted-function-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
for k,r in summary.items():print(k,r['defined_sized_function_ranges'],r['union_function_bytes'],r['text_section_bytes'],'unsized',len(r['unsized_function_symbols']))
