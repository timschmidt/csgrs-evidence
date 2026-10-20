"""Audit source, completed contracts and retained failures before committing."""
import ast
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

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
assert git('rev-parse', 'HEAD').decode().strip() == manifest['baseline']
assert not git('diff', '--name-only', '--diff-filter=U')
assert source == read('final-source.json') == read('qualification-driver.json')['source']
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
for name, value in manifest['evidence_files'].items():
    assert digest(OUT/name) == value, name
for name, value in manifest['documents'].items():
    assert digest(ROOT/name) == value, name

qualification = read('qualification-driver.json')
assert not qualification['failures'] and not qualification['upstream_debug_blocked']
remaining = read('remaining-stages.json')
assert remaining['source'] == source
assert [row['stage'] for row in remaining['rows']] == ['consumers', 'artifacts', 'preserve', 'consumer_costs', 'new_costs']
assert all(row['exit_code'] == 0 and row['source_unchanged'] for row in remaining['rows'])
assert read('qualification-summary.json')['test_counts'] == {
    'new-debug': 11, 'native-release': 632, 'native-minimal': 624,
    'curve-tests': 303, 'curve-retained': 165, 'curve-winding': 4, 'curve-successors': 62,
    'harness-release': 1, 'harness-minimal': 1,
}
attempts = read('attempts.json')
assert all(row['source_unchanged'] for row in attempts)
latest = {row['label']: row for row in attempts}
for label in qualification['executed']:
    row = latest[label]
    expected = read('qualification-driver-before-harness.json')['source'] if label in qualification.get('reused_checks', []) else source
    assert row['exit_code'] == 0 and read(row['source']) == expected, label
recheck = read('harness-requalification.json')
assert recheck['source'] == source and recheck['passed'] and recheck['acceptance_body_unchanged'] and recheck['production_unchanged']
assert recheck['reused_checks'] == qualification['reused_checks']
assert len(recheck['changed']) == 3 and all('/src/' not in name for name in recheck['changed'])
for label, expected in read('qualification-summary.json')['test_counts'].items():
    rows = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored', (OUT/latest[label]['log']).read_text())
    assert sum(int(row[0]) for row in rows) == expected and all(row[1:] == ('0', '0') for row in rows), label
assert latest['baseline-public-test']['exit_code'] != 0
assert 'UnsupportedPlanarProfile' in (OUT/latest['baseline-public-test']['log']).read_text()
baseline_profiles = read('baseline-profiles.json')
assert digest(baseline_profiles['binary']['path']) == baseline_profiles['binary']['sha256']
assert sum(row['outcome'] == 'native_result' for row in baseline_profiles['rows']) == 2
assert sum(row['outcome'] == 'unsupported' for row in baseline_profiles['rows']) == 5
storage = read('storage-identity.json')
assert storage['passed'] and len(storage['checks']) == 5
assert digest(OUT/'final-review/storage.py') == storage['recipe_sha256']

consumers = read('consumers.json')
assert consumers['source'] == source
assert consumers['groups'] == dict(new=11, measurement=7, spline=9, images=14, original=138)
for label, count in consumers['groups'].items():
    row = latest[label+'-wasm-runtime']
    result = json.loads((OUT/row['log']).read_text())
    assert row['exit_code'] == 0 and result.get('groups', result.get('probe_groups')) == count and result['imports'] == 0
for path, value in consumers['inputs'].items():
    assert digest(path) == value, path
for binary in consumers['binaries'].values():
    assert digest(binary['path']) == binary['sha256'] and Path(binary['path']).stat().st_size == binary['bytes']
profiles = read('original-profiles.json')
assert profiles['source'] == source and profiles['counts'] == dict(native_result=6, unsupported=1)
assert digest(profiles['binary']['path']) == profiles['binary']['sha256']

new = read('artifacts.json')
old = read('artifact-comparison.json')
assert new['source'] == old['source'] == source
assert new['new'] == 48 and new['preserved'] == 78 and len(new['rows']) == 126 and len(old['rows']) == 211
for row in new['rows']:
    assert digest(OUT/row['path']) == digest(OUT/row['repeat']) == row['sha256']
    if row['baseline']:
        assert digest(ROOT/row['baseline']) == row['sha256']
for row in old['rows']:
    assert digest(OUT/row['path']) == digest(ROOT/row['baseline']) == row['sha256']
assert read('continuation-admission.json')['passed'] and read('continuation-admission.json')['source'] == source
assert read('artifact-preservation.json')['preserved_files'] == 289
oracle = json.loads((OUT.parent/'2026-10-18-measurement-admission/quintic-occt.json').read_text())
assert len(oracle['rows']) == 8 and not oracle['failed']
for row in oracle['rows']:
    assert digest(OUT/'measurement-artifacts'/row['file']) == row['sha256']
for name, groups, trials in [('consumer-costs.json', 22, 18), ('new-costs.json', 11, 3)]:
    costs = read(name)
    assert costs['source'] == source and len(costs['rows']) == groups and len(costs['trials']) == trials
    for path, value in costs['inputs'].items():
        assert digest(path) == value
    for row in costs['trials']:
        assert row['exit_code'] == row['resource']['exit_code'] == 0
    binaries = [costs['binary']] if 'binary' in costs else [binary for group in costs['binaries'].values() for binary in group.values()]
    for binary in binaries:
        assert digest(binary['path']) == binary['sha256']

archive = read('source-reconstruction.json')
assert archive['baseline'] == manifest['baseline'] and digest(OUT/archive['archive']) == archive['archive_sha256']
with tarfile.open(OUT/archive['archive'], 'r:gz') as packed:
    contents = {row.name: packed.extractfile(row).read() for row in packed.getmembers()}
assert {name: sha(data) for name, data in contents.items()} == archive['members']
cache = {}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(row['snapshot'])
    assert set(snapshot) == set(row['baseline_files']) | set(row['overlay_files'])
    for name, value in snapshot.items():
        if name in row['overlay_files']:
            data = contents[row['overlay_files'][name]]
        else:
            if name not in cache:
                cache[name] = git('show', manifest['baseline']+':'+name)
            data = cache[name]
        assert sha(data) == value, (row['snapshot'], name)

helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
current = (ROOT/'docs/properties-status.json').read_text()
baseline = git('show', manifest['baseline']+':docs/properties-status.json').decode()
leaf = json.loads(current)['current_work']['hyperbrep']
assert current == spans.replace_brep(baseline, leaf) and leaf['upstream_revision'] == manifest['upstream']
status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(git('stash', 'list', '--format=%H').decode().splitlines())
for path in [ROOT/name for name in manifest['documents'] if name.endswith('.md')] + list(OUT.glob('*.md')):
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' not in target and not target.startswith('#'):
            destination = path.parent/target.split('#')[0]
            assert destination.exists() or destination == OUT/'audit.json', (path, target)
for path in OUT.rglob('*.json'):
    json.loads(path.read_text())
for path in [*(OUT/'analysis-recipes').glob('*.py'), *(OUT/'final-review').glob('*.py')]:
    ast.parse(path.read_text(), filename=str(path))
(OUT/'audit.json').write_text(json.dumps(dict(passed=True, source_identity=manifest['source_identity'],
    manifest_sha256=digest(OUT/'manifest.json'), scope='Pinned baseline and upstream; owner-layer tests and typed limits; original and new native/WASM consumers; 289 preserved and 48 repeated new artifacts; complete prior continuation; matched 22-group and absolute 11-group costs; reconstructible source epochs; protected stashes and ledger ownership. All broader work-package, resource, distribution and pre-push gates remain open.'), indent=2)+'\n')
print('Selected profile admission audit passed')
