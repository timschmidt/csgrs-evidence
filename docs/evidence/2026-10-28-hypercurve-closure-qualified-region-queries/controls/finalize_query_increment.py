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
CONFIG = {'qualified-region-queries': {'parent': 'empty-native-replay', 'tests': 2931, 'suites': 95, 'root_tests': 67, 'root_suites': 12, 'matrix': 271, 'title': 'Preserve inherited topology certainty in region queries', 'owner': 'CurveRegion2 geometric queries, policy-aware native contour caching and native similarity lowering', 'domain': 'Canonical exact empty and rational-square regions, plus existing symbolic approximate normalization and its empty or nonempty Boolean successors. Structural collection accessors remain structural observations.', 'proof': 'A shared owning-layer validator checks and observes the retained normalization policy before geometric queries interpret empty boundaries or reuse cached facts. Membership, signed and filled area, roles and profiles, filled sides, native facts and contours, and bounds share this requirement. The native cache keeps an internal strict policy barrier as typed uncertainty so an authorized approximate request can continue without promoting the result. Native similarity lowering also attaches the consumed dependency to its returned region. Requesting approximation alone leaves exact controls certified.', 'witness': 'Ten public integration fixtures preserve the eight original probes and add exact empty/square controls and a qualified nonempty union. The independent positive-height cap has source area 2h/3>0 and interior point (1,h/4), although approximate normalization retained no boundary. Its disjoint square union has intended area 4+2h/3. Repeated queries, strict/approximate/strict cache transitions, bounds, native views, similarity output and separately consumed material components preserve their qualification; exact operands remain unchanged.', 'gaps': 'A fresh CSGRS public probe still returns Certified false for qualified empty membership because its adapter bypasses the native query. Its bounds control already preserves the receipt. This reproduced wrapper gap is archived as a separate follow-on increment; no end-to-end adapter completion is claimed here. These fixtures qualify the named query and receipt paths, not arbitrary algebraic operation closure or universal symbolic decisions. General coefficient fields, all representation/degeneracy combinations, complete total-work and coefficient/expression growth accounting, retained-memory bounds, cooperative cancellation and package delivery remain open.'}}


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
parser.add_argument('--attempt', default='query6')
args = parser.parse_args()
name = args.increment
config = CONFIG[name]
checkout = (ROOT / name).resolve()
run = CONTROLS / (name + '-qualification-' + args.attempt)
assert json.loads((run / 'complete.json').read_text())['all_passed']
rows = json.loads((run / 'results.json').read_text())
assert len([row for row in rows if row['phase'] == 'qualification']) == 19
assert len([row for row in rows if row['phase'] == 'focused']) == 24
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
    resource = CONTROLS / 'qualified-region-query-resource-final5'
    assert json.loads((resource / 'source-before.json').read_text()) == qualified
    assert json.loads((resource / 'source-after.json').read_text()) == qualified
    resource_rows = json.loads((resource / 'results.json').read_text())
    assert len(resource_rows) == 3 and all(r['exit_code'] == 0 and r['source_stable'] for r in resource_rows)
    assert counts(resource / 'region_query_receipts_under_zero_instrumented_budget.log')['passed'] == 1
    resource_log = (resource / 'region_query_receipts_under_zero_instrumented_budget-stderr.log').read_text()
    assert resource_log.count('WorkUsage { refinements: 0, promotions: 0 }') == 6
    expected_focused = {'selected-points':54, 'region-replay':18, 'root-region-replay':3, 'native-svg-contract':20, 'qualified-queries':10, 'receipt-composition':5}
    for row in rows:
        if row['phase'] == 'focused':
            assert counts(run / ('focused-' + row['name'] + '.log'))['passed'] == expected_focused.get(row['name'], 1)
    intended_parent = json.loads((CONTROLS / 'qualified-region-query-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
    full_root = counts(run / 'qualification-full-root.log')
    assert full_root == {'suites':75,'passed':688,'failed':0,'ignored':7}
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
        if not folder.is_dir() or not folder.name.startswith('qualified-region-query-'):
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file():
                continue
            if item.suffix in {'.json','.jsonl','.log','.patch','.rs','.txt','.tsv','.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path':str(item.relative_to(ROOT)), 'bytes':item.stat().st_size, 'sha256':hashlib.sha256(item.read_bytes()).hexdigest(), 'reason':'Compiled or temporary artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('qualified-region-query-') and item.suffix in {'.json','.log','.patch','.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_qualified_region_queries.py', 'probe_qualified_region_queries.py', 'build_probe_qualified_region_queries.py', 'apply_qualified_region_query_fix1.py', 'apply_qualified_region_query_fix2.py', 'integrate_qualified_region_queries.py', 'probe_qualified_region_query_resources.py', 'migrate_qualified_query_assertions.py', 'migrate_region_receipt_consumers.py', 'migrate_projection_receipt_assertion.py', 'probe_existing_receipt_consumers.py', 'qualified-region-queries-projection-migration-applied.json', 'prepare_query_finalizer.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
    frontier = CONTROLS / 'qualified-region-adapter-baseline4'
    assert json.loads((frontier / 'source-before.json').read_text()) == qualified
    assert json.loads((frontier / 'source-after.json').read_text()) == qualified
    frontier_rows = json.loads((frontier / 'results.json').read_text())
    assert [r['exit_code'] for r in frontier_rows] == [0, 0, 101, 0]
    assert all(r['source_stable'] for r in frontier_rows)
    for item in sorted(frontier.iterdir()):
        if item.is_file() and item.suffix in {'.json','.jsonl','.log','.rs','.patch'}:
            copy(item, Path('frontier') / frontier.name / item.name)
    for filename in ['qualified-region-adapter-tests.rs', 'qualified-region-adapter-baseline-contract.json', 'probe_qualified_region_adapters.py']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    supplemental = CONTROLS / 'qualified-nonempty-similarity-baseline1'
    assert json.loads((supplemental / 'source-before.json').read_text()) == qualified
    assert json.loads((supplemental / 'source-after.json').read_text()) == qualified
    supplemental_rows = json.loads((supplemental / 'results.json').read_text())
    assert len(supplemental_rows) == 2 and all(r['exit_code'] == 0 and r['source_stable'] for r in supplemental_rows)
    for item in sorted(supplemental.iterdir()):
        if item.is_file() and item.suffix in {'.json','.log','.rs','.patch'}:
            copy(item, Path('supplemental') / supplemental.name / item.name)
    for filename in ['probe_nonempty_similarity.py','qualified-nonempty-similarity-probe.rs']:
        copy(CONTROLS / filename, Path('supplemental') / filename)
    binary = supplemental / 'original'
    excluded.append({'path':str(binary.relative_to(ROOT)), 'bytes':binary.stat().st_size, 'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(), 'reason':'Compiled supplemental probe retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    changed = output(['git', 'diff', '--name-only'], checkout).splitlines()
    untracked = output(['git', 'ls-files', '--others', '--exclude-standard'], checkout).splitlines()
    for relative in sorted(set(changed + untracked)):
        if relative:
            copy(checkout / relative, Path('source') / relative)
    metadata = {**config, 'properties': ['P9', 'P12', 'P14', 'P19'], 'qualification': qualified, 'commit_parent': parent, 'evidence_parent': evidence_parent, 'transition': transition, 'full_suite': full, 'downstream': downstream, 'consumers': consumers, 'commands': rows,
        'provenance': 'Seven failing public query probes and the already-correct material-component control are reproduced on the final parent candidate. The first guard fix blocked four authorized approximate paths; their unchanged assertions pass after native-cache strict trials preserve internal uncertainty. Two exact/nonempty acceptance controls also pass. All earlier failures, interrupted qualification and source snapshots are retained; none counts as completed final qualification.',
        'regressions': 'Inherited point, circle, original native-fillet, affine-chord, SVG and positive-height tests remain unchanged relative to the final parent. Query1 was intentionally stopped for the parent export migration; query2 stopped on its integer-format assumption. Query3 completed with seven obsolete strict readback expectations on explicitly approximate Boolean, miter-option and stroke constructions. The documented certainty migration preserves their original inputs, construction policies and geometric expectations, and adds strict Predicate rejection, authorized Approximate512Consumed readback and strict rejection on reentry. Query4 found an inconsistent Certified-only assertion helper in the migrated miter test; it now reads the same area34 only after asserting the required approximate receipt. Two CSGRS receipt fixtures also required the explicit migration: strict source claims stay blocked, authorized consumers keep the geometry and receipts, and an intentionally adopted retained boundary is a separate model. The added symbolic area2 control explicitly requires approximate comparison because its sine-addition identity is outside the admitted scalar normal form. No qualified fixture is credited as exact success. Query5 completed the full CSGRS suite with 687 passes, one legacy finite-profile assertion failure and seven ignored cases. That projection certainty migration is owned by the empty parent and copied unchanged. Query6 reruns all focused and qualification groups on the final source, including the complete CSGRS suite; earlier failures are retained.',
        'complete_root_suite': full_root,
        'supplemental_similarity': 'A separate final-source probe confirms that the qualified nonempty union retains its strict topology blocker and authorized Approximate512Consumed membership after a similarity and source drop. It uses the source-attributed final library without concurrent Cargo writes. This is one observed composition, not proof of every internal native lowering route.',
        'resource_measurement': {'record': 'qualified-region-query-resource-final5', 'requested_policies': ['STRICT', 'APPROXIMATE_512', 'STRICT'], 'observed_refinements': [0, 0, 0, 0, 0, 0], 'observed_promotions': [0, 0, 0, 0, 0, 0], 'outcome': 'Exact empty/square queries remain certified under WorkBudget::ZERO; qualified empty queries return typed strict Predicate blockers or authorized Approximate512Consumed results. Blocker handling is not certified geometry.', 'scope': 'Instrumented root refinements and promotions only; not total work, memory, cancellation or elapsed time.'},
        'limits': 'Shared precision/refinement and promotion counters, per-command timeouts and process peak RSS are distinct measurements, not total arithmetic, expression/coefficient growth, retained-memory or cancellation bounds. No universal closure or comparative performance claim. Full pre-push validation and delivery of this increment remain pending.',
        'recorded_epoch': time.time(), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose'])}
    save(dest / 'source.json', metadata)
    save(dest / 'retained-files.json', retained)
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (name + '-recovered-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', evidence_parent], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', evidence_parent, '-m', 'Record inherited region query certainty qualification'], env=env)
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
under P9, P12, P14 and P19.
The measured domain is {config['domain']}

{config['proof']}

{config['witness']}

All 19 local qualification groups pass: {config['tests']:,} Hypercurve
cases in {config['suites']} suites, 34 existing ignored cases; {config['root_tests']}
root adapter cases in {config['root_suites']} suites; 3,012 cases across six
consumer packages; strict MSRV all-target/all-feature and fuzz Clippy, core
builds, denied-warning docs, formatting, 16 matrix guards, {config['matrix']}
capability fixtures, typos, repository budget and diff checks. All 24 focused
groups pass, including ten query fixtures, unchanged exact parent regressions,
and seven documented readback migrations. Those seven preserve the original
geometry expectations while requiring inherited approximation receipts;
strict readback rejects the unproved source claim before and after warming.
The complete CSGRS suite also passes, including migrated receipt-composition
consumers whose explicit boundary-adoption control has a separate source claim.
Record {record} has SHA-256 {digest}. Every non-receipt byte matches the final
qualified snapshot. The completed empty-replay parent is retained by commit;
only its three admission receipts were synchronized afterward.

A separate source-attributed zero-budget probe records zero root refinements
and promotions for exact and qualified query controls under strict,
approximate-requested and strict policies. Exact controls stay certified;
qualified inputs keep typed strict blockers or authorized consumed certainty.
This is instrumentation of those units, not a total computational bound.
Original failures and all incomplete or rejected attempts remain archived.

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
Every final implementation and acceptance byte is freshly qualified. Original
query failures, rejected guard behavior, exact/nonempty controls and zero-budget
instrumentation are archived separately. Parent {parent[:10]} and the receipt-only
transition are recorded. This record is unpushed; full closure and package
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
