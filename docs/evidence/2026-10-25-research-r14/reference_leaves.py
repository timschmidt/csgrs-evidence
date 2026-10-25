"""Independent normalized-rational basis change; never integer homogeneous Horner.
The bisection schedule intentionally matches the production helper; arithmetic,
interval multiplication and Bernstein conversion are separate implementations.
"""
from pathlib import Path
import gmpy2, json, math, time, sys
sys.set_int_max_str_digits(0)
record=Path(__file__).resolve().parent
source=record.parent/'r25-recovered/historical/leaves'
Q=gmpy2.mpq

def sign(x): return (x>0)-(x<0)
def point(c,x):
 y=Q(0)
 for a in reversed(c): y=y*x+a
 return y

def horner(c,lo,hi):
 a=b=c[-1]
 for v in reversed(c[:-1]):
  products=[a*lo,a*hi,b*lo,b*hi]
  a=min(products)+v;b=max(products)+v
 return 1 if a>0 else -1 if b<0 else None

def bernstein(c,lo,hi):
 n=len(c)-1;delta=hi-lo
 lo_powers=[Q(1)];delta_powers=[Q(1)]
 for _ in range(n): lo_powers.append(lo_powers[-1]*lo);delta_powers.append(delta_powers[-1]*delta)
 # f(lo + delta*t) in the power basis, using the binomial theorem.
 restricted=[sum((c[i]*math.comb(i,j)*lo_powers[i-j] for i in range(j,n+1)),Q(0))*delta_powers[j] for j in range(n+1)]
 controls=[sum((restricted[j]*Q(math.comb(k,j),math.comb(n,j)) for j in range(k+1)),Q(0)) for k in range(n+1)]
 signs=set(map(sign,controls))
 return signs.pop() if len(signs)==1 and 0 not in signs else None

with (record/'reference-leaves.jsonl').open('w',buffering=1) as out:
 for path in sorted(source.glob('leaf_*.txt')):
  lines=path.read_text().splitlines();a=lines.index('filter');b=lines.index('defining')
  c=[Q(x) for x in lines[a+1:b]];d=[Q(x) for x in lines[b+1:] if x]
  lo,hi=[Q(x) for x in next(x for x in lines if x.startswith('interval ')).split()[1:]]
  sl=sign(point(d,lo));su=sign(point(d,hi));assert sl and su and sl!=su
  start=time.time();steps=0;decision=None
  for target in [8,16,32,64,128,256,512,1024,2048,4096]:
   while steps<target:
    mid=(lo+hi)/2;sm=sign(point(d,mid))
    if sm==0:
     decision=sign(point(c,mid));break
    if sm==sl:lo=mid
    else:hi=mid
    steps+=1
   if decision is not None:break
   hs=horner(c,lo,hi);bs=bernstein(c,lo,hi) if hs is None else None
   row={'leaf':path.name,'steps':steps,'horner':hs,'bernstein':bs,'lower':str(lo),'upper':str(hi),'elapsed_seconds':time.time()-start}
   out.write(json.dumps(row)+'\n');print(path.name,steps,hs,bs,round(time.time()-start,3),flush=True)
   decision=hs if hs is not None else bs
   if decision is not None:break
  expected=1 if path.name=='leaf_0000.txt' else None
  assert decision==expected,(path.name,decision)
  out.write(json.dumps({'leaf':path.name,'event':'complete','decision':decision,'steps':steps,'elapsed_seconds':time.time()-start,'gmpy2_version':gmpy2.version(),'gmp_version':gmpy2.mp_version()})+'\n')
