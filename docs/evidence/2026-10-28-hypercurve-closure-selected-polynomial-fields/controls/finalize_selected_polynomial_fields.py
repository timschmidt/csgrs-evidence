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
CHECKOUT = (ROOT / 'selected-polynomial-fields').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-polynomial-fields'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/lib.rs', 'crates/hypersolve/src/root_sign.rs', 'crates/hypersolve/src/selected_polynomial_field.rs', 'crates/hypersolve/src/work_budget.rs', 'crates/hypersolve/tests/selected_polynomial_fields.rs', 'crates/hypersolve/CHANGELOG.md'}
PARENT = 'd88ae9e028c7d2c3dc4061bc515ee917d34be65b'
EVIDENCE_PARENT = '588685ed15c8b41c5c1690523b46fd3669f1f73e'


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
assert complete['all_passed'] and complete['groups'] == len(rows) == 23
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((run / 'source-before.json').read_text())
files = json.loads((run / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((run / 'source-after.json').read_text())
assert files == json.loads((run / 'files-after.json').read_text())
assert qualified['revision'] == PARENT
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-fields1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == qualified
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-fields1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    suites = {name: counts(run / (name + '.log')) for name in ['selected-fields', 'solver-full', 'solver-minimal', 'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io', 'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack']}
    assert suites['selected-fields']['passed'] == 8
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

    prefixes = ['selected-polynomial-fields-baseline', 'selected-polynomial-fields-fix', 'selected-polynomial-fields-qualification-', 'polynomial-operation-frontier-fields1']
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
    for name in ['finalize_selected_polynomial_fields.py', 'close_selected_polynomial_fields.py', 'qualify_selected_polynomial_fields.py', 'probe_selected_polynomial_fields.py', 'probe_selected_polynomial_fields2.py', 'probe_selected_polynomial_fields3.py', 'probe_polynomial_operations_fields.py', 'selected-polynomial-fields-contract.json', 'selected-polynomial-fields-prepared.json', 'selected-polynomial-fields-first-edit.json', 'polynomial-distance-field-design.json']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve selected polynomial fields and shared ordered-field root signs/counts', 'properties': ['P1', 'P7', 'P18', 'P19', 'P20'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites,
        'domain': 'Finite chains of polynomial root selections over an admitted recursive quadratic field, with exactly one distinct real root in each open selector, endpoints off the zero set, and rational images with certified nonzero denominators. Repeated, reducible and nonmonic relations remain valid.',
        'proof': 'Exact Sturm distinct-root counting validates each selector. Values keep shared parents, original equations and positive denominator proofs, with local monic relation reduction and strict selected-root signs. No independent coordinate projection, approximation or global inverse is required.',
        'witnesses': 'Eight independent tests: a^3=2, b^3=a, c^5=b and c^45=2; repeated nonmonic relations; locally invertible denominators on reducible equations; invalid/no-root/multiple-root selectors; zero-budget refusal and larger retry without approximate consumption; independently factored root counts; 2^-160 separated roots; and the original elliptic corner distance contact satisfying the source cubic, circle distance and selected side. Baseline compilation reproduced missing APIs on d88ae9. The fix2 fixture compile failure is retained; no geometric assertion was weakened.',
        'frontier': 'Seven public geometric operations remain Unsupported on this frozen source: offset/chamfer/fillet on admitted parabola and elliptic caps, plus a chamfer at a Boolean-generated algebraic elliptic corner. The successful scalar contact calculation is not completed geometric chamfer support.',
        'limits': 'One shared promotion unit admits a new selected extension proof. This is not a total arithmetic, coefficient, expression, memory, time or cancellation bound. General joins, point/parameter integration, geometric construction and exact native replay remain separate gaps. No performance improvement, universal closure or package delivery claimed; full pre-push verification remains pending for the changed implementation.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record selected polynomial field qualification'], env=env)
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
    text = f'''**Selected polynomial field increment (2026-10-28).**
Hypersolve owns this extension under P1, P7, P18, P19 and P20.
`SelectedPolynomialField` retains a finite chain of selected polynomial roots
over an admitted native recursive quadratic field. Strict Sturm counting
checks that each open interval contains exactly one distinct root and excludes
endpoint roots. Repeated, reducible and nonmonic equations remain supported.
Values retain their shared parent, original defining equation and positive
rational denominator proof; arithmetic reduces locally without global
inversion or independent coordinate projection.

Eight acceptance witnesses pass, including dependent degrees 3, 3 and 5
(`c^45=2`), a locally invertible denominator on a reducible equation, repeated
roots, invalid and ambiguous selectors, zero-budget refusal and successful
retry, independently factored root counts, and roots separated by `2^-160`.
The original elliptic corner contact is also constructed in one retained field:
`4a^3+3=0`, corner `(a,1/2)`, radius `1/64`. Its selected point satisfies
`y^2=1+x^3`, the original squared chord-distance equation and the retained
left/down side conditions. This proves the scalar contact construction only.
The missing APIs were reproduced on parent `{PARENT}` before implementation.

All 23 final qualification groups pass: full/all-target solver release tests
({suites['solver-full']['passed']:,} passed,
{suites['solver-full']['ignored']} ignored), minimal solver tests
({suites['solver-minimal']['passed']:,} passed), full Hypercurve tests
({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), full CSGRS tests
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), six downstream consumer suites,
strict MSRV Clippy, minimal core checks, denied-warning docs, solver and curve
fuzz-target lint, allocation lifetime profiling, the capability matrix and
hygiene. Existing ignored tests remain ignored; they are not completion evidence.

The archived record `{record}` has SHA-256 `{digest}`. It retains baseline
failures, final source attribution, commands and logs. All non-receipt bytes
match the qualified source. One promotion unit admits a new extension proof;
this counter does not bound arithmetic work, coefficient growth, expression
size, memory or cancellation. No performance or universal closure claim follows.

Seven public geometric operations still return `Unsupported` on this exact
source: offset, chamfer and fillet on the parabola and elliptic caps, plus the
chamfer at the generated algebraic elliptic corner. All three source controls
pass. General independent-field joins, Hypercurve point/parameter integration,
trimming, reconstructed boundaries and exact native replay remain open.
Full pre-push verification for this changed implementation remains pending.

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
{int(size):,} bytes), SHA-256 `{digest}`. It records selected polynomial
fields, eight exact witnesses and 23 local/downstream qualification groups.
The elliptic scalar contact succeeds; seven public geometric operations remain
unsupported. Original failures and resource limits remain explicit. No completed
geometric chamfer, universal closure or package delivery is claimed. This record
is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Retain dependent polynomial roots in exact selected fields'], cwd=CHECKOUT, check=True)
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
    state['selected_polynomial_fields'].update({'state': 'Full selected-field qualification, frontier replay, evidence archive and receipt checks passed; increment committed locally.', 'controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Selected-polynomial-fields increment committed. Independent polynomial-field joins are in a separate worktree; consult its current controller receipt. Point/parameter integration, geometric operations, exact replay and full resource contracts remain open. Full closure goal remains active.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
