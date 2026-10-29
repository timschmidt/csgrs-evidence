"""Archive and commit certified polynomial display projection and exact SVG replay."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, re, subprocess, sys, time
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
C = ROOT / 'controls'
USER = ROOT.parents[1]
W = (ROOT / 'polynomial-svg-replay').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'polynomial-svg-replay'
PARENT = 'eb7ab943b1f168524cbd332d387546ee30f2a861'
EPARENT = 'f25a26281d409f115e4a2f8a8a95ab14d4fa3c8c'
IMPLEMENTATION = {'crates/hypercurve/src/svg.rs', 'src/errors.rs', 'crates/hypercurve/src/finite_projection_polynomial.rs', 'crates/hypercurve/tests/polynomial_chamfer_corners.rs', 'crates/hypercurve/src/svg/exact.rs', 'src/io/svg.rs', 'tests/svg_polynomial_replay.rs', 'crates/hypercurve/README.md', 'crates/hypercurve/src/lib.rs', 'crates/hypercurve/src/curve_region_boolean.rs', 'crates/hypercurve/src/bezier_region.rs', 'crates/hypercurve/src/finite_projection.rs', 'crates/hypercurve/src/polynomial_curve.rs', 'CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json', 'crates/hypercurve/tests/polynomial_projection.rs', 'crates/hypercurve/tests/polynomial_region_admission.rs', 'crates/hypercurve/CHANGELOG.md', 'docs/MIGRATIONS.md', 'crates/hypercurve/src/svg/exact/graph/polynomial.rs', 'crates/hypercurve/src/polynomial_curve_projection.rs', 'crates/hypercurve/src/svg/exact/graph/points.rs', 'crates/hypercurve/src/svg/exact/graph/polynomial/tests.rs', 'crates/hypercurve/src/svg/exact/graph.rs'}
RECEIPTS = {'crates/hypercurve/FUTURE_WORK.md', 'crates/hypercurve/CHANGELOG.md', 'docs/MIGRATIONS.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
RUN = C / (NAME + '-qualification-final9')
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
assert complete['all_passed'] and complete['groups'] == len(rows) == 17
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
    focused = json.loads((C / (NAME + '-candidate14/complete.json')).read_text())
    assert focused['all_passed'] and focused['groups'] == 20 and focused['source'] == qualified
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
    for name in ['probe_polynomial_svg_replay.py', 'qualify_polynomial_svg_replay.py', 'finalize_polynomial_svg_replay.py', 'close_polynomial_svg_replay.py']:
        copy(C / name, Path('controls') / name)
    suites = {r['name']: counts(RUN / (r['name'] + '.log')) for r in rows if r['name'] in ['adapter-polynomial', 'curve-owners', 'model-consumers', 'native-replay', 'brep-io-consumer', 'graphics-consumer', 'minimal-projection']}
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'owner': 'Hypercurve selected polynomial graph enclosure, finite display boundary, shared region reconstruction and native SVG graph; CSGRS typed error adapter',
        'properties': ['P8', 'P15', 'P18', 'P19', 'P20', 'P26', 'P29', 'P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EPARENT,
        'contract': json.loads((C / (NAME + '-contract.json')).read_text()),
        'review': json.loads((C / (NAME + '-review.json')).read_text()),
        'commands': rows, 'suites': suites, 'baseline': baseline, 'focused': focused,
        'proof': 'An exact interior fiber anchor and whole-interval nonzero polynomial edge signs enclose the continuous selected graph. Guarded original maps transport the box. Exact distance tests contain all four box corners in the convex capsule of the actual emitted binary64 segment. Native SVG independently reconstructs original topology, selections and maps. Display chords never certify the exact model.',
        'composition': 'Original and isolated-trim chamfer SVG replay in fresh processes; further source restriction, maps/reversal, polynomial/native holes and disconnected material, exact XOR and canonical-empty Boolean continuation. Native SVG replay retains an uncut original native line and its provenance after the shared arrangement checks the complete source range; ordinary construction keeps its established retained-chord publication; analytic parallels and selected chords retain their original carriers.',
        'resource_contract': 'Per-path polynomial subdivision defaults depth 128 and 65,536 attempted boxes; scalar enclosure attempts through 512 refinements; shared solver budgets and existing SVG byte/point-depth limits remain enforced. No total arithmetic, coefficient, memory, wall-time or cancellation bound is claimed.',
        'limits': 'Currently admitted compact continuous finite-fiber graph branches only. Arbitrary algebraic-coefficient topology, vertical/repeated components, general nonzero offsets/fillets and original repeated polynomial chamfer remain unfinished. This is affected local admission, not complete pre-push verification or universal closure.',
        'hardware': output(['lscpu', '--json']), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']), 'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EPARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', RECORD], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EPARENT, '-m', 'Record polynomial projection and exact SVG replay admission'], env=env)
    subprocess.run(git + ['update-ref', BRANCH, commit, '0' * 40], check=True)
    archive = module('archive', W / 'scripts/evidence_archive.py'); archive.ROOTS = {RECORD: False}
    manifest = archive.manifest(str(EVIDENCE), commit); assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EPARENT, 'branch': BRANCH, 'record': RECORD, 'manifest_row': manifest[1], 'suites': suites})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text()); record, count, size, digest = archive['manifest_row'].split('\t'); suites = archive['suites']
    paragraph = f"""

