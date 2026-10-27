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
checkout = Path('/tmp/hypercurve-closure-point-replay')
base = json.loads((root / 'chord-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'point-replay-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'point-replay-final-files-before.json').read_text())
assert before == json.loads((root / 'point-replay-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'point-replay-final-full-suite.log')
assert full == {'suites': 90, 'passed': 2820, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'point-replay-final-downstream.log')
assert downstream['suites'] == 10 and downstream['passed'] == 63 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('point-replay-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'point-replay-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-point-replay-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 170
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-point-replay-evidence-2026-10-27'
parent = json.loads((root / 'chord-replay-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-chord-replay-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-point-replay'
staging = Path('/tmp/hypercurve-point-replay-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('point-replay-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
copy(root / 'circle-replay-next-baseline.rs', Path('commands/circle-replay-next-baseline.rs'))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*point_replay*.py')) | {root / 'check_increment_receipt.py', root / 'reclaim_completed_point_replay_builds.py', root / 'reclaim_completed_replay_probe_binaries.py', root / 'reclaim_completed_circle_replay_probe_binaries.py', root / 'circle-replay-completed-probe-binary-recovery.json'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'point-replay-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve exact point definitions and native SVG dependency graph; Hyperbrep native planar-point persistence and record admission; CSGRS SVG adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'domain': 'Existing checked coordinate, rational, expression and parallel points, extended to polynomial fibers, rational images, similarities, unique supporting-line intersections and signed chord unit-direction displacements. Preserve shared definitions, original denominator and selector guards, selected chord source, arbitrary origin and exact translation. Native line or selected chord sources; stroke-path replay and the named Hyperbrep planar-point archives only.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 170, 'commands': results,
    'source_attribution': 'Every final command ran on the identical complete source snapshot in commands/point-replay-final-source-before.json and commands/point-replay-final-files-before.json; the after records agree. The three ledger receipts are added only after qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'The committed S parent passes selected-chord export but rejects the unchanged degree-seven selected fillet line and complete selected fillet circle. Source files, commands, library digest and equality to the qualified parent bytes are retained in point-replay-committed-s-baseline.json. The original complete circle remains an unchanged positive assertion; the T frontier probe still fails it as Unsupported generated curve definition after the line succeeds.',
    'change': 'Append HCP4 point records14-17 plus shared displacement recipe18 and selector19. Retain selected fibers and original rational-map guards; re-establish exact similarities and unique intersections. The native chord-displacement owner exposes its full construction, retaining source, direction, signed distance, translation and origin. Public replay still validates recursive dependencies; the graph decoder reuses only previously checked immutable records. Iterative point traversal and owned memo keys keep common map prefixes shared. A distinct configurable point-depth limit propagates through chord and endpoint indirection. Hyperbrep replays the new point variant through the same owner and counts its source/origin before scalar parsing.',
    'closure_argument': 'A defining base parameter and revalidated fiber singleton retain a correlated point. Rational images preserve the original nonzero denominator; similarities retain the source and a certified matrix; two distinct nonparallel supporting lines determine one point. A nonzero directed chord determines a unit tangent and left normal, so source/origin, signed distance, direction and translation define the displaced point without independent normalized coordinates. Native replay consumes these definitions through the existing owners. Typed prior references are acyclic; no stored success flag or allocation identity establishes geometry. Chord sources and selected ranges retain their original evidence. Unsupported source definitions and generated curves remain explicit gaps.',
    'qualification': 'Ten public Hypercurve witnesses cover fresh-process replay of the original selected fillet line before further splitting; correlated fiber/map/algebraic-similarity relations; independent selected supports and exterior intersections; invalid unused records, selectors and original poles; input-depth and byte exhaustion/retry; linear shared-prefix record growth; signed tangent/normal displacements, zero distance, arbitrary origin, translation and source reversal; and shared endpoint recipes. A unit test checks inherited approximate-policy rejection and strict recovery. One CSGRS adapter case repeats the fillet-cut split/replay. Two public Hyperbrep archive cases check source/origin record budgets before scalar decoding, invalid source substitution, larger retry and the selected fillet cut before a further split.',
    'attempts': 'Compile1 needed an explicit closure error type; prototype1 needed the new option in a complete existing initializer. Prototype2 preserved four real/setup failures: a deeper displacement dependency lacked a point definition; common map prefixes emitted24/62records for4/8spans; an exact root witness incorrectly used nondegenerate bounds; positive retry fixtures had invalid empty paths. The unchanged fillet-line assertion was retained and the owner was extended with its full source-preserving displacement definition. Invalid witness cases remain; positive fixtures now follow the existing point-interval and nonempty-path contracts. Prototype3 caught a missing type qualification. Prototype4 passed all new kernel tests and old regressions, while root/MSRV builds exhausted the repository filesystem; original failure logs and durable-cache cleanup receipts are retained. A separate current-revision Hyperbrep check reproduced the exhaustive-match gap before extending its persistence and resource admission. Prototype5 passed the selected fillet BRep archive; the native-source test instead stopped at a mistaken setup assertion because Curve2::try_line creates a retained chord. Prototype6 uses the intended native LineSeg2 constructor, preserves all prior geometric and resource assertions, and also consumes explicit native Line archive syntax with its exact smaller record count. Current source inspection corrects the earlier assumption that coordinate-only Chord records replay natively: they retain their chord carrier. No original hard geometry assertion, policy or tolerance was weakened. The first final fuzz Clippy command could not start because runtime toolchain1.98.1 lacks Clippy. The source-identical retry uses installed MSRV1.95.0 with the same fuzz manifest, all bins and -D warnings; first four passing groups and the failed attempt are preserved. That retry found two existing collapsible_if warnings in the unchanged region fuzz harness. The final let-chain preserves guards and evaluation order; the next attempt exposed an identity map and bool.then filter_map in the existing string-editing fuzz target. A strict all-bin --keep-going audit retained every remaining finding. Removing the identity map and using filter plus map preserves the original accepted chunks and point-construction order. All-bin strict Clippy then passes; all18groups are restarted on the final source, and all three earlier five-row attempts remain in the archive. The fourth execution session and its watcher were externally terminated with status143 during the full suite, without a completed Cargo exit receipt. The whole incomplete log and source records are retained in qualification-attempt4. Source hashes were unchanged; the five completed groups remain valid and the unfinished full suite plus downstream groups are rerun. This external interruption is not library exhaustion or successful suite completion.',
    'limitations': ['The finite corpus is not universal algebraic curve closure. The complete selected circle remains an unsupported generated-curve definition, not an exhausted or completed result.', 'Auxiliary contact records, other cusp-derived point definitions, general joint parameter charts, broader generated and filled-region replay, scalar expression DAGs and cross-path sharing remain open.', 'Point-definition depth counts serialized dependency nesting, even if native similarities simplify. The byte and depth limits do not bound all solver work, coefficient growth, existing native prefix-vector allocations, scalar expressions, total temporary/retained memory or cooperative cancellation.', 'The 4/8/16 map-prefix fixture emits14/26/50native records. This is a measured serialization-growth result, not a speedup or total-memory claim. Hyperbrep retains its existing nested point format and archive budgets.', 'Full SVG and JSON determinism are tested separately from exact defining relations and downstream operations. No display projection substitutes for exact geometry.', 'Full repository pre-push qualification and published-package delivery remain pending. Earlier pushed revisions do not qualify these source bytes.'],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-point-replay-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected point graph replay qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'point-replay-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
