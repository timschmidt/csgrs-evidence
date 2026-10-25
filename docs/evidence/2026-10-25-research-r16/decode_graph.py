"""Independent exact interpretation of the captured Q(sqrt(89)) expression DAGs."""
from pathlib import Path
from fractions import Fraction as F
import hashlib, json, resource, sys, time

resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
source = Path(sys.argv[1]); out = Path(sys.argv[2]); out.mkdir()
start = time.monotonic()
(out / 'driver.py').write_bytes(Path(__file__).read_bytes())
pool = {}; values = []; signatures = []; input_hashes = {}; stats = []
Z = F(0); O = F(1)

def limbs(xs):
    assert all(type(x) is int and 0 <= x < 2**32 for x in xs)
    return sum(x << (32 * i) for i, x in enumerate(xs))

def rational(d):
    assert set(d) == {'numerator', 'denominator', 'sign'}
    assert d['sign'] in [-1, 0, 1]
    denominator = limbs(d['denominator']); assert denominator
    return F(d['sign'] * limbs(d['numerator']), denominator)

def add(x, y): return (x[0] + y[0], x[1] + y[1])
def mul(x, y): return (x[0] * y[0] + 89 * x[1] * y[1], x[0] * y[1] + x[1] * y[0])
def inv(x):
    norm = x[0]**2 - 89 * x[1]**2
    assert norm, 'undefined inverse in captured expression'
    return (x[0] / norm, -x[1] / norm)

def intern(signature):
    prior = pool.get(signature)
    if prior is not None: return prior
    kind, *args = signature
    if kind == 'Q': value = (args[0], Z)
    elif kind == 'Sqrt':
        assert values[args[0]] == (F(89), Z), 'unsupported radical'
        value = (Z, O)  # the positive square root
    elif kind == 'Add': value = add(values[args[0]], values[args[1]])
    elif kind == 'Multiply': value = mul(values[args[0]], values[args[1]])
    elif kind == 'Negate': value = tuple(-q for q in values[args[0]])
    elif kind == 'Inverse': value = inv(values[args[0]])
    elif kind == 'Offset':
        shift = args[1]; assert type(shift) is int and abs(shift) <= 1_048_576
        scale = F(2**shift) if shift >= 0 else F(1, 2**-shift)
        value = tuple(scale * q for q in values[args[0]])
    else: raise AssertionError(('unsupported node', kind))
    assert max(max(abs(q.numerator).bit_length(), q.denominator.bit_length()) for q in value) <= 1_048_576
    index = len(values); pool[signature] = index; signatures.append(signature); values.append(value)
    return index

def decode(path):
    data = path.read_bytes(); input_hashes[path.name] = hashlib.sha256(data).hexdigest()
    d = json.loads(data); assert d['format'] == 'r16-exact-real-dag-v1'
    scale = rational(d['rational']); graph = d['computable']; local = []
    if graph is None: return (scale, Z)
    def ref(d):
        assert set(d) == {'r16_node_ref'}
        index = d['r16_node_ref']; assert type(index) is int and 0 <= index < len(local)
        return local[index]
    assert len(graph['nodes']) <= 1_000_000
    for node in graph['nodes']:
        assert len(node) == 1
        kind, args = next(iter(node.items()))
        if kind == 'Int':
            sign, mag = args; assert sign in [-1, 0, 1]
            signature = ('Q', F(sign * limbs(mag)))
        elif kind == 'Ratio': signature = ('Q', rational(args))
        elif kind in ['Add', 'Multiply']: signature = (kind, *(ref(a) for a in args)); assert len(signature) == 3
        elif kind in ['Negate', 'Inverse', 'Sqrt']: signature = (kind, ref(args))
        elif kind == 'Offset': signature = (kind, ref(args[0]), args[1])
        else: raise AssertionError(('unsupported node', kind))
        local.append(intern(signature))
    assert 0 <= graph['root'] < len(local)
    result = tuple(scale * q for q in values[local[graph['root']]])
    row = {'file': path.name, 'bytes': len(data), 'nodes': len(local), 'global_structural_nodes': len(values), 'seconds': time.monotonic() - start}
    stats.append(row); print(json.dumps(row), flush=True)
    with (out/'progress.jsonl').open('a') as f: f.write(json.dumps(row)+'\n')
    return result

# Exact arithmetic controls: conjugate norm, positive radical, inverse,
# signed binary scale, and full limb decoding. No floating-point equality.
assert mul((F(3), F(2)), (F(3), F(-2))) == (F(-347), Z)
assert mul((F(3), F(2)), inv((F(3), F(2)))) == (O, Z)
assert limbs([1, 2]) == 2 * 2**32 + 1
sqrt = intern(('Sqrt', intern(('Q', F(89)))))
assert values[intern(('Multiply', sqrt, sqrt))] == (F(89), Z)
assert values[intern(('Offset', sqrt, -3))] == (Z, F(1, 8))

fixture_path = source/'fiber-000000.json'; fixture = json.loads(fixture_path.read_text())
input_hashes[fixture_path.name] = hashlib.sha256(fixture_path.read_bytes()).hexdigest()
decoded = {}
def coefficient(c):
    if isinstance(c, str): value = (F(c), Z)
    else:
        assert set(c) == {'exact_real_graph_file'}
        filename = c['exact_real_graph_file']; assert Path(filename).name == filename
        if filename not in decoded: decoded[filename] = decode(source / filename)
        value = decoded[filename]
    return [str(q) for q in value]

result = dict(fixture)
result['polynomials'] = [[[coefficient(c) for c in row] for row in poly] for poly in fixture['polynomials']]
result['root_polynomial'] = [coefficient(c) for c in fixture['root_polynomial']]
result['coefficient_encoding'] = 'exact [a,b] rational pair for a+b*positive_sqrt(89)'
(out/'decoded-fiber.json').write_text(json.dumps(result, indent=2)+'\n')
(out/'completion.json').write_text(json.dumps({'inputs':input_hashes, 'decoded_graphs':len(decoded), 'global_structural_nodes':len(values), 'nodes_interpreted':sum(s['nodes'] for s in stats), 'seconds':time.monotonic()-start, 'field':'Q(positive_sqrt(89))', 'oracle_controls_passed':True, 'no_floating_point_used_for_values':True, 'scope':'Exact scalar interpretation only; selected-root and polynomial claims require separate checking.'},indent=2)+'\n')
print('DECODE COMPLETE',out,flush=True)
