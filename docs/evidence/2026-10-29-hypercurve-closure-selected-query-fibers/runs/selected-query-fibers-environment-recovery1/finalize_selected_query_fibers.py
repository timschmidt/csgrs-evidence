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
CHECKOUT = (ROOT / 'selected-query-fibers').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-query-fibers'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/ordered_field_roots/complete.rs', 'crates/hypercurve/tests/support/rational_point_forms.rs', 'crates/hyperbrep/tests/selected_query_archive.rs', 'crates/hypercurve/src/curve_point/definition.rs', 'crates/hypercurve/qualification/capabilities.json', 'crates/hypercurve/src/finite_projection.rs', 'crates/hypercurve/src/polynomial_curve_abscissa.rs', 'crates/hypercurve/tests/support/polynomial_curves.rs', 'crates/hyperbrep/tests/support/polynomial_points.rs', 'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/src/svg/exact/graph/points.rs', 'crates/hypercurve/tests/support/selected_fiber_images.rs', 'crates/hypercurve/tests/fiber_point_incidence.rs', 'tests/svg_region_replay.rs', 'crates/hypersolve/src/ordered_field_roots.rs', 'crates/hypercurve/tests/selected_polynomial_points.rs', 'crates/hypercurve/tests/support/polynomial_sections.rs', 'crates/hypersolve/CHANGELOG.md', 'crates/hyperbrep/src/persistence/planar_points.rs', 'crates/hypercurve/tests/polynomial_query_fibers.rs', 'crates/hypercurve/tests/svg_point_replay.rs', 'crates/hypercurve/src/polynomial_point/joint.rs', 'crates/hypercurve/src/polynomial_curve.rs', 'crates/hypersolve/tests/selected_polynomial_root_discovery.rs', 'crates/hypercurve/src/polynomial_point.rs', 'crates/hypercurve/src/polynomial_point/selected_fiber.rs', 'crates/hypersolve/src/lib.rs', 'crates/hyperbrep/tests/support/rational_surface_evaluation.rs', 'crates/hypercurve/src/bezier_offset/selected_fiber/image_tests.rs', 'crates/hypercurve/tests/support/joint_form_arithmetic.rs', 'docs/MIGRATIONS.md', 'crates/hypercurve/src/bezier_offset/cusp_semicircle/incident_point.rs'}
POINT = json.loads((CONTROLS / 'selected-field-root-discovery-final-commit.json').read_text())
PARENT = POINT['commit']
EVIDENCE_PARENT = POINT['evidence_commit']
ALIGNMENT = json.loads((CONTROLS / 'selected-query-fibers-parent-alignment.json').read_text())



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
assert ALIGNMENT['root_parent'] == PARENT and ALIGNMENT['root_evidence'] == EVIDENCE_PARENT
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-query-fibers1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-query-fibers1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused_dir = CONTROLS / 'selected-query-fibers-fix4'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 12
    focus_rows = json.loads((focused_dir / 'results.json').read_text())
    assert len(focus_rows) == 12 and all(row['exit_code'] == 0 and row['source_stable'] for row in focus_rows)
    preflight = json.loads((CONTROLS / 'selected-query-fibers-preflight-2/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    owners = json.loads((CONTROLS / 'selected-query-fibers-owners-2/complete.json').read_text())
    assert owners['all_passed'] and owners['groups'] == 3 and owners['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-query-fibers-baseline2/complete.json').read_text())
    assert baseline['statuses'] == [0, 0, 0, 101]
    operation_baseline = json.loads((CONTROLS / 'selected-query-fibers-operation-baseline1/complete.json').read_text())
    assert operation_baseline['expected_failure_reproduced']
    integration_baseline = json.loads((CONTROLS / 'selected-closure-integration-baseline1/complete.json').read_text())
    assert integration_baseline['source'] == qualified and integration_baseline['expected_outcomes_reproduced']
    depth_rows = json.loads((CONTROLS / 'selected-query-fibers-fix2/results.json').read_text())
    assert [row['exit_code'] for row in depth_rows] == [0, 0, 0, 0, 101]
    suites = {name: counts(run / (name + '.log')) for name in [
        'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal',
        'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
        'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack',
    ]}
    assert counts(focused_dir / 'polynomial_branch_consumes_a_nested_selected_fiber_query.log')['passed'] == 1
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

    prefixes = ['selected-query-fibers-', 'polynomial-operation-frontier-query-fibers1', 'selected-closure-integration-baseline1']
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
        'prepare_selected_query_fibers_closeout.py', 'align_selected_query_fibers.py',
        'close_selected_query_fibers.py', 'finalize_selected_query_fibers.py',
        'probe_polynomial_operations_query_fibers.py', 'polynomial-operation-frontier-tests.rs',
        'probe_selected_closure_integration.py', 'selected-closure-integration-tests.rs',
        'selected-closure-integration-contract.json',
    }
    for path in CONTROLS.iterdir():
        if path.is_file() and ('query_fiber' in path.name or path.name.startswith('selected-query-fibers-')):
            if path.suffix in {'.py', '.rs', '.json', '.log', '.patch'}:
                controls.add(path.name)
    for name in sorted(controls):
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve point and polynomial-branch carriers; Hypersolve selected fields and shared ordered-field Sturm discovery; native SVG and HyperBREP persistence adapters',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'owners': owners,
        'baseline': baseline, 'operation_baseline': operation_baseline, 'depth_regression': depth_rows,
        'integration_gaps': integration_baseline,
        'frontier': frontier, 'source_alignment': ALIGNMENT,
        'domain': 'Already admitted finite polynomial graph branches evaluated at source-bound rational queries over retained selected algebraic point fields. Arbitrary finite fiber degree with represented finite root bounds and decidable exact field signs. Original native Bezier-base fibers remain supported. Original polynomial, parameter recipe, scalar chart, branch ordinal, domains and selectors remain authoritative.',
        'proof': 'Evaluate original query and denominator in its retained field; form fiber coefficients in that same field; use the existing complete Sturm root census and original slab ordinal; select a singleton over the original equation. Store the shared x/y field pair with the original PolynomialFiber definition. Native replay reconstructs and validates source dependencies and selectors. No coordinate materialization or duplicate polynomial arithmetic kernel is introduced.',
        'witnesses': 'u>0,8u^2=1; v>0,16v^3=u; evaluate positive y^2=x at x=v and prove 2048x^6=1, incidence and a further evaluation recovering v. Ten cases cover opposite/repeated/exact roots, degree17, authored/generated queries, rational geometry, trim/reversal/affine transport, 1/10^12 separation, operation-local diagnostics, small limits and retries, and cold native replay followed by another operation. The original depth-zero and operation-attribution failures are retained. HyperBREP cold archives consume the new fiber through a retained query in a further affine point construction.',
        'migration': 'PolynomialFiber.parameter changes from BezierParameter2 to CurveParameter2. Existing callers convert with into() or inspect as_bezier_parameter(); original native assertions remain. Existing SVG fiber and HyperBREP planar records admit retained query references. CHANGELOG and MIGRATIONS record the public source compatibility change.',
        'limits': 'Configured per-segment subdivision depth and shared refinement charges are enforced before publishing complete roots; exhausted attempts publish no partial list. Depth is not a total arithmetic, coefficient-growth, memory, elapsed-time or cancellation bound. Unrestricted discovery keeps its existing behavior. Native scalar fibers lacking query recipes and more general relative-coefficient geometry remain open. Seven original implicit-region offset/corner fixtures still return Unsupported with three controls passing. These are implementation gaps, not completed closure. Twenty-five local/downstream groups do not replace the full publication pre-push contract.',
        'cost_scope': 'Raw focused completion times, time-v peak RSS, source and artifact sizes, compiler settings and allocation lifetime controls are retained. No speedup or uniform practical bound is claimed.',
        'hardware': output(['lscpu', '--json']),
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record dependent polynomial query fibers and replay'], env=env)
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
    text = f'''**2026-10-29 dependent polynomial-query fibers:**
An exact source query v with v>0, 16v^3=u and u>0, 8u^2=1 could not be
consumed as the abscissa of y^2=x. The original source control passed and
branch evaluation returned Unsupported on the target revision. Hypercurve
now retains that query as the base of a polynomial fiber, reusing Hypersolve's
selected fields and complete Sturm discovery. The point keeps its original
equation, parameter recipe and selector alongside shared field coordinates.
Original branch domains, slab root counts and ordering still select the arc.

Ten acceptance cases pass. Independent relations include 2048x^6=1,
positive-root incidence and a further polynomial evaluation recovering the
original v. They cover repeated and opposite roots, exact events, degree17,
mixed authored/generated queries, rational evaluation, trim/reversal/affine
transport, 1/10^12 separation, certainty, cold native replay and further use.
HyperBREP archives also replay in a fresh process and feed another exact
affine point construction. Native-base fixtures retain their geometry and assertions.
PolynomialFiber.parameter now uses CurveParameter2; CHANGELOG and MIGRATIONS
document conversions and native query references.

A new zero-depth case exposed an ignored configured limit; the shared Sturm
implementation now enforces optional per-segment depth before publishing a
complete result. Exhaustion returns no partial roots and larger retries pass.
Another reproduced failure attributed invalid construction to Evaluation;
the diagnostic now retains Construction. Both failures and the original
unsupported chain remain archived alongside corrected results.

All 25 affected qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, strict
four-package MSRV Clippy, minimal checks, strict docs and both fuzz manifests,
allocation lifetime controls, capability checks and hygiene. Commands record
ignored tests separately. The qualified source is reconstructable from
retained revisions, patches and file inventories; only the finalized parent's
three receipt files change during alignment. Source, original failures,
completion times and peak RSS are in {record}, SHA-256 {digest}.
Receipt checks run after the final ledger edit. No speedup is claimed.

Seven original region offset/corner operations still return Unsupported with
three controls passing. Native scalar fibers without source-query recipes,
more general relative-coefficient geometry and general operation closure remain
open. Configured depth and refinement counts do not bound total arithmetic,
coefficient growth, memory, elapsed time or cancellation. This increment still
requires full pre-push verification before publication.

Two cross-increment witnesses also remain open on this isolated source:
the generated fiber's parameter is Unsupported in rational differentiation,
and a derived quotient recipe loses its original divisor pole guard and
incorrectly accepts that pole. Their source control passes. The separately
qualified derivative and guard fixes must be integrated and both original
witnesses must pass before this work is published. The failed integration
observations are retained in the same archive; they are not exact successes.

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
{int(size):,} bytes), SHA-256 {digest}. It records dependent polynomial fibers
over retained selected queries, ten exact/resource/replay cases and 25 affected
qualification groups. Original unsupported, depth-limit and error-attribution
failures, reconstruction patches and seven region blockers remain explicit.
General operation closure and publication are not claimed. This record is
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
    subprocess.run(['git', 'commit', '-m', 'Evaluate polynomial branches over retained selected queries'], cwd=CHECKOUT, check=True)
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
    state['selected_query_fibers'].update({'state': 'Dependent polynomial fibers qualified through owner/downstream suites, aligned to finalized root-discovery parent, archived and committed locally. General region-operation closure remains open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue general region-operation construction and integrate separately qualified increments. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
