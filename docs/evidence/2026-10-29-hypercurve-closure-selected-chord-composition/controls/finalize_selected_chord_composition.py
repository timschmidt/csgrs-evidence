"""Retain the selected-chord increment only after its frozen qualification passes."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, re, subprocess, sys, time
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
C = ROOT / 'controls'
USER = ROOT.parents[1]
W = (ROOT / 'polynomial-chamfer-dispatch').resolve()
EVIDENCE = USER.parent / 'csgrs-evidence.git'
NAME = 'selected-chord-composition'
PARENT = '6296155cf7f04936215f375989dd175ab797eb24'
EPARENT = 'c230c717f4bef74e3f9b7622bfaa65700d57c536'
RUN = C / (NAME + '-qualification-final1')
FOCUSED = C / 'polynomial-chamfer-dispatch-selected-chord-owners2'
RECORD = 'docs/evidence/2026-10-29-hypercurve-closure-' + NAME
BRANCH = 'refs/heads/hypercurve-' + NAME + '-evidence-2026-10-29'
IMPLEMENTATION = {
    'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json',
    'crates/hypercurve/src/bezier_offset.rs', 'crates/hypercurve/src/bezier_offset/affine_form.rs',
    'crates/hypercurve/src/bezier_offset/algebraic_chord.rs',
    'crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs',
    'crates/hypercurve/src/bezier_offset/algebraic_chord/selected_points.rs',
    'crates/hypercurve/src/bezier_offset/polynomial_field.rs',
    'crates/hypercurve/src/bezier_offset/rational_form.rs',
    'crates/hypercurve/tests/selected_chord_displacements.rs',
    'crates/hypersolve/CHANGELOG.md', 'crates/hypersolve/src/recursive_quadratic_field.rs',
    'crates/hypersolve/src/selected_polynomial_field.rs',
    'crates/hypersolve/src/selected_polynomial_field/filter.rs',
    'crates/hypersolve/src/selected_polynomial_field/inverse.rs',
    'crates/hypersolve/src/selected_polynomial_field/witness.rs',
    'crates/hypersolve/src/work_budget.rs',
    'crates/hypersolve/tests/fixtures/selected_chamfer_enclosure.json',
    'crates/hypersolve/tests/recursive_quadratic_field_signs.rs',
    'crates/hypersolve/tests/recursive_quadratic_witnesses.rs',
    'crates/hypersolve/tests/selected_chamfer_enclosure.rs',
    'crates/hypersolve/tests/selected_polynomial_fields.rs',
}
RECEIPTS = {'crates/hypersolve/FUTURE_WORK.md', 'crates/hypercurve/FUTURE_WORK.md',
            'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}

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
    matches = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert matches and all(row[0] == 'ok' and row[2] == '0' for row in matches), path
    return {'suites': len(matches), **{key: sum(int(row[i]) for row in matches)
            for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

parser = argparse.ArgumentParser()
parser.add_argument('action', choices=['archive', 'receipts', 'check', 'commit'])
args = parser.parse_args()
complete = json.loads((RUN / 'complete.json').read_text())
rows = json.loads((RUN / 'results.json').read_text())
assert complete['all_passed'] and complete['groups'] == len(rows) == 27
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
qualified = json.loads((RUN / 'source-before.json').read_text())
files = json.loads((RUN / 'files-before.json').read_text())
assert qualified == complete['source'] == json.loads((RUN / 'source-after.json').read_text())
assert files == json.loads((RUN / 'files-after.json').read_text())
assert qualified['revision'] == PARENT and not qualified['untracked_inputs']
focused = json.loads((FOCUSED / 'complete.json').read_text())
assert focused['all_passed'] and focused['groups'] == 4 and focused['source'] == qualified
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
    baseline = json.loads((C / 'polynomial-chamfer-dispatch-field-inverse-baseline2/complete.json').read_text())
    baseline_rows = json.loads((C / 'polynomial-chamfer-dispatch-field-inverse-baseline2/results.json').read_text())
    assert not baseline['all_passed'] and baseline['source']['revision'] == 'eb7ab943b1f168524cbd332d387546ee30f2a861'
    assert baseline_rows[0]['exit_code'] == 0 and baseline_rows[1]['exit_code'] == 'external_timeout'
    assert baseline_rows[1]['external_timeout_seconds'] == 180
    repeat = next(row for row in rows if row['name'] == 'repeat-chamfer')
    assert repeat['external_timeout_seconds'] == 180 and repeat['elapsed_seconds'] < 180
    original = 'crates/hypercurve/tests/polynomial_chamfer_corners.rs'
    original_bytes = subprocess.check_output(['git', 'show', baseline['source']['revision'] + ':' + original], cwd=W)
    assert (W / original).read_bytes().startswith(original_bytes), 'original fixture or helpers changed'
    assert not output(['git', 'diff', PARENT, '--', original]), 'pending fixture modification'
    suffix = (W / original).read_bytes()[len(original_bytes):].decode()
    assert suffix.startswith('\n#[cfg(feature = "svg")]\n#[test]\nfn trimmed_polynomial_svg_replays_without_an_untrimmed_viewport()')
    guard = json.loads((C / 'selected-chord-composition-fixture-guard-review.json').read_text())
    assert hashlib.sha256(original_bytes).hexdigest() == guard['original_sha256'] == guard['retained_prefix_sha256']
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
    experiments = [
        'field-inverse-baseline1', 'field-inverse-baseline2', 'field-inverse1',
        'native-witness1', 'native-quotient1', 'combined-normalization1',
        'complete-normalization1', 'complete-normalization2', 'retained-enclosure1',
        'unit-leading1', 'coefficients1', 'normalized-stage1', 'normalized-stack1',
        'enclosure-capture1', 'refined-filter1', 'refined-filter-owner1',
        'refined-filter-owner2', 'refined-filter2-stage1', 'selected-chord-field1',
        'selected-chord-owners1', 'selected-chord-owners2',
    ]
    directories = [RUN] + [C / ('polynomial-chamfer-dispatch-' + name) for name in experiments]
    directories += [C / name for name in ['selected-chamfer-enclosure-replay1',
                   'native-tensor-witnesses-baseline1', 'native-tensor-witnesses-fix1',
                   'native-tensor-witnesses-qualification-final2', 'zero-selected-chord-projection1']]
    suffixes = {'.json', '.jsonl', '.log', '.patch', '.rs', '.txt', '.md', '.py', '.svg'}
    for directory in directories:
        assert directory.is_dir(), directory
        for path in sorted(directory.rglob('*')):
            if path.is_file() and path.suffix in suffixes:
                copy(path, Path('runs') / directory.name / path.relative_to(directory))
    patterns = [
        'selected-polynomial-*-contract.json', 'selected-polynomial-*-review.json',
        'selected-polynomial-field-inverse-build-attribution.json',
        'selected-chord-displacement-field-contract.json',
        'polynomial-refined-filter1-review.json', 'polynomial-normalized-*-review.json',
        'polynomial-selected-enclosure-*.json', 'polynomial-repeat-coefficient-*.json',
        'native-projective-quotient-*.json', 'native-tensor-witnesses-contract.json',
        'native-tensor-witnesses-*-review.json', 'native-tensor-witnesses-final-commit.json',
        'selected-chord-composition-zero-bounds-review.json',
        'selected-chord-composition-owner-review.json',
        'selected-chord-composition-fixture-guard-review.json',
        'selected-chord-composition-closeout-controller-failed1.log',
        'analyze_polynomial_coefficients*.py', 'analyze_selected_enclosure_intervals.py',
        'probe_polynomial_chamfer_*.py', 'probe_selected_chord_displacement_owners.py',
        'replay_selected_chamfer_enclosure.rs', 'zero_selected_chord_projection.rs',
        'qualify_selected_chord_composition.py', 'finalize_selected_chord_composition.py',
        'close_selected_chord_composition.py',
    ]
    selected = {path for pattern in patterns for path in C.glob(pattern) if path.is_file()}
    for path in sorted(selected):
        copy(path, Path('controls') / path.name)
    test_groups = {'native-regressions', 'selected-fibers', 'selected-roots', 'brep-replay',
                   'solver-full', 'solver-minimal', 'repeat-chamfer', 'curve-full', 'model-full'}
    suites = {row['name']: counts(RUN / (row['name'] + '.log')) for row in rows
              if row['name'] in test_groups or row['name'].startswith('dependent-')}
    save(dest / 'retained-files.json', retained)
    save(dest / 'admission.json', {
        'parent': PARENT, 'evidence_parent': EPARENT, 'qualified': qualified,
        'focused': focused, 'commands': rows, 'suites': suites,
        'contracts': [json.loads((C / name).read_text()) for name in [
            'selected-chord-displacement-field-contract.json',
            'selected-polynomial-refined-filter-contract.json',
            'selected-polynomial-complete-normalization-contract.json']],
        'scalar_proof': 'Exact Bezout inversion reduces unit rational quotients modulo retained defining relations; nonunits retain their original selected quotient. Optional parent images are checked against original equations and open selectors. Strict interval filters preserve denominator guards and consume only definite signs; the complete exact sign path remains authoritative. Original rational sign/refinement budgets remain unchanged.',
        'geometry_proof': 'Selected chord queries share original source coordinates and one positive speed satisfying s^2=dx^2+dy^2. The procedural source, origin, traversal, direction and signed distance remain authoritative. Derived successful pairs are cached only on that immutable construction and checked for policy and budget admissibility.',
        'independent_evidence': 'Exact coefficient arithmetic compares the captured pre/post-normalization quotient values. A separate Fraction interval calculation certifies the original scalar capture lies between -1 and 0. Tests check exact squared setbacks, cross/dot orientation, source parameter reuse, connectivity, original pole guards and fresh-process replay.',
        'baseline': 'The rebuilt original repeated chamfer exceeds its unchanged 180-second envelope on eb7ab943b1. Earlier stale-cache baseline1 is explicitly invalidated by its attribution review. Individual inverse, native witness, quotient, parent-image and enclosure experiments do not establish completion. Final combined source completes the original fixture.',
        'cache_resources': 'Successful immutable derived query pairs preserve shared fields; failed attempts are not cached. Selected-root bisections consume existing shared refinement counters. Those counters and local timing/RSS/allocation samples are not total work or memory bounds.',
        'limits': 'This admits the named repeated-chamfer corpus and normalized selected chord queries, not arbitrary implicit operation closure. A separately reproduced pre-existing tiny-source zero-distance bounds gap remains pending in another checkout. Full pre-push verification and publication are not established by these affected checks.',
        'hardware': output(['lscpu', '--json']),
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
    env = {**os.environ, 'GIT_INDEX_FILE': str(ROOT / (NAME + '-evidence.index'))}
    git = ['git', '--git-dir=' + str(EVIDENCE), '--work-tree=' + str(stage)]
    subprocess.run(git + ['read-tree', EPARENT], env=env, check=True)
    subprocess.run(git + ['add', '--', RECORD], env=env, check=True)
    tree = output(git + ['write-tree'], env=env)
    commit = output(git + ['commit-tree', tree, '-p', EPARENT, '-m',
                          'Record selected-field normalization and repeated chamfer admission'], env=env)
    subprocess.run(git + ['update-ref', BRANCH, commit, '0' * 40], check=True)
    archive = module('archive', W / 'scripts/evidence_archive.py')
    archive.ROOTS = {RECORD: False}
    manifest = archive.manifest(str(EVIDENCE), commit)
    assert len(manifest) == 2
    save(archive_path, {'commit': commit, 'parent': EPARENT, 'branch': BRANCH,
                       'record': RECORD, 'manifest_row': manifest[1], 'suites': suites})
    print(archive_path.read_text())
elif args.action == 'receipts':
    assert not receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    record, count, size, digest = archive['manifest_row'].split('\t')
    suites = archive['suites']
    repeat = next(row for row in rows if row['name'] == 'repeat-chamfer')
    shared = f'''All four focused groups and all 27 affected qualification groups pass.\nThe latter include full Hypersolve ({suites['solver-full']['passed']:,} passed),\nHypercurve ({suites['curve-full']['passed']:,} passed), CSGRS\n({suites['model-full']['passed']:,} passed), six downstream suites, strict MSRV\nClippy, minimal builds, strict docs and fuzz checks, allocation lifetime checks,\nthe capability matrix and hygiene. Logs retain ignored-test counts. Evidence:\n`{record}`, SHA-256 `{digest}`. These are local admission checks; full pre-push\nqualification and package publication are separate.\n'''
    scalar = f'''\n## Selected-field chord composition (2026-10-29)\n\nThe original second polynomial chamfer exposed repeated quotient expansion and\na later selected-scalar enclosure stall. Unit quotients now use exact Bezout\ninverses modulo retained relations; nonunit quotients keep their original local\nrepresentation. Optional parent images retain and validate the original\nequations and selectors. Exact interval filters refine selected roots only\nwhen endpoint signs certify a bracket, preserve denominator guards, and leave\nzero or unresolved signs to the complete exact path. Rational sign queries\nretain their earlier remainder path and resource behavior.\n\nThe maintained 405-node scalar capture replays in a fresh process and proves\n`-1 < value < 0`; independent rational interval arithmetic checks that claim.\nZero-budget refusal permits a larger retry. Original six-refinement budget\nregressions remain unchanged. The unused-tensor witness correction from local\n`b6ec1de05f` is included with its original zero and nonzero dependency tests.\n\n{shared}\nIndividual normalization and enclosure experiments did not complete the\noriginal geometry. Failed attempts, invalid cache attribution and the repaired\nfilter-budget regression remain in the archive. New bisections use the shared\nrefinement counter; it is not a total arithmetic-work or memory bound.\n'''
    curve = f'''\n## Repeated selected polynomial chamfer (2026-10-29)\n\nThe original second chamfer of the elliptic path now completes in\n{repeat['elapsed_seconds']:.2f} seconds in its unchanged 180-second external\nenvelope, including the recorded Cargo invocation. Its exact squared setbacks,\ngenerated-line collinearity and traversal, original cut-parameter reuse and\nfour-piece connectivity assertions pass. Earlier timeout and typed unsupported\noutcomes remain preserved; this is a completion result, not a matched speedup.\n\nGenerated normalized chord points now expose queries over their shared selected\nsource field, with one positive speed relation `s^2 = dx^2 + dy^2`. The original\nprocedural construction remains authoritative. Both coordinates and endpoint\nqueries share successful derived values; policy mismatch and exhausted work\nare checked before reuse. Failed attempts do not enter the cache. Tests cover\nsigned tangent and normal setbacks, reversal, translation, explicit origins,\nzero distance, original denominator guards and fresh-process native SVG replay.\n\n{shared}\nThis establishes the named two-chamfer path and query corpus, not arbitrary\nimplicit offsets, fillets or universal finite composition. A separate probe on\nan exact direction of size `2^-1100` reproduces a pre-existing zero-distance\nbounds/export blocker; its unchanged owner and follow-up are retained in the\nrecord. That gap is not credited as completed by these tests.\n'''
    for path, paragraph in [(W / 'crates/hypersolve/FUTURE_WORK.md', scalar),
                            (W / 'crates/hypercurve/FUTURE_WORK.md', curve)]:
        content = path.read_text()
        assert paragraph.splitlines()[1] not in content
        path.write_text(content.rstrip() + '\n' + paragraph)
    path = W / 'docs/evidence-archive.md'
    content = path.read_text()
    marker = '## Follow-on records\n\n'
    assert marker in content and archive['commit'] not in content
    entry = f'''The local {BRANCH.removeprefix('refs/heads/')} branch ends at\n{archive['commit']}, adding {record} ({int(count):,} files,\n{int(size):,} bytes), SHA-256 {digest}. It records exact selected-field\nnormalization, normalized chord queries, the original repeated chamfer within\nits unchanged 180-second limit, four focused groups and 27 passing affected\nqualification groups. Failed experiments and the separate zero-distance bounds\ngap remain explicit. Full pre-push qualification and general algebraic closure\nremain open. This evidence record is unpushed.\n\n'''
    path.write_text(content.replace(marker, marker + entry, 1))
    path = W / 'docs/evidence-archive.tsv'
    excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
    manifest = output(['python3', 'scripts/evidence_archive.py', 'manifest', str(EVIDENCE), archive['commit']]).splitlines()
    assert not any(line.startswith('excluded:') for line in manifest)
    path.write_text('\n'.join(manifest + excluded) + '\n')
    assert_qualified()
    save(receipt_path, {'archive': archive, 'receipt_files': sorted(RECEIPTS),
                        'all_non_receipt_bytes_unchanged': True})
elif args.action == 'check':
    assert receipt_path.exists()
    archive = json.loads(archive_path.read_text())
    checks = []
    commands = [
        ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
        ('typos', ['typos']), ('budget', ['scripts/check-repository-budget.sh']),
        ('diff', ['git', 'diff', '--check']),
        ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(EVIDENCE), archive['commit']]),
    ]
    for name, command in commands:
        started = time.time()
        with (C / (NAME + '-receipt-' + name + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=W, stdout=log, stderr=subprocess.STDOUT)
        checks.append({'name': name, 'command': command, 'exit_code': result.returncode,
                       'elapsed_seconds': time.time() - started})
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
        return (output(['git', 'rev-parse', 'HEAD'], USER),
                output(['git', 'status', '--porcelain'], USER),
                hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=USER)).hexdigest())
    before = user_state()
    subprocess.run(['git', 'add', '--', *sorted(IMPLEMENTATION | RECEIPTS)], cwd=W, check=True)
    tree = output(['git', 'write-tree'])
    branch = output(['git', 'symbolic-ref', 'HEAD'])
    commit = output(['git', 'commit-tree', tree, '-p', PARENT, '-m',
                     'Preserve selected fields through repeated polynomial chamfers'])
    subprocess.run(['git', 'update-ref', branch, commit, PARENT], cwd=W, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=W, check=True)
    assert not output(['git', 'status', '--porcelain'])
    persistent = 'refs/heads/hypercurve-' + NAME
    subprocess.run(['git', 'fetch', str(ROOT / 'code.git'), branch + ':' + persistent], cwd=USER, check=True)
    assert output(['git', 'rev-parse', persistent], USER) == commit and before == user_state()
    archive = json.loads(archive_path.read_text())
    result = {'commit': commit, 'parent': PARENT, 'branch': persistent,
              'evidence_commit': archive['commit'], 'checks': checks, 'qualification': qualified,
              'user_checkout_unchanged': True, 'epoch': time.time()}
    save(C / (NAME + '-final-commit.json'), result)
    state_path = ROOT / 'SESSION_STATE.json'
    state = json.loads(state_path.read_text())
    state['selected_chord_composition'].update({
        'status': 'Four focused groups, 27 affected groups and five receipt checks passed; code and evidence committed locally. Full pre-push, tiny-source zero bounds follow-up and general closure remain open.',
        'commit': result, 'source_frozen': False,
    })
    save(state_path, state)
    print(json.dumps(result, indent=2))
