from pathlib import Path
import subprocess,gzip,hashlib,json
stage=Path('/tmp/interval-refactor/servo-migration');build=Path('/mnt/development/.interval-refactor-build')
rows={}; artifacts={}
for name in ['baseline','candidate']:
 programs={'servo-188':(build/f'servo-probe-{name}'/'release/observe',[]),'servo-195':(build/f'servo-probe-{name}-195'/'release/observe',[]),'clock':(build/f'servo-clock-{name}'/'release/clock-owner-probe',['rows']),'foc':(build/f'servo-foc-{name}'/'release/observe',[])}
 for kind,(p,args) in programs.items():
  data=subprocess.check_output([str(p),*args]);(stage/f'final-{kind}-{name}-rows.txt.gz').write_bytes(gzip.compress(data,mtime=0))
  row={'bytes':len(data),'rows':len(data.splitlines()),'sha256':hashlib.sha256(data).hexdigest()};rows[kind,name]=row
  if name=='candidate':assert row==rows[kind,'baseline'],kind
 for kind,p in [('servo-188',build/f'servo-probe-{name}'/'release/cost'),('servo-195',build/f'servo-probe-{name}-195'/'release/cost'),('clock',programs['clock'][0]),('foc',build/f'servo-foc-{name}'/'release/cost')]:
  size=subprocess.check_output(['size','-A',str(p)],text=True)
  (stage/f'final-{kind}-{name}-size.log').write_text(size)
  (stage/f'final-{kind}-{name}-symbols.log').write_bytes(subprocess.check_output(['nm','-S','--size-sort','--demangle',str(p)]))
  text=int(next(x.split()[1] for x in size.splitlines() if x.startswith('.text ')))
  artifacts[kind,name]={'path':str(p),'bytes':p.stat().st_size,'text':text,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
 data=subprocess.check_output([str(programs['clock'][0]),'alloc']);(stage/f'clock-{name}-alloc.log').write_bytes(data)
 if name=='candidate':assert data==(stage/'clock-baseline-alloc.log').read_bytes()
(stage/'final-observers.json').write_text(json.dumps({f'{k}:{n}':v for (k,n),v in rows.items()},indent=2)+'\n')
(stage/'final-artifacts.json').write_text(json.dumps({f'{k}:{n}':v for (k,n),v in artifacts.items()},indent=2)+'\n')
print('All full observer rows and clock allocation reports match.')
print(json.dumps({f'{k}:{n}':v for (k,n),v in artifacts.items()},indent=2))
