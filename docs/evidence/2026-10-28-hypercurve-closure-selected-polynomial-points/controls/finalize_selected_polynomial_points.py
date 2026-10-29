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
CHECKOUT = (ROOT / 'selected-polynomial-points').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-polynomial-points'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/src/curve_point/rational.rs', 'crates/hypercurve/tests/selected_polynomial_points.rs', 'crates/hypercurve/src/polynomial_point.rs', 'crates/hyperbrep/tests/selected_query_archive.rs', 'crates/hypercurve/src/bezier_offset/polynomial_field.rs', 'crates/hyperbrep/docs/SUPPORT_MATRIX.md', 'crates/hypercurve/qualification/capabilities.json', 'crates/hypersolve/src/selected_polynomial_field/join.rs', 'crates/hypercurve/src/curve_point/definition.rs', 'crates/hypercurve/src/svg/exact/graph/points.rs', 'crates/hypercurve/src/bezier_split.rs', 'crates/hyperbrep/src/persistence/selection.rs', 'docs/MIGRATIONS.md', 'crates/hypercurve/src/finite_projection.rs', 'crates/hyperbrep/src/persistence/planar_points.rs', 'crates/hypercurve/tests/svg_point_replay.rs', 'crates/hyperbrep/src/persistence/admission/shapes.rs', 'crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs', 'crates/hypercurve/src/polynomial_point/joint.rs', 'crates/hypercurve/src/svg/exact/graph.rs', 'crates/hypercurve/src/lib.rs', 'crates/hypercurve/src/error.rs', 'crates/hyperbrep/docs/SELECTED_ARCHIVE.md', 'crates/hypercurve/src/selected_scalar.rs', 'crates/hypercurve/src/bezier_offset/projective_gauge_tests.rs', 'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/src/bezier_offset/rational_form.rs', 'crates/hypercurve/src/selected_query_scalar.rs', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json', 'crates/hypercurve/src/bezier_offset/recursive_quadratic.rs', 'crates/hypercurve/src/curve_scalar_chart.rs', 'crates/hypercurve/src/bezier_offset.rs', 'crates/hypercurve/src/svg.rs', 'crates/hypercurve/tests/support/joint_form_arithmetic.rs', 'crates/hypercurve/src/bezier_offset/algebraic_chord/tangent.rs', 'crates/hypersolve/tests/selected_polynomial_join_retention.rs', 'crates/hypercurve/src/curve_evaluation.rs', 'crates/hypercurve/src/selected_field.rs'}
PARENT = 'c57653e9963a199e88fdfddac3d60f5ff9b07351'
EVIDENCE_PARENT = '9700b7d8fd1124660c33a1059ebf321e968ce1f3'


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
run = CONTROLS / (NAME + '-qualification-final7')
complete = json.loads((run / 'complete.json').read_text())
rows = json.loads((run / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 24
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-points2/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == qualified
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-points2'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    derivatives = json.loads((CONTROLS / 'selected-query-derivative-frontier2/complete.json').read_text())
    assert derivatives['all_expected_outcomes_reproduced'] and derivatives['source'] == qualified
    assert derivatives['controls_passed'] == 1 and derivatives['unsupported_derivatives'] == 3
    focused = json.loads((CONTROLS / 'selected-polynomial-points-fix15/complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 30
    baseline = json.loads((CONTROLS / 'polynomial-point-composition-baseline5/complete.json').read_text())
    assert baseline['all_expected_outcomes_reproduced'] and baseline['composition'] == 'Unsupported'
    suite_names = ['selected-points', 'selected-join-retention', 'solver-full', 'solver-minimal', 'curve-full', 'model-full']
    suite_names += ['dependent-' + name for name in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
    suites = {name: counts(run / (name + '.log')) for name in suite_names}
    assert suites['selected-points']['passed'] >= 25
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

    prefixes = ['selected-point-regressions-', 'selected-point-gauges-', 'selected-point-predecessors-', 'selected-point-distinct-fiber-', 'selected-point-hole-parent-trace', 'selected-point-generated-lines-review', 'selected-point-quintic-review', 'selected-point-composed-review', 'selected-point-fillets-', 'selected-polynomial-points-', 'polynomial-point-composition-baseline5', 'selected-polynomial-join-retention-baseline', 'selected-query-restriction-baseline1', 'query-parameter-native-reexport-baseline1', 'polynomial-operation-frontier-points2', 'selected-query-layout-', 'selected-query-derivative-frontier']
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
    for name in ['selected-point-regressions-contract.json', 'selected-point-gauges-integration.json', 'integrate_selected_point_gauges.py', 'prepare_selected_point_gauge_qualification.py', 'apply_selected_point_gauge_owner_fix.py', 'probe_selected_point_regressions.py', 'probe_selected_point_gauge_owners.py', 'probe_selected_point_predecessors.py', 'preflight_selected_point_gauges.py', 'probe_distinct_fiber_product.py', 'probe_selected_point_hole_parent_trace.py', 'selected-point-generated-lines-contract.json', 'integrate_selected_point_generated_priority.py', 'fix_selected_point_generated_priority.py', 'probe_selected_point_tail.py', 'selected-point-quintic-contract.json', 'integrate_selected_point_quintic.py', 'probe_selected_point_fillets.py', 'selected-point-fillets-contract.json', 'finalize_selected_polynomial_points.py', 'close_selected_polynomial_points.py', 'qualify_selected_polynomial_points.py', 'probe_selected_polynomial_points.py', 'probe_polynomial_operations_points.py', 'selected-polynomial-points-contract.json', 'selected-polynomial-points-prepared.json', 'implement_selected_polynomial_points.py', 'add_selected_polynomial_point_tests.py', 'extend_selected_query_replay.py', 'probe_polynomial_point_composition_points.py', 'probe_query_parameter_native_reexport.py', 'query-parameter-native-reexport-test.rs', 'selected-polynomial-join-retention-tests.rs', 'selected-query-restriction-test.rs', 'polynomial-operation-frontier-tests.rs', 'probe_selected_query_derivative_frontier.py', 'selected-query-derivative-frontier-tests.rs']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve source-bound query points, selected parameters and native graph; Hypersolve selected-field ancestry',
        'properties': ['P1','P7','P12','P14','P15','P16','P18','P19','P20','P30'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'baseline': baseline, 'frontier': frontier, 'derivative_frontier': derivatives,
        'domain': 'Rational queries over admitted native and polynomial-fiber point fields, original guards and selected real roots; exact scalar charts, rational evaluation, restrictions, subdivision, transforms and native point/parameter replay in the named fixtures.',
        'proof': 'Query-pair points own both original sources and rational forms alongside common selected values. Hypersolve owns field joins, signs and enclosures. Query parameters retain their source recipe, including under native replay. Every native record validates typed backward references and original denominators, even when unused. Display midpoint samples use certified enclosures and never replace source authority. Native-base joins retain polynomial ancestry when no new axes or radicals require extension.',
        'witnesses': 'Independent cubic sum relation, equal and 2^-160-separated selections, zero original guards/divisors, dependent degree-21 coordinate, affine and rational evaluation, exact policy transitions/transforms, cold native point and parameter replay, restriction/reversal/split/reload, malformed references and depth refusal/retry, original-fiber native re-export, typed refinement and promotion refusal/retry, complementary enclosures and solver ancestry/field replay.',
        'native_completion': 'Existing native orientation uses its least-shared recursive projective field before general query-pair construction. Both original fillet witnesses and the subsequent chamfer-fillet-Boolean composition exceed60seconds on their prior candidates and pass under the fresh focused envelope; native orientation and circle residuals both reuse their established authority. Query-pair source alignment consumes its retained common field before optional coordinate equality, restoring the unchanged selected-quintic Boolean fixture; exact equality remains a fallback. Shared scalar, finite and batched chord dispatch consumes existing certified cardinal-support evidence before general field joining; all ten original generated-line cases complete. Initial refinement-only priority left the overlap case slow and is retained as an incomplete attempt. Construction-level projective normalization transports tangent signs through retained-support reversals and preserves signed cardinal imports. The original selected-trim Boolean/offset chain, collapsed-neck and material/hole cases pass with all assertions preserved. Three independent gauge fixtures cover signed weights, reversals and subsequent predicates. The distinct opposite-fiber fixture now requires certified defining relations, distinct sources and replay, with an explicit Unsupported-to-exact capability migration. Failed full suites, direct baseline contradictions and diagnostic attempts remain retained. Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.',
        'retained_failures': 'Initial Unsupported composition; native chain external 300-second timeout and stacks; scalar ancestry reproducer; missing native parameter encoding; missing finite projection dispatch; initial fixture compile errors and invalid empty-path control; valid imported query parameter that could not be re-exported. Original hard cases remain.',
        'downstream': 'Hyperbrep adds RationalQueryPair point and RationalForm parameter records, replaying through Hypercurve and charging both source records and all polynomial degrees/rows/coefficients before scalar decoding. Public model tests include fresh-process replay, another subdivision/save/reload, typed invalid original guards/selectors, exact inclusive metadata bounds and malformed-scalar precedence.',
        'layout': 'Rust 1.98.1 x86_64 CurveParameter2 size changes from 216 to 56 bytes and its range from 432 to 112 after placing the new immutable scalar behind Arc. These are object-layout observations; retained heap, allocation count and elapsed time are not inferred.',
        'limits': 'Shared promotion/refinement counters and native byte/depth bounds are not total work, coefficient growth, temporary/retained memory, wall-time or cancellation limits. No geometric approximation or universal completeness/performance claim. General selected parameter derivatives, polynomial region offsets/corners and arbitrary algebraic closure remain open. Complete pre-push verification of this increment is still required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record selected query point and parameter closure'], env=env)
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
    text = f'''**Selected polynomial point and parameter increment (2026-10-28).**
The independent cubic-root query sum now composes in a shared selected field.
Hypercurve retains both original point queries, selected roots and denominator
guards; Hypersolve remains the field, sign, join and enclosure authority. The
new parameter carrier feeds affine charts, rational evaluation, restriction,
reversal and subdivision without reconstructing independent coordinates.
Native point/query records replay original sources and guards, including unused
records. HyperBRep stores these points and rational parameter recipes through
the same planar authority, counting nested sources and polynomial metadata before
scalar decoding. Public model witnesses cover cold replay, further subdivision,
forged guards/selectors and inclusive admission limits with larger retries. Query parameters retain their declared authority after reload,
so the original-fiber restriction can be saved again. Display sampling consumes checked
enclosures while exact definitions remain authoritative. Exhausted query
refinement retains its typed cause through the SVG projection boundary.

The original native point chain initially hit an external 300-second timeout;
this was not typed geometric exhaustion. A reproduced scalar witness showed
that an unchanged native source union rebuilt polynomial ancestors. Reusing the
first native base through the existing foreign-field embedding preserves those
ancestors when no new radical is introduced. The original point chain and both
scalar ancestry witnesses now complete. Strict downstream Clippy also caught
avoidable inline scalar growth. Sharing that immutable scalar behind Arc reduces
CurveParameter2 from 216 to 56 bytes and its range from 432 to 112 on x86_64 with
Rust 1.98.1. This does not measure retained heap or execution time. Concurrent
qualification timings are not performance claims.

Full-suite review also reproduced regressions in two unchanged fillet cases,
a chamfer-fillet-Boolean composition and a selected-quintic Boolean fixture.
Native orientation and circle residuals now use their established field
authority before general query pairing. Query-pair alignment consumes its
common field before optional coordinate equality, retaining equality as a
fallback. All four earlier cases and the ten original generated-line cases are included
in the 30-group focused run, together with the three projective-gauge fixtures
and four reproduced full-suite regressions. Reversed support intersections now
transport their tangent sign before positive-weight normalization; cardinal
imports retain their actual gauge sign. The opposite-fiber capability migration
preserves the original fixture and requires stronger exact equations, separate
selectors, policy certainty and replay. Shared scalar, finite and batched chord dispatch
consumes existing certified cardinal-support evidence before the general
determinant; original overlap, restriction and reversal retain their meaning.
Matched parent/candidate/fix observations and the interrupted runs remain
archived; external timeouts are not typed geometry exhaustion or completion.

The focused witnesses cover the independent cubic-sum polynomial, equal roots,
2^-160-separated roots, a dependent degree-21 coordinate, original denominator
failures, exact policy transitions and transforms, rational evaluation, cold
native replay and further arithmetic. A retained parabola restriction completes
save/reload, reversal, split and another save/reload in a fresh process.
Malformed references, original guards, depth/promotion/refinement refusal and
larger retries remain explicit. Complementary enclosures preserve exact bounds.

All 24 affected qualification groups pass: full solver release
({suites['solver-full']['passed']:,} passed, {suites['solver-full']['ignored']} ignored),
minimal solver tests ({suites['solver-minimal']['passed']:,} passed), full
Hypercurve ({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed, {suites['model-full']['ignored']} ignored),
six downstream consumer suites, strict MSRV lint, minimal checks, denied-warning
docs, fuzz-target lint, allocation profiling, the capability matrix and hygiene.
The archive {record}, SHA-256 {digest}, retains source snapshots, commands,
logs, original baseline/review failures and the completed witnesses. The public
point-definition/error additions and rational-parameter recipe API are documented
in the changelog. HyperBRep documents its additive version-14 records; older
readers reject new variants while existing record encodings remain unchanged.

Shared promotion/refinement counts and native byte/depth limits do not bound
total arithmetic, coefficient growth, memory, elapsed time or cancellation.
Seven original polynomial region offset/corner operations still return
Unsupported, with all three controls passing on this revision. Three original
derivative success expectations also return Unsupported at generated query
parameters; the represented-parameter and evaluation control passes. General
query parameter derivatives and region/offset/corner closure remain open. No universal
closure or performance claim is made; full pre-push qualification of this
increment remains required. This entry supersedes earlier point-query and
native-parameter gaps only for its demonstrated domain.

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
{int(size):,} bytes), SHA-256 {digest}. It records selected query points and
parameters, cold native replay, restrictions and subsequent operations, exact
source guards, native-base retention and 24 affected qualification groups.
Original failures, resource limits and seven remaining region operation
blockers are retained. Full algebraic closure and publication are not claimed.
This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Preserve selected polynomial query points through exact replay'], cwd=CHECKOUT, check=True)
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
    state['selected_polynomial_points'].update({'state': 'Selected query points, scalar parameters, native replay, Hyperbrep archive integration and finite restriction chains qualified, archived and committed locally. General derivatives, region offsets/corners and complete closure remain open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue exact Hypercurve closure from the qualified selected point/parameter carrier. Parent full publication campaign is independent; this increment requires its own complete pre-push validation before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
