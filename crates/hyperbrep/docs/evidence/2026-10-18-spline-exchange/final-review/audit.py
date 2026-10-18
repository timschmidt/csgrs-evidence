"""Audit exact capability, source epochs and all preserved complete-work evidence."""
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
sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda p: sha(p.read_bytes())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
source = hashes()
m = read('manifest.json')
assert git('branch', '--show-current').strip() == b'brep'
assert git('rev-parse', 'HEAD').decode().strip() == m['baseline']
assert subprocess.run(['git', 'merge-base', '--is-ancestor', m['upstream'], 'HEAD'], cwd=ROOT).returncode == 0
assert not git('diff', '--name-only', '--diff-filter=U')
assert source == read('final-source.json') == read('qualification-summary.json')['source']
assert sha(json.dumps(source, sort_keys=True).encode()) == m['source_identity']
for name, h in m['evidence_files'].items():
    assert digest(OUT/name) == h, name
for name, h in m['documents'].items():
    assert digest(ROOT/name) == h, name
q = read('qualification-summary.json')
assert {k: v['passed'] for k, v in q['tests'].items()} == {
    'native-release': 618, 'native-minimal': 610, 'axial-debug': 26, 'axial-proof-debug': 5,
    'axial-chart-debug': 2, 'plane-relation-debug': 2, 'native-image-debug': 8,
    'retained-profile-debug': 6, 'curve-tests': 93, 'spline-native-debug': 4, 'spline-io-debug': 5}
assert not q['upstream_debug_blocked'] and all(v['failed'] == v['exit_code'] == 0 for v in q['tests'].values())
assert q['wasm']['groups'] == 138 and q['wasm']['imports'] == 0
attempts = read('attempts.json')
latest = {r['label']: r for r in attempts}
assert all(r['source_unchanged'] for r in attempts)
assert q['failures'] == [r for r in attempts if r['exit_code']]
for label in read('qualification-driver.json')['executed']:
    row = latest[label]
    assert row['exit_code'] == 0 and read(row['source']) == source, label
assert any(r['exit_code'] and r['label']=='missing-acceptance' for r in attempts)
assert any(r['exit_code'] and r['label']=='native-release' for r in attempts)
payload = read('package-payload.json')
assert payload['source'] == source and set(payload['crates'])=={'hyperbrep','hyperbrep-io'}
for crate, item in payload['crates'].items():
    assert item['command'] == latest['package-list-'+crate] and item['command']['exit_code'] == 0
    assert read(item['command']['source']) == source
    assert len(item['members']) == len(set(item['members']))
    assert not any(n.startswith('docs/evidence/') for n in item['members'])
    for name, row in item['files'].items():
        path = ROOT/'crates'/crate/name
        assert digest(path) == row['sha256'] and path.stat().st_size == row['bytes'], name
assert 'src/geometry/spline.rs' in payload['crates']['hyperbrep']['members']
assert 'tests/fixtures/spline-extrusion.step' in payload['crates']['hyperbrep-io']['members']
assert 'tests/retained_region_extrusion.rs' in payload['crates']['hyperbrep']['members']
for name in ['qualification-driver.json', 'finish-checks.json', 'cost-summary.json', 'resource-summary.json',
             'continuation-admission.json', 'consumer-admission.json', 'previous-axial-admission.json',
             'components-admission.json', 'old-path-control.json', 'retention-decision.json',
             'frontier.json', 'new-consumers.json', 'new-cost-summary.json', 'resource-decision.json',
             'spline-artifacts.json', 'prior-image-artifacts.json', 'prior-native-cost-summary.json',
             'faceted-followup.json']:
    assert read(name)['source'] == source, name
inputs = {}
for name in ['external-inputs.json', 'continuation-inputs.json', 'components-inputs.json']:
    inputs.update(read(name))
for name, key in [('qualification-driver.json', 'external_inputs'), ('finish-checks.json', 'inputs'),
                  ('previous-axial-admission.json', 'inputs'), ('old-path-control.json', 'inputs'),
                  ('cost-summary.json', 'inputs'),
                  ('new-consumers.json', 'inputs'), ('spline-artifacts.json','inputs'),
                  ('prior-native-cost-summary.json','inputs'), ('new-cost-summary.json', 'inputs'),
                  ('faceted-followup.json','inputs')]:
    inputs.update(read(name)[key])
for path, h in inputs.items():
    assert digest(Path(path)) == h, path
assert read('storage-identity.json')['passed']
assert read('continuation-frontier.json')['counts'] == dict(native_result=81)
assert not read('continuation-frontier.json')['changes']
prisms = read('prism-frontier.json')
assert len(prisms['rows']) == 24 and not prisms['changes'] and prisms['counts'] == dict(native_result=24)
assert len(read('axial-shell-occt.json')['rows']) == 8
assert all(r['valid'] and r['solids'] == 1 for r in read('axial-shell-occt.json')['rows'])
assert read('prism-occt.json')['failed'] == 0 and len(read('prism-occt.json')['fixtures']) == 20
artifacts = read('artifact-comparison.json')['rows']
assert len(artifacts) == 211 and all(r['unchanged'] for r in artifacts)
for row in artifacts:
    assert digest(OUT/row['path']) == row['candidate_sha256'] == row['baseline_sha256'] == digest(ROOT/row['baseline'])
    assert row['candidate_bytes'] == row['baseline_bytes'] == (OUT/row['path']).stat().st_size
