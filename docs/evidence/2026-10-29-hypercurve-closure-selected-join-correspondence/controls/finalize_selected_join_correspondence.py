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
CHECKOUT = (ROOT / 'selected-join-correspondence').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-join-correspondence'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/selected_polynomial_field/definition.rs', 'crates/hypersolve/tests/support/selected_polynomial_replay.rs', 'crates/hypersolve/src/selected_polynomial_field/definition/encode.rs', 'crates/hypersolve/tests/selected_polynomial_join_retention.rs', 'crates/hypersolve/src/selected_polynomial_field.rs', 'crates/hypersolve/CHANGELOG.md', 'crates/hypersolve/src/selected_polynomial_field/definition/replay.rs', 'crates/hypersolve/src/selected_polynomial_field/join.rs'}
POINT = json.loads((CONTROLS / 'selected-polynomial-points-final-commit.json').read_text())
PARENT = POINT['commit']
EVIDENCE_PARENT = POINT['evidence_commit']
ALIGNMENT = json.loads((CONTROLS / 'selected-join-correspondence-parent-alignment.json').read_text())



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
assert complete['all_passed'] and complete['groups'] == len(rows) == 24
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((run / 'source-before.json').read_text())
files = json.loads((run / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((run / 'source-after.json').read_text())
assert files == json.loads((run / 'files-after.json').read_text())
assert qualified == ALIGNMENT['qualified']
assert ALIGNMENT['point_parent'] == PARENT and ALIGNMENT['point_evidence'] == EVIDENCE_PARENT
assert ALIGNMENT['all_nonreceipt_bytes_unchanged'] and set(ALIGNMENT['changed_since_qualification']) == RECEIPTS
e = module('source_evidence', CHECKOUT / 'scripts/successive-operations.py')


def assert_qualified():
    current = e.source_snapshot()[1]
    assert [r for r in current if r[0] not in RECEIPTS] == [r for r in files if r[0] not in RECEIPTS], 'non-receipt source changed'


assert_qualified()
archive_path = CONTROLS / (NAME + '-evidence-archive.json')
receipt_path = CONTROLS / (NAME + '-receipt-prepared.json')
checks_path = CONTROLS / (NAME + '-receipt-checks.json')
record = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
branch = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'

if args.action == 'archive':
    assert not archive_path.exists()
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-correspondence1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-correspondence1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused = json.loads((CONTROLS / 'selected-join-correspondence-fix5/complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 10
    preflight = json.loads((CONTROLS / 'selected-join-correspondence-preflight-4/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-join-correspondence-baseline2/complete.json').read_text())
    assert not baseline['all_passed'] and baseline['groups'] == 4
    baseline_rows = json.loads((CONTROLS / 'selected-join-correspondence-baseline2/results.json').read_text())
    assert [row['exit_code'] for row in baseline_rows] == [0, 0, 0, 101]
    suite_names = ['selected-points', 'selected-join-retention', 'solver-full', 'solver-minimal', 'curve-full', 'model-full']
    suite_names += ['dependent-' + name for name in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
    suites = {name: counts(run / (name + '.log')) for name in suite_names}
    assert suites['selected-join-retention']['passed'] >= 9
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

    prefixes = ['selected-join-correspondence-', 'polynomial-operation-frontier-correspondence1']
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
    for name in ['finalize_selected_join_correspondence.py', 'close_selected_join_correspondence.py', 'qualify_selected_join_correspondence.py', 'qualify_selected_join_correspondence_owner.py', 'run_selected_join_correspondence_qualification.py', 'preflight_selected_join_correspondence.py', 'probe_selected_join_correspondence.py', 'probe_selected_join_correspondence_candidate.py', 'probe_polynomial_operations_correspondence.py', 'align_selected_join_correspondence.py', 'prepare_selected_join_correspondence_closeout.py', 'implement_selected_join_correspondence.py', 'selected-join-correspondence-contract.json', 'selected-join-correspondence-prepared.json', 'selected-join-correspondence-seed.patch', 'selected-join-correspondence-parent-alignment.json', 'selected-join-correspondence-aligned-files.json', 'selected-join-correspondence-extra-tests.rs', 'polynomial-operation-frontier-tests.rs', 'selected-join-correspondence-qualification-final1-controller.json']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve selected-field generator correspondences and definition replay',
        'properties': ['P2','P10','P18','P19','P20','P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'alignment': ALIGNMENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'baseline': baseline, 'baseline_rows': baseline_rows, 'frontier': frontier,
        'domain': 'Repeated joins of admitted selected polynomial coefficient fields, consumption of both original operands, dependent and native-field inputs, exact definition replay and further joins.',
        'proof': 'A generator created by a validated join retains its original source authority. Reuse follows those immutable correspondences and existing ancestry; allocation identity only locates a construction proof. Independent equal selections do not acquire a correspondence from polynomial or interval equality. JoinedField graph records replay the actual join and validate original source selections, references and coefficient maps. Native and polynomial ratios validate original denominators before constructing shared value nodes; positive ratios preserve sharing, negative ratios normalize exactly, and zero guards are invalid.',
        'witnesses': 'Nine named tests retain original first and second operands, repeated and diamond joins, independent equal, opposite and nearby selections, dependent and foreign-native coefficient fields, exact cubic equations, actual configured refusal and retry, malformed references and selectors, fresh-process graph replay followed by further joins, deterministic re-export, and positive, negative and zero guard controls.',
        'retained_failures': 'The first-operand controls pass while reusing the original second operand increases field depth from two to three. The exact cubic equation still passes, distinguishing needless generator growth from a false scalar answer. The first replay implementation preserved values but exported 83 nodes instead of 87; the original byte-equality assertion remains. A later new fixture used a forward reference and was corrected without changing its arithmetic assertions. All source-attributed attempts remain archived.',
        'resource_scope': 'Known generator reuse avoids the measured additional depth in the named fixtures. This is not a general speed or memory claim. Strong source references keep the proof DAG alive; total retained memory, coefficient growth, arithmetic work and cancellation remain unbounded by the existing refinement and record counters.',
        'source_alignment': 'Qualification used a private point checkpoint. Only the finalized point parents three receipts change during alignment; every implementation and fixture byte remains identical. Base/seed/candidate patches and file digests reconstruct the qualified source.',
        'migration': 'SelectedPolynomialDefinitionNode adds JoinedField. Exhaustive consumers and external graph-format owners must handle it; existing records retain their meaning. Joined-field export intentionally preserves construction dependencies. Semantic equality and deterministic serialization are checked separately.',
        'limits': 'General field equality, complete algebraic region closure and seven original region offset/corner blockers remain open. Full pre-push qualification of this increment is still required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record retained selected-field generator correspondences'], env=env)
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
    text = f'''**Selected-field join correspondence increment (2026-10-29).**
Repeated joins now retain the validated correspondence to each original source
generator. The baseline preserved exact cubic values but appended a duplicate
generator when consuming its original second operand: depth grew from two to
three. Immutable construction links now preserve both operands through repeated
and diamond joins. Independent equal selections remain distinct unless an
existing validated construction supplies their correspondence.

Definition graphs retain a `JoinedField` operation and replay the original join,
source selections and coefficient maps. Original denominator checks precede
native and polynomial ratio reconstruction. Positive ratios keep shared nodes;
negative ratios normalize exactly, and zero guards remain invalid. The new
public enum variant and joined-field export representation are documented in
the solver changelog. Semantic equality and deterministic re-export are separate
claims; the original failing cold byte comparison remains unchanged.

Nine named witnesses pass, including both original operands, repeated and
diamond joins, independent equal/opposite/nearby roots, foreign-native fields,
invalid selectors/references, configured refusal and larger retries, fresh-process
replay followed by further joins, and negative-denominator controls. All 24
qualification groups pass: full Hypersolve ({suites['solver-full']['passed']:,}
passed, {suites['solver-full']['ignored']} ignored), minimal solver configuration,
Hypercurve ({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), six downstream consumer suites,
strict MSRV Clippy, minimal builds, denied-warning docs and fuzz lint,
allocation lifetime control, the capability matrix and hygiene.

Only the finalized point parent's three receipts changed after qualification;
implementation and fixture bytes remain identical. Commands, source inventories,
patches and raw failures are in {record}, SHA-256 {digest}. Receipt checks follow
the final documentation edit. Seven original region offset/corner operations
remain Unsupported while their three controls pass. The named depth reduction
is not a general speed or memory result; total work, coefficient growth, retained
memory and cancellation remain outside the existing counters. General algebraic
closure and this increment's full pre-push qualification remain open.

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
    paragraph = f'''The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records retained selected-field
generator correspondences, original-guard validation and fresh-process graph
replay, nine named fixtures and 24 qualification groups. Source checkpoints are
reconstructable from patches and inventories. Original duplicate-generator and
cold re-export failures remain explicit, along with seven region-operation
blockers. This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Retain selected-field generator correspondences across joins and replay'], cwd=CHECKOUT, check=True)
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
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'alignment': ALIGNMENT, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(CONTROLS / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = json.loads(state_path.read_text())
    state.setdefault('selected_join_correspondence', {}).update({'state': 'Selected-field generator correspondence and replay qualified locally/downstream, aligned to point parent, archived and committed locally. General closure remains open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue exact operation closure with retained selected-field correspondence. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
