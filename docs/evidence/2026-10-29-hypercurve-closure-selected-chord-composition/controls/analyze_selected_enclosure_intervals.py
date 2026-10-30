"""Independent exact interval checks of a captured selected scalar; no geometry claim."""
from pathlib import Path
from fractions import Fraction as Q
import functools,hashlib,json,time
c=Path(__file__).resolve().parent;p=c/'polynomial-chamfer-dispatch-enclosure-capture1/enclosure-value.json';nodes,roots=json.loads(p.read_text());started=time.monotonic()
def rational(text):
 v=json.loads(text);assert v['class']=='One' and v['computable'] is None;v=v['rational'];return Q(v['sign']*sum(x<<(32*i) for i,x in enumerate(v['numerator'])),sum(x<<(32*i) for i,x in enumerate(v['denominator'])))
def point(x):return (Q(x),Q(x))
def add(a,b):return(a[0]+b[0],a[1]+b[1])
def mul(a,b):
 v=[x*y for x in a for y in b];return(min(v),max(v))
def div(a,b):
 assert b[1]<0 or b[0]>0,('denominator enclosure crosses zero',b)
 return mul(a,(1/b[1],1/b[0]))
def sign(a):return -1 if a[1]<0 else 1 if a[0]>0 else 0 if a==(0,0) else None
def polynomial(cs,x):
 out=point(0)
 for v in reversed(cs):out=add(mul(out,x),v)
 return out
base_ids=[i for i,n in enumerate(nodes) if n[0]=='base'];native_ids=[i for i,n in enumerate(nodes) if n[0]=='native'];fields=[i for i,n in enumerate(nodes) if n[0]=='polynomial'];assert len(base_ids)==len(native_ids)==1 and len(fields)==3
base_id=base_ids[0];native_id=native_ids[0];source=nodes[base_id][1];assert len(source)==1;source=source[0];native_poly=[point(rational(x)) for x in source[3]];assert native_poly==[point(Q(3,4)),point(0),point(0),point(1)]
ranges={};alpha=(rational(source[4]),rational(source[5]));certificates=[]
def refine(cs,interval,steps,label):
 derivative=[mul(point(i),cs[i]) for i in range(1,len(cs))]
 ds=sign(polynomial(derivative,interval));ls=sign(polynomial(cs,point(interval[0])));hs=sign(polynomial(cs,point(interval[1])));assert ds in [-1,1] and ls in [-1,1] and hs==-ls,(label,'selector not independently certified',ds,ls,hs)
 original=interval;completed=0
 for _ in range(steps):
  middle=sum(interval)/2;ms=sign(polynomial(cs,point(middle)))
  if ms is None:break
  if ms==0:interval=point(middle);completed+=1;break
  if ms==ls:interval=(middle,interval[1])
  else:assert ms==hs;interval=(interval[0],middle)
  completed+=1
 certificates.append({'label':label,'original':[str(x) for x in original],'requested_steps':steps,'completed_steps':completed,'derivative_sign':ds,'endpoint_signs':[ls,hs],'bounds':[str(x) for x in interval]})
 return interval
alpha=refine(native_poly,alpha,128,'native cubic')
def tensor(data):
 dims,cs=data;assert len(dims)==1 and dims[0]==len(cs);return polynomial([point(rational(x)) for x in cs],alpha)
assert tensor(nodes[base_id][2])==tensor(nodes[base_id][3])==point(1)
@functools.cache
def value(i):
 n=nodes[i]
 if n[0]=='base-value':
  assert n[1]==base_id
  out=point(0)
  for t in n[2:]:out=add(out,tensor(t))
  return out
 if n[0]=='native-value':
  assert n[1]==native_id;return div(value(n[2]),value(n[3]))
 if n[0]=='value':
  return div(polynomial([value(j) for j in n[2]],ranges[n[1]]),polynomial([value(j) for j in n[3]],ranges[n[1]]))
 raise AssertionError((i,n[0]))
y,t,u=fields
assert nodes[y][1]==native_id and nodes[t][1]==y and nodes[u][1]==t
assert [value(j) for j in nodes[y][2]]==[point(Q(-1,4)),point(0),point(1)]
assert 0<rational(nodes[y][3])<Q(1,2)<rational(nodes[y][4]);ranges[y]=point(Q(1,2));certificates.append({'label':'positive quadratic','bounds':['1/2','1/2'],'proof':'original y^2=1/4 and positive selector'})
for i,steps,label in [(t,64,'first circle parameter'),(u,24,'second circle parameter')]:
 cs=[value(j) for j in nodes[i][2]];assert len(cs)==7
 ranges[i]=refine(cs,(rational(nodes[i][3]),rational(nodes[i][4])),steps,label)
assert len(roots)==1;bounds=value(roots[0]);assert -1<bounds[0]<bounds[1]<0,bounds
report={'kind':'Independent exact interval proof for one captured scalar; not native completion or geometry acceptance','capture_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'selectors_independently_certified':True,'certificates':certificates,'value_bounds':[str(x) for x in bounds],'display_bounds':[float(x) for x in bounds],'proved':'-1 < value < 0 using only original defining relations, derivative/endpoint interval signs and guarded rational interval arithmetic','elapsed_seconds':time.monotonic()-started,'limits':'No global eliminant or coordinate fitting. This Python diagnostic does not establish native resource behavior or completed second-chamfer geometry.'};(c/'polynomial-selected-enclosure-interval-analysis.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k not in ['certificates','value_bounds']},indent=2));print('refinements',[(v['label'],v.get('completed_steps')) for v in certificates])
