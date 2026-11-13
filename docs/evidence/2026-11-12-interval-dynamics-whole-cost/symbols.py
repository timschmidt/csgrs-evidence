from pathlib import Path
import json,re,collections,sys
out=Path('/tmp/interval-refactor/dynamics-whole-cost');labels=sys.argv[1:];records={}
for label in labels:
 source=out/(label+'-symbols.txt')
 if label=='original':source=Path('/tmp/interval-refactor/dynamics-feed-join/baseline-owner-symbols.txt')
 by_address={}
 for line in source.read_text().splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] (.*)',line)
  if not m:continue
  address,size,name=m.groups();size=int(size,16)
  row=by_address.setdefault(address,dict(bytes=size,names=[]));assert row['bytes']==size;row['names'].append(name)
 families=collections.defaultdict(lambda:dict(count=0,bytes=0,instances=[]))
 for address,row in by_address.items():
  name=sorted(row['names'])[0]
  name=name.replace('hyperpath::routing::axis_projection::','hyperdynamics::axis_projection::').replace('hyperpath::routing::jerk_schedule::','hyperdynamics::jerk_schedule::').replace('hyperpath::routing::feed::','hyperdynamics::feed::').replace('hyperpath::routing::lookahead::','hyperdynamics::lookahead::')
  for moved in ['AccelerationLimitedFeedProfileClass','AccelerationLimitedFeedTimeReport','ConstantFeedTimeReport','classify_acceleration_limited_profile','acceleration_limited_feed_time_equation']:
   name=name.replace('hyperpath::routing::'+moved,'hyperdynamics::feed::'+moved)
  for moved in ['constant_feed_time_equation','symmetric_jerk_limited_feed_time_equation']:
   name=name.replace('hyperpath::solve::'+moved,'hyperdynamics::feed::'+moved)
  family=families[name];family['count']+=1;family['bytes']+=row['bytes'];family['instances'].append(dict(address=address,**row))
 records[label]=dict(named_unique_addresses=len(by_address),named_text_bytes=sum(r['bytes'] for r in by_address.values()),families=families)
(out/'symbol-families.json').write_text(json.dumps(records,indent=2)+'\n')
if len(labels)>1:
 base=records[labels[0]]['families'];deltas={}
 for label in labels[1:]:
  current=records[label]['families'];rows=[]
  for name in base.keys()|current.keys():
   b=base.get(name,dict(bytes=0,count=0));c=current.get(name,dict(bytes=0,count=0))
   if b['bytes']!=c['bytes'] or b['count']!=c['count']:rows.append(dict(name=name,before_bytes=b['bytes'],after_bytes=c['bytes'],before_count=b['count'],after_count=c['count'],byte_delta=c['bytes']-b['bytes']))
  deltas[label]=sorted(rows,key=lambda r:(-r['byte_delta'],r['name']))
 (out/'symbol-deltas.json').write_text(json.dumps(deltas,indent=2)+'\n')
for label,row in records.items():print(label,row['named_unique_addresses'],row['named_text_bytes'])
