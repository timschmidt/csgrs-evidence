"""Check the finite admission record; runnable before and after its commit."""
import ast
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import statistics
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path[:0] = [str(OUT), str(OUT/'analysis-recipes')]
from finite_source_comparison import compare
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda path: sha(Path(path).read_bytes())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
manifest = read('manifest.json')
source = hashes()
assert git('branch', '--show-current').strip() == b'brep'
for revision in [manifest['baseline'], manifest['upstream']]:
    subprocess.run(['git', 'merge-base', '--is-ancestor', revision, 'HEAD'], cwd=ROOT, check=True)
assert not git('diff', '--name-only', '--diff-filter=U')
assert source == read('final-source.json')
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
for name, value in manifest['evidence_files'].items():
    assert digest(OUT/name) == value, name
for name, value in manifest['documents'].items():
    assert digest(ROOT/name) == value, name

qualification = read('qualification-driver.json')
assert qualification['source'] == source
assert len(qualification['executed']) == 18
reused = {r['label']: r for r in qualification['reused_unaffected_owner_checks']}
assert len(reused) == 12
assert not qualification['failures'] and not qualification['upstream_debug_blocked']
remaining = read('final-stages.json')
assert remaining['source'] == source
assert [r['stage'] for r in remaining['rows']] == ['qualify', 'consumers', 'preserve', 'artifacts', 'consumer_costs', 'new_costs']
assert all(r['exit_code'] == 0 and r['source_unchanged'] for r in remaining['rows'])
artifact_failure = read('before-finite-source-final-stages.json')
assert artifact_failure['source'] == source
assert [r['exit_code'] for r in artifact_failure['rows']] == [0, 0, 0, 1]
assert remaining['rows'][:3] == artifact_failure['rows'][:3]
assert remaining['failure_history'] == 'before-finite-source-final-stages.json'
assert remaining['rows'][3]['command'][-1] == str(OUT/'final-review/complete_artifacts.py')
for name, value in remaining['inputs'].items():
    assert digest(ROOT/name) == value, name
initial = read('first-final-stages.json')
assert [(r['stage'], r['exit_code']) for r in initial['rows']] == [('qualify', 1)]
assert all(r['source_unchanged'] for r in initial['rows'])
initial_qualification = read('first-qualification-driver.json')
assert initial_qualification['source'] == initial['source']
assert initial_qualification['failures'] == ['native-release', 'native-minimal', 'rustdoc', 'fuzz-check']
assert len(read('format-preflight.json')['failures']) == 6
assert len(read('native-endpoints-comparison.json')['rows']) == 22
assert not read('native-endpoints-comparison.json')['failures']
assert len(read('upstream-only-scalar-comparison.json')['rows']) == 22
assert all(r['baseline_unchanged'] for r in read('upstream-only-scalar-comparison.json')['rows'])
attempts = read('attempts.json')
assert all(row['source_unchanged'] for row in attempts)
latest = {row['label']: row for row in attempts}
for label in qualification['executed']:
    row = latest[label]
    assert row['exit_code'] == 0 and read(row['source']) == source, label
owner_crates = ('hypercurve', 'hyperreal', 'hyperlimit', 'hypersolve', 'hyperlattice', 'hypertri')
owner_inputs = lambda inputs: {p: h for p, h in inputs.items()
    if any(p.startswith('crates/'+crate+'/') for crate in owner_crates)
    or p in ['Cargo.toml','Cargo.lock','AGENTS.md','properties.md','docs/admission.md']}
for label, row in reused.items():
    attempt = next(a for a in attempts if a['label'] == label and a['attempt'] == row['attempt'])
    assert attempt['exit_code'] == 0 and attempt['source_unchanged']
    assert attempt['source'] == row['source'] and attempt['log'] == row['log']
    assert owner_inputs(read(row['source'])) == owner_inputs(source) == row['unchanged_inputs']
counts = dict(new_debug=12, native_release=691, native_minimal=683,
              curve_tests=365, curve_retained=165, curve_parameter=58, curve_winding=4,
              curve_successors=62, curve_subdivision=28)
for label, count in counts.items():
    row = latest[label.replace('_', '-')]
    results = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored', (OUT/row['log']).read_text())
    assert sum(int(r[0]) for r in results) == count and all(r[1:] == ('0', '0') for r in results)
for label in reused:
    if label.startswith('owner-compatibility-'):
        results = re.findall(r'test result: ok\. (\d+) passed;', (OUT/latest[label]['log']).read_text())
        assert sum(map(int, results)) == 1, label
