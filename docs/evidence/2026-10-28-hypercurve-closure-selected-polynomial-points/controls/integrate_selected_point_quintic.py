from pathlib import Path
import ast
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
point = r / 'selected-polynomial-points'
diagnostic = r / 'selected-point-fillets'
prior = '9c4f8fbc3e3fe58dd5fffb96e90b2925e360e6c6'

def save(path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')

def git(w, *args, env=None):
    return subprocess.check_output(['git', *args], cwd=w, env=env, text=True).strip()

def snapshot(w):
    spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
    e = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(e)
    return e.source_snapshot()

probe = json.loads((c / 'selected-point-fillets-quintic-shortcut2/complete.json').read_text())
assert probe['all_passed'] and probe['groups'] == 2
assert snapshot(diagnostic)[0] == probe['source']
assert snapshot(point)[0] == json.loads((c / 'selected-polynomial-points-fix12/source-before.json').read_text())
children = ['selected-query-derivatives', 'selected-field-root-discovery']
before = {}
for name in children:
    w = r / name
    assert git(w, 'rev-parse', 'HEAD') == prior
    before[name] = set(git(w, 'diff', '--name-only', 'HEAD').splitlines())
    assert not git(w, 'ls-files', '--others', '--exclude-standard')
    (c / (name + '-before-quintic.patch')).write_bytes(subprocess.check_output(['git', 'diff', '--binary', 'HEAD'], cwd=w))
    prepared = c / (name + '-prepared.json')
    (c / (name + '-prepared-before-quintic.json')).write_bytes(prepared.read_bytes())

changed = ['crates/hypercurve/src/polynomial_point.rs', 'crates/hypercurve/src/bezier_offset/rational_form.rs']
old = '  and subsequent Boolean completion.\n'
new = ('  and subsequent Boolean completion. Query-pair alignment reuses its common\n'
       '  field before an optional semantic point-equality check, preserving exact\n'
       '  selected-quintic Boolean composition.\n')
for w in [point, *[r / name for name in children]]:
    for name in changed:
        (w / name).write_bytes((diagnostic / name).read_bytes())
    p = w / 'crates/hypercurve/CHANGELOG.md'
    text = p.read_text()
    assert text.count(old) == 1
    p.write_text(text.replace(old, new))

subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=point, check=True)
source, files, patch = snapshot(point)
assert len(git(point, 'diff', '--name-only', 'HEAD').splitlines()) == 33
assert not git(point, 'ls-files', '--others', '--exclude-standard')
index = c / 'selected-query-derivatives-source4.index'
assert not index.exists()
env = {**os.environ, 'GIT_INDEX_FILE': str(index)}
subprocess.run(['git', 'read-tree', 'HEAD'], cwd=point, env=env, check=True)
subprocess.run(['git', 'add', '-A'], cwd=point, env=env, check=True)
tree = git(point, 'write-tree', env=env)
parent = git(point, 'rev-parse', 'HEAD')
checkpoint = git(point, 'commit-tree', tree, '-p', parent, '-m', 'Checkpoint selected point queries with retained native predicates and field-first alignment', env=env)
subprocess.run(['git', 'update-ref', 'refs/heads/checkpoint-selected-query-derivatives-source4', checkpoint, '0' * 40], cwd=point, check=True)

for name in children:
    w = r / name
    subprocess.run(['git', 'reset', '--mixed', checkpoint], cwd=w, check=True)
    additions = ['crates/hypercurve/tests/selected_query_derivatives.rs'] if name == 'selected-query-derivatives' else ['crates/hypersolve/src/ordered_field_roots/complete.rs', 'crates/hypersolve/tests/selected_polynomial_root_discovery.rs']
    subprocess.run(['git', 'add', '-N', *additions], cwd=w, check=True)
    assert set(git(w, 'diff', '--name-only', 'HEAD').splitlines()) == before[name]
    prepared = c / (name + '-prepared.json')
    data = json.loads(prepared.read_text())
    data.update(checkpoint=checkpoint, checkpoint_tree=tree, point_source=source,
                parent=checkpoint, point_source_checkpoint=checkpoint,
                previous_checkpoint=prior, files_identical=True, epoch=time.time(),
                scope='Private point checkpoint retains native predicate priority and field-first query alignment; child implementation changes are preserved. Final point receipt alignment remains pending.')
    save(prepared, data)

