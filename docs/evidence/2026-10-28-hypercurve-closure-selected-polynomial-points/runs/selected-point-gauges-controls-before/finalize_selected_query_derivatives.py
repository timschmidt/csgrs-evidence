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
CHECKOUT = (ROOT / 'selected-query-derivatives').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-query-derivatives'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypercurve/src/curve.rs','crates/hypercurve/src/curve_evaluation.rs','crates/hypercurve/src/selected_query_scalar.rs','crates/hypercurve/tests/selected_query_derivatives.rs','crates/hypercurve/qualification/capabilities.json','crates/hypercurve/CHANGELOG.md'}
POINT = json.loads((CONTROLS / 'selected-polynomial-points-final-commit.json').read_text())
PARENT = POINT['commit']
EVIDENCE_PARENT = POINT['evidence_commit']
ALIGNMENT = json.loads((CONTROLS / 'selected-query-derivatives-parent-alignment.json').read_text())



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
run = CONTROLS / (NAME + '-qualification-final6')
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
record = 'docs/evidence/2026-10-28-hypercurve-closure-' + NAME
branch = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-28'

if args.action == 'archive':
    assert not archive_path.exists()
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-derivatives1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-derivatives1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused = json.loads((CONTROLS / 'selected-query-derivatives-fix9/complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 14
    preflight = json.loads((CONTROLS / 'selected-query-derivatives-preflight-7/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-query-derivatives-baseline1/complete.json').read_text())
    assert baseline['all_expected_outcomes_reproduced'] and baseline['unsupported_derivatives'] == 3
    suite_names = ['selected-derivatives', 'predecessors', 'curve-full', 'model-full']
    suite_names += ['dependent-' + name for name in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
    suites = {name: counts(run / (name + '.log')) for name in suite_names}
    assert suites['selected-derivatives']['passed'] == 12
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

    prefixes = ['selected-query-derivatives-', 'polynomial-operation-frontier-derivatives1']
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
    for name in ['finalize_selected_query_derivatives.py', 'close_selected_query_derivatives.py', 'qualify_selected_query_derivatives.py', 'run_selected_query_derivatives_qualification.py', 'preflight_selected_query_derivatives.py', 'probe_selected_query_derivatives.py', 'probe_selected_query_derivatives_baseline.py', 'probe_polynomial_operations_derivatives.py', 'align_selected_query_derivatives.py', 'selected-query-derivatives-contract.json', 'selected-query-derivatives-prepared.json', 'selected-query-derivatives-seed.patch', 'selected-query-derivatives-parent-alignment.json', 'selected-query-derivatives-aligned-files.json', 'selected-query-derivative-frontier-tests.rs', 'selected-query-derivative-budget-probe.rs', 'polynomial-operation-frontier-tests.rs', 'selected-query-derivatives-qualification-final6-controller.json', 'selected-query-derivatives-catalog-review.json']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve rational derivative recurrence, retained query scalar and native/source chart dispatch',
        'properties': ['P1','P7','P14','P15','P16','P18','P19','P20','P30'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'alignment': ALIGNMENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'baseline': baseline, 'frontier': frontier,
        'domain': 'Admitted rational source spans at source-bound rational query parameters over selected native/polynomial point fields, finite derivative orders, authored spline chart scales, retained domains and explicit side selection.',
        'proof': 'The existing rational derivative recurrence differentiates original source polynomials before evaluation. A shared rational pullback maps point and derivative images into the original correlated point authority, preserving original guards. Order k carries the kth power of the native chart scale. Restrictions and reversal retain their source chart. No independent scalar-root materialization or second derivative recurrence is introduced.',
        'witnesses': 'Twelve fixtures include original native/retained parabola and rational quotient failures; degree-seven source and order-nine derivatives despite a locally constant polynomial value; order-six Mobius derivatives; nonunit NURBS charts; one-sided knot slopes and Automatic Boundary; domain and original-pole rejection even at zero order; zero-promotion proof reuse, actual refinement exhaustion, fresh replay promotion refusal and repeated larger retry; strict/approximate policy transitions; similarity and cold replay followed by further parameter/evaluation/derivative consumption.',
        'retained_failures': 'All original baseline successes/failures are retained, along with fixture compilation mistakes, two strict-Clippy needless borrows, and the incorrect expectation that a reusable field must spend a promotion. A source-attributed probe measured zero-promotion reuse and fresh replay charges; the corrected fixture preserves reuse as exact success and requires exhaustion only when an actual unit is denied.',
        'resource_scope': 'Fresh replay of the named three-derivative chain measured four refinements and four promotions; reuse measured two refinements and zero promotions. These observations are not universal costs or total-work bounds. Per-fixture external time and RSS observations are recorded separately from typed geometric resource outcomes. No comparative runtime or total-memory improvement is claimed.',
        'source_alignment': 'Qualification used an isolated checkpoint with source identical to the point candidate. After both increments qualified, only the three finalized point receipts were copied while retaining every derivative byte. The seed patch, base revision, qualified patch, file inventories and alignment proof make the qualified source reconstructable without a private Git reference.',
        'limits': 'General selected parallel derivatives, singular implicit charts, polynomial region offsets/corners, total work/coefficient/recipe growth and memory/cancellation contracts remain open. The seven original region operation blockers are reproduced after alignment. No universal closure or published-package completeness claim; complete pre-push verification of this increment remains required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record selected query derivative closure'], env=env)
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
    text = f'''**Selected query derivative increment (2026-10-28).**
Rational source spans now consume source-bound query parameters for derivatives.
The original native and retained parabola cases and rational quotient case were
reproduced as Unsupported on source identical to the point increment before
implementation. Hypercurve reuses its existing rational derivative recurrence:
it differentiates original source polynomials before evaluating in the selected
joint field. Point and derivative images share one rational pullback that keeps
original roots, source recipes and denominator guards. Native spline charts
apply the kth power of their affine scale; restrictions and reversal keep the
source parameter convention. This does not complete general parallel or singular
implicit derivatives or geometric region operations.

Twelve focused witnesses pass. Independent expectations include the parabola
jet, quotient rule, monomial falling factorials through order nine, factorial
Mobius derivatives through order six, a knot domain [2,5], explicit one-sided
knot slopes and similarity linear parts. A polynomial value becoming constant
at a selected root does not make its source derivative zero. Original poles
and out-of-domain queries remain invalid even at zero order. A fresh process
replays a restricted curve and derivative point, then uses the derivative
coordinates as another evaluation and derivative parameter and saves again.

The initial zero-promotion fixture incorrectly expected proof reuse to fail.
The retained probe measured two refinements and zero promotions for reuse;
fresh definition replay plus three derivatives used four refinements and four
promotions. Both original source/logs remain. The corrected tests preserve
zero-promotion exact success, require typed refusal of an actual refinement or
promotion charge, and repeat larger-budget retries without cache poisoning.
Strict and approximate-policy requests in this exact corpus remain certified.
The unrepresentable usize::MAX order is an implementation size refusal, not
claimed configured resource exhaustion. No artificial charge was added.

All 20 affected qualification groups pass: full Hypercurve
({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), the original derivative/point/native
predecessors, six downstream consumer suites, strict MSRV Clippy, minimal checks,
denied-warning docs, curve fuzz-target lint, the full capability matrix and
hygiene. Qualification used an isolated checkpoint; after the point increment
was finalized, only its three receipt files changed. Every implementation/test
byte matches the qualified source. The seed/base patches, file inventories and
alignment proof are retained in {record}, SHA-256 {digest}, with original
failures and all commands/logs. Receipt checks run after the final documentation
edit. No public type or archive format addition is needed for this increment.

Seven original polynomial region offset/corner operations still return
Unsupported after alignment, while all three controls pass. Shared refinement
and promotion counts do not bound total arithmetic, coefficient/expression
size, memory, elapsed time or cancellation. Concurrent test timings do not prove
a performance improvement. This supersedes the earlier query-derivative gap
only for its demonstrated domain; the full closure plan and pre-push qualification
of this new increment remain open.

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
{int(size):,} bytes), SHA-256 {digest}. It records source-preserving rational
query derivatives, twelve exact/domain/resource/replay witnesses and 20 affected
qualification groups. Source checkpoints are reconstructable from retained
base/seed/qualified patches; receipt-only parent alignment preserves every
implementation byte. Original failures and seven region operation blockers
remain explicit. Full closure and publication are not claimed. This record is
unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Differentiate rational spans at retained selected query parameters'], cwd=CHECKOUT, check=True)
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
    state['selected_query_derivatives'].update({'state': 'Selected query rational derivatives qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General implicit/parallel/region operations remain open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue exact operation closure from the committed query derivative carrier. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
