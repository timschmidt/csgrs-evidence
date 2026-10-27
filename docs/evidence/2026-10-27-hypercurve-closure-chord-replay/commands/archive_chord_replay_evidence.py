from pathlib import Path
import hashlib
import importlib.util
import json
import os
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-chord-replay')
base = '2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'chord-replay-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'chord-replay-final-files-before.json').read_text())
assert before == json.loads((root / 'chord-replay-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'chord-replay-final-full-suite.log')
assert full == {'suites': 89, 'passed': 2809, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'chord-replay-final-downstream.log')
assert downstream['suites'] == 9 and downstream['passed'] == 62 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('chord-replay-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3010
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'chord-replay-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-chord-replay-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 160
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-chord-replay-evidence-2026-10-27'
parent = '368840d8c3c4e3ca489870a56f8642c10122ff42'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-parallel-replay-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-chord-replay'
staging = Path('/tmp/hypercurve-chord-replay-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('chord-replay-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
copy(root / 'parallel-replay-next-baseline.rs', Path('commands/parallel-replay-next-baseline.rs'))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*chord_replay*.py')) | {root / 'check_increment_receipt.py', root / 'reclaim_completed_point_replay_builds.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'chord-replay-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected chord and point definitions, exact SVG graph and deterministic finite projection; CSGRS adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'domain': 'Selected straight chords with exact coordinate, rational-source, rational-expression or native-parallel endpoints at Bezier scalar/selected-root parameters. Preserve directed support ranges, validated coordinate charts and shared curve endpoint relations. Stroke-path replay only; broader recursive point and generated-circle definitions remain open.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 160, 'commands': results,
    'source_attribution': 'Every final command ran on the identical complete source snapshot in commands/chord-replay-final-source-before.json and commands/chord-replay-final-files-before.json; the after records agree. The three ledger receipts are added only after qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Committed 2eb55c5dd5 passes the procedural parallel export control but rejects an exact degree-seven selected chord after construction, midpoint incidence and split. On that same unchanged library, exact point queries pass but finite projection changes from 82 to 83 vertices at tolerance 0.01. Commands, original source, library digest and equality to qualified parent implementation bytes are retained in chord-replay-committed-r-baseline.json.',
    'change': 'HCP4 adds checked point, support, directed range and prior-curve endpoint records. The chord owner proves chart order and retained support incidence, including exterior ranges, before retaining the supplied chart. Graph records preserve shared immutable sources and root selectors. Point-local bounds used by finite projection follow the requested refinement sequence, independent of stronger cached predicate bounds; exact predicate caches remain available. docs/MIGRATIONS.md identifies the new tags, repeated retained-curve sharing and affected display bytes.',
    'closure_argument': 'Two distinct exact points determine a straight support. Its selected directed endpoints, certified monotone coordinate chart and source relation determine the retained oriented segment. Replay reconstructs each point from its original native definition and selected parameter, then proves support incidence and chart order through the existing chord kernel. Exterior ranges do not silently become bounded subranges of a finite witness. Prior typed references exclude cycles, forward references and wrong dependency types. Exact selectors and denominator guards remain authoritative. Allocation keys only memoize owned immutable storage within one encode call; they do not define mathematical equality. Known auxiliary contact definitions require their own replay records and remain explicit blockers.',
    'qualification': 'Nine public Hypercurve witnesses cover a separate-process degree-seven selected chord before further incidence, overlap and splitting; algebraic-coordinate region construction and round offset; a hand-encoded alternative chart and exterior range; invalid unused support and point definitions; correlated rational-expression endpoints; shared parallel/chord endpoints with independent exact coordinates and full SVG determinism; bounded graph growth and reached-byte-limit retry; original denominator poles; and mixed native/generated boundaries with a circular hole and disconnected material through reconstruction, Boolean identities and offset. A direct unit regression retains the original cache-dependent projection case and coarse/fine/coarse requests. One CSGRS adapter witness reloads a selected chord before split and a second archive.',
    'attempts': 'The initial baseline setup incorrectly expected RationalExpression instead of Rational; its assertion is preserved but is not credited as a geometric finding. The corrected baseline reaches the actual SVG rejection. Prototypes2 and3 preserve the original mixed parallel/chord failure: native metadata and exact incidence pass but full SVG changes after point queries. Adding a curve endpoint reference retains incidence but does not alone fix the display issue. Prototype4 fixes the independently reproduced bounds-cache cause without changing tolerances or weakening assertions. Prototype sources, logs and each parent transition remain available. Prototype5 adds the mixed topology fixture; its original assumption that native circles remain in the path list is incorrect under the established SVG API. The recovered fixture consumes the exact native wire and both generated paths without weakening its geometric, topology, offset or full-SVG assertions. Final qualification uses the committed R parent plus the complete frozen S patch. The first downstream hypercircuit build exhausted the repository filesystem before executing its tests; the failed log and original nine-row run are retained under chord-replay-qualification-attempt1. Removing only completed Q/N Cargo caches recovered 15GB. Source-identical qualification retains the first eight passing groups and reruns hypercircuit plus all remaining commands; no test, feature, policy or geometry was changed.',
    'limitations': [
        'The named fixtures do not establish universal chord or generated-curve replay across arbitrary correlated fields and all degeneracies.',
        'Recursive point definitions, selected joint fibers, auxiliary tangent/contact definitions, generated circles, filled-region archives, scalar-expression DAG serialization and cross-path dependencies remain open.',
        'Point-location samples and self-Boolean identities alone do not prove the entire intended offset set; the fixtures separately preserve exact source relations, directed endpoints and stated topology invariants.',
        'The deterministic projection fix is demonstrated for the selected analytic parallel endpoint domain. It does not establish canonical display for every independently equivalent definition or selected point family.',
        'Extension-byte, display-segment and subdivision-depth limits do not bound total arithmetic, coefficient/system growth, temporary/retained memory or cooperative cancellation.',
        'External timeouts and process RSS observations are containment and measurements, not a kernel resource bound or controlled performance comparison.',
        'Full repository pre-push qualification and published-package delivery remain pending; earlier pushed revisions do not qualify these source bytes.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-chord-replay-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected chord replay qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'chord-replay-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
