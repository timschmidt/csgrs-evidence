from pathlib import Path
import json,hashlib,struct,importlib.metadata
import wasmtime
S=1<<30;MIN=-(1<<31);MAX=(1<<31)-1;MASK=(1<<64)-1
class Range(Exception): pass
def checked(lo,hi):
 if lo<MIN or hi>MAX: raise Range()
 return (lo,hi)
def add(a,b): return checked(a[0]+b[0],a[1]+b[1])
def sub(a,b): return checked(a[0]-b[1],a[1]-b[0])
def neg(a): return checked(-a[1],-a[0])
def mul(a,b):
 p=[x*y for x in a for y in b];return checked(min(p)//S,-((-max(p))//S))
def ratio(n,d): return (n*S//d,-((-n*S)//d))
def clarke(p):
 a,b,c=p
 lo=2*a[0]-b[1]-c[1];hi=2*a[1]-b[0]-c[0]
 alpha=checked(lo//3,-((-hi)//3))
 beta=mul((b[0]-c[1],b[1]-c[0]),(619925131,619925132))
 return alpha,beta
def inverse_clarke(v):
 a,b=v;h=neg(mul((S//2,S//2),a));t=mul((929887696,929887697),b)
 return a,add(h,t),sub(h,t)
def park(v,r):
 a,b=v;s,c=r;return add(mul(a,c),mul(b,s)),sub(mul(b,c),mul(a,s))
def inverse_park(v,r):
 d,q=v;s,c=r;return sub(mul(d,c),mul(q,s)),add(mul(d,s),mul(q,c))
rotations=[((0,0),(S,S)),((S,S),(0,0)),((-S,-S),(0,0)),((0,0),(-S,-S)),(ratio(3,5),ratio(4,5))]
def sample(index):
 n=index%33-16;unit=1<<24;around=lambda x:(x-1,x+1);a=n*unit;b=-((abs(n)//2)*(1 if n>=0 else -1))*unit
 p=around(a),around(b),around(-a-b)
 stationary=around(a),around((16-abs(n))*unit)
 rotating=around(a),around((n+8)*unit//2)
 return p,stationary,rotating,rotations[index%5]
def digest(tag,values):
 if len(values)==2: values=(*values,(0,0))
 data=bytes([tag])+b''.join(struct.pack('<i',x) for p in values for x in p)
 h=0xcbf29ce484222325
 for b in data: h=((h^b)*0x100000001b3)&MASK
 return h
def expected(index,action):
 p,a,d,r=sample(index)
 if action==0:return digest(1,clarke(p))
 if action==1:return digest(2,park(a,r))
 if action==2:return digest(1,inverse_park(d,r))
 if action==3:return digest(3,inverse_clarke(a))
 return digest(1,clarke(inverse_clarke(inverse_park(park(clarke(p),r),r))))
path=Path('/mnt/development/csgrs/crates/hyperlattice-interval/conformance/alumina-foc/wasm/target/wasm32-unknown-unknown/release/interval_foc_wasm_consumer.wasm')
config=wasmtime.Config();config.consume_fuel=True
engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(path));assert not module.imports
exports=wasmtime.Instance(store,module,[]).exports(store)
completed=0;max_fuel=0
for index in [*range(330),2**32-2,2**32-1]:
 for action in range(5):
  store.set_fuel(1_000_000)
  actual=exports['conformance_probe'](store,index,action)&MASK
  assert actual==expected(index,action),(index,action,actual,expected(index,action))
  max_fuel=max(max_fuel,1_000_000-store.get_fuel());completed+=1
counts={0:0,1:0};values=[MIN,MIN+1,-S,-1,0,1,S,S+1,MAX]
for a in values:
 for b in values:
  for mode in range(5):
   try:park(((a,a),(b,b)),rotations[mode]);want=0
   except Range:want=1
   store.set_fuel(1_000_000)
   actual=exports['range_probe'](store,a,b,mode);assert actual==want,(a,b,mode,actual,want)
   max_fuel=max(max_fuel,1_000_000-store.get_fuel());counts[actual]+=1
print(json.dumps({'wasmtime':importlib.metadata.version('wasmtime'),'imports':0,'completed_transform_calls':completed,'distinct_fixture_period':165,'range_calls':sum(counts.values()),'range_success':counts[0],'range_overflow':counts[1],'fuel_limit_per_call':1000000,'maximum_observed_fuel':max_fuel,'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'independent_oracle':'Python exact integer staged bounds and complete endpoint/tag digest'},indent=2))