scripts = [
    'run_selected_polynomial_points_qualification.py', 'close_selected_polynomial_points.py',
    'probe_polynomial_operations_points.py', 'probe_selected_query_derivative_frontier.py',
    'finalize_selected_polynomial_points.py', 'run_selected_query_derivatives_qualification.py',
    'close_selected_query_derivatives.py', 'probe_polynomial_operations_derivatives.py',
    'align_selected_query_derivatives.py', 'finalize_selected_query_derivatives.py',
    'run_selected_field_root_discovery_qualification.py', 'qualify_selected_field_root_discovery.py',
    'close_selected_field_root_discovery.py', 'probe_polynomial_operations_roots.py',
    'align_selected_field_root_discovery.py', 'finalize_selected_field_root_discovery.py',
]
for name in scripts:
    p = c / name
    text = p.read_text()
    text = text.replace('selected-polynomial-points-fix12', 'selected-polynomial-points-fix13')
    text = text.replace("default='fix12'", "default='fix13'")
    text = text.replace('selected-query-derivatives-fix7', 'selected-query-derivatives-fix8')
    text = text.replace('selected-query-derivatives-preflight-5', 'selected-query-derivatives-preflight-6')
    text = text.replace('selected-field-root-discovery-fix3', 'selected-field-root-discovery-fix4')
    text = text.replace('selected-field-root-discovery-preflight-2', 'selected-field-root-discovery-preflight-3')
    text = text.replace('qualification-final4', 'qualification-final5').replace('closeout-final4', 'closeout-final5')
    text = text.replace("'final4'", "'final5'")
    text = text.replace('selected-field-root-discovery-qualification-final2', 'selected-field-root-discovery-qualification-final3')
    if name == 'run_selected_polynomial_points_qualification.py':
        text = text.replace("complete['groups']==21", "complete['groups']==22")
    if name == 'finalize_selected_polynomial_points.py':
        text = text.replace("focused['groups'] == 21", "focused['groups'] == 22")
        text = text.replace("prefixes = ['selected-point-composed-review'", "prefixes = ['selected-point-quintic-review', 'selected-point-composed-review'")
        text = text.replace("for name in ['probe_selected_point_fillets.py'", "for name in ['selected-point-quintic-contract.json', 'integrate_selected_point_quintic.py', 'probe_selected_point_fillets.py'")
        text = text.replace('Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.', 'Query-pair source alignment consumes its retained common field before optional coordinate equality, restoring the unchanged selected-quintic Boolean fixture; exact equality remains a fallback. Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.')
    ast.parse(text)
    p.write_text(text)

p = c / 'probe_selected_polynomial_points.py'
text = p.read_text()
needle = "e.save_json(record/'complete.json'"
assert text.count(needle) == 1
text = text.replace(needle, "run('native-selected-quintic',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','polynomial_closure_composition','selected_face_probes_keep_quintic_ordinates_and_policy_receipts','--','--exact'],300)\n" + needle)
ast.parse(text)
p.write_text(text)

contract = json.loads((c / 'selected-point-quintic-contract.json').read_text())
contract.update(status='Matched baseline passes; original candidate exceeds external60second limit; isolated field-first alignment passes. Integrated without changing the original fixture.', checkpoint=checkpoint, epoch=time.time())
save(c / 'selected-point-quintic-contract.json', contract)
p = c / 'selected-polynomial-points-contract.json'
data = json.loads(p.read_text())
data['quintic_alignment_followup'] = contract
save(p, data)
record = {'checkpoint': checkpoint, 'tree': tree, 'point': source,
          'children': {name: snapshot(r / name)[0] for name in children},
          'diagnostic': probe, 'epoch': time.time()}
save(c / 'selected-point-quintic-integration.json', record)
print(json.dumps(record, indent=2))