## Polynomial finite projection and whole-branch SVG replay (2026-10-29)

On `{PARENT[:10]}`, direct finite projection and the original chamfer SVG
fixture fail as unsupported. Selected graph branches now obtain certified
whole-arc boxes from an exact interior fiber and nonzero polynomial edge
signs. Guarded maps transport those boxes; exact capsule tests verify the
actual emitted binary64 chords. Exact source definitions remain authoritative.
The witnesses include waves missed by endpoint/midpoint sampling, singular
endpoints, selected trims, maps, reversal, exhausted-budget retry and a
quantization limit that must remain undecided.

SVG records retain source equations, domains, topology/evaluation controls,
selected branch ordinals, exact parameter dependencies, maps and traversal.
Replay rebuilds topology and checks all definitions, including unused ones.
Invalid selectors, source references, topology limits and shared-budget
exhaustion remain typed through CSGRS. Exact trim bounds separate disconnected
components before general incidence. Native SVG replay retains an uncut
original native line and its provenance after the same arrangement checks its
complete source range; ordinary construction keeps its established publication; analytic parallels and selected chords keep their existing carriers. Holes, disconnected material, exact
XOR, empty continuation and deterministic output are checked separately.

All 17 affected qualification groups pass, including
{suites['curve-owners']['passed']:,} Hypercurve owner tests,
{suites['model-consumers']['passed']:,} existing CSGRS export/replay tests,
{suites['adapter-polynomial']['passed']} new typed adapter tests, native BRep
replay, BRep IO, graphics, strict MSRV Clippy, minimal builds, docs, fuzz checks
and the selected capability matrix. The focused source run also completes
the unchanged original and isolated-trim fresh-process fixtures within their
180-second external caps. Raw records preserve individual timings, peak RSS,
unsuccessful candidates and ignored-test counts.

Evidence: `{record}`, SHA-256 `{digest}`. Default polynomial display limits
are depth 128 and 65,536 attempted boxes per path, with up to 512 refinements
per scalar enclosure attempt. These are not total-work or memory bounds.
General algebraic topology, nonzero implicit offsets/fillets, the original
repeated polynomial chamfer and complete pre-push qualification remain open.
"""
    path = W / 'crates/hypercurve/FUTURE_WORK.md'; path.write_text(path.read_text() + paragraph)
    path = W / 'crates/hypercurve/CHANGELOG.md'; content = path.read_text(); marker = '## [0.4.0] - Unreleased\n\n'; assert content.count(marker) == 1
    path.write_text(content.replace(marker, marker + '- Native SVG replay retains an uncut original native line and its provenance\n  after the shared arrangement checks its full source range. Ordinary region\n  construction keeps its existing retained carriers and STEP export coverage.\n', 1))
    path = W / 'docs/MIGRATIONS.md'; content = path.read_text(); marker = '  trims before image transport; this can tighten exported display viewports.\n'; assert content.count(marker) == 1
    path.write_text(content.replace(marker, marker + '  Native SVG replay now retains uncut original native lines after the same\n  arrangement checks their complete source ranges. Ordinary region construction\n  retains its established publication; selected chords and analytic parallels\n  preserve their existing carriers.\n', 1))
    path = W / 'docs/evidence-archive.md'; content = path.read_text(); marker = '## Follow-on records\n\n'; assert marker in content and archive['commit'] not in content
    entry = f"""The local {BRANCH.removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It retains the reproduced projection
and SVG failures, unsuccessful intermediate cases, exact-source replay and
all 17 passing affected qualification groups. Original repeated chamfer,
general algebraic closure and full pre-push verification remain open.
This evidence record is unpushed.

"""
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
    commit = output(['git', 'commit-tree', tree, '-p', PARENT, '-m', 'Project selected polynomial branches and replay exact SVG sources'])
    subprocess.run(['git', 'update-ref', branch, commit, PARENT], cwd=W, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=W, check=True)
    assert not output(['git', 'status', '--porcelain'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit and before == user_state()
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent, 'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified, 'user_checkout_unchanged': True, 'epoch': time.time()}
    save(C / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'; state = json.loads(state_path.read_text()); state['polynomial_svg_replay'].update({'status': 'All17 affected groups passed; source and evidence committed locally. Full pre-push, original repeated chamfer and general closure remain open.', 'commit': result}); save(state_path, state)
    print(json.dumps(result, indent=2))
