"""Audit the final admission manifest and every retained source epoch."""
import ast
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
read = lambda n: json.loads((OUT/n).read_text())
sha = lambda b: hashlib.sha256(b).hexdigest()
digest = lambda p: sha(Path(p).read_bytes())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
source = hashes()
m = read('manifest.json')
assert git('branch', '--show-current').strip() == b'brep'
assert git('rev-parse', 'HEAD').decode().strip() == m['baseline']
assert source == read('final-source.json') == read('qualification-driver.json')['source']
assert sha(json.dumps(source, sort_keys=True).encode()) == m['source_identity']
assert not read('qualification-driver.json')['failures']
for name, expected in m['evidence_files'].items():
    assert digest(OUT/name) == expected, name
for name, expected in m['documents'].items():
    assert digest(ROOT/name) == expected, name
attempts = read('attempts.json')
latest = {r['label']: r for r in attempts}
for label in read('qualification-driver.json')['executed']:
    row = latest[label]
    assert row['exit_code'] == 0 and row['source_unchanged'] and read(row['source']) == source, label
assert any(r['exit_code'] for r in attempts)
for name in ['consumers.json', 'original-profiles.json', 'artifacts.json', 'artifact-comparison.json',
             'cost-summary.json', 'new-cost-summary.json', 'prior-native-cost-summary.json',
             'prior-spline-cost-summary.json', 'continuation-admission.json']:
    assert read(name)['source'] == source, name
consumers = read('consumers.json')
for label, count in consumers['groups'].items():
    row = latest[label+'-wasm-runtime']
    outcome = json.loads((OUT/row['log']).read_text())
    assert outcome.get('groups', outcome.get('probe_groups')) == count and outcome['imports'] == 0
    assert row['exit_code'] == 0 and read(row['source']) == source
for path, expected in consumers['inputs'].items():
    assert digest(path) == expected, path
for binary in consumers['binaries'].values():
    assert digest(binary['path']) == binary['sha256']
    assert Path(binary['path']).stat().st_size == binary['bytes']
assert read('original-profiles.json')['counts'] == dict(native_result=2, unsupported=5)
artifacts = read('artifacts.json')
assert artifacts['new'] == 12 and artifacts['preserved'] == 66 and len(artifacts['rows']) == 78
for row in artifacts['rows']:
    assert digest(OUT/row['path']) == digest(OUT/row['repeat']) == row['sha256']
    if row['baseline']:
        assert digest(ROOT/row['baseline']) == row['sha256']
old = read('artifact-comparison.json')['rows']
assert len(old) == 211
for row in old:
    assert digest(OUT/row['path']) == digest(ROOT/row['baseline']) == row['sha256']
oracle = read('quintic-occt.json')
assert len(oracle['rows']) == 8 and not oracle['failed']
assert oracle['recipe_sha256'] == digest(OUT/'analysis-recipes/quintic_occt.py')
for row in oracle['rows']:
    assert digest(OUT/'measurement-artifacts'/row['file']) == row['sha256']
cost = read('cost-summary.json')
assert cost['preserved_cases'] == 192 and cost['receipt_preserved'] and not cost['migrations']
assert cost['commands'] == 72 and len(cost['baseline']) == len(cost['candidate']) == 22
for binary in [*cost['baseline'].values(), *cost['candidate'].values()]:
    assert digest(binary['path']) == binary['sha256']
for name, count in [('new-cost-summary.json', 7), ('prior-native-cost-summary.json', 6), ('prior-spline-cost-summary.json', 9)]:
    assert len(read(name)['rows']) == count
archive = read('source-reconstruction.json')
assert archive['baseline'] == m['baseline'] and digest(OUT/archive['archive']) == archive['archive_sha256']
with tarfile.open(OUT/archive['archive'], 'r:gz') as packed:
    contents = {item.name:packed.extractfile(item).read() for item in packed.getmembers()}
assert {name:sha(b) for name, b in contents.items()} == archive['members']
baseline_files = {}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(row['snapshot'])
    assert set(snapshot) == set(row['baseline_files']) | set(row['overlay_files'])
    for name, expected in snapshot.items():
        if name in row['overlay_files']:
            data = contents[row['overlay_files'][name]]
        else:
            if name not in baseline_files:
                baseline_files[name] = git('show', m['baseline']+':'+name)
            data = baseline_files[name]
        assert sha(data) == expected, (row['snapshot'], name)
for name in ['AGENTS.md', 'properties.md', 'docs/admission.md', 'Cargo.toml', 'Cargo.lock']:
    assert (ROOT/name).read_bytes() == git('show', m['baseline']+':'+name)
helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
current = (ROOT/'docs/properties-status.json').read_text()
old_ledger = git('show', m['baseline']+':docs/properties-status.json').decode()
assert current == spans.replace_brep(old_ledger, json.loads(current)['current_work']['hyperbrep'])
status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(r['status'] in ['open', 'in-progress'] for r in status['work_packages'])
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(git('stash', 'list', '--format=%H').decode().splitlines())
for name in git('diff', 'HEAD', '--name-only').decode().splitlines():
    assert name == 'docs/properties-status.json' or name.startswith(('crates/hyperbrep/', 'crates/hyperbrep-io/', 'crates/hypercurve/')), name
for path in [ROOT/name for name in m['documents'] if name.endswith('.md')] + list(OUT.glob('*.md')):
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' not in target and not target.startswith('#'):
            destination = path.parent/target.split('#')[0]
            assert destination.exists() or destination == OUT/'audit.json', (path, target)
for path in OUT.rglob('*.json'):
    json.loads(path.read_text())
for path in (OUT/'analysis-recipes').glob('*.py'):
    ast.parse(path.read_text(), filename=str(path))
(OUT/'audit.json').write_text(json.dumps(dict(passed=True, source=source, manifest_sha256=digest(OUT/'manifest.json'),
    checks='Source epochs, local/downstream checks, real WASM, original failures, 277 preserved and 12 new artifacts, independent reader, 192 benchmark receipts, new/prior costs, protected stashes, ownership and ledger isolation. Release and pre-push gates remain open.'), indent=2)+'\n')
print('Measurement admission audit passed')
