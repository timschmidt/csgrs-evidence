"""Check selected-base and common-fiber identities from exact decoded coefficients."""
from pathlib import Path
from fractions import Fraction as F
import hashlib, json, resource, sys, time
resource.setrlimit(resource.RLIMIT_AS, (8*1024**3, 8*1024**3))
import sympy as sp
from sympy.polys.domains import QQ
from sympy.polys.rings import ring
source = Path(sys.argv[1]); out = Path(sys.argv[2]); out.mkdir(); start = time.monotonic()
(out/'driver.py').write_bytes(Path(__file__).read_bytes())
data = json.loads(source.read_text()); x = sp.Symbol('a')
def event(phase, **kw):
    row = {'phase':phase, 'seconds':time.monotonic()-start, **kw}
    print(json.dumps(row), flush=True)
    with (out/'progress.jsonl').open('a') as f: f.write(json.dumps(row)+'\n')
(out/'metadata.json').write_text(json.dumps({'source':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'sympy':sp.__version__,'scope':'Exact number-field identity and selected-root checker; no geometric-contact, branch-guard or completed-workflow conclusion.'},indent=2)+'\n')
assert data['coefficient_encoding'] == 'exact [a,b] rational pair for a+b*positive_sqrt(89)'
assert data['retained_parameter'] == 'First'
def poly(values): return sp.Poly.from_list(list(reversed([sp.Rational(v) for v in values])), x, domain=QQ)
A = poly([a for a,b in data['root_polynomial']]); B = poly([b for a,b in data['root_polynomial']])
N = A*A - 89*B*B
lo, hi = map(sp.Rational, [data['root_lower'], data['root_upper']])
assert lo < hi and N.eval(lo) and N.eval(hi)
assert N.count_roots(lo,hi) == 1
event('norm-root-census', norm_degree=N.degree(), selected_interval_count=1)
_, factors = sp.factor_list(N)
selected = [f for f,m in factors if f.count_roots(lo,hi) == 1]; assert len(selected) == 1
M = selected[0].monic(); index = int(M.count_roots(-sp.oo,lo))
event('selected-factor', factor_degrees=[(f.degree(),m) for f,m in factors], selected_degree=M.degree(), root_index=index)
assert B.gcd(M).degree() == 0
S = (-A * sp.invert(B,M)).rem(M)
assert (S*S-89).rem(M).is_zero and (A+B*S).rem(M).is_zero

def interval(poly, low, high):
    a=b=sp.S.Zero
    for c in poly.all_coeffs():
        products=(a*low,a*high,b*low,b*high);a=min(products)+c;b=max(products)+c
    return a,b

# Prove the embedding uses the authored positive square root, not its conjugate.
left,right=lo,hi
for refinements in range(512):
    lower,upper=interval(S,left,right)
    if lower > 0: break
    assert upper >= 0, 'selected norm root belongs to the negative radical conjugate'
    mid=(left+right)/2; assert M.eval(mid), 'unexpected exact rational root'
    if M.count_roots(left,mid)==1:right=mid
    else:left=mid
else:raise AssertionError('positive embedding proof exhausted')
event('positive-radical-embedding', refinements=refinements, lower=str(lower), upper=str(upper))
K=QQ.alg_field_from_poly(M,alias='a',root_index=index);R,t=ring('t',K)
def coefficient_poly(pair):return (sp.Poly(sp.Rational(pair[0]),x,domain=QQ)+sp.Rational(pair[1])*S).rem(M)
def convert(grid):
    result={}
    for power in range(max(map(len,grid))):
        c=sp.Poly(0,x,domain=QQ)
        for i,row in enumerate(grid):
            if power<len(row):c+=coefficient_poly(row[power])*sp.Poly(x**i,x,domain=QQ)
        c=c.rem(M)
        if not c.is_zero:result[(power,)]=K.new([QQ.convert(v) for v in c.all_coeffs()])
    return R.from_dict(result)
f,g=map(convert,data['polynomials']);event('fields-built', degrees=[f.degree(),g.degree()])
q,r=divmod(g,f);event('second-divided-by-first', quotient_degree=q.degree() if q else None,remainder_degree=r.degree() if r else None,remainder_zero=not bool(r))
h=f.gcd(g);assert not f.rem(h) and not g.rem(h)
u,v=f.exquo(h),g.exquo(h);assert u.gcd(v).degree()==0
event('divisibility-and-maximality',gcd_degree=h.degree(),cofactor_degrees=[u.degree(),v.degree()])
def encode(p):return {str(power[0]):[str(QQ.to_sympy(c)) for c in reversed(coefficient.to_list())] for power,coefficient in sorted(p.items())}
result={'selected_minimal_polynomial_ascending':[str(c) for c in reversed(M.all_coeffs())],'selected_root_index':index,'sqrt89_embedding_ascending':[str(c) for c in reversed(S.all_coeffs())],'positive_embedding_verified':True,'gcd_degree':h.degree(),'first_degree':f.degree(),'second_degree':g.degree(),'second_multiple_of_first':not bool(r),'gcd':encode(h),'first_cofactor':encode(u),'second_cofactor':encode(v),'divisibility_verified':True,'maximality_verified':True,'geometric_contact_verified':False}
(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');event('complete')
