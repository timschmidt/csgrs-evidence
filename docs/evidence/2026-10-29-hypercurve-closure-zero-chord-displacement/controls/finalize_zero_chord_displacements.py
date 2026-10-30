"""Archive and commit the zero-distance correction after integrated qualification."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, re, subprocess, sys, time
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
C = ROOT / 'controls'
USER = ROOT.parents[1]
W = (ROOT / 'polynomial-chamfer-dispatch').resolve()
ISOLATED = (ROOT / 'zero-chord-displacement').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'zero-chord-displacement'
PRIOR = json.loads((C / 'selected-chord-composition-final-commit.json').read_text())
PARENT = PRIOR['commit']
EPARENT = PRIOR['evidence_commit']
IMPLEMENTATION = {'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json',
                  'crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs',
                  'crates/hypercurve/tests/zero_chord_displacements.rs'}
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
RUN = C / (NAME + '-qualification-final1')
RECORD = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
BRANCH = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'

def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')

def output(command, cwd=W, env=None):
    return subprocess.check_output(command, cwd=cwd, env=env, text=True).strip()

def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result

def counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows)
                                  for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

parser = argparse.ArgumentParser()
parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit'])
args = parser.parse_args()
complete = json.loads((RUN / 'complete.json').read_text())
rows = json.loads((RUN / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 21
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((RUN / 'source-before.json').read_text())
files = json.loads((RUN / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((RUN / 'source-after.json').read_text())
assert files == json.loads((RUN / 'files-after.json').read_text())
assert qualified['revision'] == PARENT and not qualified['untracked_inputs']
e = module('source_evidence', W / 'scripts/successive-operations.py')

def assert_qualified():
    current = e.source_snapshot()[1]
    assert [v for v in current if v[0] not in RECEIPTS] == [v for v in files if v[0] not in RECEIPTS]

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
    assert not baseline['all_passed'] and baseline['source']['revision'] == '6296155cf7f04936215f375989dd175ab797eb24'
    assert 'test result: FAILED. 0 passed; 2 failed;' in (C / (NAME + '-baseline1/acceptance.log')).read_text()
    focused = json.loads((C / (NAME + '-fix3/complete.json')).read_text())
    assert focused['all_passed']
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', BRANCH]).returncode == 1
    stage = ROOT / (NAME + '-evidence-stage')
    dest = stage / RECORD
    dest.mkdir(parents=True, exist_ok=False)
    retained = []
    def copy(source, relative):
        data = source.read_bytes()
        target = dest / relative
        assert not target.exists()
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        retained.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})
    suffixes = {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py', '.svg'}
    for directory in [RUN, *(C / (NAME + '-' + suffix) for suffix in ['baseline1', 'fix1', 'fix2', 'fix3']), C / 'zero-selected-chord-projection1']:
        for path in sorted(directory.rglob('*')):
            if path.is_file() and path.suffix in suffixes:
                copy(path, Path('runs') / directory.name / path.relative_to(directory))
    names = ['zero_chord_displacements.rs', 'zero_selected_chord_projection.rs',
             'probe_zero_chord_displacements.py', 'qualify_zero_chord_displacements.py',
             'integrate_zero_chord_displacements.py', 'finalize_zero_chord_displacements.py',
             'close_zero_chord_displacements.py', 'selected-chord-composition-zero-bounds-review.json']
    paths = {C / name for name in names}
    paths |= {path for path in C.glob(NAME + '-*') if path.is_file() and path.suffix in suffixes}
    for path in sorted(paths):
        copy(path, Path('controls') / path.name)
    suites = {row['name']: counts(RUN / (row['name'] + '.log')) for row in rows
              if row['name'] in ['acceptance', 'repeat-chamfer', 'curve-full', 'model-consumers', 'minimal-bounds']
              or row['name'].startswith('dependent-')}
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve BezierAlgebraicChordParallelPoint2::conservative_bounds_refined_impl',
        'properties': ['P15', 'P17', 'P18', 'P19', 'P20', 'P25', 'P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EPARENT,
        'contract': json.loads((C / (NAME + '-contract.json')).read_text()),
        'integration': json.loads((C / (NAME + '-integration.json')).read_text()),
        'commands': rows, 'suites': suites, 'baseline': baseline, 'focused': focused,
        'proof': 'After policy and source validation, a stored exact zero distance makes the point exactly its original endpoint or explicit origin plus translation. Transporting the origin enclosure by that exact translation preserves containment without computing a tangent or normal. Both local and ordinary enclosure paths use the same correction. Every nonzero-distance branch remains unchanged.',
        'witnesses': 'Direction (2^-1100,2^-1100), rational and selected cube-root coordinates, both traversal directions, tangent/normal choices, both endpoints, explicit origins and exact translation. Fresh SVG replay retains the original displacement and source, validates exact source endpoint identity and re-exports; the original unwrapped source is a positive control.',
        'resources': 'No new cache or retained representation is added. The branch requests only the original origin enclosure and exact translations. Timings are local completion samples; they are not universal performance or total-resource bounds.',
        'limits': 'This closes the zero-distance bounds/replay gap named in the preceding admission. It does not establish nonzero displacement completion for every tiny source, general implicit operations, complete pre-push verification or publication.',
        'hardware': output(['lscpu', '--json']), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EPARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', RECORD], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EPARENT, '-m', 'Record zero-distance chord bounds and native replay admission'], env=env)
    subprocess.run(git + ['update-ref', BRANCH, commit, '0' * 40], check=True)
    archive = module('archive', W / 'scripts/evidence_archive.py')
    archive.ROOTS = {RECORD: False}
    manifest = archive.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EPARENT, 'branch': BRANCH, 'record': RECORD,
                       'manifest_row': manifest[1], 'suites': suites})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    record, count, size, digest = archive['manifest_row'].split('\t')
    suites = archive['suites']
    paragraph = f'''\n## Zero-distance chord bounds (2026-10-29)\n\nThis closes the separate bounds/export gap recorded by the preceding selected\nchord admission. On clean `6296155cf7`, both new tests fail with `Ordering`\nfor a nonzero direction `(2^-1100, 2^-1100)`: the original line exports, while\na zero-distance displacement requires an unnecessary unit direction. After\nsource and policy validation, bounds now translate the original endpoint or\nexplicit origin enclosure directly when the distance is exactly zero.\nThe original definition remains authoritative and nonzero-distance guards\nremain unchanged. No new cache or retained carrier is introduced.\n\nTests cover rational and selected cubic coordinates, both directions and\nendpoints, reversal, explicit origins and translation. Fresh-process SVG replay\nretains the original source and displacement, checks exact source endpoint\nidentities, and exports again. Bounds use the independent zero-distance\nidentity; display coordinates and serialized bytes are not equality oracles.\n\nAll 21 affected groups pass on the combined source after `{PARENT[:10]}`,\nincluding the new and prior displacement witnesses, the original repeated\nchamfer within 180 seconds, full Hypercurve ({suites['curve-full']['passed']:,}\npassed), modeling export consumers, six downstream suites, strict MSRV Clippy,\nminimal builds, strict docs/fuzz checks and the selected capability matrix.\nLogs retain ignored-test counts and local timing/RSS samples. Evidence:\n`{record}`, SHA-256 `{digest}`. Original failures and source attribution are\nretained. General implicit closure, nonzero tiny-source normalization and full\npre-push qualification remain separate.\n'''
    path = W / 'crates/hypercurve/FUTURE_WORK.md'
    content = path.read_text()
    assert paragraph.splitlines()[1] not in content
    path.write_text(content.rstrip() + '\n' + paragraph)
    path = W / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    entry = f'''The local {BRANCH.removeprefix('refs/heads/')} branch ends at\n{archive['commit']}, adding {record} ({int(count):,} files,\n{int(size):,} bytes), SHA-256 {digest}. It retains both original zero-distance\nbounds/replay failures, the origin-enclosure correction, fresh-process native\nreplay and all 21 passing affected qualification groups on the integrated\nsource. Full pre-push qualification and general closure remain open.\nThis evidence record is unpushed.\n\n'''
    path.write_text(content.replace(marker, marker + entry, 1))
    path = W / 'docs/evidence-archive.tsv'
    excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']]).splitlines()
    assert not any(line.startswith('excluded:') for line in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n')
    assert_qualified()
    save(receipt_path, {'archive': archive, 'receipt_files': sorted(RECEIPTS), 'all_non_receipt_bytes_unchanged': True})
elif args.action == 'check':
    assert receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    checks = []
    commands = [('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']), ('typos', ['typos']),
                ('budget', ['scripts/check-repository-budget.sh']), ('diff', ['git', 'diff', '--check']),
                ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']])]
    for name, command in commands:
        started = time.time()
        with (C / (NAME + '-receipt-' + name + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=W, stdout=log, stderr=subprocess.STDOUT)
        checks.append({'name': name, 'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started})
        save(checks_path, checks)
        print(checks[-1], flush=True)
        assert result.returncode == 0
    assert_qualified()
    save(C / (NAME + '-receipt-ready.json'), {'files': e.source_snapshot()[1], 'checks': checks})
else:
    assert receipt_path.exists()
    checks = json.loads(checks_path.read_text())
    assert len(checks) == 5 and all(row['exit_code'] == 0 for row in checks)
    assert e.source_snapshot()[1] == json.loads((C / (NAME + '-receipt-ready.json')).read_text())['files']
    assert output(['git', 'rev-parse', 'HEAD']) == PARENT
    assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'])
    def user_state():
        return (output(['git', 'rev-parse', 'HEAD'], USER), output(['git', 'status', '--porcelain'], USER),
                hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest())
    before = user_state()
    subprocess.run(['git', 'add', '--', *sorted(IMPLEMENTATION | RECEIPTS)], cwd=W, check=True)
    tree = output(['git', 'write-tree'])
    branch = output(['git', 'symbolic-ref', 'HEAD'])
    commit = output(['git', 'commit-tree', tree, '-p', PARENT, '-m', 'Preserve zero-distance chord bounds without normalizing direction'])
    subprocess.run(['git', 'update-ref', branch, commit, PARENT], cwd=W, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=W, check=True)
    assert not output(['git', 'status', '--porcelain'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit and before == user_state()
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent, 'evidence_commit': archive['commit'],
              'checks': checks, 'qualification': qualified, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(C / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = json.loads(state_path.read_text())
    state['zero_chord_displacement'].update({'status': 'Both baseline failures corrected; all 21 integrated affected groups and five receipt checks passed. Code/evidence committed locally; full pre-push and general closure remain open.', 'commit': result, 'source_frozen': False})
    save(state_path, state)
    print(json.dumps(result, indent=2))
