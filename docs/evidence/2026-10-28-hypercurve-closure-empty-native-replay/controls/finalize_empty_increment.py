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
CONFIG = {'empty-native-replay': {'parent': 'selected-circle-corners', 'tests': 2921, 'suites': 94, 'root_tests': 67, 'root_suites': 12, 'matrix': 261, 'title': 'Preserve empty region replay and inherited topology receipts', 'owner': 'CurveRegion2 normalization publication and replay, Boolean identity dependencies, affine transforms, finite projection and strict native SVG export', 'domain': 'Canonical and generated exact empty regions, supported finite strokes, and existing symbolic approximation-dependent empty topology; exact empty results remain valid subsequent operands.', 'proof': 'Empty arrangement publication retains actual consumed policy before removing the last boundary. Consumers validate and observe that retained topology before shortcuts. Boolean identities validate both operands and retain dependencies on each returned normalized carrier; affine identities validate the same receipt. Exact unchanged policies preserve shared storage. A changed dependency keeps boundary definitions, incidence and ownership while isolating policy caches. Whole empty SVG documents reuse the existing zero-root version-five graph and an explicit unit display viewport; the viewport adds no geometry. Both public finite profile projection APIs and CSGRS use these owning checks.', 'witness': 'Ten added Hypercurve fixtures and one CSGRS fixture cover canonical and generated empty export, independent zero graph cardinalities, changed display data, deterministic and fresh-process replay, all four subsequent Booleans, offsets, identity/translation/reflection/shear, both projection APIs and invalid options. Qualified empty input is exercised in both operand orders and batched Booleans, with each returned region reconsumed separately under strict and approximate policies. An existing positive-height symbolic collapse regression now also checks returned-object replay; its independent exact positive-height assertion is preserved.', 'gaps': 'Fresh probes on this qualified source still reproduce inherited-qualification loss in membership, area, role/profile, native-view, side/fact and bounds queries, and similarity native lowering. Those seven failing probes and the passing material-component control are archived as an explicit follow-on frontier; this increment does not claim to fix them. Two older CSGRS receipt-composition fixtures also still expect strict boundary readback after approximate construction. Their failures reproduce on both the committed corner parent after an owned-package rebuild and this candidate. Their explicit certainty migration belongs to the following query increment; the 67-case downstream subset here is not a claim that the complete CSGRS suite passes. The measured domain does not establish arbitrary algebraic operation closure or universal symbolic decisions. Complete total-work, expression/coefficient growth, retained-memory and cancellation bounds remain open.'}}


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
parser.add_argument('--attempt', default='empty5')
args = parser.parse_args()
name = args.increment
config = CONFIG[name]
checkout = (ROOT / name).resolve()
run = CONTROLS / (name + '-qualification-' + args.attempt)
assert json.loads((run / 'complete.json').read_text())['all_passed']
rows = json.loads((run / 'results.json').read_text())
assert len([row for row in rows if row['phase'] == 'qualification']) == 18
assert len([row for row in rows if row['phase'] == 'focused']) == 15
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
    resource = CONTROLS / 'empty-native-resource-final4'
    assert json.loads((resource / 'source-before.json').read_text()) == qualified
    assert json.loads((resource / 'source-after.json').read_text()) == qualified
    resource_rows = json.loads((resource / 'results.json').read_text())
    assert len(resource_rows) == 3 and all(r['exit_code'] == 0 and r['source_stable'] for r in resource_rows)
    assert counts(resource / 'exact_empty_native_chain_with_zero_instrumented_work_budget.log')['passed'] == 1
    resource_log = (resource / 'exact_empty_native_chain_with_zero_instrumented_work_budget-stderr.log').read_text()
    assert resource_log.count('WorkUsage { refinements: 0, promotions: 0 }') == 3
    assert counts(run / 'focused-selected-points.log')['passed'] == 54
    assert counts(run / 'focused-region-replay.log')['passed'] == 18
    assert counts(run / 'focused-root-region-replay.log')['passed'] == 3
    assert counts(run / 'focused-native-svg-contract.log')['passed'] == 20
    for row in rows:
        if row['phase'] == 'focused' and row['name'] not in ['selected-points', 'region-replay', 'root-region-replay', 'native-svg-contract']:
            assert counts(run / ('focused-' + row['name'] + '.log'))['passed'] == 1
    intended_parent = json.loads((CONTROLS / 'empty-native-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
    full = counts(run / 'qualification-full-suite.log')
    downstream = counts(run / 'qualification-downstream.log')
    assert full == {'suites': config['suites'], 'passed': config['tests'], 'failed': 0, 'ignored': 34}, full
    assert downstream == {'suites': config['root_suites'], 'passed': config['root_tests'], 'failed': 0, 'ignored': 0}, downstream
    packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
    consumers = {package: counts(run / ('qualification-dependent-' + package + '.log')) for package in packages}
    assert sum(row['passed'] for row in consumers.values()) == 3012
    assert all(row['failed'] == row['ignored'] == 0 for row in consumers.values())
    assert 'Ran 16 tests' in (run / 'qualification-matrix-guards.log').read_text()
    report = json.loads((run / 'capabilities/report.json').read_text())
    assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == config['matrix']
    old = output(['git', 'rev-parse', 'HEAD'], checkout)
    assert old in [qualified['revision'], parent]
    subprocess.run(['git', 'merge-base', '--is-ancestor', qualified['revision'], parent], cwd=checkout, check=True)
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
    for source in [Path(__file__), CONTROLS / 'qualify_increment.py', CONTROLS / (name + '-recovered-parent-transition.json')]:
        copy(source, Path('controls') / source.name)
    for source in sorted((ROOT / 'recovery').glob('*.json')):
        copy(source, Path('recovery') / source.name)
    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith('empty-') or '-qualification-' in folder.name:
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file():
                continue
            if item.suffix in {'.json', '.jsonl', '.log', '.patch', '.rs', '.svg', '.txt', '.tsv', '.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path': str(item.relative_to(ROOT)), 'bytes': item.stat().st_size, 'sha256': hashlib.sha256(item.read_bytes()).hexdigest(), 'reason': 'Compiled or temporary artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('empty-') and item.suffix in {'.json', '.log', '.patch', '.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_empty_native_worktree.py', 'prepare_empty_native_final_baseline.py', 'probe_empty_native_replay.py', 'apply_empty_native_fix1.py', 'apply_empty_native_fix2.py', 'integrate_empty_native_acceptance.py', 'integrate_empty_composition_acceptance.py', 'probe_empty_native_composition.py', 'probe_empty_native_resources.py', 'prepare_empty_finalizer.py', 'migrate_projection_receipt_assertion.py', 'complete_empty_export_migration.py', 'run_corner_native_probe.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
    for folder_name, expected_failures in [('qualified-region-query-baseline4', 4), ('qualified-region-query-extra-baseline4', 3)]:
        folder = CONTROLS / folder_name
        assert json.loads((folder / 'source-before.json').read_text()) == qualified
        assert json.loads((folder / 'source-after.json').read_text()) == qualified
        frontier_rows = json.loads((folder / 'results.json').read_text())
        assert all(row['source_stable'] for row in frontier_rows)
        assert sum(row['exit_code'] == 101 for row in frontier_rows) == expected_failures
        for item in sorted(folder.rglob('*')):
            if item.is_file() and item.suffix in {'.json', '.log', '.rs', '.patch'}:
                copy(item, Path('frontier') / folder_name / item.relative_to(folder))
    for filename in ['qualified-region-query-baseline-contract.json', 'qualified-region-query-tests.rs', 'qualified-region-query-extra-tests.rs', 'probe_qualified_region_queries.py']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    for folder_name in ['empty-existing-receipts-baseline2', 'corner-existing-receipts-baseline2']:
        folder = CONTROLS / folder_name
        receipt_source = json.loads((folder / 'source-before.json').read_text())
        assert receipt_source == json.loads((folder / 'source-after.json').read_text())
        if folder_name.startswith('empty-'):
            assert receipt_source == qualified
        else:
            assert receipt_source['revision'] == parent
        receipt_rows = json.loads((folder / 'results.json').read_text())
        assert len(receipt_rows) == 1 and receipt_rows[0]['source_stable'] and receipt_rows[0]['exit_code'] == 101
        assert '3 passed; 2 failed;' in (folder / 'receipt-composition.log').read_text()
        for item in sorted(folder.iterdir()):
            if item.is_file():
                copy(item, Path('frontier') / folder_name / item.name)
    for filename in ['probe_existing_receipt_consumers.py', 'corner-existing-receipts-baseline1-invalidated.json']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    changed = output(['git', 'diff', '--name-only'], checkout).splitlines()
    untracked = output(['git', 'ls-files', '--others', '--exclude-standard'], checkout).splitlines()
    for relative in sorted(set(changed + untracked)):
        if relative:
            copy(checkout / relative, Path('source') / relative)
    metadata = {**config, 'properties': ['P12', 'P17', 'P18', 'P19', 'P20', 'P26'], 'qualification': qualified, 'commit_parent': parent, 'evidence_parent': evidence_parent, 'transition': transition, 'full_suite': full, 'downstream': downstream, 'consumers': consumers, 'commands': rows,
        'provenance': 'All six original empty failures were freshly reproduced on the final frozen corner candidate. Separate source-attributed probes reproduced Boolean and affine receipt loss after empty publication was fixed, while offsets already retained receipts. All prior failing attempts, partial preparation patch, exact programs, source snapshots and final qualifications are archived. No earlier or interrupted run counts as completed qualification. The original empty-export rejection is intentionally extended through the documented migration; its replacement verifies native empty replay and deterministic serialization. The later finite-profile receipt migration preserves the original symbolic closure source and single-profile result while requiring strict rejection and authorized consumed certainty. The first replacement assumed integer viewport spelling; that test-only error is retained and corrected to the existing decimal display format.',
        'regressions': 'All inherited native oblique-fillet, composite chord-role, collapsed-circle and affine-chord regressions remain unchanged and pass. The positive-height collapse fixture preserves its independent strict sign witness. Exact unchanged inputs retain shared storage; qualified output does not mutate exact operand receipts. Two legacy receipt-composition failures are separately reproduced on the committed parent after an owned-package rebuild and on this candidate; the query successor owns their explicit certainty migration.',
        'qualification_continuation': 'Empty3 passed 23 command groups on the final frozen source before hypercircuit doctest linking failed while another Cargo invocation shared its target. Empty4 verifies identical complete source and file hashes, retains those successful executions, reruns the failed complete package group with exclusive cache use, and executes every remaining group. The failed original attempt is archived and is not a passed check. No geometric or work-budget exhaustion is inferred from the link failure. After empty4 passed every required group, full CSGRS testing in the query child exposed an obsolete finite-profile Certified assertion. It was freshly reproduced on empty4, then explicitly migrated with original source and single-profile expectation intact. Only cfg(test) bytes and migration documentation changed; empty5 reruns the entire local qualification on the final source.',
        'resource_measurement': {'record': resource.name, 'requested_policies': ['STRICT', 'APPROXIMATE_512', 'STRICT'], 'observed_refinements': [0, 0, 0], 'observed_promotions': [0, 0, 0], 'outcome': 'Certified completion of the canonical empty offset/affine/projection/native replay/Boolean chain under WorkBudget::ZERO', 'scope': 'Instrumented root refinements and promotions only; not total work, memory, cancellation or elapsed time.'},
        'limits': 'Shared precision/refinement and promotion counters, per-command timeouts and process peak RSS are distinct measurements, not total arithmetic, expression/coefficient growth, retained-memory or cancellation bounds. No universal closure or comparative performance claim. Full pre-push validation and delivery of this increment remain pending.',
        'recorded_epoch': time.time(), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose'])}
    save(dest / 'source.json', metadata)
    save(dest / 'retained-files.json', retained)
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (name + '-recovered-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', evidence_parent], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', evidence_parent, '-m', 'Record exact empty region closure qualification'], env=env)
    subprocess.run(git + ['update-ref', branch, commit, '0' * 40], check=True)
    spec = importlib.util.spec_from_file_location('archive', checkout / 'scripts/evidence_archive.py')
    archive_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(archive_module)
    archive_module.ROOTS = {record: False}
    manifest = archive_module.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': evidence_parent, 'branch': branch, 'record': record, 'manifest_row': manifest[1], 'full_suite': full, 'downstream': downstream})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    assert archive['parent'] == evidence_parent
    record, count, size, digest = archive['manifest_row'].split('\t')
    label = name.replace('-', ' ').capitalize()
    text = f'''**{label} increment (2026-10-28).** The owning layer is {config['owner']},
under P12 and P17–P20, with native adapter obligations under P26.
The measured domain is {config['domain']}

{config['proof']}

{config['witness']}

All 18 local qualification groups pass: {config['tests']:,} Hypercurve
cases in {config['suites']} suites, 34 existing ignored cases; {config['root_tests']}
root adapter cases in {config['root_suites']} suites; 3,012 cases across six
consumer packages; strict MSRV all-target/all-feature and fuzz Clippy, core
builds, denied-warning docs, formatting, 16 matrix guards, {config['matrix']}
capability fixtures, typos, repository budget and diff checks. The 15 focused
groups also pass, including the unchanged native regressions and strengthened
positive-height collapse test. Record {record} has SHA-256 {digest}.
Every non-receipt byte matches the freshly qualified snapshot. The completed
corner parent is retained by commit; synchronizing its three receipts did not
change implementation or acceptance bytes. Original failing probes and every
subsequent attempt are archived, with outcomes kept distinct.

A separate source-attributed canonical empty offset/affine/projection/native
replay/Boolean chain completes under WorkBudget::ZERO, recording zero root
refinements and zero promotions under strict, approximate-requested and strict
policies. Each result remains certified. This measures those instrumented units;
it does not establish a total computational or memory bound. Existing extension
byte/depth limits, invalid-option checks and later retries remain exercised.

{config['gaps']} Shared refinement counters, external timeouts and process peak
RSS do not establish total-work, expression-growth, retained-memory or
cancellation bounds. No comparative performance or universal closure claim is
made. Full pre-push validation and delivery remain pending for this increment.

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
`{archive['commit']}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`. It records
{config['owner']}. All {config['tests']:,} Hypercurve cases, {config['root_tests']}
root cases, 3,012 consumer cases, strict Clippy, core builds, docs, 16 matrix
guards and {config['matrix']} fixtures pass; 34 existing ignored cases remain.
Every final implementation and acceptance byte is freshly qualified. Exact
empty graphs, separate qualified topology receipts and subsequent consumers
are covered, including original failures and source-attributed zero-work
instrumentation. Parent {parent[:10]} and the receipt-only transition are
recorded. This record is unpushed; complete closure, resource bounds and package
delivery remain open.

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
