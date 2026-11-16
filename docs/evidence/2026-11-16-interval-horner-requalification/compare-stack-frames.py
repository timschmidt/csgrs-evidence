from pathlib import Path
import json,subprocess,re,collections
s=Path(__file__).parent;out=s/'stack-artifacts';data={}
for variant in ['baseline','candidate']:
 symbols=collections.defaultdict(set)
 for line in (out/(variant+'.nm')).read_text().splitlines():
  f=line.split(maxsplit=3)
  if len(f)==4 and f[2] in ['t','T']:symbols[int(f[0])].add(f[3])
 raw=subprocess.check_output(['readelf','--debug-dump=frames',str(out/variant)],text=True);(out/(variant+'.frames')).write_text(raw);rows=collections.defaultdict(list)
 for block in re.split(r'\n(?=[0-9a-f]{8,} )',raw):
  header=block.split('\n')[0]
  m=re.search(r' FDE .*pc=([0-9a-f]+)\.\.([0-9a-f]+)',header)
  if not m:continue
  start=int(m[1],16);offsets=[int(x) for x in re.findall(r'DW_CFA_def_cfa(?:_offset)?: (?:r\d+ \([^)]*\) ofs )?(\d+)',block)];expressions=re.findall(r'.*DW_CFA_.*expression.*',block)
  for name in symbols[start]:rows[name].append({'start':start,'max_cfa_offset':max(offsets,default=8),'expressions':expressions})
 data[variant]=rows
comparisons=[];ambiguous=[]
for name in data['baseline'].keys()&data['candidate'].keys():
 a,b=data['baseline'][name],data['candidate'][name]
 if len(a)!=1 or len(b)!=1:ambiguous.append(name);continue
 if a[0]['expressions'] or b[0]['expressions']:continue
 comparisons.append({'name':name,'baseline':a[0]['max_cfa_offset'],'candidate':b[0]['max_cfa_offset'],'delta':b[0]['max_cfa_offset']-a[0]['max_cfa_offset'],'baseline_address':a[0]['start'],'candidate_address':b[0]['start']})
report={'scope':'Unique-name matched FDE maximum CFA offsets, not call-chain peaks. Expression CFA and duplicate demangled names are excluded, not certified.','matched_functions':len(comparisons),'ambiguous_names':ambiguous,'changed':sorted([r for r in comparisons if r['delta']],key=lambda r:(-r['delta'],r['name']))}
(s/'stack-frame-comparison.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report['changed'][:30],indent=2))
