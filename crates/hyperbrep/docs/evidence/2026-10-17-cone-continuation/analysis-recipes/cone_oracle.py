"""Independent Fraction algebra for captured cone failures; never production code."""
import collections
import hashlib
import json
from fractions import Fraction as F
from math import isqrt
from pathlib import Path

OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
radicals={}
angles=set()
unknown_trig=set()
def integer(digits): return sum(x<<(32*i) for i,x in enumerate(digits))
def rational(v): return v['sign']*F(integer(v['numerator']),integer(v['denominator']))
def constant(v): return {} if v==0 else {():F(v)}
def atom(name,power=1): return {((name,power),):F(1)}
def add(a,b):
    out=a.copy()
    for k,v in b.items():
        out[k]=out.get(k,F(0))+v
        if out[k]==0: del out[k]
    return out

def multiply(a,b):
    result={}
    for x,p in a.items():
        for y,q in b.items():
            powers=collections.Counter(dict(x));powers.update(dict(y));coefficient=p*q
            for name in list(powers):
                if name in radicals:
                    coefficient*=radicals[name]**(powers[name]//2);powers[name]%=2
            term=tuple(sorted((k,v) for k,v in powers.items() if v))
            result=add(result,{term:coefficient})
    return result

def scalar(p):
    if not p:return F(0)
    assert list(p)==[()],str(p)
    return p[()]

def root(q):
    assert q>=0
    n,d=isqrt(q.numerator),isqrt(q.denominator)
    if n*n==q.numerator and d*d==q.denominator:return constant(F(n,d))
    name=f'sqrt({q})';radicals[name]=q
    return atom(name)

def text(p):return ' + '.join(f'{v}*{k}' for k,v in sorted(p.items())) or '0'

def trig(kind,p):
    pi=p.get((('pi',1),),F(0));a=None;scale=F(0)
    for term,c in p.items():
        if term==(('pi',1),):continue
        if len(term)==1 and term[0][0].startswith('atan(') and term[0][1]==1 and a is None:
            a=F(term[0][0][5:-1]);scale=c
        else:
            unknown_trig.add((kind,text(p)));return atom(kind+'('+text(p)+')')
    turns=2*pi
    if turns.denominator!=1 or (a is not None and scale not in (-1,1)):
        unknown_trig.add((kind,text(p)));return atom(kind+'('+text(p)+')')
    if a is None:s,c=F(0),F(1)
    else:
        norm=scalar(root(1+a*a));s=scale*a/norm;c=1/norm
    s,c=[(s,c),(c,-s),(-s,-c),(-c,s)][turns.numerator%4]
    angles.add((kind,text(p),str(s if kind=='PrescaledSin' else c)))
    return constant(s if kind=='PrescaledSin' else c)

def node(v):
    raw=v['internal']
    if isinstance(raw,str):
        assert raw=='One';return constant(1)
    kind,data=next(iter(raw.items()))
    if kind=='Int':return constant(data[0]*integer(data[1]))
    if kind=='Ratio':return constant(rational(data))
    if kind=='Constant':
        if data=='Pi':return atom('pi')
        if data=='InvPi':return atom('pi',-1)
        if data=='Tau':return multiply(constant(2),atom('pi'))
        if data in ['Sqrt2','Sqrt3']:return root(F(data[-1]))
        raise AssertionError(data)
    if kind=='AtanRational':return atom(f'atan({rational(data)})')
    if kind=='Sqrt':return root(scalar(node(data)))
    if kind=='Negate':return multiply(constant(-1),node(data))
    if kind=='Add':return add(node(data[0]),node(data[1]))
    if kind=='Multiply':return multiply(node(data[0]),node(data[1]))
    if kind=='Square':return multiply(node(data),node(data))
    if kind=='Offset':return multiply(node(data[0]),constant(F(2)**data[1]))
    if kind in ['PrescaledSin','PrescaledCos']:return trig(kind,node(data))
    if kind=='Inverse':return constant(1/scalar(node(data)))
    raise AssertionError(kind)

def circle_zero(p):
    if len(p)!=3 or () not in p:return False
    others=[(k,v) for k,v in p.items() if k]
    if not all(len(k)==1 and k[0][1]==2 and v==-p[()] for k,v in others):return False
    names=sorted(k[0][0] for k,v in others)
    return names[0].startswith('PrescaledCos(') and names[1].startswith('PrescaledSin(') and names[0].split('(',1)[1]==names[1].split('(',1)[1]

rows=[]
for fixture in sorted([*OUT.glob('unresolved-cone/*.json'), *OUT.glob('unresolved-replay/*.json')]):
    raw=json.loads(fixture.read_text())
    result=multiply(constant(rational(raw['rational'])),node(raw['computable']))
    rows.append(dict(path=str(fixture.relative_to(OUT)),sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),exact_zero=result=={} or circle_zero(result),pythagorean_certificate=circle_zero(result),normal_form=text(result)))
record=dict(rows=rows,angles=sorted(angles),unknown_trig=sorted(unknown_trig),
    assumptions=['Positive pi, its exact reciprocal, and principal nonnegative rational roots.',
    'For rational t with rational sqrt(1+t*t): sin(atan(t))=t/sqrt(1+t*t), cos(atan(t))=1/sqrt(1+t*t).',
    'Integer quarter turns use the exact rotation matrix. All coefficients use Python Fraction.'],
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),scope='Independent identities for pinned fixtures; not production support or a complete geometry oracle.')
(OUT/'captured-oracle.json').write_text(json.dumps(record,indent=2)+'\n')
print('fixtures',len(rows),'exact zero',sum(r['exact_zero'] for r in rows),'angles',len(angles),'unresolved trig',len(unknown_trig))
for item in sorted(angles):print(item)
for item in sorted(unknown_trig):print('UNRESOLVED',item)
