"""Independent rational/algebraic inspection of the retained original coefficient graph."""
from pathlib import Path
import functools,hashlib,json,time
import sympy as s
from sympy.polys.rings import ring
c=Path(__file__).resolve().parent
p=c/'polynomial-chamfer-dispatch-coefficients1/coefficients-2.json'
nodes,roots=json.loads(p.read_text());started=time.monotonic()
u=s.Symbol('a'); K=s.QQ.algebraic_field(s.CRootOf(4*u**3+3,0)); R,t=ring('t',K)
alpha=K.unit
stats={'native_values':0,'polynomial_values':0,'inverse_calls':0}

def rational(text):
 x=json.loads(text);assert x['class']=='One' and x['computable'] is None,x
 r=x['rational'];n=sum(v<<(32*i) for i,v in enumerate(r['numerator']));d=sum(v<<(32*i) for i,v in enumerate(r['denominator']));return s.Rational(r['sign']*n,d)

def constant(q):return R(K.from_sympy(q))

def tensor(data):
 dimensions,coefficients=data
 assert len(dimensions)==1 and dimensions[0]==len(coefficients)
 total=K.zero
 for coefficient in reversed(coefficients): total=total*alpha+K.from_sympy(rational(coefficient))
 return R(total)

def eval_poly(coefficients,argument):
 result=R.zero
 for i in reversed(coefficients):result=result*argument+value(i)
 return result

@functools.cache
def value(i):
 n=nodes[i];kind=n[0]
 if kind=='base-value':
  assert n[1]==0 and tensor(nodes[0][2])==R.one and tensor(nodes[0][3])==R.one
  return sum((tensor(v) for v in n[2:]),R.zero)
 if kind=='native-value':
  stats['native_values']+=1
  assert n[1]==1
  numerator,denominator=value(n[2]),value(n[3]);assert denominator.is_ground and denominator!=R.zero
  return numerator.quo_ground(denominator[(0,)])
 if kind=='value':
  stats['polynomial_values']+=1
  if n[1]==11:
   numerator=eval_poly(n[2],constant(s.Rational(1,2)))
   denominator=eval_poly(n[3],constant(s.Rational(1,2)))
   assert numerator.is_ground and denominator.is_ground and denominator!=R.zero
   return numerator.quo_ground(denominator[(0,)])
  assert n[1]==64
  numerator=eval_poly(n[2],t);denominator=eval_poly(n[3],t)
  stats['inverse_calls']+=1
  inverse, _, gcd=denominator.gcdex(modulus)
  assert gcd==R.one
  assert (denominator*inverse).rem(modulus)==R.one
  result=(numerator*inverse).rem(modulus)
  assert (result*denominator-numerator).rem(modulus)==R.zero
  return result
 raise AssertionError((i,kind))

# The native base selects the unique real cube root of -3/4. Its retained
# quadratic child selects +1/2, proved from the full original equation and
# strict rational isolator. This is an independent inspection, not a rewrite
# or trust in the native graph's singleton flags.
assert len(nodes[0][1])==1
assert [rational(v) for v in nodes[0][1][0][3]]==[s.Rational(3,4),0,0,1]
assert rational(nodes[0][1][0][4])==-1 and rational(nodes[0][1][0][5])==s.Rational(-1,2)
assert nodes[11][0]=='polynomial' and nodes[11][1]==1
assert [value(i) for i in nodes[11][2]]==[constant(s.Rational(-1,4)),R.zero,R.one]
assert rational(nodes[11][3])<s.Rational(1,2)<rational(nodes[11][4])
assert rational(nodes[11][3])>0
assert nodes[64][0]=='polynomial' and nodes[64][1]==11
modulus=eval_poly(nodes[64][2],t)
assert modulus.degree()==6
print('original modulus degree6; retained parent selects exact +1/2',flush=True)
coefficients=[value(i) for i in roots]

def bit_size(poly):
 result=[]
 for coefficient in poly.values():
  for q in coefficient.to_list():
   result.append(max(abs(int(q.numerator)).bit_length(),int(q.denominator).bit_length()))
 return max(result,default=0)

numerator_sizes=[bit_size(eval_poly(nodes[i][2],t)) for i in roots]
denominator_sizes=[bit_size(eval_poly(nodes[i][3],t)) for i in roots]
simplified_sizes=[bit_size(v) for v in coefficients]
value_at_minus_one=sum(((-1)**i*v for i,v in enumerate(coefficients)),R.zero)
# Independent identity for substituting a circle into y^2-1-x^3:
# in the first chart t=-1 is the point (cx,cy-radius). Since F(cx,cy)=0,
# F(cx,cy-radius)=radius^2-2*radius*cy. Multiplication by (1+t^2)^3
# contributes8. Capture normal-form output for reviewing this relation.
report={'kind':'independent exact scalar inspection; not geometric acceptance or native replay','sympy':s.__version__,'capture_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'selected_native_equation':'4*a^3+3=0; -1<a<-1/2','selected_parent_equation':'y^2-1/4=0;127/256<y<257/512 therefore y=1/2','modulus_degree':modulus.degree(),'modulus':str(modulus.as_expr()),'coefficient_numerator_max_bits':numerator_sizes,'coefficient_denominator_max_bits':denominator_sizes,'independent_normal_form_max_bits':simplified_sizes,'lower_endpoint_normal_form_max_bits':bit_size(value_at_minus_one),'lower_endpoint_normal_form':str(value_at_minus_one.as_expr()),'all_original_denominator_inverse_identities_verified':True,'statistics':stats,'elapsed_seconds':time.monotonic()-started}
(c/'polynomial-repeat-coefficient-analysis.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items() if k not in ['modulus','lower_endpoint_normal_form']},indent=2),flush=True)
