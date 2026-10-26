"""Independent exact polynomial certificate for captured rational-turn DAGs.

Only zero/constant remainders certify values. A nonconstant remainder is not a
nonzero proof: sine atoms obey additional relations not modeled here.
"""
from collections import Counter
from fractions import Fraction as Q
from pathlib import Path
import argparse
import hashlib
import json


def rational(value):
    def integer(limbs):
        assert all(type(x) is int and 0 <= x < 2**32 for x in limbs)
        return sum(x << (32 * i) for i, x in enumerate(limbs))
    assert value['sign'] in [-1, 0, 1]
    d = integer(value['denominator'])
    assert d > 0
    return Q(value['sign'] * integer(value['numerator']), d)


def ref(value, parent):
    assert set(value) == {'r16_node_ref'}
    i = value['r16_node_ref']
    assert type(i) is int and 0 <= i < parent
    return i


def constant(q):
    return {(): q} if q else {}


def add(a, b):
    out = dict(a)
    for monomial, coefficient in b.items():
        out[monomial] = out.get(monomial, Q(0)) + coefficient
        if not out[monomial]: del out[monomial]
    assert len(out) <= 100_000
    return out


def mul(a, b):
    out = {}
    for x, c in a.items():
        for y, d in b.items():
            out = add(out, {tuple(sorted((*x, *y))): c * d})
    return out


def neg(a):
    return {m: -q for m, q in a.items()}


def proof(graph):
    assert graph['format'] == 'r16-exact-real-dag-v1'
    nodes = graph['computable']['nodes']
    # First pass proves every stored sine argument is in its kernel domain.
    # Pi is a formal variable here; no numerical approximation is used.
    simple = []
    phases = {}
    for i, node in enumerate(nodes):
        assert len(node) == 1
        kind, value = next(iter(node.items()))
        child = lambda x: simple[ref(x, i)]
        p = None
        if kind == 'Ratio': p = constant(rational(value))
        elif kind == 'Constant':
            assert value == 'Pi'
            p = {(0,): Q(1)}
        elif kind in ['Add', 'Multiply']:
            a, b = map(child, value)
            if a is not None and b is not None:
                p = add(a, b) if kind == 'Add' else mul(a, b)
        elif kind == 'Negate':
            if child(value) is not None: p = neg(child(value))
        elif kind == 'Square':
            if child(value) is not None: p = mul(child(value), child(value))
        elif kind == 'PrescaledSin':
            a = child(value)
            assert a is not None and set(a) <= {(0,)}
            phase = a.get((0,), Q(0))
            assert 0 <= phase <= Q(1, 2)
            phases[i] = phase
        else:
            raise AssertionError(f'Unsupported operator/domain {i}: {kind}')
        simple.append(p)
    turns = sorted(set(phases.values()))
    ids = {phase: i + 1 for i, phase in enumerate(turns)}
    pairs = [(ids[q], ids[Q(1, 2) - q]) for q in turns
             if q < Q(1, 4) and Q(1, 2) - q in ids]

    def reduce(p):
        stack = list(p.items())
        out = {}
        work = 0
        while stack:
            monomial, coefficient = stack.pop()
            work += 1
            assert work < 1_000_000
            for sine, cosine in pairs:
                if monomial.count(cosine) >= 2:
                    rest = list(monomial)
                    rest.remove(cosine)
                    rest.remove(cosine)
                    stack.append((tuple(rest), coefficient))
                    stack.append((tuple(sorted((*rest, sine, sine))), -coefficient))
                    break
            else:
                out = add(out, {monomial: coefficient})
        return out

    values = []
    rows = []
    for i, node in enumerate(nodes):
        kind, payload = next(iter(node.items()))
        child = lambda x: values[ref(x, i)]
        if kind == 'Ratio': p = constant(rational(payload))
        elif kind == 'Constant': p = {(0,): Q(1)}
        elif kind == 'PrescaledSin': p = {(ids[phases[i]],): Q(1)}
        elif kind == 'Add': p = add(child(payload[0]), child(payload[1]))
        elif kind == 'Multiply': p = mul(child(payload[0]), child(payload[1]))
        elif kind == 'Negate': p = neg(child(payload))
        elif kind == 'Square': p = mul(child(payload), child(payload))
        else: raise AssertionError(kind)
        p = reduce(p)
        values.append(p)
        rows.append({'node': i, 'operator': kind, 'terms': len(p),
                     'degree': max(map(len, p), default=0),
                     'constant': str(p.get((), Q(0))) if set(p) <= {()} else None})
    scale = rational(graph['rational'])
    root = graph['computable']['root']
    assert root == len(nodes) - 1
    result = values[root]
    return {'node_count': len(nodes), 'operators': dict(Counter(next(iter(x)) for x in nodes)),
            'phases': {str(ids[q]): str(q) for q in turns}, 'unit_circle_pairs': pairs,
            'result': str(scale * result.get((), Q(0))) if set(result) <= {()} else None,
            'rows': rows,
            'scope': 'Exact Fraction polynomial evaluation modulo proved complementary-sine unit-circle identities. Nonconstant remainder is inconclusive, never a nonzero certificate.'}


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('source', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    data = args.source.read_bytes()
    result = proof(json.loads(data))
    result.update(source=str(args.source), sha256=hashlib.sha256(data).hexdigest())
    args.output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k != 'rows'}, indent=2))
