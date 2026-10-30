"""Archive and commit only the fully qualified repeated-factor increment."""
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
W = (ROOT / 'polynomial-multiplicities').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'polynomial-multiplicities'
PARENT = 'd31ef199c3d981547fd31d1b98525de3f2ed9686'
EPARENT = 'b8ffdd329648cd4925e71af88fabe01fe36e6aab'
FOCUS = C / (NAME + '-focus-final3')
RUN = C / (NAME + '-full-final1')
RECORD = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
BRANCH = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'
IMPLEMENTATION = {
    'crates/hyperbrep/src/geometry.rs',
    'crates/hyperbrep/src/geometry/plane_tensor.rs',
    'crates/hyperbrep/tests/plane_tensor_sections.rs',
    'crates/hyperbrep/tests/support/plane_tensor_sections.rs',
    'crates/hypercurve/CHANGELOG.md',
    'crates/hypercurve/qualification/capabilities.json',
    'crates/hypercurve/src/polynomial_curve.rs',
    'crates/hypercurve/src/polynomial_curve_differential.rs',
    'crates/hypercurve/src/polynomial_curve_pair.rs',
    'crates/hypercurve/src/polynomial_curve_projection.rs',
    'crates/hypercurve/src/polynomial_curve_rational.rs',
    'crates/hypercurve/src/polynomial_curve_selected_chord.rs',
    'crates/hypercurve/src/polynomial_curve_selected_circle.rs',
    'crates/hypercurve/tests/polynomial_multiplicities.rs',
    'crates/hypersolve/CHANGELOG.md',
    'crates/hypersolve/src/bivariate_topology.rs',
    'crates/hypersolve/src/bivariate_topology/multiplicity.rs',
    'crates/hypersolve/tests/bivariate_boundary_components.rs',
    'crates/hypersolve/tests/bivariate_multiplicities.rs',
    'crates/hypersolve/tests/support/bivariate_topology.rs',
}
RECEIPTS = {
    'crates/hypersolve/FUTURE_WORK.md', 'crates/hypercurve/FUTURE_WORK.md',
    'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
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
    path.write_text(json.dumps(value, indent=2) + '\n')


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
    baseline = C / (NAME + '-baseline2')
    assert not read(baseline / 'complete.json')['all_passed']
    assert read(baseline / 'source-before.json')['revision'] == '6296155cf7f04936215f375989dd175ab797eb24'
    text = (baseline / 'acceptance.log').read_text()
    assert 'test result: FAILED. 0 passed; 6 failed;' in text and 'RepeatedComponent' in text
    consumer_baseline = C / (NAME + '-consumers-baseline1')
    assert not read(consumer_baseline / 'complete.json')['all_passed']
    assert 'test result: FAILED. 0 passed; 5 failed;' in (consumer_baseline / 'acceptance.log').read_text()
    preserved = [
        'crates/hypercurve/tests/polynomial_chamfer_corners.rs',
        'crates/hypercurve/src/svg', 'crates/hyperbrep/src/persistence',
    ]
    assert not output(['git', 'diff', PARENT, '--', *preserved])
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
        'baseline1', 'baseline2', 'fix1', 'fix2', 'fix3', 'fix4',
        'consumers-baseline1', 'consumers-fix1', 'consumers-fix2', 'brep-fix1',
        'focus-final1', 'focus-final2', 'focus-final3', 'full-final1',
    ]
    suffixes = {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py', '.svg'}
    for attempt in attempts:
        directory = C / (NAME + '-' + attempt)
        assert directory.is_dir(), directory
        for path in sorted(directory.rglob('*')):
            if path.is_file() and path.suffix in suffixes:
                copy(path, Path('runs') / directory.name / path.relative_to(directory))
    patterns = [NAME + '-*', 'probe_polynomial_multiplicities.py',
                'qualify_polynomial_multiplicities.py', 'run_polynomial_multiplicities_final.py',
                'finalize_polynomial_multiplicities.py', 'close_polynomial_multiplicities.py']
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
        'closure_argument': read(C / (NAME + '-closure-argument.json')),
        'review': read(C / (NAME + '-owner-review.json')),
        'baseline': 'Six solver cases fail RepeatedComponent on unchanged production source. With only the owner reduction, five consumer cases execute and fail differential, incidence or region admission. Compile-only failed attempts and the interrupted review attempt are retained without runtime credit.',
        'independent_evidence': 'Exact factor powers and reconstruction; independent univariate Sturm fiber counts; exact graph jets and mixed component contacts; original-polynomial equations at selected chord cuts; exact chord setbacks; source-preserving region identities; even and odd signed plane values; whole pcurve image validation and fresh-process replay followed by further operation.',
        'selection': 'Original polynomial definitions and selected root/fiber dependencies remain authoritative. Geometric consumers use checked reduced support. Event roots retain every factor membership; each open-slab branch retains its defining exponent. Defining exponents do not replace winding, local intersection order or transversality.',
        'resources': 'Configured projection-degree and shared work limits remain active; exact reduction does not call complete component-discovery continuations. Degree refusal and exhaustion during factor reduction allow larger retries. Degree, refinement and promotion counters do not bound total arithmetic, coefficient growth, retained memory or cancellation.',
        'cost_observations': metrics,
        'cost_limits': 'Recorded Cargo command wall times and maximum process RSS include builds and child processes. Existing allocation lifetime checks are regression coverage, not a matched repeated-factor benchmark. No speedup or total resource bound is claimed.',
        'limits': 'This is rational finite-fiber multiplicity admission, not arbitrary algebraic-coefficient or vertical-component topology, complete implicit operations, curved solids or full pre-push qualification. The parallel zero-distance correction is not part of this source.',
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
                          'Record exact repeated-factor topology and consumer admission'], env=env)
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
## Repeated rational polynomial factors (2026-10-29)

