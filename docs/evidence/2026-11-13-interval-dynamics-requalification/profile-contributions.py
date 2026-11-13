from pathlib import Path
import re,json,collections
p=Path(__file__).parent

def parse(f):
 lines=f.read_text().splitlines();names={}
 for line in lines:
  m=re.match(r'(?:c?fn)=\((\d+)\) (.+)',line)
  if m:names[m[1]]=m[2]
 own=collections.Counter();inclusive=collections.Counter();edges=[];current=None;target=None;pending=False
 for line in lines:
  m=re.match(r'fn=\((\d+)\)',line)
  if m:current=names.get(m[1],m[1]);continue
  m=re.match(r'cfn=\((\d+)\)',line)
  if m:target=names.get(m[1],m[1]);continue
  if line.startswith('calls='):pending=True;continue
  if re.match(r'^(?:\d+|[+*-]\d*) ',line):
   cost=int(line.split()[1]);inclusive[current]+=cost
   if pending:edges.append(dict(caller=current,callee=target,instructions=cost));pending=False
   else:own[current]+=cost
 return dict(own=dict(own),inclusive=dict(inclusive),edges=edges)
rows={}
for f in p.glob('callgrind-*.out'):rows[f.stem]=parse(f)
(p/'profile-contributions.json').write_text(json.dumps(rows,indent=2)+'\n')
case='mixed_path_symmetric_jerk_limited_feed_time'
for v in ['baseline','candidate']:
 print(v)
 d=rows[f'callgrind-{case}-{v}']
 for n,c in d['own'].items():
  if any(s in n for s in ['routing::feed','dynamics::feed','metric::Metric','MetricSpan']):print(c,n)
 for e in d['edges']:
  if 'exact_length' in e['callee'] or 'route_path_length' in e['callee']:print(e)
