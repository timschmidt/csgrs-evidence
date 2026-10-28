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

CONFIG = {'selected-circle-corners': {'parent': 'circle-line-contacts', 'tests': 2911, 'suites': 94, 'root_tests': 66, 'root_suites': 12, 'matrix': 251, 'title': 'Preserve selected circle corners through replay and repeated offsets', 'owner': 'Hypercurve common point fields, selected-circle incidence and endpoint transport, corner reconstruction, arrangement side rays, finite projection and native circle definitions', 'domain': 'The named jointly selected degree-seven/five circle centers, represented metric frames, signed radii, translated support contacts, finite and reversed overlaps, and diameter-corner edits with explicit algebraic constraints.', 'proof': 'Common-field relations retain exact translated circle/circle and nonincident circle/line contacts, original radius equations, finite domains and tangent signs. Derived-point query views preserve coordinate guards and source identity. Coincident supports reuse the existing angular correspondence authority; overlap endpoints replay through their original point definitions. Mapped cuts use the fragment endpoint authority after concentric offsets. A finite set of distinct side rays in the certified normal half-plane avoids endpoint-collinear candidates without guessing winding. Exact point translations retain consumed policy and inherited barriers. Projection reuses only vertices whose exact connectivity is validated, while native definitions remain authoritative.', 'witness': 'The unchanged chamfer and constrained fillet programs now complete construction, independent contact checks, boundary reconstruction, path and filled-region replay, round dilation/contraction and semantic XOR. Twelve additional public fixtures cover exact roots, tangency, finite clipping, 2^-80 gaps, selected halves, reversal, partial overlap restriction/replay, fresh-process contact replay, policy transitions and resource retry. Three unit regressions cover mapped cut rays and retained policy dependencies. A CSGRS adapter fixture constructs a fillet from a compact exact seed, reloads its filled result and consumes further offsets.', 'gaps': 'Six fresh probes on this source still fail whole empty-document export or inherited empty-topology replay/projection. Their source-attributed programs are archived as a separate follow-on frontier. This is a bounded completion envelope for the named shared-field circles and corner chains. General independent coefficient fields, nonrepresented circle frames, arbitrary algebraic curve operations, complete cancellation and total arithmetic/memory bounds remain open.'}}


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
parser.add_argument('--attempt', default='corner5')
args = parser.parse_args()
name = args.increment
config = CONFIG[name]
checkout = (ROOT / name).resolve()
run = CONTROLS / (name + '-qualification-' + args.attempt)
assert json.loads((run / 'complete.json').read_text())['all_passed']
rows = json.loads((run / 'results.json').read_text())
assert len([row for row in rows if row['phase'] == 'qualification']) == 18
assert len([row for row in rows if row['phase'] == 'focused']) == 12
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
    resource_probe = CONTROLS / 'corner-composition-resource-policy-final2'
    assert json.loads((resource_probe / 'source-before.json').read_text()) == qualified
    assert json.loads((resource_probe / 'source-after.json').read_text()) == qualified
    assert all(row['exit_code'] == 0 and row['source_stable'] for row in json.loads((resource_probe / 'results.json').read_text()))
    assert counts(resource_probe / 'resource-policy.log')['passed'] == 1
    resource_log = (resource_probe / 'resource-policy-stderr.log').read_text()
    retry_usage = [(int(a), int(b)) for a, b in re.findall(r'retry usage: WorkUsage \{ refinements: (\d+), promotions: (\d+) \}', resource_log)]
    exhaustion = [(int(a), int(b), int(c)) for a, b, c in re.findall(r'(?:small|medium) outcome: exhausted BudgetExceeded \{ kind: RootRefinement, limit: (\d+), used: (\d+), requested: (\d+) \}', resource_log)]
    assert len(retry_usage) == 2 and exhaustion == [(0, 0, 1), (65536, 65536, 1)] * 2
    assert all(a <= 4194304 and b <= 4096 for a, b in retry_usage)
    assert counts(run / 'focused-affine-chord-frame.log')['passed'] == 1
    native_log = run / 'focused-collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support.log'
    assert counts(native_log)['passed'] == 1
    native_seconds = float(re.search(r'test result: ok.*finished in ([0-9.]+)s', native_log.read_text()).group(1))
    parent_native = json.loads((CONTROLS / 'corner-native-priority-parent1/result.json').read_text())
    assert parent_native['exit_code'] == 0 and parent_native['source_stable']
    full = counts(run / 'qualification-full-suite.log')
    downstream = counts(run / 'qualification-downstream.log')
    assert full == {'suites': config['suites'], 'passed': config['tests'], 'failed': 0, 'ignored': 34}, full
    for row in rows:
        if row['phase'] == 'focused' and '--lib' in row['command']:
            assert counts(run / ('focused-' + row['name'] + '.log'))['passed'] == 1, row['name']
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
    for folder in sorted(CONTROLS.glob(name + '-qualification-*')):
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
    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith(('corners-', 'corner-', 'retained-circle-', 'selected-corner-adapter-')):
            continue
        for source in sorted(folder.rglob('*')):
            if not source.is_file():
                continue
            if source.suffix in {'.json', '.jsonl', '.log', '.patch', '.rs', '.svg', '.txt', '.tsv', '.md'}:
                copy(source, Path('exploration') / folder.name / source.relative_to(folder))
            else:
                excluded.append({'path': str(source.relative_to(ROOT)), 'bytes': source.stat().st_size, 'sha256': hashlib.sha256(source.read_bytes()).hexdigest(), 'reason': 'Compiled or temporary artifact, retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for filename in ['selected-circle-corners-contract.json', 'selected-circle-corners-tests.rs', 'retained-circle-pair-tests.rs', 'selected-circle-corners-extra-tests.rs', 'selected-corner-offset-query-tests.rs', 'selected-circle-overlap-extra-tests.rs', 'mapped-circle-ray-regression.rs', 'selected-corner-root-test.rs', 'probe_selected_circle_corners.py', 'run_retained_circle_pair_probe.py', 'integrate_corner_acceptance.py', 'export_corner_fixture.py', 'corners-qualified-parent-transport.json', 'corner-root-adapter-fixed-dependency.log', 'probe_corner_composition_resources.py', 'corner-composition-resource-policy-probe.rs']:
        copy(CONTROLS / filename, Path('controls') / filename)
    for filename in ['probe_corner_native_priority.py', 'probe_corner_native_parent.py', 'run_corner_native_probe.py', 'trace_corner_native_probe.py', 'prepare_corner_native_fix2.py', 'promote_corner_native_fix2.py', 'corner-native-fix2-prepared.json', 'corner-native-fix2-promoted.json', 'prepare_corner_anchor_reuse.py', 'promote_corner_anchor_reuse.py', 'corner-anchor-reuse-prepared.json', 'corner-anchor-reuse-promoted.json']:
        copy(CONTROLS / filename, Path('controls') / filename)
    frontier = CONTROLS / 'empty-native-corner5-baseline'
    assert json.loads((frontier / 'source-before.json').read_text()) == qualified
    assert json.loads((frontier / 'source-after.json').read_text()) == qualified
    frontier_rows = json.loads((frontier / 'results.json').read_text())
    assert [row['exit_code'] for row in frontier_rows] == [0, 101, 101, 101, 101, 101, 101]
    assert all(row['source_stable'] for row in frontier_rows)
    for item in sorted(frontier.iterdir()):
        if item.is_file() and item.suffix in {'.json', '.jsonl', '.log', '.rs', '.patch'}:
            copy(item, Path('frontier') / frontier.name / item.name)
    for filename in ['empty-native-replay-tests.rs', 'probe_empty_native_replay.py']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    changed = output(['git', 'diff', '--name-only'], checkout).splitlines()
    untracked = output(['git', 'ls-files', '--others', '--exclude-standard'], checkout).splitlines()
    for relative in sorted(set(changed + untracked)):
        if relative:
            copy(checkout / relative, Path('source') / relative)
    metadata = {**config, 'properties': ['P12', 'P15', 'P17', 'P18', 'P19', 'P20', 'P26'], 'qualification': qualified, 'commit_parent': parent, 'evidence_parent': evidence_parent, 'transition': transition, 'full_suite': full, 'downstream': downstream, 'consumers': consumers, 'commands': rows,
        'provenance': 'The qualified circle-line parent and every final input are retained. Original failing corner programs, diagnostic attempts and unchanged full-chain assertions are archived. The first qualification attempt omitted an ignored SVG seed from its source snapshot; the second reproduced a missing root test dependency. The third was interrupted after reproducing a native collapsed-circle regression and is not resource exhaustion. None is credited as complete qualification. The fourth attempt completed 94 suites with 2,910 passing cases and one affine-chord dispatch regression. The fifth fresh complete attempt includes every final input, the corrected coordinate-order dispatch and original chord-frame reuse. Exploratory cross-sign oracle, anchor selector and oriented-range fixture corrections are documented separately from implementation failures.',
        'regressions': 'The unchanged native independent-oblique constrained-fillet, composite-chord role, collapsed selected-circle and affine-chord tests pass freshly. Endpoint and similarity wrappers enter the new common point-field path only when their retained dependencies need it; native dispatch retains priority. The first proposed chord-displacement dispatch change did not resolve the original test and was rejected. Required assertions were not weakened.',
        'native_regression_measurement': {'final_focused_harness_seconds': native_seconds, 'qualified_parent_external_seconds': parent_native['elapsed_seconds'], 'scope': 'Separate focused runs, not a matched benchmark or general speedup claim. The full rejected attempt and original source-attributed controls are retained.'},
        'limits': 'Shared precision/refinement and promotion counters, per-command timeouts and process peak RSS are distinct measurements, not total arithmetic, expression/coefficient growth, retained-memory or cancellation bounds. No universal closure or comparative performance claim. Full pre-push validation and delivery of this increment remain pending.',
        'resource_measurement': {'record': resource_probe.name, 'configured_retry_refinements': 4194304, 'configured_retry_promotions': 4096, 'observed_retry_refinements': [a for a, _ in retry_usage], 'observed_retry_promotions': [b for _, b in retry_usage], 'exhaustion_limit_used_requested': exhaustion, 'policy_chain': 'STRICT/APPROXIMATE_512 requested/STRICT all certified, native replay and semantic XOR pass', 'scope': 'Synchronous instrumented root refinements and promotions only; not total arithmetic, memory, cancellation or elapsed-time bounds.'}, 'artifact_measurement': {'seed_svg_bytes': 4261, 'filled_fillet_svg_bytes': 610102, 'scope': 'Recorded original generated artifact before final formatting and test integration; final semantic tests do not establish a general size bound.'}, 'recorded_epoch': time.time(), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose'])}
    save(dest / 'source.json', metadata)
    save(dest / 'retained-files.json', retained)
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (name + '-recovered-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', evidence_parent], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', evidence_parent, '-m', 'Record selected circle corner qualification'], env=env)
    subprocess.run(git + ['update-ref', branch, commit, '0' * 40], check=True)
    spec = importlib.util.spec_from_file_location('archive', checkout / 'scripts/evidence_archive.py')
    archive_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(archive_module)
    archive_module.ROOTS = {record: False}
    manifest = archive_module.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': evidence_parent, 'branch': branch, 'record': record, 'manifest_row': manifest[1], 'full_suite': full, 'downstream': downstream, 'resource_measurement': metadata['resource_measurement'], 'native_regression_measurement': metadata['native_regression_measurement']})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    assert archive['parent'] == evidence_parent
    record, count, size, digest = archive['manifest_row'].split('\t')
    label = name.replace('-', ' ').capitalize()
    resource = archive['resource_measurement']
    assert resource['observed_retry_refinements'] == [278432, 278432]
    assert resource['observed_retry_promotions'] == [0, 0]
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
capability fixtures, typos, repository budget and diff checks. The unchanged
native oblique fillet, composite chord-role, collapsed selected-circle and
affine-chord regressions pass. Record
`{record}` has SHA-256 `{digest}`.
Every non-receipt byte matches the freshly qualified snapshot. Original
failures, subsequent diagnostic attempts and fixture corrections are archived.
The initial attempt omitted the ignored SVG seed from source attribution and
is not credited; the fresh complete attempt includes every final input.
The third attempt exposed a native collapsed-circle regression and was
interrupted without claiming resource exhaustion. Native coordinate-order
dispatch now retains priority unless wrappers retain joint-field dependencies.
The unchanged regression passes in
{archive['native_regression_measurement']['final_focused_harness_seconds']:.2f}
seconds in the final focused run. This is not a comparative benchmark.
The fourth attempt exposed an affine-chord dispatch regression. The join now
reuses its original chord frame instead of constructing a replacement direction
chord; the original dispatch and geometric assertions pass unchanged.

A separate source-attributed whole-chain probe exhausted the configured zero
and 65,536 refinement limits, then completed two retries using 278,432 root
refinement units and zero promotions each under limits of 4,194,304 and 4,096.
Strict, approximate-requested and strict erosion/replay/XOR chains were certified.
The archived probe includes the initial insufficient-budget attempt; exhaustion
is distinct from completed geometry.

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
Every final source input is freshly qualified; the initial attempt with a
missing fixture snapshot is not credited. Source equality and parent
`{parent[:10]}` are recorded. This record is unpushed; complete closure, resource bounds and package
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
