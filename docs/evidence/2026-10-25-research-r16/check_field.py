from pathlib import Path
import hashlib,json,resource,sys,time
resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
import sympy as sp
from sympy.polys.domains import QQ
from sympy.polys.rings import ring
p=Path(sys.argv[1]);out=Path(sys.argv[2]);out.mkdir();start=time.monotonic();d=json.loads(p.read_text());a=sp.Symbol('a')
def event(phase,**values):
 row={'phase':phase,'seconds':time.monotonic()-start,**values};print(json.dumps(row),flush=True)
 with (out/'progress.jsonl').open('a') as f:f.write(json.dumps(row)+'\n');f.flush()
(out/'driver.py').write_bytes(Path(__file__).read_bytes());(out/'metadata.json').write_text(json.dumps({'source':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sympy':sp.__version__,'memory_bytes':8*1024**3,'scope':'Independent exact rational coefficient/selected-field/GCD checker, no geometric contact or unsquared-guard conclusion; diagnostic workflow may be running concurrently, so elapsed times are not a native performance comparison.'},indent=2)+'\n')
assert d['retained_parameter'] in ['First','Second']
assert all(c is not None for poly in d['polynomials'] for row in poly for c in row)
assert all(c is not None for c in d['root_polynomial']) and d['root_lower'] is not None and d['root_upper'] is not None
P=sp.Poly.from_list([sp.Rational(q) for q in reversed(d['root_polynomial'])],a,domain=QQ)
lo,hi=map(sp.Rational,[d['root_lower'],d['root_upper']]);assert lo<hi and P.eval(lo)!=0 and P.eval(hi)!=0
count=int(P.count_roots(lo,hi));assert count==1
event('root-census',degree=P.degree(),distinct_roots=count)
content,factors=sp.factor_list(P);selected=[f for f,m in factors if f.count_roots(lo,hi)==1];assert len(selected)==1;M=selected[0].monic();index=int(M.count_roots(-sp.oo,lo));assert M.eval(lo)!=0
event('selected-irreducible-factor',factor_degrees=[(f.degree(),m) for f,m in factors],selected_degree=M.degree(),root_index=index)
K=QQ.alg_field_from_poly(M,alias='a',root_index=index);R,t=ring('t',K)
def convert(grid):
 if d['retained_parameter']=='Second':grid=[[row[i] if i<len(row) else '0/1' for row in grid] for i in range(max(map(len,grid)))]
 width=max(map(len,grid));terms={}
 for power in range(width):
  coeff=sp.Poly.from_list([sp.Rational(row[power]) if power<len(row) else sp.S.Zero for row in reversed(grid)],a,domain=QQ).rem(M)
  if not coeff.is_zero:terms[(power,)]=K.new([QQ.convert(c) for c in coeff.all_coeffs()])
 return R.from_dict(terms)
f,g=map(convert,d['polynomials']);event('fields-built',degrees=[f.degree(),g.degree()])
q,r=divmod(g,f);event('second-divided-by-first',quotient_degree=q.degree(),remainder_degree=(r.degree() if r else None),remainder_zero=not bool(r))
h=f.gcd(g);event('gcd',degree=h.degree());assert not f.rem(h) and not g.rem(h)
u=f.exquo(h);v=g.exquo(h);c=u.gcd(v);assert c.degree()==0
event('exact-divisibility-and-maximality',gcd_degree=h.degree(),cofactor_degrees=[u.degree(),v.degree()])
def encode(poly):
 return {str(power[0]):[str(QQ.to_sympy(c)) for c in reversed(coefficient.to_list())] for power,coefficient in sorted(poly.items())}
result={'gcd_degree':h.degree(),'second_multiple_of_first':not bool(r),'first_degree':f.degree(),'second_degree':g.degree(),'selected_minimal_polynomial_ascending':[str(c) for c in reversed(M.all_coeffs())],'selected_root_index':index,'gcd':encode(h),'first_cofactor':encode(u),'second_cofactor':encode(v),'maximality_verified':True,'divisibility_verified':True,'geometric_contact_verified':False}
(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');event('complete')
