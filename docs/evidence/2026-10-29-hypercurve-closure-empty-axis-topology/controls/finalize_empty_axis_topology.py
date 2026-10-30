"""Archive and commit only the fully qualified empty-axis increment."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
C = ROOT / 'controls'
USER = ROOT.parents[1]
W = (ROOT / 'empty-axis-topology').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'empty-axis-topology'
PARENT = 'd31ef199c3d981547fd31d1b98525de3f2ed9686'
EPARENT = 'b8ffdd329648cd4925e71af88fabe01fe36e6aab'
FOCUS = C / (NAME + '-focus-final1')
RUN = C / (NAME + '-full-final1')
RECORD = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
BRANCH = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'
IMPLEMENTATION = {
    'crates/hypersolve/src/bivariate_topology.rs',
    'crates/hypersolve/tests/bivariate_empty_axis.rs',
    'crates/hypercurve/tests/polynomial_empty_axis.rs',
    'crates/hyperbrep/tests/empty_plane_sections.rs',
    'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/CHANGELOG.md',
    'crates/hypercurve/qualification/capabilities.json',
}
RECEIPTS = {
    'crates/hypersolve/FUTURE_WORK.md', 'crates/hypercurve/FUTURE_WORK.md',
    'docs/evidence-archive.md', 'docs/evidence-archive.tsv',
}
FOCUS_NAMES = ['solver', 'curves', 'brep', 'fmt', 'typos', 'diff', 'budget', 'matrix-guards']
FULL_NAMES = [
    'msrv-clippy', 'solver-full', 'solver-minimal', 'curve-full',
    'repeat-chamfer', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
    'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics',
    'dependent-hyperpack', 'curve-minimal', 'core-check', 'docs', 'solver-fuzz',
    'curve-fuzz', 'allocation-profile', 'matrix', 'fmt', 'typos', 'diff',
    'budget', 'matrix-guards',
]


def read(path):
    return json.loads(path.read_text())


def save(path, value):
    temporary = path.with_name(path.name + '.tmp')
    temporary.write_text(json.dumps(value, indent=2) + '\n')
    temporary.replace(path)


def output(command, cwd=W, env=None):
    return subprocess.check_output(command, cwd=cwd, env=env, text=True).strip()


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def qualified_run(path, names):
    complete = read(path / 'complete.json')
    rows = read(path / 'results.json')
    assert complete['all_passed'] and complete['groups'] == len(rows) == len(names)
    assert [row['name'] for row in rows] == names
    assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
    assert complete['source'] == read(path / 'source-before.json') == read(path / 'source-after.json')
    assert read(path / 'files-before.json') == read(path / 'files-after.json')
    return complete, rows


def counts(path):
    matches = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert matches and all(row[0] == 'ok' and row[2] == '0' for row in matches), path
    return {'suites': len(matches), **{key: sum(int(row[i]) for row in matches)
            for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}


parser = argparse.ArgumentParser()
parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit'])
args = parser.parse_args()
focused, focus_rows = qualified_run(FOCUS, FOCUS_NAMES)
complete, rows = qualified_run(RUN, FULL_NAMES)
qualified = complete['source']
files = read(RUN / 'files-before.json')
assert qualified == focused['source']
assert qualified['revision'] == PARENT and not qualified['untracked_inputs']
e = module('source_evidence', W / 'scripts/successive-operations.py')


def assert_qualified():
    current = e.source_snapshot()[1]
    assert [v for v in current if v[0] not in RECEIPTS] == [v for v in files if v[0] not in RECEIPTS], 'non-receipt source changed'


assert_qualified()
archive_path = C / (NAME + '-evidence-archive.json')
receipt_path = C / (NAME + '-receipt-prepared.json')
checks_path = C / (NAME + '-receipt-checks.json')

if args.action == 'archive':
    assert not archive_path.exists()
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    baseline = C / (NAME + '-cargo-baseline1')
    failed = read(baseline / 'result.json')
    assert failed['exit_code'] == 101 and failed['source_stable']
    assert read(baseline / 'source-before.json')['revision'] == PARENT
    assert read(baseline / 'files-before.json') == read(baseline / 'files-after.json')
    original = (baseline / 'acceptance.log').read_text()
    assert 'test result: FAILED. 2 passed; 2 failed;' in original
    assert original.count('closed rectangle: VerticalComponent') == 2
    assert re.findall(r'^diff --git a/(.*?) b/', (baseline / 'candidate.patch').read_text(), re.M) == ['crates/hypersolve/tests/bivariate_empty_axis.rs']
    preserved = [
        'crates/hypersolve/tests/bivariate_topology.rs',
        'crates/hypersolve/tests/support/bivariate_topology.rs',
        'crates/hypersolve/tests/bivariate_boundary_components.rs',
        'crates/hypercurve/tests/polynomial_chamfer_corners.rs',
        'crates/hypercurve/src/svg', 'crates/hyperbrep/src/persistence',
        'crates/hyperbrep/tests/plane_tensor_sections.rs',
        'crates/hyperbrep/tests/support/plane_tensor_sections.rs',
    ]
    assert not output(['git', 'diff', PARENT, '--', *preserved])
    replay = read(C / (NAME + '-replay-selector-audit.json'))
    assert replay['qualified_source'] == qualified
    assert replay['exit_code'] == 0 and replay['exact_selected_tests'] == 1
    repeat = next(row for row in rows if row['name'] == 'repeat-chamfer')
    assert repeat['external_timeout_seconds'] == 180 and repeat['elapsed_seconds'] < 180
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', BRANCH]).returncode == 1
    stage = ROOT / (NAME + '-evidence-stage')
    dest = stage / RECORD
    dest.mkdir(parents=True, exist_ok=False)
    retained = []

    def copy(source, relative):
        data = source.read_bytes()
        target = dest / relative
        assert not target.exists()
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

    attempts = [
        'baseline1', 'baseline2', 'cargo-baseline1', 'owner-fix1',
        'owner-fix2', 'owner-fix3', 'consumers1', 'focus-final1', 'full-final1',
    ]
    suffixes = {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py', '.svg'}
    for attempt in attempts:
        directory = C / (NAME + '-' + attempt)
        assert directory.is_dir(), directory
        for path in sorted(directory.rglob('*')):
            if path.is_file() and path.suffix in suffixes:
                copy(path, Path('runs') / directory.name / path.relative_to(directory))
    patterns = [NAME + '-*', 'probe_empty_axis_topology.py',
                'qualify_empty_axis_topology.py', 'run_empty_axis_topology_final.py',
                'finalize_empty_axis_topology.py', 'close_empty_axis_topology.py',
                'prepare_empty_axis_finalizer.py', 'empty_axis_topology*.rs',
                'polynomial_empty_axis.rs', 'empty_plane_sections.rs']
    for path in sorted({p for pattern in patterns for p in C.glob(pattern) if p.is_file()}):
        copy(path, Path('controls') / path.name)
    tests = {'solver-full', 'solver-minimal', 'curve-full', 'repeat-chamfer', 'model-full', 'curve-minimal'}
    suites = {row['name']: counts(RUN / (row['name'] + '.log')) for row in rows
              if row['name'] in tests or row['name'].startswith('dependent-')}
    focus_suites = {name: counts(FOCUS / (name + '.log')) for name in ['solver', 'curves', 'brep']}
    matrix = read(RUN / 'capabilities/report.json')
    metrics = {}
    for path in [FOCUS, RUN]:
        for log in path.glob('*.log'):
            rss = re.findall(r'Maximum resident set size \(kbytes\): (\d+)', log.read_text())
            if rss:
                metrics[path.name + '/' + log.name] = {'maximum_process_rss_kib': max(map(int, rss))}
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'parent': PARENT, 'evidence_parent': EPARENT, 'qualified': qualified,
        'focused': focused, 'focus_commands': focus_rows, 'commands': rows,
        'focus_suites': focus_suites, 'suites': suites,
        'matrix_status': matrix['status'], 'matrix_fixture_count': len(matrix['fixtures']),
        'contract': read(C / (NAME + '-contract.json')),
        'closure_argument': 'For a nonzero rational first-coordinate polynomial, each real zero in the closed first-coordinate interval gives an identically zero second-coordinate fiber. The existing exact boundary projection includes every such first-coordinate root. Its closed-fiber census preserves live vertical-component refusal. A completed census without any such root therefore proves the zero set in the whole rectangle empty; original equation and domain remain authoritative. No geometric sampling is used.',
        'review': read(C / (NAME + '-owner-review.json')),
        'baseline': 'On the unchanged d31 production source, x^2+1 and x-3 execute and fail VerticalComponent on [-1,1] x [-2,2]; constant-empty/live-vertical and invalid-domain controls pass. The earlier external probe reproduces these cases; its compile-only import failure has no runtime credit.',
        'independent_evidence': 'Strict positivity and exact excluded roots establish the empty sets independently. Original equations and domains survive further fibers and curve-set reconstruction. Three whole tensor patches have height u^2+1, u-3 or (u-2)^2 on [0,1]^2; exact disjointness persists through both operand orders, fresh-process native replay, a nonsingular affine map and another replay/query.',
        'replay_selector_audit': replay,
        'selection': 'The existing projection and original-equation fiber census remain authoritative. No alternative geometric carrier, serialized success flag, coordinate rounding or tolerance is introduced. Empty topology is distinct from invalid domains and actual live vertical components.',
        'resources': 'Axis/projection degree refusal, zero-work refusal and larger retry are exercised. The same one-promotion budget correctly completes this rational census. A mistaken new expectation of exhaustion is retained and corrected against the existing WorkBudget contract; no artificial charge or production change forces exhaustion. Current counters do not bound total arithmetic, coefficient growth, retained memory or cancellation.',
        'cost_observations': metrics,
        'cost_limits': 'Cargo command wall times and maximum process RSS include builds and child processes. Existing allocation lifetime checks are regression coverage, not a matched empty-axis benchmark. No speedup or total resource bound is claimed.',
        'limits': 'This admits empty first-coordinate support over rational closed rectangles. Actual vertical components, algebraic-coefficient topology, general implicit operations and total resource bounds remain open. The independently qualified multiplicity and zero-distance increments are not part of this source. These affected checks are not full pre-push qualification.',
        'hardware': output(['lscpu', '--json']),
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']),
        'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EPARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', RECORD], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EPARENT, '-m',
                          'Record empty first-coordinate topology and replay admission'], env=env)
    subprocess.run(git + ['update-ref', BRANCH, commit, '0' * 40], check=True)
    archive = module('archive', W / 'scripts/evidence_archive.py')
    archive.ROOTS = {RECORD: False}
    manifest = archive.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EPARENT, 'branch': BRANCH,
                       'record': RECORD, 'manifest_row': manifest[1], 'suites': suites,
                       'focus_suites': focus_suites, 'matrix_fixture_count': len(matrix['fixtures'])})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = read(archive_path)
    record, count, size, digest = archive['manifest_row'].split('\t')
    suites = archive['suites']
    shared = f'''All eight focused groups and all 24 affected qualification groups pass.
The latter include full Hypersolve ({suites['solver-full']['passed']:,} passed),
Hypercurve ({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, strict MSRV
Clippy, minimal builds, strict docs and fuzz-target checks, allocation lifetime
checks, the capability matrix and hygiene. Counts are harness-reported passes;
logs retain ignored counts. The matrix verifies {archive['matrix_fixture_count']}
advertised outcomes, including explicit blocker witnesses. Evidence:
`{record}`, SHA-256 `{digest}`. These local admission checks do not establish
full pre-push qualification or complete general algebraic operation closure.
'''
    scalar = f'''
## Empty first-coordinate polynomial topology (2026-10-29)

Removing an early nonconstant-axis rejection lets the existing exact projection
and closed-fiber census distinguish an empty rectangle from a live vertical
component. Every first-coordinate root in the closed domain enters that census;
an identically zero fiber still returns `VerticalComponent`. The original
equation, domain checks, root selection and resource controls remain authoritative.

On unchanged `d31ef199c3`, `x^2+1` and `x-3` incorrectly failed on
`[-1,1] x [-2,2]`. They now return empty topology and accept later fiber queries.
Seven owner tests include repeated and degree-six sources, algebraic live roots,
boundary roots, malformed domains, degree limits, zero-budget refusal and retry.
A one-promotion budget completes the rational census; a mistaken new exhaustion
expectation is recorded and corrected against the existing budget contract.

{shared}
This is empty-support admission. Actual vertical components and algebraic
coefficient topology remain open. Existing work counters do not bound total
arithmetic, coefficient growth, retained memory or cancellation. Command timing
and process RSS include builds; no performance improvement is claimed.
'''
    curve = f'''
## Empty polynomial sources through consumers (2026-10-29)

Empty first-coordinate polynomial topology now enters the native curve set,
retains its original equation and domain for reconstruction, and accepts further
fiber queries. Three rational tensor patches with exact heights `u^2+1`, `u-3`
and `(u-2)^2` over `[0,1]^2` are disjoint from the zero-height plane. Both operand
orders return successful empty sections. A fresh process validates each native
archive, repeats the queries, applies a nonsingular affine map, saves/reloads
and queries again. Exact sign expectations establish disjointness independently;
deterministic serialization is checked separately. The child-test selector was
audited on the qualified binary to exclude a zero-test successful exit.

{shared}
Original topology/boundary tests and the repeated-chamfer hard case are retained;
the latter still passes its unchanged 180-second envelope. Compile-only failed
probes and the incorrect new budget expectation remain in the evidence record.
Actual vertical components, arbitrary algebraic coefficients and general
implicit operations remain open. The independent multiplicity and zero-distance
changes are not included here. No full-solid or performance claim is made.
'''
    for relative, paragraph in [('crates/hypersolve/FUTURE_WORK.md', scalar),
                                ('crates/hypercurve/FUTURE_WORK.md', curve)]:
        path = W / relative
        content = path.read_text()
        assert paragraph.splitlines()[1] not in content
        path.write_text(content.rstrip() + '\n' + paragraph)
    path = W / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    entry = f'''The local {BRANCH.removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records empty first-coordinate
topology, native curve and section consumers, eight focused groups and 24 passing
affected qualification groups. Original runtime failures, the compile-only failed
probe and the corrected new budget expectation are retained. Full pre-push and
general algebraic closure remain open. This evidence record is unpushed.

'''
    path.write_text(content.replace(marker, marker + entry, 1))
    path = W / 'docs/evidence-archive.tsv'
    excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']]).splitlines()
    assert not any(line.startswith('excluded:') for line in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n')
    assert_qualified()
    save(receipt_path, {'archive': archive, 'receipt_files': sorted(RECEIPTS),
                        'all_non_receipt_bytes_unchanged': True})
elif args.action == 'check':
    assert receipt_path.exists()
    archive = read(archive_path)
    checks = []
    commands = [
        ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
        ('typos', ['typos']), ('budget', ['scripts/check-repository-budget.sh']),
        ('diff', ['git', 'diff', '--check']),
        ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']]),
    ]
    for name, command in commands:
        started = time.time()
        with (C / (NAME + '-receipt-' + name + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=W, stdout=log, stderr=subprocess.STDOUT)
        checks.append({'name': name, 'command': command, 'exit_code': result.returncode,
                       'elapsed_seconds': time.time() - started})
        save(checks_path, checks)
        print(checks[-1], flush=True)
        assert result.returncode == 0
    assert_qualified()
    save(C / (NAME + '-receipt-ready.json'), {'files': e.source_snapshot()[1], 'checks': checks})
else:
    assert receipt_path.exists()
    checks = read(checks_path)
    assert len(checks) == 5 and all(row['exit_code'] == 0 for row in checks)
    assert e.source_snapshot()[1] == read(C / (NAME + '-receipt-ready.json'))['files']
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])

    def user_state():
        return (output(['git', 'rev-parse', 'HEAD'], USER),
                output(['git', 'status', '--porcelain'], USER),
                hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest())

    before = user_state()
    subprocess.run(['git', 'add', '--', *sorted(IMPLEMENTATION | RECEIPTS)], cwd=W, check=True)
    tree = output(['git', 'write-tree'])
    branch = output(['git', 'symbolic-ref', 'HEAD'])
    commit = output(['git', 'commit-tree', tree, '-p', PARENT, '-m',
                     'Admit empty first-coordinate polynomial topology'])
    subprocess.run(['git', 'update-ref', branch, commit, PARENT], cwd=W, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=W, check=True)
    assert not output(['git', 'status', '--porcelain'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit and before == user_state()
    archive = read(archive_path)
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent,
              'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified,
              'user_checkout_unchanged': True, 'epoch': time.time()}
    save(C / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = read(state_path)
    state['empty_axis_topology'].update({
        'status': 'Eight focused groups, 24 affected groups and five receipt checks passed; code and evidence committed locally. Full pre-push, integration with the separate multiplicity and zero-distance increments and general closure remain open.',
        'commit': result, 'source_frozen': False,
    })
    save(state_path, state)
    print(json.dumps(result, indent=2))
