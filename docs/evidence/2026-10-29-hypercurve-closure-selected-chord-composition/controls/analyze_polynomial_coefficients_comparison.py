"""Independent rational/algebraic inspection of the retained original coefficient graph."""
from pathlib import Path
import argparse,functools,hashlib,json,time
import sympy as s
from sympy.polys.rings import ring
c=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--input',type=Path,required=True);parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
p=args.input
nodes,roots=json.loads(p.read_text());started=time.monotonic()
base_ids=[i for i,n in enumerate(nodes) if n[0]=='base'];native_ids=[i for i,n in enumerate(nodes) if n[0]=='native'];polynomial_ids=[i for i,n in enumerate(nodes) if n[0]=='polynomial']
assert len(base_ids)==len(native_ids)==1 and len(polynomial_ids)==2
base_id=base_ids[0];native_id=native_ids[0];y_id,t_id=polynomial_ids
assert nodes[native_id][1]==base_id
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
  assert n[1]==base_id and tensor(nodes[base_id][2])==R.one and tensor(nodes[base_id][3])==R.one
  return sum((tensor(v) for v in n[2:]),R.zero)
 if kind=='native-value':
  stats['native_values']+=1
  assert n[1]==native_id
  numerator,denominator=value(n[2]),value(n[3]);assert denominator.is_ground and denominator!=R.zero
  return numerator.quo_ground(denominator[(0,)])
 if kind=='value':
  stats['polynomial_values']+=1
  if n[1]==y_id:
   numerator=eval_poly(n[2],constant(s.Rational(1,2)))
   denominator=eval_poly(n[3],constant(s.Rational(1,2)))
   assert numerator.is_ground and denominator.is_ground and denominator!=R.zero
   return numerator.quo_ground(denominator[(0,)])
  assert n[1]==t_id
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
assert len(nodes[base_id][1])==1
assert [rational(v) for v in nodes[base_id][1][0][3]]==[s.Rational(3,4),0,0,1]
assert rational(nodes[base_id][1][0][4])==-1 and rational(nodes[base_id][1][0][5])==s.Rational(-1,2)
assert nodes[y_id][0]=='polynomial' and nodes[y_id][1]==native_id
assert [value(i) for i in nodes[y_id][2]]==[constant(s.Rational(-1,4)),R.zero,R.one]
assert rational(nodes[y_id][3])<s.Rational(1,2)<rational(nodes[y_id][4])
assert rational(nodes[y_id][3])>0
assert nodes[t_id][0]=='polynomial' and nodes[t_id][1]==y_id
modulus=eval_poly(nodes[t_id][2],t)
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
def canonical_rows(poly):
 return [[list(power),[[str(q.numerator),str(q.denominator)] for q in coefficient.to_list()]] for power,coefficient in sorted(poly.items())]
raw=[rational(text) for node in nodes if node[0]=='base-value' for tensor_data in node[2:] for text in tensor_data[1]]
raw_max_bits=max((max(abs(int(q.p)).bit_length(),int(q.q).bit_length()) for q in raw),default=0)
report={'raw_native_coefficient_max_bits':raw_max_bits,'raw_native_coefficient_count':len(raw),'modulus_rows':canonical_rows(modulus),'normal_form_rows':[canonical_rows(v) for v in coefficients],'kind':'independent exact scalar inspection; not geometric acceptance or native replay','sympy':s.__version__,'capture_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'graph_nodes':len(nodes),'graph_root_count':len(roots),'field_nodes':{'base':base_id,'native':native_id,'parent':y_id,'polynomial':t_id},'selected_native_equation':'4*a^3+3=0; -1<a<-1/2','selected_parent_equation':'y^2-1/4=0;127/256<y<257/512 therefore y=1/2','modulus_degree':modulus.degree(),'modulus':str(modulus.as_expr()),'coefficient_numerator_max_bits':numerator_sizes,'coefficient_denominator_max_bits':denominator_sizes,'independent_normal_form_max_bits':simplified_sizes,'lower_endpoint_normal_form_max_bits':bit_size(value_at_minus_one),'lower_endpoint_normal_form':str(value_at_minus_one.as_expr()),'all_original_denominator_inverse_identities_verified':True,'statistics':stats,'elapsed_seconds':time.monotonic()-started}
args.output.write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items() if k not in ['modulus','lower_endpoint_normal_form','modulus_rows','normal_form_rows']},indent=2),flush=True)
