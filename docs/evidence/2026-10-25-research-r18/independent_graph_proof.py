from collections import Counter
from fractions import Fraction
from pathlib import Path
import hashlib
import json
import time

raw = Path(__file__).resolve().parent
capture = Path(json.loads((raw / 'latest-predicate-capture.json').read_text())['record'])
source = capture / 'binary64/predicate-0000.json'
graph = json.loads(source.read_text())
assert graph['format'] == 'r16-exact-real-dag-v1'
nodes = graph['computable']['nodes']


def integer(limbs):
    assert isinstance(limbs, list) and all(type(x) is int and 0 <= x < 2**32 for x in limbs)
    return sum(x << (32 * i) for i, x in enumerate(limbs))


def rational(value):
    assert value['sign'] in [-1, 0, 1]
    denominator = integer(value['denominator'])
    assert denominator > 0
    return Fraction(value['sign'] * integer(value['numerator']), denominator)


def reference(value, parent):
    assert set(value) == {'r16_node_ref'}
    child = value['r16_node_ref']
    assert type(child) is int and 0 <= child < parent
    return child


def add(a, b):
    result = dict(a)
    for term, coefficient in b.items():
        result[term] = result.get(term, Fraction(0)) + coefficient
        if not result[term]:
            del result[term]
    assert len(result) < 100_000
    return result


def multiply(a, b):
    result = {}
    for x, p in a.items():
        for y, q in b.items():
            term = tuple(sorted((*x, *y)))
            result[term] = result.get(term, Fraction(0)) + p * q
            if not result[term]:
                del result[term]
    assert len(result) < 100_000
    return result


def analyze(input_nodes):
    polynomials = []
    rows = []
    phases = []
    for index, node in enumerate(input_nodes):
        assert len(node) == 1
        kind, payload = next(iter(node.items()))
        if kind == 'Ratio':
            q = rational(payload)
            polynomial = {(): q} if q else {}
        elif kind == 'Constant':
            assert payload == 'Pi'
            polynomial = {('pi',): Fraction(1)}
        elif kind == 'PrescaledSin':
            argument = polynomials[reference(payload, index)]
            assert set(argument) == {('pi',)}
            phase = argument[('pi',)]
            assert 0 <= phase <= Fraction(1, 2)
            # Separate formal variables even for equal phases. The zero proof
            # uses neither trigonometric identities nor equality of phases.
            polynomial = {(f'sin-node-{index}',): Fraction(1)}
            phases.append({'node': index, 'pi_multiple': str(phase)})
        elif kind in ['Add', 'Multiply']:
            assert len(payload) == 2
            a, b = [polynomials[reference(child, index)] for child in payload]
            polynomial = add(a, b) if kind == 'Add' else multiply(a, b)
        elif kind == 'Negate':
            polynomial = {term: -q for term, q in polynomials[reference(payload, index)].items()}
        else:
            raise AssertionError(f'Unsupported domain at node {index}: {kind}')
        polynomials.append(polynomial)
        rows.append({'node': index, 'operator': kind, 'terms': len(polynomial),
                     'degree': max(map(len, polynomial), default=0)})
    return polynomials, rows, phases


def outer_product(index, sign=1):
    node = nodes[index]
    kind, payload = next(iter(node.items()))
    if kind == 'Multiply':
        left, right = [reference(x, index) for x in payload]
        a, x = outer_product(left, sign)
        b, y = outer_product(right)
        return a * b, sorted(x + y)
    if kind == 'Negate':
        return outer_product(reference(payload, index), -sign)
    return sign, [index]


start = time.monotonic()
polynomials, rows, phases = analyze(nodes)
root = graph['computable']['root']
assert root == len(nodes) - 1
assert not polynomials[root]
assert rational(graph['rational']) == -1
assert 'Add' in nodes[root]
products = [outer_product(reference(x, root)) for x in nodes[root]['Add']]
assert products[0][1] == products[1][1] and products[0][0] == -products[1][0]
# A sign mutation must destroy the formal identity; no actual nonzero claim
# follows merely from a nonzero formal polynomial in related trigonometric atoms.
mutated = json.loads(json.dumps(nodes))
negative = reference(nodes[root]['Add'][0], root)
assert 'Negate' in mutated[negative]
child = mutated[negative]['Negate']
mutated[negative] = {'Add': [child, child]}
assert analyze(mutated)[0][root]
bad_domain = json.loads(json.dumps(nodes))
ratio_index = next(i for i, x in enumerate(nodes) if 'Ratio' in x)
bad_domain[ratio_index]['Ratio']['denominator'] = []
try:
    analyze(bad_domain)
except AssertionError:
    pass
else:
    raise AssertionError('Zero denominator was accepted')

result = {
    'source': str(source), 'sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
    'nodes': len(nodes), 'root': root, 'operator_counts': dict(Counter(next(iter(x)) for x in nodes)),
    'certificate': {'root_form': '-((N52*N82)*N55) + ((N55*N82)*N52)',
                    'outer_products': products, 'real_scale': '-1',
                    'formal_expansion_is_zero': True,
                    'domain': 'Every node is an exact rational with nonzero denominator, pi, arithmetic over real children, or PrescaledSin(q*pi) with 0 <= q <= 1/2.'},
    'phases': phases, 'expansion_rows': rows,
    'maximum_formal_terms': max(x['terms'] for x in rows),
    'maximum_formal_degree': max(x['degree'] for x in rows),
    'controls': {'sign_mutation_not_formal_zero': True, 'zero_denominator_rejected': True},
    'seconds_diagnostic': time.monotonic() - start,
    'scope': 'Independent Python Fraction polynomial arithmetic with each captured sine node a separate formal indeterminate. This proves the first captured scalar is zero; it does not prove the full Boolean completes or diagnose the Rust decline.'}
(raw / 'independent-first-predicate-proof.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: v for k, v in result.items() if k not in ['phases', 'expansion_rows']}, indent=2))
