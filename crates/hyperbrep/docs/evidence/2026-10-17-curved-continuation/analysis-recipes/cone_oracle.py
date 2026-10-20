"""Independent diagnosis only: the unresolved cone joint is exactly zero."""
import hashlib
import json
from fractions import Fraction as F
from pathlib import Path

OUT=Path(__file__).resolve().parents[1]
fixture=OUT/'cone-joint-scalars/joint-3-0.json'
integer=lambda digits:sum(x<<(32*i) for i,x in enumerate(digits))
def rational(value):return value['sign']*F(integer(value['numerator']),integer(value['denominator']))
def add(a,b):
    result=a.copy()
    for term,value in b.items():
        result[term]=result.get(term,F(0))+value
        if result[term]==0:del result[term]
    return result
def multiply(a,b):
    result={}
    for (p,a_power,s),x in a.items():
        for (q,b_power,t),y in b.items():
            # sqrt(5)^2=5 and pi^p*pi^q=pi^(p+q), including inv(pi).
            term=(p+q,a_power+b_power,(s+t)%2)
            result=add(result,{term:x*y*F(5)**((s+t)//2)})
    return result
def node(value):
    kind,data=next(iter(value['internal'].items()))
    if kind=='Constant':
        assert data in ['Pi','InvPi']
        return {(1 if data=='Pi' else -1,0,0):F(1)}
    if kind=='AtanRational':
        assert rational(data)==F(3,4)
        return {(0,1,0):F(1)}
    if kind=='Sqrt':
        assert data['internal']['Int']==[1,[5]]
        return {(0,0,1):F(1)}
    if kind=='Ratio':return {(0,0,0):rational(data)}
    if kind=='Negate':return {k:-v for k,v in node(data).items()}
    if kind=='Add':return add(node(data[0]),node(data[1]))
    if kind=='Multiply':return multiply(node(data[0]),node(data[1]))
    raise AssertionError(kind)
raw=json.loads(fixture.read_text())
assert raw['class']=='Irrational' and rational(raw['rational'])==1
assert node(raw['computable'])=={}
record=dict(passed=True,claim='pi*(atan(3/4)*sqrt(5))*(inv(pi)*sqrt(5))/5 - atan(3/4) = 0',
    assumptions=['Pi denotes the positive mathematical constant pi, so its reciprocal is defined.','Sqrt(Int(5)) denotes the principal real square root of the positive integer 5.','AtanRational(3/4) denotes the principal real atan of 3/4.'],
    inputs={str(p.relative_to(OUT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),fixture]},
    scope='Diagnosis and future contract only. This independent polynomial proof does not make the production kernel admit the cone archive or complete its Booleans.')
(OUT/'cone-oracle.json').write_text(json.dumps(record,indent=2)+'\n')
print('independent cone-joint identity: exact zero; production capability remains separate')
