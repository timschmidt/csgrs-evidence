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
CONFIG = {
 'selected-circle-regions': {'parent': None, 'tests': 2878, 'suites': 93, 'root_tests': 64, 'root_suites': 11, 'matrix': 221,
   'title': 'Preserve selected-circle regions through exact shared-field winding',
   'owner': 'Hypercurve common point-field predicates, retained line representatives, circle endpoint contacts, minor-arc and line winding, and the existing CurveRegion2 arrangement',
   'domain': 'The named degree-seven/five joint-field circle centers, represented unit frames, exact angular restrictions, retained generated lines, holes and disconnected components.',
   'proof': 'Point-backed circle rays share native minor-arc crossing and endpoint ownership. Common-field determinants and transverse-coordinate line representatives preserve coordinate correlation and original guards. Two distinct endpoints on a nonzero circle exhaust its line contacts; selected halves and transverse signs are still checked. The existing arrangement consumes these relations for material, hole and Boolean fragment classification. Candidate ray searches suppress approximate terminals while seeking an exact answer. Native independent-field contact and endpoint-winding proofs retain priority.',
   'witness': 'Eight added public fixtures cover the unchanged split/complement/native path replay, region admission, +1/4 then -1/4 round offsets and exact XOR chain; winding multiplicity and cancellation; reversal; holes; disconnected circles; a semicircle/diameter boundary; complete endpoint contacts; complementary and reversed secants; and strict/approximate-requested/strict certainty. Independent point and radius identities supplement topology and set identities.',
   'gaps': 'The full radius-one erosion by two and fresh-process filled-region replay chains remain separate implementation gaps on this increment. Exact path replay before region admission is a different demonstrated stage. General independent circle/line fields and arbitrary algebraic regions remain open.'},
 'region-replay': {'parent': 'selected-circle-regions', 'tests': 2888, 'suites': 94, 'root_tests': 65, 'root_suites': 12, 'matrix': 231,
   'title': 'Replay exact filled regions through shared native boundary graphs',
   'owner': 'Hypercurve native SVG graph interchange, CurveRegion2 regularization-policy replay, and the CSGRS SVG adapter',
   'domain': 'Finite exact boundary graphs admitted by the existing native path graph format, including joint-field selected circles, holes, islands, disconnected components, canonical empty regions and supported SVG transforms.',
   'proof': 'Native v5 stores multiple path roots in one checked definition graph, preserving shared source, selected-root and fiber identities. Every definition, including unused definitions, is validated; typed prior references, selectors, denominator guards, closed boundaries, and trailing bytes are checked. Filled export obtains exact regularized boundary paths from CurveRegion2. Display path data remains a separate projection. Import uses the existing arrangement, fill semantics and transform handling. Retained regularized topology is revalidated under the requested policy before cached or empty shortcuts, because retained boundaries cannot reprove removed topology.',
   'witness': 'Two additional point-composition fixtures, eight native region fixtures and one root-adapter fixture cover fresh-process annulus replay and further offsets; holes, islands and disconnected components; coarse/fine/coarse display with exact semantic equality; altered display data; malformed graph references and selectors; byte/depth limits and retry; reflection; legacy formats; canonical empty graphs; and strict/approximate/strict topology qualification.',
   'gaps': 'Zero-root native graphs represent canonical empty regions, but whole empty-document export still has its separate finite-display-bounds contract. Byte and depth limits are not total-work or memory bounds. Large erosion remains the following contact increment; general algebraic interchange and package delivery are not claimed.'},
 'circle-line-contacts': {'parent': 'region-replay', 'tests': 2896, 'suites': 94, 'root_tests': 65, 'root_suites': 12, 'matrix': 239,
   'title': 'Retain shared-field circle contacts and generated chord incidence',
   'owner': 'Hypercurve common point-field rational queries, circle/chord incidence, chord orientation and overlap, and point equality using retained two-support evidence',
   'domain': 'Selected circles with represented unit frames and signed radius, joint-field centers and chord endpoints, known incident endpoints, finite/reversed/partial chord domains, and the named repeated-offset region chains.',
   'proof': 'For an incident endpoint A, circle center C and nonzero chord direction D, the second line contact is A - 2((A-C) dot D)D/(D dot D). The common field retains the norm guard in the original rational map. A zero dot product proves tangency; candidate residuals, selected halves, finite domains, parameters and transverse signs are still checked. Shared-field orientation proves line coincidence or separation without separating coordinates. Two-support intersection evidence is consulted before generic point equality. Actual budget exhaustion propagates and does not poison retry.',
   'witness': 'Eight additional public fixtures preserve the full concentric Boolean, radius-one erosion-by-two, canonical empty, further offset and union chain. They also exercise signed and reversed radii, finite clipping and tangency, independent oblique contacts, nonconstant retained fibers, selected halves, splitting and native replay, partial and reversed line overlaps, 2^-80 distinct parallels, transverse contacts in both identity orders, zero-budget retry and policy transitions.',
   'gaps': 'The unchanged corner probes still expose a generated diameter setback identity blocker and unsupported explicitly constrained selected-circle fillet on this increment. General independent circle/line fields, arbitrary algebraic operation closure and complete resource bounds remain open.'},
}


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
args = parser.parse_args()
name = args.increment
config = CONFIG[name]
checkout = (ROOT / name).resolve()
run = CONTROLS / (name + '-qualification-recovered2')
assert json.loads((run / 'complete.json').read_text())['all_passed']
rows = json.loads((run / 'results.json').read_text())
assert len([row for row in rows if row['phase'] == 'qualification']) == 18
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
    assert old in [BASE, parent]
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
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})
    for folder in sorted(CONTROLS.glob(name + '-qualification-recovered*')):
        for source in sorted(folder.rglob('*')):
            if source.is_file():
                copy(source, Path('runs') / folder.name / source.relative_to(folder))
    for source in [Path(__file__), CONTROLS / 'qualify_increment.py', CONTROLS / (name + '-recovered-parent-transition.json')]:
        copy(source, Path('controls') / source.name)
    for source in sorted((ROOT / 'recovery').glob('*.json')):
        copy(source, Path('recovery') / source.name)
    if name == 'circle-line-contacts':
        for source in [CONTROLS / 'selected-circle-corners-contract.json', CONTROLS / 'selected-circle-corners-tests.rs', CONTROLS / 'probe_selected_circle_corners.py']:
            copy(source, Path('frontier') / source.name)
        for source in sorted((CONTROLS / 'corners-recovered-baseline2').rglob('*')):
            if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
                copy(source, Path('frontier/baseline') / source.relative_to(CONTROLS / 'corners-recovered-baseline2'))
    changed = output(['git', 'diff', '--name-only'], checkout).splitlines()
    untracked = output(['git', 'ls-files', '--others', '--exclude-standard'], checkout).splitlines()
    for relative in sorted(set(changed + untracked)):
        if relative:
            copy(checkout / relative, Path('source') / relative)
    metadata = {**config, 'properties': ['P12', 'P15', 'P17', 'P18', 'P19', 'P20', 'P26'], 'qualification': qualified, 'commit_parent': parent, 'evidence_parent': evidence_parent, 'transition': transition, 'full_suite': full, 'downstream': downstream, 'consumers': consumers, 'commands': rows,
        'recovery': 'The host restart removed earlier /tmp worktrees and raw attempts. Sources were recovered from retained Rustdoc source artifacts; acceptance tests and catalog edits were recovered from the original task edit commands. Recovery hashes and fresh source snapshots are retained. Earlier lost runs are not credited or claimed archived. The interrupted recovered1 run is retained; every required command was rerun in recovered2 after moving the checkout outside the outer Cargo workspace.',
        'regressions': 'Both unchanged native independent-oblique constrained-fillet and composite-chord role tests pass freshly. Their required assertions and dispatch evidence were not weakened.',
        'limits': 'Shared precision/refinement and promotion counters, per-command timeouts and process peak RSS are distinct measurements, not total arithmetic, expression/coefficient growth, retained-memory or cancellation bounds. No universal closure or comparative performance claim. Full pre-push validation and delivery of this increment remain pending.',
        'recorded_epoch': time.time(), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose'])}
    save(dest / 'source.json', metadata)
    save(dest / 'retained-files.json', retained)
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (name + '-recovered-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', evidence_parent], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', evidence_parent, '-m', 'Record recovered ' + name + ' qualification'], env=env)
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
under P12, P15 and P17–P20, with native adapter obligations under P26.
The measured domain is {config['domain']}

{config['proof']}

{config['witness']}

All 18 fresh local qualification groups pass: {config['tests']:,} Hypercurve
cases in {config['suites']} suites, 34 existing ignored cases; {config['root_tests']}
root adapter cases in {config['root_suites']} suites; 3,012 cases across six
consumer packages; strict MSRV all-target/all-feature and fuzz Clippy, core
builds, denied-warning docs, formatting, 16 matrix guards, {config['matrix']}
capability fixtures, typos, repository budget and diff checks. Both unchanged
native oblique fillet and composite chord-role regressions pass. Record
`{record}` has SHA-256 `{digest}`.
Every non-receipt byte matches the freshly qualified snapshot. A host restart
removed earlier temporary runs; recovery provenance and the fresh runs are
archived, and lost attempts are not credited. The interrupted nested-workspace
attempt is retained, followed by a complete rerun outside the outer workspace.

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
The recovered source is freshly qualified; lost pre-restart attempts are not
credited. Source equality and the transition from parent `{parent[:10]}` are
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
