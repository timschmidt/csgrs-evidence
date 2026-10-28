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
CHECKOUT = (ROOT / 'polynomial-chamfers').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'polynomial-substitution'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/recursive_quadratic_field.rs', 'crates/hypersolve/src/recursive_quadratic_field/polynomial.rs', 'crates/hypersolve/tests/recursive_polynomial_substitution.rs', 'crates/hypersolve/CHANGELOG.md'}
PARENT = '6d3630028c7f7a5eb9aeb2b1ec74119269d1b31b'
EVIDENCE_PARENT = 'fedf350fcf2a4d555b95ffec6af213d52dedc68a'


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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-substitution1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == qualified
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-substitution1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    suites = {name: counts(run / (name + '.log')) for name in ['substitution', 'solver-full', 'solver-minimal', 'curve-consumers', 'model-consumers']}
    assert suites['substitution']['passed'] == 5
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

    prefixes = ['polynomial-substitution-missing-api-baseline', 'polynomial-substitution-fix', 'polynomial-substitution-qualification-', 'polynomial-operation-frontier-']
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
    for name in ['finalize_polynomial_substitution.py', 'qualify_polynomial_substitution.py', 'probe_polynomial_substitution.py', 'probe_polynomial_operations.py', 'probe_polynomial_operations_current.py', 'polynomial-chamfer-substitution-contract.json', 'polynomial-chamfer-contract.json', 'polynomial-chamfer-parent-aligned.json', 'polynomial-chamfer-substitution-implemented.json']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve retained-field polynomial arithmetic', 'properties': ['P1', 'P7', 'P18', 'P19'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites,
        'domain': 'Finite bivariate equations with supported exact Real coefficients and nonempty polynomial homogeneous coordinates over one retained RecursiveQuadraticField, at a sufficient finite common degree.',
        'proof': 'Homogenize each monomial X^i Y^j W^(d-i-j) using existing exact field operations. Each coefficient shares the input field. Guards are retained; no cancellation, branch selection, coordinate projection or approximation occurs.',
        'witnesses': 'Five independent tests: explicit elliptic circle-substitution coefficients with cubic selected center a^3=2; all degree-37 coefficients from binomial expansion; denominator factor and invalid-input controls; output consumed by exact root isolation with independent bracketing signs; nested quadratic extension identity. Three initial witnesses first reproduced E0425 for the missing API on the exact parent.',
        'frontier': 'Six Unsupported offset/chamfer/fillet cases on admitted parabola and nonrational elliptic caps, plus one Unsupported chamfer at a generated algebraic elliptic corner, remain open. Baseline source and controls retained. Arithmetic qualification does not establish geometric completion.',
        'limits': 'No new total-work, coefficient-growth, expression-size, retained-memory or cancellation bound. Option failure covers invalid polynomial inputs or checked arithmetic/storage inability; it is not a proof of exhausted resources. External timeouts and process RSS are containment measurements only. No performance improvement, package delivery or universal closure claimed. Full pre-push checks are pending for this changed implementation.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record retained-field polynomial substitution qualification'], env=env)
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
    text = f'''**Retained-field polynomial substitution increment (2026-10-28).**
Hypersolve owns this arithmetic extension under P1, P7, P18 and P19.
`compose_bivariate_homogeneous_polynomial` constructs
`W(t)^d P(X(t)/W(t), Y(t)/W(t))` with coefficients in the same selected
recursive field. The domain is finite bivariate equations with supported exact
`Real` coefficients and nonempty coordinate polynomials at a sufficient degree.
The implementation uses existing field arithmetic, retains denominator factors
and rejects incompatible fields or invalid degrees. It creates no independent
coordinate roots, cancels no guards and selects no geometric branch.

Five independent witnesses pass: explicit cubic-center circle coefficients,
degree-37 binomial coefficients, denominator and invalid-input controls,
consumption by the exact ordered-field root isolator, and a nested radical
identity. The first three witnesses reproduced the missing API on parent
`{PARENT}` before implementation. The final 13-group qualification passes:
Hypersolve all-feature/all-target release tests ({suites['solver-full']['passed']:,}
passes, {suites['solver-full']['ignored']} ignored), minimal release tests
({suites['solver-minimal']['passed']:,} passes,
{suites['solver-minimal']['ignored']} ignored), affected Hypercurve consumers
({suites['curve-consumers']['passed']:,} passes) and CSGRS consumers
({suites['model-consumers']['passed']:,} passes), strict MSRV Clippy for the
solver and curve crates, denied-warning docs, the four-iteration allocation
lifetime profile, formatting, typos, repository budget and diff checks.

The archived record `{record}` has SHA-256 `{digest}`. Source attribution,
commands, logs and prior failures are retained; all non-receipt bytes match
the final qualified snapshot. These are local arithmetic and consumer results,
not a shipped package or geometric chamfer completion claim. No new bound on
total work, coefficient growth, expression size, memory or cancellation is
established; external time and RSS measurements are not such bounds.

The preserved geometric frontier has six `Unsupported` offset/chamfer/fillet
cases on admitted parabola and elliptic caps, plus a chamfer blocker at the
Boolean-generated elliptic corner `y=1/2, x^3+3/4=0, x<0`. These outcomes are reproduced on this frozen source after qualification;
source and exact relation controls pass. General implicit distance contacts, correlated contact
points, branch/domain replay, trimming and downstream closure remain open.
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
{int(size):,} bytes), SHA-256 `{digest}`. It records retained-field polynomial
substitution, five independent arithmetic witnesses, local solver qualification
and affected curve/model consumers. Original geometric operation blockers and
failed baseline compilation remain explicit. No completed implicit chamfer,
universal closure, resource bound or delivery is claimed. This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Compose implicit equations over retained algebraic fields'], cwd=CHECKOUT, check=True)
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
    state['polynomial_chamfers'].update({'state': 'Polynomial substitution arithmetic increment qualified, archived and committed. Geometric distance contacts remain open.', 'running_controller': None, 'substitution_commit': result})
    state['remaining_runtime_work'] = 'No arithmetic qualification job pending. General implicit-curve chamfers remain open, including correlated algebraic corners, contact points, branch restrictions, reconstruction and exact replay. Current polynomial-chamfers worktree is clean on the arithmetic increment. Next work must reproduce its owning point/field blocker and extend the retained representation. Full closure goal remains active.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
