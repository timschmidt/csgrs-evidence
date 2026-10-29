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
CHECKOUT = (ROOT / 'selected-field-root-discovery').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-field-root-discovery'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = {'crates/hypersolve/src/lib.rs', 'crates/hypersolve/tests/selected_polynomial_root_discovery.rs', 'crates/hypersolve/src/ordered_field_roots.rs', 'crates/hypersolve/src/work_budget.rs', 'crates/hypersolve/CHANGELOG.md', 'crates/hypersolve/src/root_sign.rs', 'crates/hypersolve/src/ordered_field_roots/complete.rs'}
POINT = json.loads((CONTROLS / 'selected-polynomial-points-final-commit.json').read_text())
PARENT = POINT['commit']
EVIDENCE_PARENT = POINT['evidence_commit']
ALIGNMENT = json.loads((CONTROLS / 'selected-field-root-discovery-parent-alignment.json').read_text())



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
run = CONTROLS / (NAME + '-qualification-final5')
complete = json.loads((run / 'complete.json').read_text())
rows = json.loads((run / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 15
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
    frontier = json.loads((CONTROLS / 'polynomial-operation-frontier-roots1/complete.json').read_text())
    assert frontier['all_expected_outcomes_reproduced'] and frontier['source'] == ALIGNMENT['aligned']
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-roots1'
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused = json.loads((CONTROLS / 'selected-field-root-discovery-fix6/complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 14 and len(focused['tests']) == 11
    preflight = json.loads((CONTROLS / 'selected-field-root-discovery-preflight-5/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-field-root-discovery-baseline2/complete.json').read_text())
    assert baseline['all_expected_outcomes_reproduced']
    suites = {name: counts(run / (name + '.log')) for name in ['discovery','solver-full','solver-minimal','curve-consumers','model-consumers','brep-consumers']}
    assert suites['discovery']['passed'] >= 11
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

    prefixes = ['selected-field-root-discovery-', 'polynomial-operation-frontier-roots1']
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
    for name in ['finalize_selected_field_root_discovery.py', 'close_selected_field_root_discovery.py', 'align_selected_field_root_discovery.py', 'qualify_selected_field_root_discovery.py', 'run_selected_field_root_discovery_qualification.py', 'preflight_selected_field_root_discovery.py', 'probe_selected_field_root_discovery_candidate.py', 'probe_selected_field_root_baseline.py', 'probe_selected_field_root_discovery.py', 'probe_polynomial_operations_roots.py', 'selected-field-root-discovery-contract.json', 'selected-field-root-discovery-prepared.json', 'selected-field-root-discovery-prepared-original.json', 'selected-field-root-discovery-source-alignment.json', 'selected-field-root-discovery-seed.patch', 'selected-field-root-discovery-parent-alignment.json', 'selected-field-root-discovery-aligned-files.json', 'selected-field-complete-roots.rs', 'selected-field-root-discovery-extra-tests.rs', 'selected-field-root-discovery-context-tests.rs', 'polynomial-operation-frontier-tests.rs']:
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve ordered-field root discovery using the existing exact Sturm count, polynomial quotient and selected-field authority',
        'properties': ['P1','P7','P14','P18','P19','P20'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'baseline': baseline, 'frontier': frontier,
        'domain': 'Finite univariate polynomials over admitted exact ordered coefficient fields on finite represented closed intervals with lower < upper; arbitrary finite degree, algebraic coefficients, repeated/reducible/nonmonic relations and exact boundary roots. Exact field signs must be decidable; broader computable real expressions are not given a new decision guarantee.',
        'proof': 'Shared Sturm counts partition open intervals. Certified represented roots are temporarily deflated through the existing exact quotient. Ordered subdivisions retain original endpoint-root exclusions; only original-equation singleton selectors are published. Selected-field consumption retains original coefficients and multiplicity. No independent coordinate projection or new sign authority is introduced. The existing bounded Bernstein API is unchanged.',
        'witnesses': 'Original simple and repeated nested cubic discovery, original elliptic radius1/64 contact and side equations; nonmonic repeated endpoints/midpoint with irrational roots; algebraic degree drop and independent root joins;2^-160 separation; successful empty root set, zero equation and invalid interval; bounded remainder-context refusal distinct from actual shared-budget exhaustion, repeated larger retry; degree17 over an algebraic coefficient field; exact cold graph replay followed by further discovery and c^63=2.',
        'source_alignment': ALIGNMENT,
        'limits': 'Each dyadic subdivision charges a shared refinement unit. Root counts, coefficient growth, arithmetic, memory, cancellation and wall time are not bounded by this counter. Configured bounded remainder contexts can request a complete fallback. No partial list is published after refusal. Eleven named tests include the explicit fresh-process child; that child is also exercised by its parent. Fifteen qualification groups pass. Seven original geometric region operations remain Unsupported; this scalar discovery interface is not yet consumed by those geometric algorithms. General closure and full pre-push qualification remain open.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record complete ordered-field root discovery'], env=env)
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
    text = f'''**2026-10-28 selected-field root-discovery increment:**
The original fast isolator declined both t^3-a and (t^3-a)^2 with a^3=2,
while the original elliptic contact control completed. These outcomes were
reproduced on the target source before implementation. Hypersolve now supplies
a separate complete ordered-field discovery entry point using its existing
Sturm distinct-root count and exact quotient. The bounded Bernstein API keeps
its existing contract. No new sign kernel or independent coordinate projection
is introduced.

The new route admits finite polynomial degree, repeated/reducible/nonmonic
relations, algebraic coefficients, exact boundary and midpoint roots, and
degree drops. Search ranges require lower < upper, matching the existing
Bernstein entry point; reversed and zero-width ranges are explicitly invalid. Certified temporary deflation never replaces the original
equation used by later selection. Nonpoint selectors exclude separately
reported roots at their endpoints. Ordered subdivision preserves root order
without approximate sorting. Exact field decisions must complete; this does
not give arbitrary computable real expressions a decision guarantee.

Eleven named tests include a fresh-process child. Independent expectations
cover nested cubic relations, the original elliptic curve/distance/side
equations, multiplicity and endpoint exclusion, field degree drop and root
joins, 2^-160 separation, zero/rootless/invalid outcomes, degree17 over an
algebraic field, cold replay and a further construction proving c^63=2.
Original discovery failures remain archived. Bounded remainder-context refusal
is distinguished from an actual denied refinement charge. Small-budget runs
publish no partial list and larger retries succeed repeatedly.

All 15 affected qualification groups pass: full Hypersolve
({suites['solver-full']['passed']:,} passed,
{suites['solver-full']['ignored']} ignored), minimal solver tests, selected
curve/model/native archive consumers, strict four-package MSRV Clippy, denied-
warning docs and solver fuzz lint, the allocation lifetime control and hygiene.
The qualified source is reconstructable from retained base/seed/candidate
patches and file inventories. Only the finalized point parent's three receipt
files changed during alignment. Commands, logs and source snapshots are in
{record}, SHA-256 {digest}. Receipt checks run after the final ledger edit.

Seven original polynomial region offset/corner operations still return
Unsupported, with their three controls passing. Geometric algorithms do not
yet consume this new scalar discovery interface. Shared subdivision counts do
not bound total arithmetic, coefficient growth, memory, elapsed time or
cancellation. Configured bounded contexts can still request a complete
fallback. General operation closure and full pre-push verification of this
increment remain open.

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
{int(size):,} bytes), SHA-256 {digest}. It records complete ordered-field
root discovery, eleven named exact/resource/replay tests and 15 affected
qualification groups. Original declined discovery cases, reconstruction
patches and seven geometric region blockers remain explicit. General operation
closure and publication are not claimed. This record is unpushed.

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
    subprocess.run(['git', 'commit', '-m', 'Isolate repeated roots over retained exact coefficient fields'], cwd=CHECKOUT, check=True)
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
    state['selected_field_root_discovery'].update({'state': 'Complete ordered-field root discovery qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General geometric region integration remains open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue geometric construction from the committed exact selected-field discovery interface. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