assert sum(label.startswith('owner-compatibility-') for label in reused) == 5
assert sum(label.endswith('-example') for label in qualification['executed']) == 9
for label in ['baseline-lift', 'baseline-clip', 'baseline-shape']:
    assert latest[label]['exit_code'] == 101
assert latest['preservation-correction']['exit_code'] == 0
assert latest['archive-envelope-correction']['exit_code'] == 0
assert latest['rustdoc-correction']['exit_code'] == 0
assert latest['fuzz-correction']['exit_code'] == 0
assert latest['native-endpoints-selected-procedural']['exit_code'] == 0
components = read('components-admission.json')
assert components['source'] == source and components['complete_workflows'] == 2
for path, value in components['inputs'].items():
    assert digest(path) == value

consumers = read('consumers.json')
assert consumers['source'] == source
assert consumers['groups'] == dict(new=12, contacts=14, selected_planar=14, planar=12, parallel=7, selected=11, measurement=7, spline=9, images=14, original=138)
for label, count in consumers['groups'].items():
    row = latest[label+'-wasm-runtime']
    result = json.loads((OUT/row['log']).read_text())
    assert row['exit_code'] == 0 and result.get('groups', result.get('probe_groups')) == count
    assert result['imports'] == 0
for path, value in consumers['inputs'].items():
    assert digest(path) == value, path
assert len(consumers['binaries']) == 20
for binary in consumers['binaries'].values():
    assert digest(binary['path']) == binary['sha256']
for binary in read('baseline-binaries.json')['binaries'].values():
    assert digest(binary['path']) == binary['sha256']
profiles = read('original-profiles.json')
assert profiles['source'] == source and profiles['counts'] == dict(native_result=7, unsupported=0)
assert 'cold_replay=identical' in (OUT/latest['original-profile-parallel_cap']['log']).read_text()
step = read('step-review.json')
assert step['source'] == source and len(step['checks']) == 2
assert all(row['exit_code'] == 0 for row in step['checks'])
assert len(step['retained_contact_rows']) == 4
assert digest(step['new_binary']['path']) == step['new_binary']['sha256']
continuation = read('continuation-admission.json')
assert continuation['passed'] and continuation['source'] == source
frontier = read('continuation-frontier.json')
assert len(frontier['rows']) == 81 and not frontier['changes']
assert sum(label.startswith('final-prism-') for label in latest) == 24
occt = read('prism-occt.json')
assert occt['passed'] == 20 and occt['failed'] == 0 and len(occt['fixtures']) == 20
assert latest['prism-occt']['exit_code'] == 0
old_path = read('old-path-control.json')
assert sorted(r['exit_code'] for r in old_path['rows']) == [0, 0, 101, 101]

preserved = read('artifact-comparison.json')
recent = read('artifacts.json')
parallel = read('parallel-artifacts.json')
planar = read('planar-artifacts.json')
selected_planar = read('selected-planar-artifacts.json')
contacts = read('plane-contact-artifacts.json')
new = read('selected-procedural-artifacts.json')
records = [preserved, recent, parallel, planar, selected_planar, contacts, new]
assert all(j['source'] == source for j in records)
assert [len(j['rows']) for j in records[:-1]] == [211,126,25,48,22,18]
assert sum(len(j['rows']) for j in records[:-1]) == 450
for record in records:
    for row in record['rows']:
        path = OUT/row['path']
        assert digest(path) == row['sha256'] and path.stat().st_size == row['bytes']
        if row.get('repeat'):
            assert path.read_bytes() == (OUT/row['repeat']).read_bytes()
assert len(new['rows']) == manifest['new_artifacts']
formats = read('format-migration.json')
assert formats['source'] == source and len(formats['rows']) == 450
for row in formats['rows']:
    actual = compare(row['baseline'], OUT/row['path'])
    assert actual == {k:v for k,v in row.items() if k != 'path'}
finite = read('finite-source-proof.json')
assert finite['source'] == source and finite['inputs'] == formats['inputs'] == new['inputs']
assert len(finite['finite_rows']) == 2
assert len(finite['mutation_controls']) == 12 and len(finite['scalar_loss_controls']) == 6
for name, value in finite['inputs'].items():
    assert digest(ROOT/name) == value, name
for row in finite['mutation_controls'] + finite['scalar_loss_controls']:
    assert row['rejected'] and digest(OUT/row['path']) == row['sha256']
    try:
        compare(row['baseline'], OUT/row['path'])
    except AssertionError:
        pass
    else:
        raise AssertionError(('accepted_negative_control', row['path']))
