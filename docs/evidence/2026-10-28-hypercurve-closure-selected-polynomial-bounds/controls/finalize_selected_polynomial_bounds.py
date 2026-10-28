"""Admit the arithmetic increment only after its frozen qualification passes."""
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
CONTROLS = ROOT / 'controls'
USER = ROOT.parents[1]
CHECKOUT = (ROOT / 'selected-polynomial-bounds').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-polynomial-bounds'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/selected_polynomial_field.rs', 'crates/hypersolve/src/selected_polynomial_field/bounds.rs', 'crates/hypersolve/src/work_budget.rs', 'crates/hypersolve/tests/selected_polynomial_bounds.rs', 'crates/hypersolve/CHANGELOG.md'}
PARENT_RECORD = json.loads((CONTROLS / 'selected-polynomial-joins-final-commit.json').read_text())
PARENT = PARENT_RECORD['commit']
EVIDENCE_PARENT = PARENT_RECORD['evidence_commit']


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def output(command, cwd=CHECKOUT, env=None):
    return subprocess.check_output(command, cwd=cwd, env=env, text=True).strip()


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[index]) for row in rows) for key, index in [('passed', 1), ('failed', 2), ('ignored', 3)]}}


parser = argparse.ArgumentParser()
parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit'])
args = parser.parse_args()
run = CONTROLS / (NAME + '-qualification-final1')
complete = json.loads((run / 'complete.json').read_text())
rows = json.loads((run / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 13
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((run / 'source-before.json').read_text())
files = json.loads((run / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((run / 'source-after.json').read_text())
assert files == json.loads((run / 'files-after.json').read_text())
assert qualified['revision'] == 'd88ae9e028c7d2c3dc4061bc515ee917d34be65b'
alignment = json.loads((CONTROLS / 'selected-polynomial-bounds-parent-aligned.json').read_text())
assert alignment['before'] == qualified and alignment['parent_commit'] == PARENT
assert alignment['all_nonreceipt_source_bytes_unchanged']
e = module('source_evidence', CHECKOUT / 'scripts/successive-operations.py')


def assert_qualified():
    current = e.source_snapshot()[1]
    assert [r for r in current if r[0] not in RECEIPTS] == [r for r in files if r[0] not in RECEIPTS], 'non-receipt source changed'


assert_qualified()
archive_path = CONTROLS / (NAME + '-evidence-archive.json')
receipt_path = CONTROLS / (NAME + '-receipt-prepared.json')
checks_path = CONTROLS / (NAME + '-receipt-checks.json')
record = 'docs/evidence/2026-10-28-hypercurve-closure-' + NAME
branch = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-28'

if args.action == 'archive':
    assert not archive_path.exists()
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-bounds1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == qualified
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-bounds1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    point_frontier = json.loads((CONTROLS / 'polynomial-point-composition-baseline3/complete.json').read_text())
    assert point_frontier['source'] == qualified and point_frontier['all_expected_outcomes_reproduced']
    suites = {name: counts(run / (name + '.log')) for name in ['bounds', 'solver-full', 'solver-minimal', 'curve-consumers', 'model-consumers']}
    assert suites['bounds']['passed'] == 18
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
    stage = ROOT / (NAME + '-evidence-stage')
    dest = stage / record
    dest.mkdir(parents=True, exist_ok=False)
    retained, excluded = [], []

    def copy(source, relative):
        data = source.read_bytes()
        path = dest / relative
        assert not path.exists()
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

    prefixes = ['selected-polynomial-bounds-baseline', 'selected-polynomial-bounds-fix', 'selected-polynomial-bounds-qualification-', 'polynomial-operation-frontier-bounds1', 'polynomial-point-composition-baseline3']
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not any(folder.name.startswith(prefix) for prefix in prefixes):
            continue
        for source in sorted(folder.rglob('*')):
            if not source.is_file():
                continue
            if source.suffix in {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py'}:
                copy(source, Path('runs') / folder.name / source.relative_to(folder))
            else:
                excluded.append({'path': str(source.relative_to(ROOT)), 'bytes': source.stat().st_size, 'sha256': hashlib.sha256(source.read_bytes()).hexdigest(), 'reason': 'Generated compiled artifact retained by digest only.'})
    for name in ['finalize_selected_polynomial_bounds.py', 'close_selected_polynomial_bounds.py', 'align_selected_polynomial_bounds.py', 'qualify_selected_polynomial_bounds.py', 'probe_selected_polynomial_bounds.py', 'probe_selected_polynomial_bounds_baseline.py', 'probe_polynomial_operations_bounds.py', 'selected-polynomial-bounds-contract.json', 'selected-polynomial-bounds-prepared.json', 'selected-polynomial-bounds-parent-aligned.json', 'probe_polynomial_point_composition_bounds.py']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve certified enclosures of selected polynomial values', 'properties': ['P1', 'P7', 'P18', 'P19', 'P20'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'parent_alignment': alignment,
        'commands': rows, 'suites': suites, 'point_consumer_frontier': point_frontier,
        'domain': 'Finite rational values in admitted selected polynomial fields and their native recursive bases. Closed exact bounds may be authored and checked, or discovered by sign-guided dyadic expansion. The retained value remains authoritative.',
        'proof': 'Every new endpoint or midpoint comparison uses the strict field sign authority. Supplied closed bounds are checked for order and containment. Refinement halves width or proves an exact singleton while retaining the original immutable value and denominator/root evidence. No independent global scalar projection or approximation is used.',
        'witnesses': 'Five new tests: dependent c^45=2 bracketed by independent rational endpoint powers; rational-image and negative-value equations plus exact zero; invalid supplied intervals and closed endpoints; disjoint enclosures for values 2^-160 apart; zero-budget refusal, larger retry, zero-step certificate reuse and no approximate consumption. Thirteen predecessor field tests also pass. Missing enclosure APIs reproduced on the exact inherited join candidate before implementation.',
        'frontier': 'Seven public geometric operations remain Unsupported on this frozen source; the independent cubic-root point-query sum also remains Unsupported with its source/invalid-input controls passing. Scalar enclosures alone do not establish geometric point/parameter integration or region closure.',
        'limits': 'Each bound comparison charges one shared RootRefinement unit before its algebraic predicate. Existing checked singleton/zero-step certificates need no new comparison. This counts attempts, not total arithmetic, coefficient growth, expression size, memory, time or cancellation. The API is additive and unused by existing geometric paths. Fresh-process field-graph replay, geometric integration and full pre-push verification remain pending.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record certified bounds for selected polynomial values'], env=env)
    subprocess.run(git + ['update-ref', branch, commit, '0' * 40], check=True)
    archive = module('archive', CHECKOUT / 'scripts/evidence_archive.py')
    archive.ROOTS = {record: False}
    manifest = archive.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EVIDENCE_PARENT, 'branch': branch, 'record': record, 'manifest_row': manifest[1], 'suites': suites})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    record, count, size, digest = archive['manifest_row'].split('\t')
    suites = archive['suites']
    text = f'''**Selected polynomial enclosure increment (2026-10-28).**
Hypersolve owns exact scalar enclosure certificates under P1, P7, P18, P19
and P20. `SelectedPolynomialValue::enclosed` discovers dyadic bounds by strict
field comparisons. `SelectedPolynomialEnclosure::try_new` checks authored
closed bounds, and `refined` narrows a clone while retaining the original
value, root dependencies and finite-denominator evidence. Neither bounds nor
midpoints replace an authoritative coordinate or create an independent root.

Five new witnesses pass: rational endpoint certificates for dependent
`c^45=2`; rational-image and negative-value equations with exact zero; invalid
bounds and closed endpoints; separation of values `2^-160` apart; and budget
refusal, larger retry and zero-step certificate reuse without approximation.
The thirteen preceding field selection/join witnesses also pass. Missing APIs
were reproduced before implementation. Alignment to parent `{PARENT}` changed
only Git ancestry and three admission receipts; qualified implementation bytes
remain identical.

All 13 qualification groups pass, including full/all-target solver release
({suites['solver-full']['passed']:,} passed,
{suites['solver-full']['ignored']} ignored), minimal solver tests
({suites['solver-minimal']['passed']:,} passed), affected Hypercurve consumers
({suites['curve-consumers']['passed']:,} passed), CSGRS consumers
({suites['model-consumers']['passed']:,} passed), strict MSRV lint, denied-warning
docs, allocation lifetime profiling and hygiene. The archive `{record}` has
SHA-256 `{digest}` and preserves commands, source attribution, baseline
failures, original witnesses and alignment evidence.

Every new bound comparison charges one shared `RootRefinement` unit. This is
an attempt count, not a total arithmetic, coefficient-growth, expression-size,
memory, time or cancellation bound. Checked singleton and zero-step reuse need
no new comparison. No performance or universal closure claim is made.

Seven geometric operations and the independent cubic-root point-query sum
still return `Unsupported` on this source, with all corresponding controls
passing. The additive enclosure API is not yet used by existing geometric
paths. Point/parameter integration, exact field-graph replay and completed
modeling operations remain open. Full pre-push verification remains pending.

'''
    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'
    content = path.read_text()
    marker = '**Open, in dependency order:**'
    index = content.index(marker, content.index('## 8. Polynomial-branch sections'))
    assert text.splitlines()[0] not in content
    path.write_text(content[:index] + text + content[index:])
    path = CHECKOUT / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    paragraph = f'''The local `{archive['branch'].removeprefix('refs/heads/')}` branch ends at
`{archive['commit']}`, adding `{record}` ({int(count):,} files,
{int(size):,} bytes), SHA-256 `{digest}`. It records certified enclosures of
retained polynomial-field values, five new exact witnesses, thirteen predecessor
witnesses and 13 qualification groups. Geometric and point-consumer blockers,
resource limits and parent-alignment evidence remain explicit. No completed
geometric closure or package delivery is claimed. This record is unpushed.

'''
    path.write_text(content.replace(marker, marker + paragraph, 1))
    path = CHECKOUT / 'docs/evidence-archive.tsv'
    excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
    assert len(excluded) == 4
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']]).splitlines()
    assert not any(line.startswith('excluded:') for line in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n')
    assert_qualified()
    save(receipt_path, {'archive': archive, 'receipt_files': sorted(RECEIPTS), 'all_non_receipt_bytes_unchanged': True})
elif args.action == 'check':
    assert receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    commands = [('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']), ('typos', ['typos']), ('budget', ['scripts/check-repository-budget.sh']), ('diff', ['git', 'diff', '--check']), ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']])]
    results = []
    for name, command in commands:
        started = time.time()
        with (CONTROLS / (NAME + '-receipt-' + name + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=CHECKOUT, stdout=log, stderr=subprocess.STDOUT)
        results.append({'name': name, 'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started})
        save(checks_path, results)
        print(results[-1], flush=True)
        assert result.returncode == 0
    assert_qualified()
    save(CONTROLS / (NAME + '-ready.json'), {'files': e.source_snapshot()[1], 'checks': results})
else:
    assert receipt_path.exists()
    checks = json.loads(checks_path.read_text())
    assert len(checks) == 5 and all(row['exit_code'] == 0 for row in checks)
    assert e.source_snapshot()[1] == json.loads((CONTROLS / (NAME + '-ready.json')).read_text())['files']
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    user_head = output(['git', 'rev-parse', 'HEAD'], USER)
    user_status = output(['git', 'status', '--porcelain'], USER)
    user_diff = hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest()
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    subprocess.run(['git', 'add', '--all'], cwd=CHECKOUT, check=True)
    subprocess.run(['git', 'commit', '-m', 'Certify bounds without projecting selected polynomial values'], cwd=CHECKOUT, check=True)
    commit = output(['git', 'rev-parse', 'HEAD'])
    assert not output(['git', 'status', '--porcelain'])
    code_branch = output(['git', 'symbolic-ref', 'HEAD'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), code_branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit
    assert output(['git', 'rev-parse', 'HEAD'], USER) == user_head
    assert output(['git', 'status', '--porcelain'], USER) == user_status
    assert hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest() == user_diff
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(CONTROLS / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = json.loads(state_path.read_text())
    state['selected_polynomial_bounds'].update({'state': 'Scalar bounds qualified, archived, parent-aligned and committed locally. Geometric point and parameter integration remain pending.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'All three selected-field increments committed. Next implementation must integrate retained polynomial values with geometric points/parameters and replay, preserving all original blockers. Full exact closure goal remains active; no new push was attempted.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
