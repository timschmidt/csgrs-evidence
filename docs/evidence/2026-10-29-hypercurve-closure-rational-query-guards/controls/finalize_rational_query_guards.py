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
CHECKOUT = (ROOT / 'rational-query-guards').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'rational-query-guards'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypercurve/src/curve_point/rational/arithmetic.rs', 'crates/hypercurve/tests/rational_query_guards.rs', 'crates/hypercurve/qualification/capabilities.json', 'crates/hypercurve/CHANGELOG.md'}
POINT = json.loads((CONTROLS / 'selected-polynomial-points-final-commit.json').read_text())
PARENT = POINT['commit']
EVIDENCE_PARENT = POINT['evidence_commit']
ALIGNMENT = json.loads((CONTROLS / 'rational-query-guards-parent-alignment.json').read_text())



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
run = CONTROLS / (NAME + '-qualification-final2')
complete = json.loads((run / 'complete.json').read_text())
rows = json.loads((run / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 20
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-guards1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-guards1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused = json.loads((CONTROLS / 'selected-point-fillets-query-guards-fix5/complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 6
    preflight = json.loads((CONTROLS / 'rational-query-guards-preflight-2/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-point-fillets-query-guards-baseline1/complete.json').read_text())
    assert not baseline['all_passed'] and baseline['groups'] == 3
    baseline_rows = json.loads((CONTROLS / 'selected-point-fillets-query-guards-baseline1/results.json').read_text())
    assert [row['exit_code'] for row in baseline_rows] == [0, 0, 101]
    suite_names = ['rational-guards', 'predecessors', 'curve-full', 'model-full']
    suite_names += ['dependent-' + name for name in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
    suites = {name: counts(run / (name + '.log')) for name in suite_names}
    assert suites['rational-guards']['passed'] >= 5
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

    prefixes = ['rational-query-guards-', 'selected-point-fillets-query-guards-', 'polynomial-operation-frontier-guards1']
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
    for name in ['finalize_rational_query_guards.py', 'close_rational_query_guards.py', 'qualify_rational_query_guards.py', 'run_rational_query_guards_qualification.py', 'preflight_rational_query_guards.py', 'probe_selected_point_fillets.py', 'probe_polynomial_operations_guards.py', 'align_rational_query_guards.py', 'prepare_rational_query_guards_closeout.py', 'rational-query-guards-contract.json', 'rational-query-guards-prepared.json', 'rational-query-guards-seed.patch', 'rational-query-guards-parent-alignment.json', 'rational-query-guards-aligned-files.json', 'rational-query-guards-extra-tests.rs', 'polynomial-operation-frontier-tests.rs', 'rational-query-guards-qualification-final2-controller.json']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve source-bound rational query arithmetic and scalar recipe replay',
        'properties': ['P1','P7','P14','P18','P19','P20','P26'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'alignment': ALIGNMENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'baseline': baseline, 'baseline_rows': baseline_rows, 'frontier': frontier,
        'domain': 'Division of admitted exact source-bound rational queries, preserving both original denominator guards through scalar recipes and native point/parameter replay. Original guards and divisor numerator must be nonzero at the selected source.',
        'proof': 'The quotient a/d divided by b/e previously exported a*e/(d*b), which omitted the original e guard from its denominator. Multiplying numerator and denominator by e preserves the exact value and the original exclusion. If d and e are structurally identical, the existing d factor already preserves the guard. Original source selectors and live operands remain retained; no new scalar kernel or format record is introduced.',
        'witnesses': 'Five named fixtures preserve the exact cubic quotient relation, reject rebinding its recipe to the original divisor pole, preserve both distinct and shared denominator guards under strict/approximate/strict policy, keep zero divisors invalid, require actual zero-refinement-budget refusal with repeated larger retries, and exercise cold native SVG replay, exact selected endpoint identity, subdivision and another save/reload. The independent endpoint relation is 3t^3-6t^2+6t-2=0, with curve coordinates (t,t^2).',
        'retained_failures': 'The original exact-value control passes while replay at the original divisor pole incorrectly succeeds. Baseline source, patch and failing assertion are retained. A later fixture compilation error used an unsupported integer-to-parameter conversion; its log and corrected explicit Real construction remain recorded.',
        'resource_scope': 'The denominator guard is retained algebraically; original source and budget authorities remain in use. Per-fixture elapsed time and RSS are observations, not a general performance improvement or total resource bound. Guard polynomial growth, complete arithmetic work, memory and cancellation limits remain unqualified.',
        'source_alignment': 'Qualification used a private point checkpoint. Only the finalized point parents three receipt files change during alignment; every guard implementation and fixture byte remains identical. Base/seed/candidate patches and file digests reconstruct the qualified source.',
        'limits': 'No new general region offset, corner or algebraic-root-point capability is claimed. Seven original region operation blockers remain after alignment. Full pre-push verification of this increment is still required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record original rational quotient guards'], env=env)
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
    text = f'''**Rational quotient guard increment (2026-10-29).**
A source-bound quotient now preserves the original divisor denominator in its
exported scalar recipe. The baseline kept the exact value of a/d divided by
b/e, but exporting a*e/(d*b) discarded e as a guard: rebinding a valid cubic
source to the original divisor pole incorrectly succeeded. The correction
retains e in both numerator and denominator. An already shared denominator
keeps that guard once. Original source selectors, operands and typed failures
remain authoritative; no new scalar kernel or archive record is introduced.

Five named witnesses pass. They check an independent cubic quotient identity,
both distinct and shared original guards, a zero divisor, strict/approximate/
strict certainty, actual refinement-budget refusal and repeated larger retries.
A fresh process replays a restricted parabola at the selected parameter t,
proves 3t^3-6t^2+6t-2=0 and y=t^2, subdivides with a shared exact endpoint, then
saves and reloads again. Replayed recipes still reject the original divisor
pole. The original failing witness and subsequent fixture compilation error
remain in the evidence; no assertion or policy was weakened.

All 20 affected qualification groups pass, including full Hypercurve
({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), six downstream consumer suites,
strict MSRV Clippy, minimal builds, denied-warning docs, fuzz-target lint,
the full capability matrix and hygiene. Only the finalized point parent's
three receipt files changed after qualification; implementation and fixture
bytes remain identical. Commands, raw logs, source inventories and patches
are retained in {record}, SHA-256 {digest}. Receipt checks follow the final
documentation edit.

The seven original polynomial region offset/corner blockers remain Unsupported,
and three controls still pass. Refinement and promotion counters do not bound
total work, guard-polynomial growth, memory or cancellation. No general speed,
universal closure or publication claim is made. Complete pre-push qualification
of this increment remains required.

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
{int(size):,} bytes), SHA-256 {digest}. It records preservation of original
rational quotient guards through scalar recipes and native replay, five named
witnesses and 20 affected qualification groups. Source checkpoints are
reconstructable from retained patches and inventories; receipt-only parent
alignment preserves implementation bytes. The original failure and seven
region operation blockers remain explicit. This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Preserve original divisor guards in rational query recipes'], cwd=CHECKOUT, check=True)
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
    state.setdefault('rational_query_guards', {}).update({'state': 'Original rational divisor guards qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General operation closure remains open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue exact operation closure with the guarded query carrier. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
