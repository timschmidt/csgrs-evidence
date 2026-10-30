"""Apply the independently reproduced zero-distance fix after the preceding commit."""
from pathlib import Path
import hashlib, importlib.util, json, os, subprocess, sys, time
sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
w = root / 'polynomial-chamfer-dispatch'
isolated = root / 'zero-chord-displacement'
previous = c / 'selected-chord-composition-final-commit.json'
closed = c / 'selected-chord-composition-closeout-controller.log'
controller = json.loads((c / 'selected-chord-composition-closeout-controller.json').read_text())['pid']
qualification = c / 'selected-chord-composition-qualification-final1'
while not previous.exists() or 'Selected chord composition committed locally; no push.' not in closed.read_text():
    if (qualification / 'results.json').exists():
        assert all(row['exit_code'] == 0 and row['source_stable']
                   for row in json.loads((qualification / 'results.json').read_text())), 'prior qualification failed'
    os.kill(controller, 0)
    time.sleep(10)
prior = json.loads(previous.read_text())
def out(command):
    return subprocess.check_output(command, cwd=w, text=True).strip()
assert out(['git', 'rev-parse', 'HEAD']) == prior['commit']
assert not out(['git', 'status', '--porcelain'])
focused = json.loads((c / 'zero-chord-displacement-fix3/complete.json').read_text())
assert focused['all_passed']
def evidence(checkout, name):
    spec = importlib.util.spec_from_file_location(name, checkout / 'scripts/successive-operations.py')
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result
test_evidence = evidence(isolated, 'isolated_evidence')
assert test_evidence.source_snapshot()[0] == focused['source']
e = evidence(w, 'integrated_evidence')
before, before_files, _ = e.source_snapshot()
relative = 'crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs'
start = '    pub(in crate::bezier_offset) fn conservative_bounds_refined_impl('
end = '    /// Signs this parallel endpoint against a concentric circle'
def owner(text):
    return text[text.index(start):text.index(end)]
original = subprocess.check_output(['git', 'show', '6296155cf7f04936215f375989dd175ab797eb24:' + relative], cwd=w, text=True)
current = (w / relative).read_text()
corrected = (isolated / relative).read_text()
assert owner(current) == owner(original)
assert 'if self.data.distance.definitely_zero()' in owner(corrected)
(w / relative).write_text(current.replace(owner(current), owner(corrected), 1))
test = 'crates/hypercurve/tests/zero_chord_displacements.rs'
assert not (w / test).exists()
(w / test).write_bytes((isolated / test).read_bytes())
catalog_path = w / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(catalog_path.read_text())
additions = json.loads((c / 'zero-chord-displacement-capability-additions.json').read_text())
existing = {row['id'] for row in catalog['fixtures']}
assert all(row['id'] not in existing for row in additions)
catalog['fixtures'].extend(additions)
catalog_path.write_text(json.dumps(catalog, indent=2) + '\n')
path = w / 'crates/hypercurve/CHANGELOG.md'
content = path.read_text()
marker = '## [0.4.0] - Unreleased\n\n'
entry = (c / 'zero-chord-displacement-changelog.txt').read_text()
assert content.count(marker) == 1 and entry not in content
path.write_text(content.replace(marker, marker + entry, 1))
subprocess.run(['git', 'add', '-N', '--', test], cwd=w, check=True)
subprocess.run(['git', 'diff', '--check'], cwd=w, check=True)
intended = {relative, test, 'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json'}
assert set(out(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == intended
source, files, patch = e.source_snapshot()
assert [row for row in files if row[0] not in intended] == [row for row in before_files if row[0] not in intended]
record = {'parent': prior['commit'], 'parent_qualification': str(qualification),
          'isolated_focused': focused, 'source': source, 'before': before,
          'intended_files': sorted(intended), 'non_task_files_unchanged': True,
          'owner_sha256': hashlib.sha256(owner(corrected).encode()).hexdigest(), 'epoch': time.time()}
(c / 'zero-chord-displacement-integration.json').write_text(json.dumps(record, indent=2) + '\n')
(c / 'zero-chord-displacement-integrated.patch').write_bytes(patch)
state_path = root / 'SESSION_STATE.json'
state = json.loads(state_path.read_text())
state['zero_chord_displacement'].update({'status': 'Independently reproduced correction integrated after the selected-chord commit. Final combined source is frozen for 21 affected qualification groups.',
                                       'integration': record, 'checkout': str(w), 'source_frozen': True})
state_path.write_text(json.dumps(state, indent=2) + '\n')
command = ['python3', str(c / 'qualify_zero_chord_displacements.py'), '--attempt', 'final1']
print('START', command, flush=True)
result = subprocess.run(command, cwd=w)
print('FINISH', result.returncode, flush=True)
raise SystemExit(result.returncode)
