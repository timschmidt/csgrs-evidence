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
checkout = Path('/tmp/hypercurve-closure-parallel-replay')
base = '8eea456ceec297833e727212183581e3cd43527b'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'parallel-replay-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'parallel-replay-final-files-before.json').read_text())
assert before == json.loads((root / 'parallel-replay-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'parallel-replay-final-full-suite.log')
assert full == {'suites': 88, 'passed': 2799, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'parallel-replay-final-downstream.log')
assert downstream['suites'] == 8 and downstream['passed'] == 61 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('parallel-replay-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3010
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'parallel-replay-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-parallel-replay-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 151
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-parallel-replay-evidence-2026-10-27'
parent = 'e0d8165fae971704511ba1f27fd6286eff408f6b'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-native-replay-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-parallel-replay'
staging = Path('/tmp/hypercurve-parallel-replay-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('parallel-replay-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
copy(root / 'native-restriction-replay-n-baseline.rs', Path('commands/native-restriction-replay-n-baseline.rs'))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*parallel_replay*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in [
    'crates/hypercurve/src/svg/exact.rs',
    'crates/hypercurve/src/svg/exact/graph.rs',
    'crates/hypercurve/src/svg.rs',
    'crates/hypercurve/src/bezier_offset/parallel.rs',
    'crates/hypercurve/src/finite_projection.rs',
    'crates/hypercurve/tests/svg_parallel_replay.rs',
    'tests/svg_parallel_replay.rs',
]:
    copy(checkout / name, Path('source') / name)
patch = (root / 'parallel-replay-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve exact SVG definition graph and finite parallel projection; CSGRS adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P28', 'P29', 'P30'],
    'domain': 'Finite procedural parallels of quadratic, cubic and rational Bezier sources, with signed left-normal distance, ascending scalar or selected-root ranges and separate traversal. Existing native source and parameter records remain authoritative. This is a stroke-path extension, not a filled-region archive or arbitrary selected-fiber format.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 151, 'commands': results,
    'source_attribution': 'Every final command ran on the identical complete source snapshot in commands/parallel-replay-final-source-before.json and commands/parallel-replay-final-files-before.json; the after records agree. The three ledger receipts are added only after qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Committed 8eea456cee passes the authored-restriction control but rejects a regular parabola parallel during SVG export. Its qualified unchanged library also rejects finite projection of the ellipse parallel and the exterior [2,3] range of C(t)=(t,0), distance 1/4. Actual commands, library digest and all nonreceipt source equality are retained in parallel-replay-committed-q-baseline.json.',
    'change': 'HCP4 adds prior-reference parallel-support and finite-range records. Readers reconstruct native source and signed distance, prove strict range order, replay selected roots and call existing STRICT parallel validation before path assembly. Shared sources and support owners are retained within a path. Finite projection uses power-basis interval bounds on the original finite range, including exterior domains, and subdivides inconclusive Ordering bounds under the existing depth limit. Every accepted chord still needs a certified box. Authored HCP3 and previous HCP4 records are unchanged.',
    'closure_argument': 'An exact source, signed normal distance, selected source interval and traversal determine the same regular parallel image. Existing constructors re-establish denominator, normal and interior-cusp guards; selected roots re-establish their equations and isolators. Cyclic, forward, missing and wrong-type references cannot become geometry. Unused finite range definitions still validate before an empty final path. Original source relations and shared identities are retained without rationalizing the offset or materializing unrelated coordinate fields. Local immutable allocation keys never become serialized identity or mathematical equality.',
    'qualification': 'Nine Hypercurve witnesses cover independent normal-derived midpoint expectations for parabola, ellipse, PH cubic and stationary zero-distance sources; cusp-split support/root sharing; separate-process replay before region admission, Boolean and round offset consumption; malformed references and singular/nonascending ranges; rational pole guards on exterior domains; exact finite line-parallel projection; actual byte limits with retry; algebraic selected trim through reflection, scale and another archive; and different distances sharing one source through repeated replay. One CSGRS adapter witness consumes the reloaded parallel in exact point incidence. Existing 33 SVG/replay/scalar tests pass unchanged.',
    'attempts': 'Preserved prototype1 and prototype3 compilation failures, prototype2 ellipse projection failure, and prototype4 descending-range rejection failure. Prototype5 passes all nine new witnesses plus the 33 existing tests. Early prototypes used the frozen Q candidate before its receipt commit; the verified parent transition preserves every nonreceipt byte. Final commands use committed Q plus the frozen R patch. The first downstream build failed before tests because ccache used read-only storage; its original logs and all source snapshots are retained. A task-owned cache passed the same C compiler flags, then the remaining twelve groups resumed on identical source. The first five passed groups retain their original environment and timestamps.',
    'limitations': [
        'The finite named witnesses do not establish arbitrary offset closure, general singularity handling or all algebraic coefficients and parameter selectors.',
        'The fresh-process cap fixture qualifies consumption and specified exact assertions; finite membership and self-difference do not independently prove the entire expanded set.',
        'A rational pole inside the retained range preserves the existing typed Boundary blocker, not a new invalid-input diagnosis or a geometric success.',
        'Other generated supports, selected or joint fibers, filled-region native replay, scalar-expression DAG serialization and cross-path dependency sharing remain open.',
        'Extension-byte, display-segment and subdivision-depth limits do not bound total arithmetic, coefficient/system growth, temporary/retained memory or cooperative cancellation.',
        'External fixture timeouts and process peak RSS are containment and observations, not kernel resource bounds or controlled performance comparisons.',
        'Full repository pre-push qualification and published-package delivery remain pending for this increment; the earlier pushed candidate does not qualify these bytes.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-parallel-replay-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record procedural parallel replay qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'parallel-replay-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