fixture_migrations = read('fixture-format-migration.json')
assert len(fixture_migrations['rows']) == 3
for row in fixture_migrations['rows']:
    before = git('show', manifest['baseline']+':'+row['path'])
    after = (ROOT/row['path']).read_bytes()
    assert sha(before) == row['before_sha256'] and sha(after) == row['after_sha256']
    assert before.replace(b'"version":9',b'"version":10',1) == after

cost = read('consumer-costs.json')
absolute = read('new-costs.json')
assert cost['source'] == absolute['source'] == source
assert len(cost['rows']) == 80 and len(cost['trials']) == 48
assert sum(r['matched_contract'] for r in cost['rows']) == 79
assert len(absolute['rows']) == 12 and len(absolute['trials']) == 3
for item in [cost, absolute]:
    for trial in item['trials']:
        assert trial['exit_code'] == trial['resource']['exit_code'] == 0
        rows = [json.loads(line) for line in (OUT/trial['log']).read_text().splitlines() if line.startswith('{')]
        assert rows == trial['rows']
for row in cost['rows']:
    for side in ['baseline', 'candidate']:
        samples = [r for t in cost['trials'] if t['cohort'] == row['cohort'] and t['side'] == side
                   for r in t['rows'] if r['case'] == row['case']]
        assert len(samples) == 3
        for key in ['elapsed_ns', 'allocation_calls', 'requested_bytes']:
            assert statistics.median(r[key]/r['iterations'] for r in samples) == row[side][key]
    if row['matched_contract']:
        assert row['ratio'] == row['candidate']['elapsed_ns']/row['baseline']['elapsed_ns']
    else:
        assert row['ratio'] is None and row['case'] == 'planar_image_limits_and_typed_frontiers_recover'
for row in absolute['rows']:
    samples = [r for t in absolute['trials'] for r in t['rows'] if r['case'] == row['case']]
    assert len(samples) == 3
    for key in ['elapsed_ns', 'allocation_calls', 'requested_bytes']:
        assert statistics.median(r[key]/r['iterations'] for r in samples) == row['median'][key]
reconstruction = read('source-reconstruction.json')
assert reconstruction['baseline'] == manifest['baseline']
assert {r['source'] for r in attempts} <= {r['snapshot'] for r in reconstruction['sources']}
assert all(r['completely_reconstructible'] and not r['missing_files'] for r in reconstruction['sources'])
assert digest(OUT/reconstruction['archive']) == reconstruction['archive_sha256']

status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(w['status'] in ['open', 'in-progress'] for w in status['work_packages'])
assert len(status['increments']) == 63
assert status['increments'][-1]['id'] == 'selected-procedural-profiles-2026-10-18'
ledger = ROOT/'docs/properties-status.json'
spec = importlib.util.spec_from_file_location('ledger_spans', OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
baseline_ledger = git('show', '75b4aa7ab4cf1f28d928c9c018edcc5de4bcb081:docs/properties-status.json').decode()
assert module.replace_brep(baseline_ledger, json.loads(ledger.read_text())['current_work']['hyperbrep']) == ledger.read_text()
upstream_ledger = json.loads(git('show', manifest['upstream']+':docs/properties-status.json'))
current_ledger = json.loads(ledger.read_text())
upstream_ledger['current_work'].pop('hyperbrep',None)
current_ledger['current_work'].pop('hyperbrep')
assert upstream_ledger == current_ledger
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(git('stash', 'list', '--format=%H').decode().splitlines())
for path in [ROOT/name for name in manifest['documents']] + list(OUT.glob('*.md')):
    if path.suffix == '.md':
        for target in re.findall(r'\]\(([^)\s]+)\)', path.read_text()):
            target = target.split('#')[0]
            if target and '://' not in target and not target.startswith('mailto:'):
                assert (path.parent/target).exists() or path.parent/target == OUT/'final-audit.json', (path, target)
for path in OUT.rglob('*.json'):
    json.loads(path.read_text())
for path in OUT.rglob('*.py'):
    ast.parse(path.read_text(), filename=str(path))
whitespace = read('staged-whitespace.json')
assert whitespace['non_logs']['exit_code'] == 0
assert whitespace['all_files']['exit_code'] in [0, 2]
result = dict(passed=True, source_identity=manifest['source_identity'],
              evidence_files=len(manifest['evidence_files']), documents=len(manifest['documents']),
              prior_artifacts=450, new_artifacts=len(new['rows']), wasm_groups=238,
              native_release_tests=691, minimal_release_tests=683,
              scope='Finite source-path selected procedural-profile construction and split/replay/slab continuation admission, not full plan/release/pre-push qualification.')
(OUT/'final-audit.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
