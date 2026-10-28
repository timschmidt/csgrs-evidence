from pathlib import Path
import importlib.util
import json
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
target = (root / 'selected-circle-corners').resolve()
source = (root / 'empty-native-replay').resolve()
record = controls / 'corner-anchor-reuse-promoted.json'
assert not record.exists()
for label, count in [('corner-anchor-reuse-candidate1', 1), ('corner-anchor-reuse-candidate1-points', 54)]:
    folder = controls / label
    result = json.loads((folder / 'result.json').read_text())
    assert result['exit_code'] == 0 and result['source_stable']
    assert re.search(r'test result: ok\. ' + str(count) + r' passed; 0 failed;', (folder / 'original-test.log').read_text())
old_run = controls / 'selected-circle-corners-qualification-corner4'
rows = json.loads((old_run / 'results.json').read_text())
assert len(rows) == 17 and rows[-1]['name'] == 'full-suite' and rows[-1]['exit_code'] == 101
assert all(r['source_stable'] for r in rows)
assert all(r['exit_code'] == 0 for r in rows[:-1])
def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path / 'scripts/successive-operations.py')
    m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m); return m
old, new = module('old', target), module('new', source)
before, files, _ = old.source_snapshot()
assert before == json.loads((old_run / 'source-before.json').read_text())
assert before == json.loads((old_run / 'source-after.json').read_text())
candidate, new_files, _ = new.source_snapshot()
assert candidate == json.loads((controls / 'corner-anchor-reuse-candidate1-points/source-before.json').read_text())
relative = 'crates/hypercurve/src/bezier_region/offset_joins.rs'
(target / relative).write_bytes((source / relative).read_bytes())
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=target, check=True)
after, after_files, _ = old.source_snapshot()
expected = {row[0]: row for row in files}
expected[relative] = next(row for row in new_files if row[0] == relative)
assert after_files == sorted(expected.values())
driver = controls / 'qualify_increment.py'; text = driver.read_text()
needle = 'commands = [\n'
assert text.count(needle) == 1
text = text.replace(needle, '''if args.increment == 'selected-circle-corners':
    focused.append(('affine-chord-frame', [*base, '--test', 'hypercurve_curve_region_promotion', 'algebraic_chords_survive_nonsingular_exact_affine_transforms', '--', '--exact', '--nocapture'], {}))
''' + needle)
driver.write_text(text)
contract = controls / 'selected-circle-corners-contract.json'; data = json.loads(contract.read_text())
data['native_anchor_regression'] = {'qualification_attempt': 'corner4', 'source': before, 'original_test': 'algebraic_chords_survive_nonsingular_exact_affine_transforms', 'finding': 'The generic unit-normal center constructor reconstructed a direction chord when the join already owned the source chord, bypassing required chord-frame dispatch.', 'fix': 'The join reuses that source chord for the general center representation; native one-field frames and the general constructor remain available.', 'all_original_assertions_unchanged': True, 'focused_original_test_passed': True, 'selected_point_cases_passed': 54, 'fresh_full_qualification_required': True}
contract.write_text(json.dumps(data, indent=2) + '\n')
result = {'previous_source': before, 'source': after, 'probe_source': candidate, 'promoted_path': relative, 'other_primary_files_unchanged': True, 'all_original_assertions_unchanged': True, 'epoch': time.time()}
record.write_text(json.dumps(result, indent=2) + '\n')
for name, command in [
    ('selected-circle-corners-qualification-corner5', ['python3', str(driver), 'selected-circle-corners', '--attempt', 'corner5']),
    ('corner-composition-resource-policy-final2', ['python3', str(controls / 'probe_corner_composition_resources.py'), '--checkout', 'selected-circle-corners', '--record', 'corner-composition-resource-policy-final2']),
]:
    with (controls / (name + '-controller.log')).open('x') as log:
        p = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    result[name] = {'pid': p.pid, 'command': command}
record.write_text(json.dumps(result, indent=2) + '\n')
print(record.read_text())
