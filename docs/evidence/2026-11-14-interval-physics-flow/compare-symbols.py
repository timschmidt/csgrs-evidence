from pathlib import Path
import subprocess,re,json,collections
s=Path(__file__).parent;p=Path('/mnt/development/.interval-refactor-build/physics-flow-artifacts')
def symbols(name):
 result=collections.defaultdict(list)
 for line in subprocess.check_output(['nm','-S','-C',str(p/name)],text=True).splitlines():
  m=re.match(r'^([0-9a-f]+) ([0-9a-f]+) ([tTwW]) (.+)$',line)
  if m:result[m[4]].append((int(m[1],16),int(m[2],16)))
 return result
out={}
for a,b in [('physics-base','physics-default'),('dynamics-base','dynamics-candidate')]:
 if not (p/b).exists():continue
 aa=symbols(a);bb=symbols(b);shared=aa.keys()&bb.keys();out[a+' vs '+b]={'shared':len(shared),'only_base':sorted(aa.keys()-bb.keys()),'only_candidate':sorted(bb.keys()-aa.keys()),'changed_size':[(k,aa[k],bb[k]) for k in sorted(shared) if sorted(x[1] for x in aa[k])!=sorted(x[1] for x in bb[k])],'moved':[(k,aa[k],bb[k]) for k in sorted(shared) if sorted(aa[k])!=sorted(bb[k])]}
(s/'symbol-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2)[:5000])
