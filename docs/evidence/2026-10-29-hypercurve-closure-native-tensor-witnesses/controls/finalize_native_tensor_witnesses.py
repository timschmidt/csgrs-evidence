"""Archive and commit the native witness correction after complete local qualification."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, re, subprocess, sys, time
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
C = ROOT / 'controls'
USER = ROOT.parents[1]
W = (ROOT / 'native-tensor-witnesses').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'native-tensor-witnesses'
PARENT = '146cc0804f478833decc8cda2b9bb66c4529e971'
EPARENT = 'f25a26281d409f115e4a2f8a8a95ab14d4fa3c8c'
IMPLEMENTATION = {'crates/hypersolve/CHANGELOG.md', 'crates/hypersolve/src/recursive_quadratic_field.rs', 'crates/hypersolve/tests/recursive_quadratic_field_signs.rs', 'crates/hypersolve/tests/recursive_quadratic_witnesses.rs'}
RECEIPTS = {'crates/hypersolve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
RUN = C / (NAME + '-qualification-final2')
RECORD = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
BRANCH = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'

def save(path, value): path.write_text(json.dumps(value, indent=2) + '\n')
def output(command, cwd=W, env=None): return subprocess.check_output(command, cwd=cwd, env=env, text=True).strip()
def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec); spec.loader.exec_module(result); return result

def counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(r[0] == 'ok' and r[2] == '0' for r in rows), path
    return {'suites': len(rows), **{k: sum(int(r[i]) for r in rows) for k, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

parser = argparse.ArgumentParser(); parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit']); args = parser.parse_args()
complete = json.loads((RUN / 'complete.json').read_text())
rows = json.loads((RUN / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 26
assert all(r['exit_code'] == 0 and r['source_stable'] for r in rows)
qualified = json.loads((RUN / 'source-before.json').read_text())
files = json.loads((RUN / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((RUN / 'source-after.json').read_text())
assert files == json.loads((RUN / 'files-after.json').read_text())
assert qualified['revision'] == PARENT and not qualified['untracked_inputs']
e = module('source_evidence', W / 'scripts/successive-operations.py')

def assert_qualified():
    current = e.source_snapshot()[1]
    assert [v for v in current if v[0] not in RECEIPTS] == [v for v in files if v[0] not in RECEIPTS], 'non-receipt source changed'

assert_qualified()
archive_path = C / (NAME + '-evidence-archive.json')
receipt_path = C / (NAME + '-receipt-prepared.json')
checks_path = C / (NAME + '-receipt-checks.json')
if args.action == 'archive':
    assert not archive_path.exists()
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    baseline = json.loads((C / (NAME + '-baseline1/complete.json')).read_text())
    baseline_rows = json.loads((C / (NAME + '-baseline1/results.json')).read_text())
    assert not baseline['all_passed'] and baseline['source']['revision'] == PARENT
    assert [r['exit_code'] for r in baseline_rows] == [0, 101, 101, 101]
    focused = json.loads((C / (NAME + '-fix1/complete.json')).read_text())
    assert focused['all_passed'] and focused['groups'] == 4
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', BRANCH]).returncode == 1
    stage = ROOT / (NAME + '-evidence-stage'); dest = stage / RECORD
    dest.mkdir(parents=True, exist_ok=False)
    retained = []
    def copy(source, relative):
        data = source.read_bytes(); target = dest / relative
        assert not target.exists(); target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})
    # Frozen command records and patches reconstruct the source from PARENT.
    # Compiled binaries, unrelated controls and the full session state stay out.
    suffixes = {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py'}
    for path in sorted(C.iterdir()):
        if path.name.startswith(NAME + '-'):
            if path.is_dir():
                for item in sorted(path.rglob('*')):
                    if item.is_file() and item.suffix in suffixes: copy(item, Path('runs') / path.name / item.relative_to(path))
            elif path.suffix in suffixes: copy(path, Path('controls') / path.name)
    for name in ['probe_native_tensor_witnesses.py', 'qualify_native_tensor_witnesses.py', 'finalize_native_tensor_witnesses.py', 'close_native_tensor_witnesses.py']:
        copy(C / name, Path('controls') / name)
    suites = {r['name']: counts(RUN / (r['name'] + '.log')) for r in rows if r['name'] in ['native-regressions', 'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal', 'curve-full', 'model-full'] or r['name'].startswith('dependent-')}
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypersolve RecursiveQuadraticValue::compute_exact_real_witness',
        'properties': ['P1', 'P4', 'P8', 'P15', 'P18', 'P19', 'P20', 'P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EPARENT,
        'contract': json.loads((C / (NAME + '-contract.json')).read_text()),
        'commands': rows, 'suites': suites, 'baseline': baseline, 'focused': focused,
        'proof': 'A fixed-prefix dense tensor block is independent of an unavailable generator when every coefficient of each positive power is a stored exact rational zero. Checked row-major slices prove that polynomial identity; the constant slice is evaluated recursively. No field, selected-source definition, branch, tensor or source guard is replaced.',
        'witnesses': 'Padded rational constants, exact reduction of 1+a^3 with a^3=2, both mixed axis orders, and retained nonzero coefficients of 2^-80. Original 2*sqrt(2)-sqrt(8) tests now require the exact zero witness. The additional 2*c*sqrt(2)-c*sqrt(8) case preserves the unwitnessed exact sign fallback.',
        'cache_and_cost': 'Only successful exact values enter the existing shared OnceLock. Unknown dependencies remain uncached. The new work scans existing tensor slices with checked indexing and allocates no additional representation graph. Timings and peak RSS are local completion samples, not a universal speed or total-work bound.',
        'limits': 'No new public carrier, format or mathematical support envelope is declared. Repeated polynomial chamfer, full polynomial SVG path replay and general operation closure remain separately qualified work. Full pre-push verification and publication are not established by this local admission.',
        'hardware': output(['lscpu', '--json']), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EPARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', RECORD], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EPARENT, '-m', 'Record native tensor witness regression and downstream admission'], env=env)
    subprocess.run(git + ['update-ref', BRANCH, commit, '0' * 40], check=True)
    archive = module('archive', W / 'scripts/evidence_archive.py'); archive.ROOTS = {RECORD: False}
    manifest = archive.manifest(str(EVIDENCE), commit); assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EPARENT, 'branch': BRANCH, 'record': RECORD, 'manifest_row': manifest[1], 'suites': suites})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text()); record, count, size, digest = archive['manifest_row'].split('\t'); suites = archive['suites']
    paragraph = f'''\n### Unused tensor generators (2026-10-29)\n\nThree acceptance tests fail on `{PARENT[:10]}` because exact zero padding\nrequires a witness for an unused source axis. The evaluator now scans the\npositive-power slices for stored exact zeros and evaluates the constant slice\nwhen the axis is unused. It retains the full native field and only caches\nsuccessful exact values. Mixed axis orders and coefficients of `2^-80` check\nthat a genuine dependency is never discarded.\n\nThe original `2*sqrt(2)-sqrt(8)` fixtures now require a zero witness. A new\n`2*c*sqrt(2)-c*sqrt(8)` fixture retains a genuinely used cubic source and\nchecks the exact sign fallback. All 26 local qualification groups pass,\nincluding {suites['native-regressions']['passed']} native regression tests, full\nHypersolve ({suites['solver-full']['passed']:,} passed), Hypercurve\n({suites['curve-full']['passed']:,} passed), CSGRS\n({suites['model-full']['passed']:,} passed), six downstream suites, strict MSRV\nClippy, minimal builds, docs and fuzz checks, allocation lifetime checks and\nthe existing capability matrix. Raw logs distinguish ignored tests.\n\nEvidence: `{record}`, SHA-256 `{digest}`. Original failures, source patches,\ncommands and local cost samples are retained. No repeated-chamfer completion,\nuniversal closure, total-work bound or publication is claimed by this record.\n'''
    path = W / 'crates/hypersolve/FUTURE_WORK.md'; content = path.read_text(); marker = '\n## Modular certificates for tower remainders\n'; assert content.count(marker) == 1
    path.write_text(content.replace(marker, paragraph + marker, 1))
    path = W / 'docs/evidence-archive.md'; content = path.read_text(); marker = '## Follow-on records\n\n'; assert marker in content and archive['commit'] not in content
    entry = f'''The local {BRANCH.removeprefix('refs/heads/')} branch ends at\n{archive['commit']}, adding {record} ({int(count):,} files,\n{int(size):,} bytes), SHA-256 {digest}. It records the reproduced unused-axis\nwitness failure, its exact correction and all 26 passing local qualification\ngroups. General operation closure and full pre-push verification remain open.\nThis evidence record is unpushed.\n\n'''
    path.write_text(content.replace(marker, marker + entry, 1))
    path = W / 'docs/evidence-archive.tsv'; excluded = [l for l in path.read_text().splitlines() if l.startswith('excluded:')]
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']]).splitlines()
    assert not any(l.startswith('excluded:') for l in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n'); assert_qualified()
    save(receipt_path, {'archive': archive, 'receipt_files': sorted(RECEIPTS), 'all_non_receipt_bytes_unchanged': True})
elif args.action == 'check':
    assert receipt_path.exists(); archive = json.loads(archive_path.read_text()); checks = []
    commands = [('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']), ('typos', ['typos']), ('budget', ['scripts/check-repository-budget.sh']), ('diff', ['git', 'diff', '--check']), ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']])]
    for name, command in commands:
        started = time.time()
        with (C / (NAME + '-receipt-' + name + '.log')).open('w') as log: result = subprocess.run(command, cwd=W, stdout=log, stderr=subprocess.STDOUT)
        checks.append({'name': name, 'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started})
        save(checks_path, checks); print(checks[-1], flush=True); assert result.returncode == 0
    assert_qualified(); save(C / (NAME + '-receipt-ready.json'), {'files': e.source_snapshot()[1], 'checks': checks})
else:
    assert receipt_path.exists(); checks = json.loads(checks_path.read_text())
    assert len(checks) == 5 and all(r['exit_code'] == 0 for r in checks)
    assert e.source_snapshot()[1] == json.loads((C / (NAME + '-receipt-ready.json')).read_text())['files']
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    user_state = lambda: (output(['git', 'rev-parse', 'HEAD'], USER), output(['git', 'status', '--porcelain'], USER), hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest())
    before = user_state()
    subprocess.run(['git', 'add', '--', *sorted(IMPLEMENTATION | RECEIPTS)], cwd=W, check=True)
    tree = output(['git', 'write-tree']); branch = output(['git', 'symbolic-ref', 'HEAD'])
    commit = output(['git', 'commit-tree', tree, '-p', PARENT, '-m', 'Recover exact native witnesses from zero-padded tensor axes'])
    subprocess.run(['git', 'update-ref', branch, commit, PARENT], cwd=W, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=W, check=True)
    assert not output(['git', 'status', '--porcelain'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit and before == user_state()
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(C / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'; state = json.loads(state_path.read_text()); state['native_tensor_witnesses'].update({'status': 'All 26 local groups passed; source and evidence committed locally. Full pre-push and geometric closure remain open.', 'commit': result}); save(state_path, state)
    print(json.dumps(result, indent=2))
