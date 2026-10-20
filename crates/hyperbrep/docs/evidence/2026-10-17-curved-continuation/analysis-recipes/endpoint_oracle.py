"""Independent exact rational coefficient proof for the retained endpoints.

Uses only Python Fraction arithmetic and congruence of mathematical functions;
no Hyper-stack evaluator, floating point, structural matcher or private proof.
"""
import hashlib
import json
from fractions import Fraction as F
from pathlib import Path

ROOT = Path(__file__).resolve().parents[6]
OUT = Path(__file__).resolve().parents[1]
fixture = ROOT / 'crates/hyperreal/tests/fixtures/periodic-endpoint-pairs.json'
archive = OUT / 'reconstruction-diagnostic-artifacts/cycle-1-remainder.json'

def rational(value):
    integer = lambda limbs: sum(x << (32*i) for i, x in enumerate(limbs))
    return value['sign'] * F(integer(value['numerator']), integer(value['denominator']))

def scale(a, b): return [x*b for x in a]
def add(a, b): return [x+y for x, y in zip(a, b)]

def linear(node):
    kind, value = next(iter(node['internal'].items()))
    if kind == 'Constant' and value == 'Pi': return [F(0), F(1), F(0)]
    if kind == 'AtanRational':
        assert rational(value) == F(3, 4)
        return [F(0), F(0), F(1)]
    if kind == 'Add': return add(linear(value[0]), linear(value[1]))
    if kind == 'Negate': return scale(linear(value), -1)
    if kind == 'Offset': return scale(linear(value[0]), F(2)**value[1])
    raise AssertionError(kind)

def real(value):
    if value['class'] == 'One': return [rational(value['rational']), F(0), F(0)]
    assert value['class'] == 'Irrational'
    return scale(linear(value['computable']), rational(value['rational']))

def trig(value):
    assert value['class'] == 'Irrational'
    coefficient = rational(value['rational'])
    node = value['computable']['internal']
    while 'Negate' in node:
        coefficient = -coefficient
        node = node['Negate']['internal']
    kind, argument = next(iter(node.items()))
    assert kind in ['PrescaledSin', 'PrescaledCos']
    return kind, coefficient, linear(argument)

raw = json.loads(archive.read_text())
pairs = json.loads(fixture.read_text())
assert len(pairs) == 4
curve = raw['curves'][1]['EllipseArc']
assert curve['circle'] and curve['direction'] == 1
assert [real(v) for v in curve['center']] == [[0, 0, 0]]*3
assert [real(v)[0] for v in curve['x']] == [1, 0, 0]
assert [real(v)[0] for v in curve['y']] == [0, 1, 0]
assert real(curve['x_radius']) == real(curve['y_radius']) == [7, 0, 0]
domain = [real(v) for v in curve['domain']]
assert domain == [[0, 1, F(-3, 4)], [0, 1, F(-1, 2)]]
assert real(curve['angle_at_start']) == domain[0]
rows = []
for index, (a, b) in enumerate(pairs):
    first, second = trig(a), trig(b)
    assert first == second
    kind, coefficient, argument = first
    endpoint, axis = divmod(index, 2)
    assert kind == ['PrescaledCos', 'PrescaledSin'][axis]
    assert coefficient == -7
    assert argument == [0, 0, [F(-3, 4), F(-1, 2)][endpoint]]
    assert b == raw['vertices'][endpoint+1]['Coordinates'][axis]
    # sin(pi+x)=-sin(x), cos(pi+x)=-cos(x). Each vertex therefore
    # agrees with the radius-7 circle at the independently reduced endpoint.
    assert add(argument, [0, 1, 0]) == domain[endpoint]
    rows.append(dict(pair=index, function=kind, scale=str(coefficient),
                     argument_coefficients=list(map(str, argument)), equal=True))
record = dict(passed=True, rows=rows,
    inputs={str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in [Path(__file__), fixture, archive]},
    claim='Four identical function/argument values and exact radius-7 circle endpoint incidence; no numerical tolerance or general nonlinear-equivalence claim.')
(OUT/'endpoint-oracle.json').write_text(json.dumps(record, indent=2)+'\n')
print('independent exact endpoint proofs:', len(rows))
