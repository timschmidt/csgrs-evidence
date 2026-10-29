"""Admit dependent query fibers only after frozen owner/downstream validation."""
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
CHECKOUT = (ROOT / 'selected-closure-integration').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-closure-integration'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = set(json.loads((CONTROLS / 'selected-closure-integration-candidate-prepared.json').read_text())['working_changes'])
ALIGNMENT = json.loads((CONTROLS / 'selected-closure-integration-parent-alignment.json').read_text())
PARENT = ALIGNMENT['parent']
CODE_PARENTS = ALIGNMENT['code_parents']
EVIDENCE_PARENT = ALIGNMENT['evidence_parent']




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
assert complete['all_passed'] and complete['groups'] == len(rows) == 25
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((run / 'source-before.json').read_text())
files = json.loads((run / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((run / 'source-after.json').read_text())
assert files == json.loads((run / 'files-after.json').read_text())
assert qualified == ALIGNMENT['qualified']
assert CODE_PARENTS[0] == PARENT and len(CODE_PARENTS) == 5
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
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-integration1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-integration1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused_dir = CONTROLS / 'selected-closure-integration-fix1'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 16
    focus_rows = json.loads((focused_dir / 'results.json').read_text())
    assert len(focus_rows) == 16 and all(row['exit_code'] == 0 and row['source_stable'] for row in focus_rows)
    preflight = json.loads((CONTROLS / 'selected-closure-integration-preflight-1/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-closure-integration-baseline1/complete.json').read_text())
    assert baseline['expected_outcomes_reproduced'] and baseline['statuses'] == [0, 0, 101, 101]
    readiness = json.loads((CONTROLS / 'selected-closure-integration-ready.json').read_text())
    assert readiness['all_local_qualification_and_receipt_checks_passed']
    suites = {name: counts(run / (name + '.log')) for name in [
        'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal',
        'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
        'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack',
    ]}
    for name in ['integration_dependent_fiber_feeds_derivatives_and_another_polynomial', 'integration_dependent_fiber_quotient_replay_retains_the_original_pole', 'integration_dependent_fiber_derivative_replays_cold_and_feeds_geometry']:
        assert counts(focused_dir / (name + '.log'))['passed'] == 1
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

    prefixes = ['selected-closure-integration-', 'polynomial-operation-frontier-integration1', 'selected-closure-integration-baseline1']
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
    controls = {
        'prepare_selected_closure_integration_closeout.py', 'align_selected_closure_integration.py',
        'finalize_selected_closure_integration.py', 'close_selected_closure_integration.py',
        'probe_polynomial_operations_integration.py', 'polynomial-operation-frontier-tests.rs',
        'integration-disk-cleanup.json', 'integration-disk-live-users.json',
        'integration-private-commit-graph-repair.json',
    }
    for path in CONTROLS.iterdir():
        if path.is_file() and ('selected_closure' in path.name or path.name.startswith('selected-closure-integration-')):
            if path.suffix in {'.py', '.rs', '.json', '.log', '.patch'}:
                controls.add(path.name)
    for name in sorted(controls):
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve selected-query fibers, derivatives, original rational denominator guards and native replay; Hypersolve selected-field joins and root discovery',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'code_parents': CODE_PARENTS, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight,
        'baseline': baseline, 'frontier': frontier, 'source_alignment': ALIGNMENT, 'predecessor_admission': readiness,
        'domain': 'The combined admitted selected-point, query-derivative, complete-root-discovery, original-guard, join-correspondence and dependent-fiber envelopes. The new named chain evaluates a selected algebraic query on y^2=x, differentiates C(t)=(t,t^2) at its retained ordinate, replays the exact derivative and feeds further polynomial evaluation and differentiation.',
        'proof': 'Reuse the separately qualified lower-layer implementations without a new arithmetic or differentiation authority. Original equations, source-dependent coefficients, branch selectors and denominator guards survive the combined chain. Shared-field join correspondences preserve existing source generators. Two incoming test literals receive the already-declared PolynomialFiber parameter conversion; existing assertions remain. Capability rows and source changelogs are merged without removing prior entries.',
        'witnesses': 'Source control u>0,8u^2=1; v>0,16v^3=u; positive y^2=x at x=v. At t=y, exact derivatives of C(t) are (1,2t),(0,2),(0,0), and a further polynomial recovers v. A quotient equal to y-1 retains the original excluded pole y^2-1=0. A fresh-process derivative endpoint proves dx=1,dy>0,dy^12=2 and feeds another polynomial evaluation and derivative. Four new witnesses coexist with the original ten dependent-fiber cases and every predecessor corpus.',
        'retained_failures': 'The target revision passed source construction but rejected derivative consumption as Unsupported and incorrectly accepted the original divisor pole after recipe rebinding. Both complete original failing fixtures, exact source attribution and corrected outcomes are retained. Compilation and archived failed predecessor attempts remain in their original evidence histories.',
        'limits': 'Seven original polynomial-region offset/corner operations remain Unsupported with their three controls passing. General algebraic region and singular-branch operation closure, total arithmetic/coefficient/expression/memory limits and cooperative cancellation remain open. Fourteen named focused cases, 25 combined local/downstream groups and finalized predecessor records do not replace the separate full pre-push contract for the merged source.',
        'cost_scope': 'Raw completion times, peak RSS, allocation lifetime controls and source/artifact digests are retained. Concurrent timings do not establish a speedup. Inactive Cargo outputs were removed only after checking for live references; source, raw logs and evidence were preserved.',
        'hardware': output(['lscpu', '--json']),
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record integrated exact query-fiber composition'], env=env)
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
    text = f'''**2026-10-29 integrated selected-query composition:**
The individually qualified point, derivative, complete-root, pole-guard,
join-correspondence and dependent-fiber increments now share one candidate.
The original generated-fiber control passed, but its parameter was Unsupported
in rational differentiation, and a derived quotient recipe incorrectly accepted
an input excluded by the original divisor denominator. Both failures were
reproduced on the frozen fiber revision and retained before integration.

Four new composition fixtures pass with the original ten fiber cases. For
u>0, 8u^2=1 and v>0, 16v^3=u, evaluate positive y^2=x at x=v. Its ordinate t
feeds C(t)=(t,t^2), whose derivatives are independently (1,2t), (0,2) and
(0,0); a further polynomial evaluation recovers v. The quotient with value
y-1 keeps the excluded pole y^2-1=0. Cold native replay of the derivative
proves dx=1, dy>0 and dy^12=2, then completes another polynomial evaluation
and derivative. Exact equations and semantic equality are distinct from
deterministic serialization. The two incoming native fiber test constructors
use the previously documented parameter conversion; their assertions remain.

All 25 combined qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, every
predecessor acceptance target, strict four-package MSRV Clippy, minimal checks,
strict docs and both fuzz manifests, allocation lifetime controls, capability
checks and hygiene. Raw commands report ignored tests separately. All six
predecessor admissions and the earlier selected-field publication receipt are
retained as code/evidence parents. Only three receipt files change after the
combined source qualification; receipt checks run after their final edit.

The evidence is in {record}, SHA-256 {digest}. It retains the original
failures, source inventories, patches, compiler settings, completion times and
peak RSS. The capability catalog preserves every predecessor row. No speedup
or universal closure claim follows from these measurements.

Seven original implicit-region offset/corner operations remain Unsupported,
with all three source controls passing. General algebraic region operations,
singular cases and total work, coefficient, expression, memory and cancellation
contracts remain open. Full repository pre-push qualification of this combined
source is still required before publication.

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
{int(size):,} bytes), SHA-256 {digest}. Its parent merges all six selected-query
increment evidence histories and the earlier selected-field publication record.
Fourteen focused cases and 25 combined qualification groups pass. Original
derivative/pole failures and seven remaining region-operation blockers are
retained. General closure and publication of the combined source are not
claimed. This record is unpushed.

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
    save(CONTROLS / (NAME + '-receipt-ready.json'), {'files': e.source_snapshot()[1], 'checks': results})
else:
    assert receipt_path.exists()
    checks = json.loads(checks_path.read_text())
    assert len(checks) == 5 and all(row['exit_code'] == 0 for row in checks)
    assert e.source_snapshot()[1] == json.loads((CONTROLS / (NAME + '-receipt-ready.json')).read_text())['files']
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    user_head = output(['git', 'rev-parse', 'HEAD'], USER)
    user_status = output(['git', 'status', '--porcelain'], USER)
    user_diff = hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest()
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    subprocess.run(['git', 'add', '--all'], cwd=CHECKOUT, check=True)
    tree = output(['git', 'write-tree'])
    code_branch = output(['git', 'symbolic-ref', 'HEAD'])
    parents = [item for parent in CODE_PARENTS for item in ['-p', parent]]
    commit = output(['git', 'commit-tree', tree, *parents, '-m', 'Compose selected fibers with exact derivatives and original guards'])
    subprocess.run(['git', 'update-ref', code_branch, commit, PARENT], cwd=CHECKOUT, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=CHECKOUT, check=True)
    assert not output(['git', 'status', '--porcelain'])
    code_branch = output(['git', 'symbolic-ref', 'HEAD'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), code_branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit
    assert output(['git', 'rev-parse', 'HEAD'], USER) == user_head
    assert output(['git', 'status', '--porcelain'], USER) == user_status
    assert hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest() == user_diff
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'code_parents': CODE_PARENTS, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'alignment': ALIGNMENT, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(CONTROLS / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = json.loads(state_path.read_text())
    state['selected_closure_integration'].update({'state': 'Combined selected-query composition qualified locally/downstream, aligned to all finalized code/evidence parents, archived and committed locally. General region-operation closure and integrated pre-push remain open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue the full geometric operation-closure plan and run all pre-push checks on the integrated source before its publication. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