Finite-fiber bivariate topology now reduces repeated generic factors with exact
GCDs of the polynomial and both partial derivatives. Axis content is retained;
checked reconstruction preserves the original rational unit and factor powers.
The original equation remains authoritative while geometric consumers use the
reduced support. Each selected event root keeps all factor memberships, and
each open-slab branch keeps its defining exponent.

The six original circle, parabola, node, cusp, isolated-point and mixed-power
witnesses failed with `RepeatedComponent` on clean `6296155cf7`. They now pass,
with independent Sturm fiber counts, exact incidence, factor reconstruction,
rootless axis factors, degree refusal, exhaustion during reduction and retry.
Original zero-polynomial and vertical-component rejections remain unchanged.

{shared}
The bounded component path respects configured projection limits. Existing
work counters do not bound total arithmetic, coefficient growth, retained heap
or cancellation. Recorded process RSS and command timings include builds;
allocation lifetime checks are not a matched multiplicity benchmark. No
performance improvement is claimed. Arbitrary algebraic coefficients, vertical
components and the broader exact-closure target remain open.
'''
    curve = f'''
## Repeated polynomial support through consumers (2026-10-29)

Polynomial branches retain their original defining equation, selected fibers
and factor powers through restriction, reversal, maps and native replay.
Differentials, incidence, component quotients and projection use the owner's
checked reduced support. Defining exponent remains separate from winding and
local singularity or intersection order. Native SVG and BRep encoding retain
the original polynomial and reconstruct factor evidence without trusted flags.

Eight curve witnesses cover repeated graph jets, circle events, mixed-power
overlaps and contacts, region admission and reconstruction, fresh-process SVG,
rational quarter-circle overlap, algebraic selected-chord cuts and a chamfer
whose generated line is queried again. Five original downstream witnesses
failed before the consumer changes; their original inputs and assertions remain.
The existing repeated-chamfer hard case also passes its unchanged 180-second
envelope. Plane/tensor sections retain even/odd defining exponents, validate
both pcurve images after cold replay and accept later intersections. Exponent
parity describes the signed plane value only along regular open arcs with both
sides in the parameter domain; it does not establish transversality.

