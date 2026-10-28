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
CHECKOUT = (ROOT / 'selected-polynomial-joins').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-polynomial-joins'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/selected_polynomial_field.rs', 'crates/hypersolve/src/selected_polynomial_field/join.rs', 'crates/hypersolve/tests/selected_polynomial_joins.rs', 'crates/hypersolve/CHANGELOG.md'}
PARENT_RECORD = json.loads((CONTROLS / 'selected-polynomial-fields-final-commit.json').read_text())
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
alignment = json.loads((CONTROLS / 'selected-polynomial-joins-parent-aligned.json').read_text())
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-joins1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == qualified
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-joins1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    point_frontier = json.loads((CONTROLS / 'polynomial-point-composition-baseline2/complete.json').read_text())
    assert point_frontier['source'] == qualified and point_frontier['all_expected_outcomes_reproduced']
    suites = {name: counts(run / (name + '.log')) for name in ['joins', 'solver-full', 'solver-minimal', 'curve-consumers', 'model-consumers']}
    assert suites['joins']['passed'] == 13
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

    prefixes = ['selected-polynomial-joins-baseline', 'selected-polynomial-joins-fix', 'selected-polynomial-joins-qualification-', 'polynomial-operation-frontier-joins1', 'polynomial-point-composition-baseline2']
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
    for name in ['finalize_selected_polynomial_joins.py', 'close_selected_polynomial_joins.py', 'align_selected_polynomial_joins.py', 'qualify_selected_polynomial_joins.py', 'probe_selected_polynomial_joins.py', 'probe_selected_polynomial_joins_baseline.py', 'probe_polynomial_operations_joins.py', 'selected-polynomial-joins-contract.json', 'selected-polynomial-joins-prepared.json', 'selected-polynomial-joins-parent-aligned.json', 'probe_polynomial_point_composition_joins.py']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve selected polynomial field joins', 'properties': ['P1', 'P7', 'P18', 'P19', 'P20'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'parent_alignment': alignment,
        'commands': rows, 'suites': suites, 'point_consumer_frontier': point_frontier,
        'domain': 'Finite selected polynomial towers over admitted native recursive quadratic fields, including independent native sources and divergent dependent polynomial generators. Each source has a valid singleton selection and certified finite denominators.',
        'proof': 'Native source union and embeddings retain selected roots and positive radicals. Divergent polynomial generators replay original equations over embedded parent values with the same singleton selectors. Reusable generator correspondences transport exact rational values and positive denominator proofs. Ancestor joins reuse existing authority, and call-local memoization retains shared value graphs.',
        'witnesses': 'Five new tests: divergent b^3=a and c^5=a over a^3=2, original rational quotients and further selected construction; independent equal-value selections with repeated/nonmonic equations and opposite branches; mixed foreign cubic/quadratic native roots and radicals; roots separated by 2^-160; zero-budget refusal, larger retry, ancestor reuse and no approximate consumption. Eight predecessor field tests also pass. Missing joined_with API reproduced on the exact inherited producer snapshot.',
        'frontier': 'Seven geometric operations remain Unsupported on this frozen source: offset/chamfer/fillet on admitted parabola and elliptic caps, plus the generated algebraic-corner chamfer. These scalar joins are not yet integrated into geometric point/parameter carriers.',
        'limits': 'The additive join API does not change existing arithmetic callers; the parent separately qualifies the shared root-sign change with its full downstream stack. Each new polynomial selection charges its shared promotion entry. Native embedding and arithmetic retain their existing decision/resource limits. No total-work, coefficient-growth, memory or cancellation bound is claimed. Equal independently selected polynomial generators may remain separate while exact signs prove equality. Native graph replay, geometric closure and full pre-push verification remain pending.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record exact selected polynomial field joins'], env=env)
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
    text = f'''**Selected polynomial field join increment (2026-10-28).**
Hypersolve owns these scalar embeddings under P1, P7, P18, P19 and P20.
`SelectedPolynomialField::joined_with` builds a common field for finite selected
polynomial towers over admitted recursive quadratic fields. It reuses native
source union and embeddings, then replays divergent polynomial equations over
their mapped parent values in the original singleton intervals. The retained
correspondences transport finite rational values and positive denominator
proofs. Ancestor joins reuse authority; independent allocations and different
polynomial presentations do not determine mathematical value equality.

Five new witnesses pass: dependent divergent generators (`b^3=a`, `c^5=a`,
`a^3=2`), rational quotients and a further selected extension; independently
selected equal roots and opposite branches; foreign native cubic/quadratic
roots with a retained positive radical; distinct roots separated by `2^-160`;
and zero-budget refusal, larger-budget retry and ancestor reuse without
approximate consumption. The eight preceding selected-field witnesses also
pass. The missing join API was reproduced before implementation on the exact
inherited producer snapshot. Alignment to committed parent `{PARENT}` changed
only Git ancestry and the three admission receipt files; every qualified
non-receipt source byte is unchanged.

All 13 qualification groups pass: full/all-target Hypersolve release tests
({suites['solver-full']['passed']:,} passed,
{suites['solver-full']['ignored']} ignored), minimal tests
({suites['solver-minimal']['passed']:,} passed), affected Hypercurve consumers
({suites['curve-consumers']['passed']:,} passed), CSGRS consumers
({suites['model-consumers']['passed']:,} passed), strict MSRV lint for solver and
curve, denied-warning solver docs, allocation lifetime profiling and hygiene.
The additive API is not called by existing geometry paths. The parent separately
qualifies its shared root-sign changes across the full downstream stack.

The evidence record `{record}` has SHA-256 `{digest}` and retains commands,
logs, source attribution, the missing-API witness and parent-alignment proof.
Each appended polynomial selection consumes the shared promotion entry; this
counter does not bound total arithmetic, coefficient growth, expression size,
memory or cancellation. Equal independent generators may retain separate
representations while exact predicates prove equality. No performance or
universal completeness claim is made.

Seven geometric operations still return `Unsupported` on this source, with
three exact source controls passing. A separate point witness confirms that
adding coordinate queries from independently selected cubic-root points remains
`Unsupported`, while both source equations and zero-divisor rejection pass.
Point/parameter integration, constructed contact carriers, trimming, arrangement
and exact native replay remain open.
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
{int(size):,} bytes), SHA-256 `{digest}`. It records exact joins of selected
polynomial fields, five new composition witnesses, eight predecessor witnesses
and 13 qualification groups. The source attribution and parent alignment are
retained. Seven public geometric operation blockers remain explicit; no complete
geometric closure or resource bound is claimed. This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Join selected polynomial fields without coordinate projection'], cwd=CHECKOUT, check=True)
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
    state['selected_polynomial_joins'].update({'state': 'Field joins qualified, archived, parent-aligned and committed locally. Public geometric consumers remain pending.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Both selected-field increments committed. Next implementation must integrate retained polynomial values with geometric points/parameters and replay, preserving all original blockers. Full exact closure goal remains active; no new push was attempted.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