prior = read('prior-image-artifacts.json')
assert prior['unchanged']==8 and len(prior['rows'])==16
for row in prior['rows']:
    assert digest(OUT/row['path'])==digest(ROOT/row['baseline'])==row['sha256']
new_artifacts = read('spline-artifacts.json')
assert len(new_artifacts['artifacts'])==58 and len(new_artifacts['reader_cases'])==28
for row in new_artifacts['artifacts']:
    assert digest(OUT/row['path'])==digest(OUT/row['repeat'])==row['sha256']
    assert (OUT/row['path']).stat().st_size==(OUT/row['repeat']).stat().st_size==row['bytes']
reader_report=read('spline-occt.json')
assert reader_report['recipe_sha256']==digest(OUT/'final-review/spline_occt.py')
assert not reader_report['failed'] and latest['spline-occt']['exit_code']==0
for observation, recipe in [('spline-occt-attempt-1.json','spline_occt_auto_roots.py'), ('spline-occt-attempt-2.json','spline_occt_gauss.py')]:
    assert read(observation)['recipe_sha256']==digest(OUT/'final-review'/recipe)
assert len(read('spline-occt-attempt-2.json')['failed'])==4
reader=reader_report['rows']
assert len(reader)==28 and all(r['valid'] and r['volume_agrees'] and r['observed_solids']==r['solids'] for r in reader)
for row in reader:
    assert digest(OUT/'spline-artifacts'/row['step'])==row['sha256']
frontier=read('frontier.json')
assert frontier['counts']==dict(native_result=2,unsupported=5) and len(frontier['rows'])==7
assert all(not r['improved'] and r['original_unchanged'] for r in frontier['rows'])
for row in frontier['rows']:
    assert (OUT/row['log']).read_bytes()==(OUT.parent/'2026-10-18-native-boundary-images'/row['log']).read_bytes()
new=read('new-consumers.json')
assert (new['new_native_groups'],new['new_wasm_groups'],new['preserved_native_groups'],new['preserved_wasm_groups'])==(9,9,14,14)
wasm=json.loads((OUT/latest['new-wasm-runtime']['log']).read_text())
assert wasm['groups']==9 and wasm['imports']==0
previous_wasm=json.loads((OUT/latest['prior-image-wasm-runtime']['log']).read_text())
assert previous_wasm['groups']==14 and previous_wasm['imports']==0
cost = read('cost-summary.json')
assert (cost['preserved_cases'], cost['new_cases'], cost['commands']) == (192, 0, 132)
assert len(cost['baseline']) == len(cost['candidate']) == 22
assert cost['receipt_preserved'] and not cost['migrations'] and not cost['representation_migration']
commands = read('costs/commands.json')
assert len(commands) == 132 and all(r['exit_code'] == r['resource']['exit_code'] == 0 for r in commands)
nc = read('new-cost-summary.json')
assert len(nc['trials']) == 3 and len(nc['rows']) == 9
assert all(r['exit_code'] == r['resources']['exit_code'] == 0 for r in nc['trials'])
pc=read('prior-native-cost-summary.json')
assert len(pc['rows'])==6 and len(pc['trials'])==6
assert all(r['exit_code']==r['resource']['exit_code']==0 for r in pc['trials'])
assert read('resource-decision.json')['reviewed_prior_rows']==[r['case'] for r in pc['rows']]
followup=read('faceted-followup.json')
assert followup['receipts_preserved'] and len(followup['rows'])==7 and len(followup['trials'])==6
assert all(r['exit_code']==r['resource']['exit_code']==0 for r in followup['trials'])
assert read('resource-decision.json')['reviewed_adverse_rows'] == [r['corpus']+'/'+r['case'] for r in read('resource-summary.json')['adverse_timing_rows']]
binaries = [read(name) for name in ['wasm-binary.json', 'consumer-binary.json', 'components-binary.json']]
binaries += [read(name)['binary'] for name in ['previous-axial-admission.json', 'old-path-control.json', 'frontier.json', 'baseline.json', 'spline-artifacts.json']]
binaries += list(read('continuation-binaries.json').values()) + list(cost['baseline'].values()) + list(cost['candidate'].values())
binaries += list(new['binaries'].values())
binaries = {r['path']: r for r in binaries}
for path, row in binaries.items():
    assert Path(path).stat().st_size == row['bytes'] and digest(Path(path)) == row['sha256'], path
archive = read('source-reconstruction.json')
assert archive['baseline'] == m['baseline'] and digest(OUT/archive['archive']) == archive['archive_sha256']
with tarfile.open(OUT/archive['archive'], 'r:gz') as packed:
    contents = {item.name: packed.extractfile(item).read() for item in packed.getmembers()}
