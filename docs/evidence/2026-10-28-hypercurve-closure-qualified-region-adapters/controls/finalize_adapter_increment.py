"""Close out one recovered increment after its complete local qualification."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
import time

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
CONTROLS = ROOT / 'controls'
USER = ROOT.parents[1]
EVIDENCE = USER.parent / 'csgrs-evidence.git'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
BASE = 'd75bb9ea3c27ea4ac19b419b0fa3af3103b78062'
BASE_EVIDENCE = '01f2e7a9311b962f07e3b7ba6a71d9fcf38e2d63'
CONFIG = {'qualified-region-adapters': {'parent': 'qualified-region-queries', 'title': 'Preserve inherited certainty through empty region membership adapters', 'owner': 'CSGRS native region membership adapter, delegating to CurveRegion2', 'domain': 'Canonical and generated exact empty regions, exact square controls, and qualified empty/nonempty descendants of the independently positive-height symbolic cap.', 'proof': 'The adapter removes its is_empty shortcut and always consumes the owning Hypercurve membership query through GeometryDecisions. Native strict blockers and Approximate512Consumed receipts survive the wrapper; a returned empty boundary alone cannot certify that the original source had no interior. No geometry algorithm is duplicated in the adapter.', 'witness': 'Three public Rust fixtures exercise strict/approximate/strict membership and bounds on exact and qualified empty/nonempty inputs, the strict convenience API, typed Predicate blockers, Boolean descendants and exact operand nonmutation. A separately proven positive source height and interior point prevent using collapsed topology as an exact oracle. Real Node binding controls also consume canonical empty and square-minus-itself results through strict and contextual membership and bounds. Those JavaScript additions exercise exact empty controls; the symbolic inherited-qualification witness is Rust-only.', 'gaps': 'This closes the reproduced CSGRS membership shortcut, not arbitrary algebraic operation closure or all ABI provenance surfaces. The adapter inherits the parent kernel support envelope and resource limits. Total work, coefficient/expression growth, retained-memory bounds, cooperative cancellation and full package delivery remain open.'}}


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def output(command, cwd=None, env=None):
    return subprocess.check_output(command, cwd=cwd, env=env, text=True).strip()


def counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[index]) for row in rows) for key, index in [('passed', 1), ('failed', 2), ('ignored', 3)]}}


parser = argparse.ArgumentParser()
parser.add_argument('increment', choices=CONFIG)
parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit'])
parser.add_argument('--attempt', default='adapter6')
args = parser.parse_args()
name = args.increment
config = CONFIG[name]
checkout = (ROOT / name).resolve()
run = CONTROLS / (name + '-qualification-' + args.attempt)
assert json.loads((run / 'complete.json').read_text())['all_passed']
rows = json.loads((run / 'results.json').read_text())
assert len([row for row in rows if row['phase'] == 'qualification']) == 13
assert len([row for row in rows if row['phase'] == 'focused']) == 2
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((run / 'source-before.json').read_text())
files = json.loads((run / 'files-before.json').read_text())
assert qualified == json.loads((run / 'source-after.json').read_text())
assert files == json.loads((run / 'files-after.json').read_text())
spec = importlib.util.spec_from_file_location('successive', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)


def assert_qualified():
    current = e.source_snapshot()[1]
    assert [row for row in current if row[0] not in RECEIPTS] == [row for row in files if row[0] not in RECEIPTS], 'non-receipt source changed'


assert_qualified()
if config['parent']:
    parent_result = json.loads((CONTROLS / (config['parent'] + '-recovered-final-commit.json')).read_text())
    parent = parent_result['commit']
    evidence_parent = parent_result['evidence_commit']
else:
    parent, evidence_parent = BASE, BASE_EVIDENCE
archive_path = CONTROLS / (name + '-recovered-evidence-archive.json')
receipt_path = CONTROLS / (name + '-recovered-receipt-prepared.json')
checks_path = CONTROLS / (name + '-recovered-receipt-checks.json')

if args.action == 'archive':
    assert not archive_path.exists()
    intended_parent = json.loads((CONTROLS / 'qualified-region-adapter-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
    assert qualified == intended_parent['after']
    parent_run = CONTROLS / 'qualified-region-queries-qualification-query6'
    assert json.loads((parent_run / 'source-before.json').read_text()) == parent_result['qualification']
    assert json.loads((parent_run / 'complete.json').read_text())['all_passed']
    parent_files = {r[0]:r[1:] for r in json.loads((parent_run / 'files-before.json').read_text())}
    changed_paths = sorted(r[0] for r in files if parent_files.get(r[0]) != r[1:])
    assert changed_paths == ['CHANGELOG.md','src/curve/native.rs','tests/qualified_region_queries.rs','tests/wasm/geometry_certainty.cjs']
    assert changed_paths == intended_parent['intended_changes']
    root_suite = counts(run / 'qualification-full-root.log')
    parent_root = counts(parent_run / 'qualification-full-root.log')
    assert root_suite == {**parent_root, 'passed':parent_root['passed']+3, 'suites':parent_root['suites']+1}
    assert counts(run / 'focused-adapter-queries.log')['passed'] == 3
    assert counts(run / 'focused-receipt-consumers.log')['passed'] == 43
    assert counts(run / 'qualification-minimal-queries.log')['passed'] == 3
    consumers = {package:counts(run / ('qualification-'+package+'.log')) for package in ['hyperdrc','hypercircuit','ffi']}
    wasm = next(row for row in rows if row['name'] == 'wasm-consumers')
    assert wasm['command'] == ['bash','scripts/test-wasm-bindings.sh'] and wasm['exit_code'] == 0
    frontier = CONTROLS / 'qualified-region-adapter-baseline4'
    assert json.loads((frontier / 'source-before.json').read_text()) == parent_result['qualification']
    assert json.loads((frontier / 'source-after.json').read_text()) == parent_result['qualification']
    assert [r['exit_code'] for r in json.loads((frontier / 'results.json').read_text())] == [0,0,101,0]
    old = output(['git', 'rev-parse', 'HEAD'], checkout)
    assert old in [qualified['revision'], parent]
    subprocess.run(['git','merge-base','--is-ancestor',qualified['revision'],parent],cwd=checkout,check=True)
    if old != parent:
        subprocess.run(['git', 'reset', '--mixed', parent], cwd=checkout, check=True, stdout=subprocess.DEVNULL)
        for relative in RECEIPTS:
            (checkout / relative).write_bytes(subprocess.check_output(['git', 'show', parent + ':' + relative], cwd=checkout))
    assert_qualified()
    transition = {'old': old, 'new': parent, 'qualified_revision': qualified['revision'], 'all_non_receipt_bytes_unchanged': True, 'receipt_paths': sorted(RECEIPTS)}
    save(CONTROLS / (name + '-recovered-parent-transition.json'), transition)
    record = 'docs/evidence/2026-10-28-hypercurve-closure-' + name
    branch = 'refs/heads/hypercurve-' + name + '-evidence-2026-10-28'
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
    stage = ROOT / (name + '-recovered-evidence-stage')
    dest = stage / record
    dest.mkdir(parents=True, exist_ok=False)
    retained = []
    def copy(source, relative):
        data = source.read_bytes()
        path = dest / relative
        if path.exists():
            assert path.read_bytes() == data
            return
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})
    for folder in sorted(CONTROLS.glob(name + '-qualification-*')):
        for source in sorted(folder.rglob('*')):
            if source.is_file():
                copy(source, Path('runs') / folder.name / source.relative_to(folder))
    for source in [Path(__file__), CONTROLS / 'qualify_region_adapters.py', CONTROLS / (name + '-recovered-parent-transition.json')]:
        copy(source, Path('controls') / source.name)
    for source in sorted((ROOT / 'recovery').glob('*.json')):
        copy(source, Path('recovery') / source.name)
    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith('qualified-region-adapter-'):
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file(): continue
            if item.suffix in {'.json','.jsonl','.log','.patch','.rs','.txt','.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path':str(item.relative_to(ROOT)),'bytes':item.stat().st_size,'sha256':hashlib.sha256(item.read_bytes()).hexdigest(),'reason':'Generated compiled artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('qualified-region-adapter-') and item.suffix in {'.json','.log','.patch','.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_qualified_region_adapters.py','apply_qualified_region_adapter_fix.py','probe_qualified_region_adapters.py','qualified-region-adapters-projection-migration-applied.json','correct_adapter_binding_control.py','prepare_adapter_finalizer.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
    changed = output(['git', 'diff', '--name-only'], checkout).splitlines()
    untracked = output(['git', 'ls-files', '--others', '--exclude-standard'], checkout).splitlines()
    for relative in sorted(set(changed + untracked)):
        if relative:
            copy(checkout / relative, Path('source') / relative)
    metadata = {**config, 'properties':['P9','P19','P25','P30'], 'qualification':qualified,
        'commit_parent':parent, 'evidence_parent':evidence_parent, 'transition':transition,
        'parent_qualification':parent_result['qualification'], 'root_suite':root_suite,
        'parent_root_suite':parent_root, 'consumers':consumers, 'commands':rows,
        'scope_check':changed_paths,
        'provenance':'The original membership witness fails on the final query parent while the bounds control already passes. The unchanged independent positive-height fixture now passes through the adapter. Adapter1 had an ambiguous test-only Real expectation; adapter2 exposed legacy receipt-composition migrations belonging to the parent. Adapter3 full CSGRS completed with 690 passes, one legacy finite-profile assertion failure and seven ignored cases. Its owning parent migration is copied unchanged. Adapter4 passed native and WASM lint groups, then its direct invocation of the non-executable binding script failed before tests ran. Adapter5 retained that successful prefix on identical source and invoked the script through Bash; the actual generated binding reproduced the new JavaScript control using the mesh method name on a curve. The only subsequent edit calls CurveRegionJs.difference, preserving every original assertion and ownership transfer. Adapter6 freshly reruns both focused and all 13 qualification groups on the final source. The final parent fixes are copied byte-for-byte and their separate qualification is required before closeout. Owned Hypercurve/CSGRS cache packages are rebuilt after switching from the corner baseline. Every incomplete attempt remains archived.',
        'limits':'No new total-work or memory bound is claimed. This wrapper consumes the parent kernel and retains its typed blockers and certainty; the parent zero-refinement query probe is separate owning-layer evidence. External timeouts and process peak RSS are measurements, not shared resource contracts. The JavaScript additions cover exact empty controls, not the symbolic Rust fixture. Full pre-push validation and publication remain pending.',
        'recorded_epoch':time.time(), 'rustc':output(['rustc','+1.98.1','--version','--verbose']), 'msrv':output(['rustc','+1.95.0','--version','--verbose'])}
    save(dest / 'source.json', metadata)
    save(dest / 'retained-files.json', retained)
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (name + '-recovered-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', evidence_parent], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', evidence_parent, '-m', 'Record CSGRS inherited region query certainty qualification'], env=env)
    subprocess.run(git + ['update-ref', branch, commit, '0' * 40], check=True)
    spec = importlib.util.spec_from_file_location('archive', checkout / 'scripts/evidence_archive.py')
    archive_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(archive_module)
    archive_module.ROOTS = {record: False}
    manifest = archive_module.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': evidence_parent, 'branch': branch, 'record': record, 'manifest_row': manifest[1], 'root_suite': root_suite, 'consumers': consumers})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    assert archive['parent'] == evidence_parent
    record, count, size, digest = archive['manifest_row'].split('\t')
    label = name.replace('-', ' ').capitalize()
    root_suite = archive['root_suite']
    consumer_total = sum(row['passed'] for row in archive['consumers'].values())
    text = f'''**{label} increment (2026-10-28).** The owning layer is {config['owner']},
under P9, P19, P25 and P30. The measured domain is {config['domain']}

{config['proof']}

{config['witness']}

All 13 local qualification groups and two focused groups pass. The complete
CSGRS all-feature release run has {root_suite['passed']:,} passing cases in
{root_suite['suites']} suites, with {root_suite['ignored']} existing ignored
cases. Three new adapter fixtures also pass with only the curve feature.
Hyperdrc, Hypercircuit and the FFI crate contribute {consumer_total:,} passing
cases. Strict MSRV and WASM Clippy, denied-warning docs, formatting, typos,
repository budget and diff checks pass. Actual generated Node bindings run
five JavaScript programs; TypeScript declarations are checked and three typed
programs are compiled and executed by the repository's binding script.

Record {record} has SHA-256 {digest}. All non-receipt bytes match the qualified
source. The completed query parent is retained by commit; its full kernel and
consumer qualification is separate evidence. Only the four intended adapter
paths differ from that parent before synchronizing the three receipts.

{config['gaps']} Full pre-push validation and publication remain pending.

'''
    path = checkout / 'crates/hypercurve/FUTURE_WORK.md'
    content = path.read_text()
    assert f'**{label} increment (2026-10-28).' not in content
    index = content.index('**Open, in dependency order:**', content.index('## 8. Polynomial-branch sections'))
    path.write_text(content[:index] + text + content[index:])
    path = checkout / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    paragraph = f'''The local `{archive['branch'].removeprefix('refs/heads/')}` branch ends at
`{archive['commit']}`, adding `{record}` ({int(count):,} files,
{int(size):,} bytes), SHA-256 `{digest}`. It records the CSGRS membership
adapter's inherited topology receipt. The complete CSGRS suite, three new
fixtures in full and minimal feature configurations, affected consumer and
FFI suites, strict native/WASM Clippy and actual Node/TypeScript binding
consumers pass. The four-path scope, final parent qualification and receipt-only
transition are checked. Earlier failures remain archived. This record is
unpushed; general closure, complete resource bounds and delivery remain open.

'''
    path.write_text(content.replace(marker, marker + paragraph, 1))
    path = checkout / 'docs/evidence-archive.tsv'
    excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
    assert len(excluded) == 4
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']], checkout).splitlines()
    assert not any(line.startswith('excluded:') for line in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n')
    assert_qualified()
    save(receipt_path, {'archive': archive, 'parent': parent, 'receipt_files': sorted(RECEIPTS), 'qualified_non_receipt_snapshot_preserved': True})
    print('Prepared three receipts; all qualified non-receipt bytes preserved.')
elif args.action == 'check':
    assert receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    commands = [('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']), ('typos', ['typos']), ('budget', ['scripts/check-repository-budget.sh']), ('diff', ['git', 'diff', '--check']), ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']])]
    results = []
    for key, command in commands:
        started = time.time()
        with (CONTROLS / (name + '-recovered-receipt-' + key + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=checkout, stdout=log, stderr=subprocess.STDOUT)
        results.append({'name': key, 'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started})
        save(checks_path, results)
        print(results[-1], flush=True)
        assert result.returncode == 0
    assert_qualified()
    save(CONTROLS / (name + '-recovered-ready.json'), {'source': e.source_snapshot()[0], 'files': e.source_snapshot()[1], 'checks': results})
else:
    assert receipt_path.exists()
    checks = json.loads(checks_path.read_text())
    assert len(checks) == 5 and all(row['exit_code'] == 0 for row in checks)
    ready = json.loads((CONTROLS / (name + '-recovered-ready.json')).read_text())
    assert e.source_snapshot()[1] == ready['files']
    assert output(['git', 'rev-parse', 'HEAD'], checkout) == parent
    user_before = output(['git', 'status', '--porcelain'], USER)
    user_head = output(['git', 'rev-parse', 'HEAD'], USER)
    user_diff = hashlib.sha256(subprocess.check_output(['git', 'diff'], cwd=USER)).hexdigest()
    subprocess.run(['git', 'add', '--all'], cwd=checkout, check=True)
    subprocess.run(['git', 'commit', '-m', config['title']], cwd=checkout, check=True)
    commit = output(['git', 'rev-parse', 'HEAD'], checkout)
    assert output(['git', 'status', '--porcelain'], checkout) == ''
    branch = output(['git', 'symbolic-ref', 'HEAD'], checkout)
    persistent = 'refs/heads/hypercurve-' + name
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit
    assert output(['git', 'status', '--porcelain'], USER) == user_before
    assert output(['git', 'rev-parse', 'HEAD'], USER) == user_head
    assert hashlib.sha256(subprocess.check_output(['git', 'diff'], cwd=USER)).hexdigest() == user_diff
    archive = json.loads(archive_path.read_text())
    save(CONTROLS / (name + '-recovered-final-commit.json'), {'commit': commit, 'parent': parent, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'user_checkout_unchanged': True, 'epoch': time.time()})
    print('Committed and persisted', commit, 'without changing the user checkout.')
