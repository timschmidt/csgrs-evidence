"""Independent rational-function check of the three retained zero expressions.

Only the serialized arithmetic grammar below is accepted. P denotes pi and A
denotes atan(3/4). The elementary bounds 3<P<4 and 12/25<A<3/4 suffice for
all inverse-domain checks: A is the integral of 1/(1+x*x) on [0,3/4], whose
integrand lies between 16/25 and 1. No float or Hyper stack code is used.
"""
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
INPUT = ROOT / 'crates/hyperreal/tests/fixtures/periodic-rounding-zeros.json'
ONE = {(0, 0): Q(1)}
BOX = [(Q(3), Q(4)), (Q(12, 25), Q(3, 4))]
domains = []

def add(a, b):
    result = a.copy()
    for power, coefficient in b.items():
        result[power] = result.get(power, Q(0)) + coefficient
        if not result[power]:
            del result[power]
    return result

def mul(a, b):
    result = {}
    for (pa, aa), ca in a.items():
        for (pb, ab), cb in b.items():
            power = (pa + pb, aa + ab)
            assert sum(power) <= 32
            result = add(result, {power: ca * cb})
    assert len(result) <= 256
    assert all(c.numerator.bit_length() + c.denominator.bit_length() <= 8192
               for c in result.values())
    return result

def scale(a, coefficient):
    return {power: c * coefficient for power, c in a.items() if c * coefficient}

def interval(polynomial):
    low, high = Q(0), Q(0)
    for power, coefficient in polynomial.items():
        lo = BOX[0][0] ** power[0] * BOX[1][0] ** power[1]
        hi = BOX[0][1] ** power[0] * BOX[1][1] ** power[1]
        low += coefficient * (lo if coefficient > 0 else hi)
        high += coefficient * (hi if coefficient > 0 else lo)
    return low, high

def pair(numerator, denominator):
    assert denominator
    if not numerator:
        return {}, ONE
    if numerator == denominator:
        return ONE, ONE
    if numerator == scale(denominator, -1):
        return scale(ONE, -1), ONE
    # Both variables are strictly positive in BOX; cancel shared monomials.
    common = tuple(min(power[i] for power in [*numerator, *denominator]) for i in range(2))
    shift = lambda p: {(a-common[0], b-common[1]): c for (a, b), c in p.items()}
    numerator, denominator = shift(numerator), shift(denominator)
    coefficient = next(iter(denominator.values()))
    return scale(numerator, 1/coefficient), scale(denominator, 1/coefficient)

def limbs(values):
    return sum(x << (32*i) for i, x in enumerate(values))

def rational(value):
    return Q(value['sign'] * limbs(value['numerator']), limbs(value['denominator']))

def node(value):
    (tag, argument), = value['internal'].items()
    if tag == 'Constant':
        if argument == 'Pi':
            return {(1, 0): Q(1)}, ONE
        assert argument == 'InvPi'
        return ONE, {(1, 0): Q(1)}
    if tag == 'AtanRational':
        assert rational(argument) == Q(3, 4)
        return {(0, 1): Q(1)}, ONE
    if tag in ['Negate', 'Offset']:
        child, coefficient = (argument, Q(-1)) if tag == 'Negate' else (argument[0], Q(2)**argument[1])
        n, d = node(child)
        return pair(scale(n, coefficient), d)
    if tag in ['Add', 'Multiply']:
        a, b = node(argument[0])
        c, d = node(argument[1])
        if tag == 'Multiply':
            return pair(mul(a, c), mul(b, d))
        return pair(add(a, c), b) if b == d else pair(add(mul(a, d), mul(c, b)), mul(b, d))
    if tag == 'Inverse':
        n, d = node(argument)
        low, high = interval(n)
        assert high < 0 or low > 0, (n, low, high)
        domains.append(dict(numerator_interval=[str(low), str(high)],
                            proof='The normalized numerator excludes zero; all prior inverse domains are already admitted.'))
        return pair(d, n)
    raise AssertionError(tag)

rows = []
for index, value in enumerate(json.loads(INPUT.read_text())):
    assert value['class'] == 'Irrational'
    before = len(domains)
    n, d = node(value['computable'])
    n = scale(n, rational(value['rational']))
    assert not n and d
    rows.append(dict(fixture=index, exact_value='0', inverse_domain_checks=len(domains)-before))
report = dict(input=str(INPUT.relative_to(ROOT)),
              input_sha256=hashlib.sha256(INPUT.read_bytes()).hexdigest(),
              recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              variables=dict(P='pi, 3 < P < 4', A='atan(3/4), 12/25 < A < 3/4'),
              rows=rows, inverse_domains=domains,
              limitation='Independent exact rational-function proof for these three serialized scalar fixtures; not a proof of general BREP topology or unrestricted symbolic normalization.')
(OUT/'scalar-oracle.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(dict(exact_zero_fixtures=len(rows), inverse_domains=len(domains))))