assert {name: sha(data) for name, data in contents.items()} == archive['members']
baseline_files = {}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(row['snapshot'])
    assert set(snapshot) == set(row['baseline_files']) | set(row['overlay_files'])
    for name, h in snapshot.items():
        if name in row['overlay_files']:
            data = contents[row['overlay_files'][name]]
        else:
            if name not in baseline_files:
                baseline_files[name] = git('show', m['baseline']+':'+name)
            data = baseline_files[name]
        assert sha(data) == h, (row['snapshot'], name)
for name in ['AGENTS.md', 'properties.md', 'docs/admission.md']:
    assert (ROOT/name).read_bytes() == git('show', m['baseline']+':'+name) == git('show', m['upstream']+':'+name)
helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
old_ledger = git('show', m['baseline']+':docs/properties-status.json').decode()
current = (ROOT/'docs/properties-status.json').read_text()
assert current == spans.replace_brep(old_ledger, json.loads(current)['current_work']['hyperbrep'])
assert digest(ROOT/'docs/properties-status.json') == read('ledger-update.json')['after_sha256']
status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(r['status'] in ['open', 'in-progress'] for r in status['work_packages'])
assert status['acceptance_contract']['implementation_ownership'] == json.loads(current)['current_work']['hyperbrep']['implementation_ownership']
assert status['acceptance_contract']['upstream_revision'] == m['upstream']
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(git('stash', 'list', '--format=%H').decode().splitlines())
for name in source:
    if name.endswith('.rs') and '/docs/' not in name and not name.startswith(('crates/hyperbrep/','crates/hyperbrep-io/')):
        assert (ROOT/name).read_bytes()==git('show',m['baseline']+':'+name), name
for name in ['Cargo.toml', 'Cargo.lock', *['crates/'+n+'/Cargo.toml' for n in ['hyperbrep', 'hyperbrep-io', 'hypercurve']]]:
    assert (ROOT/name).read_bytes() == git('show', m['baseline']+':'+name), name
for name in git('diff', 'HEAD', '--name-only').decode().splitlines():
    assert name == 'docs/properties-status.json' or name.startswith('crates/hyperbrep/') or name.startswith('crates/hyperbrep-io/'), name
links = []
for path in [ROOT/name for name in m['documents'] if name.endswith('.md')] + list(OUT.glob('*.md')):
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent/target.split('#')[0]
        assert destination.exists() or destination == OUT/'audit.json', (path, target)
        links.append((str(path.relative_to(ROOT)), target))
for path in OUT.rglob('*.json'):
    json.loads(path.read_text())
for path in (OUT/'final-review').glob('*.py'):
    ast.parse(path.read_text(), filename=str(path))
command = ['git', 'diff', '--cached', '--check']
check = subprocess.run(command, cwd=ROOT, text=True, capture_output=True)
diagnostics = [match.groups() for line in check.stdout.splitlines()
               if (match := re.match(r'^(.+):(\d+): (.*)$', line))]
raw = sorted({r[0] for r in diagnostics})
for name in raw:
    path = ROOT/name
    assert path.is_relative_to(OUT), name
    if path.suffix == '.log':
        continue
    assert path.name == 'components-Cargo.toml', name
    assert path.read_bytes() == (OUT.parent/'2026-10-17-axial-shells/final-review/components-Cargo.toml').read_bytes()
    assert {r[2] for r in diagnostics if r[0] == name} == {'new blank line at EOF.'}
scoped = subprocess.run([*command, '--', '.', *[':(exclude)'+name for name in raw]], cwd=ROOT, text=True, capture_output=True)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check') and hashes() == source
result = dict(passed=True, baseline=m['baseline'], source_identity=m['source_identity'],
    evidence_files=len(m['evidence_files']), source_snapshots=len(archive['sources']),
    overlay_members=len(contents), frozen_binaries=len(binaries), preserved_artifacts=211,
    new_repeated_artifacts=58, prior_profile_artifacts=8, matched_cases=192, matched_processes=132, new_cost_groups=9,
    new_cost_processes=3, prior_native_cost_processes=6, independent_spline_reader_cases=28,
    original_wasm_groups=138, new_wasm_groups=9, preserved_image_wasm_groups=14, local_links=len(links),
    package_members={k: len(v['members']) for k, v in payload['crates'].items()},
    non_brep_ledger_bytes_preserved=True, unrelated_runtime_unchanged=True,
    protected_stashes_preserved=True, work_packages_open=28,
    raw_whitespace=dict(command=command, exit_code=check.returncode, diagnostics=check.stdout,
                        retained_raw_files=raw, scoped_exit_code=scoped.returncode),
    scope='Exact spline exchange and continued-modeling extension. No previous receipt migration, push, release, global resource, complete coverage or whole-plan completion claim.')
(OUT/'audit.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps({k: v for k, v in result.items() if k != 'raw_whitespace'}, indent=2), flush=True)
