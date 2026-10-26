from pathlib import Path
import hashlib
import importlib.util
import json

raw = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('r18_polynomial', raw / 'rotation_polynomial_proof.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
source_path = raw / 'late-factor-public-runs-1792969953973319064/binary64/predicate-0000.json'
data = source_path.read_bytes()
graph = json.loads(data)
assert module.proof(graph)['result'] == '0'
modified = json.loads(data)
nodes = modified['computable']['nodes']
nodes.append({'Ratio': {'sign': 1, 'numerator': [1], 'denominator': [1000000]}})
i = len(nodes) - 1
nodes.append({'Add': [{'r16_node_ref': i - 1}, {'r16_node_ref': i}]})
modified['computable']['root'] = i + 1
assert module.proof(modified)['result'] == '1/1000000'
modified['rational']['sign'] = -1
assert module.proof(modified)['result'] == '-1/1000000'
bad = json.loads(data)
i = next(i for i, node in enumerate(bad['computable']['nodes']) if 'PrescaledSin' in node)
bad['computable']['nodes'][i] = {'Inverse': {'r16_node_ref': 0}}
try:
    module.proof(bad)
except AssertionError:
    pass
else:
    raise AssertionError('Unsupported inverse was admitted')
result = {'source': str(source_path), 'source_graph_sha256': hashlib.sha256(data).hexdigest(),
          'analyzer_sha256': hashlib.sha256((raw / 'rotation_polynomial_proof.py').read_bytes()).hexdigest(),
          'unperturbed_zero': True, 'plus_1e-6_exact': True, 'negative_scale_exact': True,
          'unsupported_inverse_rejected': True,
          'scope': 'Independent analyzer controls; offsets are exact polynomial constants, no numerical tolerance.'}
(raw / 'rotation-polynomial-proof-controls.json').write_text(json.dumps(result, indent=2) + '\n')
print('Independent graph-proof controls pass')
