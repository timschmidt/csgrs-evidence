from pathlib import Path
import subprocess,re,json,hashlib
out=Path('/tmp/interval-refactor/dynamics-jerk')
relative=re.search(r'Running benches/path_predicates.rs \(([^)]+)\)',(out/'final-check-03.log').read_text()).group(1)
paths={'baseline':Path('/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a'),'candidate':Path('/mnt/development/csgrs')/relative}
sizes=[];symbols={}
for label,p in paths.items():
 data=p.read_bytes();sizes.append(dict(label=label,path=str(p),bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),sections=subprocess.check_output(['size',str(p)],text=True)))
 text=subprocess.check_output(['nm','-S','-C','--defined-only',str(p)],text=True);(out/(label+'-owner-symbols.txt')).write_text(text)
 rows=[]
 for line in text.splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) ([tT]) (.+)',line)
  if not m:continue
  address,size,kind,name=m.groups()
  if any(s in name for s in ['JerkRamp','MonotonicJerk','FeedPathElement','AxisMotionLimits','AffineSpanAxisProjection','AxisProjectedMotionLimits','AxisProjectionRowReport','AxisProjectionBottleneck']):
   rows.append(dict(address=address,bytes=int(size,16),name=name))
 symbols[label]=rows
(out/'owner-binary-sizes.json').write_text(json.dumps(sizes,indent=2)+'\n');(out/'affected-symbols.json').write_text(json.dumps(symbols,indent=2)+'\n')
print(json.dumps(sizes,indent=2))
for label,rows in symbols.items():
 generics=[r for r in rows if 'core::ptr::drop_in_place' in r['name'] or 'core::fmt::Debug' in r['name'] or '::clone' in r['name']]
 print(label,'generic Debug/Clone/drop',len(generics),sum(r['bytes'] for r in generics),'all selected',len(rows),sum(r['bytes'] for r in rows))
