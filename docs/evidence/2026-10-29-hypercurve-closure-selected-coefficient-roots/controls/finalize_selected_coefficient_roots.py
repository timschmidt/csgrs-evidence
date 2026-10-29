"""Admit selected-coefficient roots only after frozen owner/downstream validation."""
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
CHECKOUT = (ROOT / 'selected-coefficient-roots').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-coefficient-roots'
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
IMPLEMENTATION = set(json.loads((CONTROLS / 'selected-coefficient-roots-admission-prepared.json').read_text())['working_changes'])
ALIGNMENT = json.loads((CONTROLS / 'selected-coefficient-roots-parent-alignment.json').read_text())
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
assert CODE_PARENTS[0] == PARENT and len(CODE_PARENTS) == 1
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
    frontier_dir = CONTROLS / 'polynomial-operation-frontier-coefficient-roots-final1'
    frontier = json.loads((frontier_dir / 'complete.json').read_text())
    assert frontier['source_stable'] and frontier['source'] == ALIGNMENT['aligned'] and frontier['probe_count'] == 12
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    assert len(frontier_rows) == 14
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7 and all(row['exit_code'] in [0, 101] and row['source_stable'] for row in frontier_rows)
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused_dir = CONTROLS / 'selected-coefficient-roots-fix4'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 10
    preflight = json.loads((CONTROLS / 'selected-coefficient-roots-preflight-4/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    owner = json.loads((CONTROLS / 'selected-coefficient-roots-owners-3/complete.json').read_text())
    assert owner['all_passed'] and owner['groups'] == 3 and owner['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-coefficient-roots-baseline2/complete.json').read_text())
    assert baseline['missing_acceptance_reproduced'] and baseline['compile']['exit_code'] == 1
    readiness = ALIGNMENT['predecessor_admission']
    assert readiness['commit'] == PARENT and len(readiness['checks']) == 5 and all(x['exit_code'] == 0 for x in readiness['checks'])
    suites = {name: counts(run / (name + '.log')) for name in [
        'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal',
        'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
        'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack',
    ]}
    assert counts(focused_dir / 'selected_coefficient_root_preserves_its_equation_and_feeds_geometry.log')['passed'] == 1
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

    prefixes = ['selected-coefficient-roots-', 'polynomial-operation-frontier-coefficient-roots-final1', 'polynomial-operation-frontier-polynomial-chamfer-']
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
        'align_selected_coefficient_roots.py', 'finalize_selected_coefficient_roots.py',
        'prepare_selected_coefficient_roots_closeout.py', 'close_selected_coefficient_roots.py',
        'probe_polynomial_operations_coefficient_roots.py', 'polynomial-operation-frontier-tests.rs',
        'polynomial-chamfer-sections-tests.rs', 'polynomial-chamfer-construction-contract.json',
        'polynomial-chamfer-root-base.json', 'probe_polynomial_chamfer_frontier.py',
        'probe_polynomial_chamfer_root_frontier.py',
    }
    for path in CONTROLS.iterdir():
        if path.is_file() and ('selected_coefficient' in path.name or path.name.startswith('selected-coefficient-roots-')):
            if path.suffix in {'.py', '.rs', '.json', '.log', '.patch'}:
                controls.add(path.name)
    for name in sorted(controls):
        copy(CONTROLS / name, Path('controls') / name)
    for name in sorted(IMPLEMENTATION):
        copy(CHECKOUT / name, Path('source') / name)
    save(dest / 'excluded-artifacts.json', excluded)
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve selected coefficient queries, exact point definitions and SVG replay; Hypersolve selected fields, polynomial evaluation and root selection; HyperBRep native archive adapter',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'code_parents': CODE_PARENTS, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'owner_checks': owner,
        'baseline': baseline, 'frontier': frontier, 'source_alignment': ALIGNMENT, 'predecessor_admission': readiness,
        'domain': 'A nonzero univariate polynomial of arbitrary finite degree with ascending coefficients retained as rational point queries, including dependent and independent admitted algebraic selections. The output (z,0) retains an open singleton selector or a checked represented exact root. Symbolic coefficients require exact decisions.',
        'proof': 'Every coefficient source and original denominator is validated, including zero/trailing coefficients. Hypersolve common-field joins transport dependencies; strict singleton selection and original-equation residuals validate roots, including repeated factors. SVG point references and HyperBRep selected-parameter references preserve these dependencies; cold replay re-establishes them. Already admitted field values reuse structural zero/unit identities after alignment; public source recipes retain original guards and division validates its denominator.',
        'witnesses': 'Independent a>0,8a^2=1 and b>0,17b^5=1 select z^3+a*z-b=0, then definition replay, y^2=x and y=x^2 recover z. Repeated/opposite roots, degree17/nonmonic relations, exact/invalid selectors, 10^-12 separation, original poles and budget retry are covered. Fresh SVG and HyperBRep processes feed further geometry and derivatives; transform/restriction/reversal preserve the same source. Malformed unused native records are checked and repeated archive dependencies stay shared.',
        'retained_failures': 'The missing public definition was reproduced as E0599 on the base. The first draft exceeded 180 seconds in the unchanged original composition fixture; progress-only diagnostics completed at 195.59/191.30 seconds. After exact zero/unit arithmetic reuse, the unchanged fixture completes within 180 seconds. Harness setup errors and an exact parameter type error in an added transform test are retained separately from geometric outcomes.',
        'limits': 'All seven original implicit-region offset/corner fixtures remain Unsupported, while their three controls and two circle-section controls pass. General algebraic/singular region closure and total arithmetic, coefficient, expression, memory and cancellation bounds remain open. Full pre-push qualification is a separate gate.',
        'cost_scope': 'Raw completed-contract timings, peak RSS, source/artifact hashes, allocation lifetime controls and failed attempts are retained. Individual concurrent samples are not a universal speed claim. External process timeouts are not kernel BudgetExhausted outcomes.',
        'hardware': output(['lscpu', '--json']), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EVIDENCE_PARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', record], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EVIDENCE_PARENT, '-m', 'Record selected-coefficient root admission and native replay'], env=env)
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
    text = f"""
**2026-10-29 selected-coefficient root admission:** Eight focused curve cases,
the native wire regression and affected solver/archive cases pass. All 25
qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, strict MSRV
Clippy, minimal builds, strict docs/fuzz manifests, allocation lifetime checks,
the 325-row capability matrix and hygiene. Ignored cases remain separately
reported in the raw commands. The finalized integrated predecessor and its
evidence history are retained; only the three receipt files change afterward.

Evidence: {record}, SHA-256 {digest}. Original failures, complete source
attribution, shared-definition replay, completion costs and the seven remaining
region-operation blockers are retained. Those blockers are not completed
support. This local admission does not replace full pre-push qualification.

"""
    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'
    content = path.read_text()
    pending = 'The selected-coefficient root increment is in qualification.'
    assert content.count(pending) == 1
    content = content.replace(pending, 'The selected-coefficient root increment has passed local and downstream qualification.')
    assert text.splitlines()[1] not in content
    path.write_text(content + text)
    path = CHECKOUT / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    paragraph = f"""The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It extends the finalized integrated
selected-query evidence history. Eight focused curve cases and 25 complete
qualification groups pass, with native replay, malformed-input and shared
construction checks. Original missing/slow cases and seven remaining
region-operation blockers are retained. This record is unpushed.

"""
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
    commit = output(['git', 'commit-tree', tree, *parents, '-m', 'Retain exact roots over selected coefficient queries and native graph replay'])
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
    state['selected_coefficient_roots'].update({'state': 'Selected-coefficient root points qualified locally/downstream, aligned to finalized integration, archived and committed locally. General region-operation closure and full pre-push remain open.', 'qualification': None, 'closeout_controller': None, 'commit': result})
    state['remaining_runtime_work'] = 'Continue the full geometric operation-closure plan and run all pre-push checks on the integrated source before its publication. Parent full pre-push publication is independent; this increment requires full pre-push qualification before publication.'
    save(state_path, state)
    print(json.dumps(result, indent=2))
