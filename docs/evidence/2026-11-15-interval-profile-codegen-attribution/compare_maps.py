from pathlib import Path
import re,json,collections,sys
label=sys.argv[1] if len(sys.argv)>1 else "dynamic"
s=Path(__file__).parent
pat=re.compile(r'^\s*([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+(\d+)( +)(.*)$')
def parse(label):
 symbols=[];section='';sections={}
 for line in (s/(label+'.map')).read_text().splitlines():
  m=pat.match(line)
  if not m:continue
  address,lma,size,align,spaces,name=m.groups();address=int(address,16);size=int(size,16)
  if len(spaces)==1:
   section=name;sections[name]={'address':address,'bytes':size}
  if section=='.text' and len(spaces)>=17 and size:
   symbols.append({'address':address,'bytes':size,'name':name,'normalized':re.sub(r'::h[0-9a-f]{16}(?=$|\.)','',re.sub(r' \(\.\d+\)$','',name))})
 groups={}
 for row in symbols:groups.setdefault((row['address'],row['bytes']),[]).append(row['normalized'])
 totals=collections.Counter()
 for (address,size),names in groups.items():totals[' | '.join(sorted(set(names)))]+=size
 intervals=sorted((a,a+n) for a,n in groups);end=0;union=0
 for a,b in intervals:
  union+=max(0,b-max(a,end));end=max(end,b)
 return {'sections':sections,'symbols':symbols,'text_symbol_union':union,'symbol_groups':len(groups)},totals
b,bt=parse('baseline');d,dt=parse(label);diff=[{'name':name,'baseline':bt[name],'dynamic':dt[name],'delta':dt[name]-bt[name]} for name in sorted(set(bt)|set(dt)) if bt[name]!=dt[name]];diff.sort(key=lambda r:abs(r['delta']),reverse=True)
report={'baseline':b,'dynamic':d,'deltas':diff};(s/(label+'-attribution.json')).write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'baseline_text':b['sections']['.text'],'dynamic_text':d['sections']['.text'],'baseline_symbol_union':b['text_symbol_union'],'dynamic_symbol_union':d['text_symbol_union'],'top_changes':diff[:22]},indent=2))