{shared}
This completes the named rational finite-fiber multiplicity corpus. General
implicit offsets, fillets, algebraic coefficients, vertical components and
curved solid operations remain open. The parallel tiny-source zero-distance
correction is not included in this source. Failed experiments, compile-only
attempts and the interrupted review run remain in the evidence record.
'''
    for relative, paragraph in [('crates/hypersolve/FUTURE_WORK.md', scalar),
                                ('crates/hypercurve/FUTURE_WORK.md', curve)]:
        path = W / relative
        content = path.read_text()
        assert paragraph.splitlines()[1] not in content
        path.write_text(content.rstrip() + '\n' + paragraph)
    path = W / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
    status = read(path)
    entry = {
        'id': 'plane-tensor-repeated-factors-2026-10-29',
        'work_packages': ['WP05a', 'WP05b', 'WP06', 'WP13', 'WP21'],
        'properties': ['P1', 'P12', 'P15', 'P17', 'P18', 'P19', 'P20', 'P25', 'P36'],
        'change': 'Consume checked repeated polynomial support in plane/tensor sections while retaining original source powers and exposing the defining exponent. Restrictions, reversal and operand exchange preserve this evidence. Exponent parity is distinct from transversality and singular contact order.',
        'source': ['../src/geometry.rs', '../src/geometry/plane_tensor.rs', '../tests/support/plane_tensor_sections.rs', '../../hypersolve/src/bivariate_topology/multiplicity.rs'],
        'evidence': '../../hypercurve/FUTURE_WORK.md',
        'validation': f'Eight focused groups and 24 affected groups pass, including the eight plane/tensor section groups, fresh-process native replay, original even and added odd repeated contacts, both pcurve images, restriction/reversal/affine replay and subsequent intersection. Full BRep reports {suites["dependent-hyperbrep"]["passed"]} passed; BRep IO reports {suites["dependent-hyperbrep-io"]["passed"]} passed. The linked ledger records commands, source attribution, all downstream checks and the evidence digest.',
        'cost_evidence': 'No speedup claim. Command timing and maximum process RSS include compilation; existing allocation lifetime tests do not measure a matched repeated-factor workload.',
        'limits': 'Rational finite-fiber repeated-factor admission does not complete vertical components, arbitrary algebraic coefficients, general surface intersections, trimmed solids or total resource bounds. Native pcurves reconstruct source-factor evidence; no new trusted archive flag or format is added. All work-package statuses and the general closure target remain open/in-progress. Full pre-push qualification is separate.',
    }
    assert all(row['id'] != entry['id'] for row in status['increments'])
    status['updated_on'] = '2026-10-29'
    status['increments'].append(entry)
    save(path, status)
    path = W / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    entry = f'''The local {BRANCH.removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records exact repeated-factor
topology, geometric consumer admission, eight focused groups and 24 passing
affected qualification groups. Original runtime failures, compile-only failed
attempts and the interrupted review run are retained. Full pre-push and general
algebraic closure remain open. This evidence record is unpushed.

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
    relative = 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
    old = json.loads(output(['git', 'show', PARENT + ':' + relative]))
    new = read(W / relative)
    assert new['work_packages'] == old['work_packages'] and new['complete'] is False
    assert new['increments'][:-1] == old['increments']
    assert new['increments'][-1]['id'] == 'plane-tensor-repeated-factors-2026-10-29'
    assert {k: v for k, v in new.items() if k not in ['updated_on', 'increments']} == {k: v for k, v in old.items() if k not in ['updated_on', 'increments']}
    checks = [{'name': 'ledger', 'exit_code': 0, 'work_package_statuses_unchanged': True}]
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
    assert len(checks) == 6 and all(row['exit_code'] == 0 for row in checks)
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
                     'Preserve repeated polynomial factors through exact geometry'])
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
    state['polynomial_multiplicities'].update({
        'status': 'Eight focused groups, 24 affected groups and six receipt checks passed; code and evidence committed locally. Full pre-push, integration with the separate zero-distance correction and general closure remain open.',
        'commit': result, 'source_frozen': False,
    })
    save(state_path, state)
    print(json.dumps(result, indent=2))
