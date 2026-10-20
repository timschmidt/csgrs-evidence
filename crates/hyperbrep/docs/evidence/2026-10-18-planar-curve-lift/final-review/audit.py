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
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda path: sha(Path(path).read_bytes())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
manifest = read('manifest.json')
source = hashes()
assert git('branch', '--show-current').strip() == b'brep'
subprocess.run(['git', 'merge-base', '--is-ancestor', manifest['baseline'], 'HEAD'], cwd=ROOT, check=True)
assert not git('diff', '--name-only', '--diff-filter=U')
assert source == read('final-source.json')
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
for name, value in manifest['evidence_files'].items():
    assert digest(OUT/name) == value, name
for name, value in manifest['documents'].items():
    assert digest(ROOT/name) == value, name

qualification = read('qualification-driver.json')
assert qualification['source'] == source
assert len(qualification['executed']) == 23
assert not qualification['failures'] and not qualification['upstream_debug_blocked']
remaining = read('final-stages.json')
assert remaining['source'] == source
assert [r['stage'] for r in remaining['rows']] == ['qualify', 'consumers', 'preserve', 'artifacts', 'consumer_costs', 'new_costs']
assert all(r['exit_code'] == 0 and r['source_unchanged'] for r in remaining['rows'])
attempts = read('attempts.json')
assert all(row['source_unchanged'] for row in attempts)
latest = {row['label']: row for row in attempts}
for label in qualification['executed']:
    row = latest[label]
    assert row['exit_code'] == 0 and read(row['source']) == source, label
counts = dict(new_debug=11, native_release=650, native_minimal=642,
              curve_tests=351, curve_retained=165, curve_winding=4, curve_successors=62)
for label, count in counts.items():
    row = latest[label.replace('_', '-')]
    results = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored', (OUT/row['log']).read_text())
    assert sum(int(r[0]) for r in results) == count and all(r[1:] == ('0', '0') for r in results)
assert latest['baseline-cap']['exit_code'] == 101
assert 'UnsupportedPlanarProfile' in (OUT/latest['baseline-cap']['log']).read_text()

consumers = read('consumers.json')
assert consumers['source'] == source
assert consumers['groups'] == dict(new=12, parallel=7, selected=11, measurement=7, spline=9, images=14, original=138)
for label, count in consumers['groups'].items():
    row = latest[label+'-wasm-runtime']
    result = json.loads((OUT/row['log']).read_text())
    assert row['exit_code'] == 0 and result.get('groups', result.get('probe_groups')) == count
    assert result['imports'] == 0
for path, value in consumers['inputs'].items():
    assert digest(path) == value, path
for binary in consumers['binaries'].values():
    assert digest(binary['path']) == binary['sha256']
profiles = read('original-profiles.json')
assert profiles['source'] == source and profiles['counts'] == dict(native_result=7, unsupported=0)
assert 'cold_replay=identical' in (OUT/latest['original-profile-parallel_cap']['log']).read_text()
pole = read('pole-review.json')
assert pole['source'] == source and len(pole['rows']) == 7
assert all(row['exit_code'] == 0 for row in pole['checks'])
assert pole['rows'][-1] == 'recovery_face=admitted'
assert all('reason: Boundary' in row for row in pole['rows'][:-1])
assert digest(pole['binary']['path']) == pole['binary']['sha256']
for name, value in pole['inputs'].items():
    assert digest(OUT/name) == value, name
continuation = read('continuation-admission.json')
assert continuation['passed'] and continuation['source'] == source
frontier = read('continuation-frontier.json')
assert len(frontier['rows']) == 81 and not frontier['changes']
assert sum(label.startswith('final-prism-') for label in latest) == 24
old_path = read('old-path-control.json')
assert sorted(r['exit_code'] for r in old_path['rows']) == [0, 0, 101, 101]

preserved = read('artifact-comparison.json')
recent = read('artifacts.json')
parallel = read('parallel-artifacts.json')
new = read('planar-artifacts.json')
assert all(j['source'] == source for j in [preserved, recent, parallel, new])
assert len(preserved['rows']) == 211 and len(recent['rows']) == 126
for row in preserved['rows'] + recent['rows'] + parallel['rows'] + new['rows']:
    path = OUT/row['path']
    assert digest(path) == row['sha256'] and path.stat().st_size == row['bytes']
    if row.get('baseline'):
        assert path.read_bytes() == (ROOT/row['baseline']).read_bytes()
    if row.get('repeat'):
        assert path.read_bytes() == (OUT/row['repeat']).read_bytes()
assert len(new['rows']) == manifest['new_artifacts']
assert len(parallel['rows']) == 25
for row in parallel['rows']:
    assert (OUT/row['path']).read_bytes() == (OUT.parent/'2026-10-18-parallel-pcurve-replay'/row['path']).read_bytes()

cost = read('consumer-costs.json')
absolute = read('new-costs.json')
assert cost['source'] == absolute['source'] == source
assert len(cost['rows']) == 40 and len(cost['trials']) == 30
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
    assert row['ratio'] == row['candidate']['elapsed_ns']/row['baseline']['elapsed_ns']
for row in absolute['rows']:
    samples = [r for t in absolute['trials'] for r in t['rows'] if r['case'] == row['case']]
    assert len(samples) == 3
    for key in ['elapsed_ns', 'allocation_calls', 'requested_bytes']:
        assert statistics.median(r[key]/r['iterations'] for r in samples) == row['median'][key]
reconstruction = read('source-reconstruction.json')
assert all(r['completely_reconstructible'] and not r['missing_files'] for r in reconstruction['sources'])
assert digest(OUT/reconstruction['archive']) == reconstruction['archive_sha256']

status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(w['status'] in ['open', 'in-progress'] for w in status['work_packages'])
assert status['increments'][-1]['id'] == 'planar-curve-lift-2026-10-18'
ledger = ROOT/'docs/properties-status.json'
spec = importlib.util.spec_from_file_location('ledger_spans', OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
baseline_ledger = git('show', manifest['baseline']+':docs/properties-status.json').decode()
assert module.replace_brep(baseline_ledger, json.loads(ledger.read_text())['current_work']['hyperbrep']) == ledger.read_text()
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
              prior_artifacts=362, new_artifacts=len(new['rows']), wasm_groups=198,
              native_release_tests=650, minimal_release_tests=642,
              scope='Finite source-path planar lift and cap extrusion admission, not full plan/release/pre-push qualification.')
(OUT/'final-audit.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
