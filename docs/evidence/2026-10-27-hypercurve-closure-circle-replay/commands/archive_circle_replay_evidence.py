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
checkout = Path('/tmp/hypercurve-closure-circle-replay')
base = json.loads((root / 'point-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'circle-replay-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'circle-replay-final-files-before.json').read_text())
assert before == json.loads((root / 'circle-replay-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'circle-replay-final-full-suite.log')
assert full == {'suites': 91, 'passed': 2832, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'circle-replay-final-downstream.log')
assert downstream['suites'] == 11 and downstream['passed'] == 64 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('circle-replay-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'circle-replay-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-circle-replay-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 181
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-circle-replay-evidence-2026-10-27'
parent = json.loads((root / 'point-replay-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-point-replay-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-circle-replay'
staging = Path('/tmp/hypercurve-circle-replay-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('circle-replay-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*circle_replay*.py')) | {root / 'check_increment_receipt.py', root / 'reclaim_completed_circle_replay_builds.py', root / 'reclaim_completed_replay_probe_binaries.py', root / 'reclaim_completed_chord_replay_builds.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'circle-replay-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected-circle and retained chord owners, native SVG dependency graph, exact point-location dispatch and shared CurveRegion2 arrangement; CSGRS SVG adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'domain': 'Chord-normal selected-circle frames with previously checked exact center and chord definitions, nonzero signed radius, scalar or signed normal-contact angular selections, independently incident points, finite ascending chart range and traversal. Transported represented unit chord directions remain checked evidence. The demonstrated complete workflows use the degree-seven fillet, algebraic similarities, native/generated boundaries, a hole and disconnected material.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 181, 'commands': results,
    'source_attribution': 'Every final command ran on the complete source snapshot in commands/circle-replay-final-source-before.json and commands/circle-replay-final-files-before.json, with matching after records. Three ledger receipts are added only after qualification. The reparent record proves preservation of every other source byte.',
    'infrastructure_recovery': 'The host temporary filesystem quota truncated extraction of a required Gerber fixture during dependent-hyperdrc. Its original covered-fixture failure and all prior source-attributed commands are preserved. After verified storage recovery, the entire failed command and all remaining groups were reexecuted on unchanged source; no fixture, policy or assertion was changed.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'The unchanged T source reproduces complete circular fillet export as Unsupported after selected-line export succeeds. Its independent retained-point circle query also fails before serialization. Both original positive assertions and qualified-library digests are preserved. Diagnostic records identify a ChordNormal frame and SelectedChordNormalContact angular definition. The completed T parent and its source/evidence records remain ancestors.',
    'change': 'Append HCP4 circle frame20, scalar angular selector21, signed normal contact22, finite oriented circle range23 and independent incident-point selector24. Reuse the existing center/frame/contact/fragment owners; no scalar-coordinate flattening or alternate circle solver. Exact point-location dispatch now permits retained points on selected circles and shares the same owner for coordinate points. A radial point-inversion selector preserves the original independent point instead of a derived solver cache. Record25 retains transported unit chord components, re-proving unit length, perpendicular equality and positive orientation while preserving support/range identity. Represented endpoint directions that the existing constructor recovers retain their old encoding.',
    'closure_argument': 'A checked center, nonzero directed chord, signed radius and orientation define the selected circle half. Checked angular endpoints and ascending range select a finite oriented arc. A literal signed normal contact replays P=C+dN, radius and half selection; an independently incident point replays its circle equation and selected half. A stored unit direction is evidence only after exact length, parallelism and orientation validation. Prior typed references retain shared sources and reject cycles or wrong owners. No construction tangent flag is serialized; later operations consume the retained relations and shared arrangement authority.',
    'qualification': 'Eleven public Hypercurve witnesses cover fresh-process full fillet replay then exact point location, split, reversal and second archive; algebraic rotation/scaling and reflection; all four empty-set Boolean operators and boundary reconstruction; mixed native/generated boundaries with hole and disconnected material; changed-neighbor endpoint and interior transverse contacts in both orders; valid and invalid unit directions; literal signed normal-contact validation; finite-arc clipping and 2^-80 separation; malformed references, radius, half and range definitions including unused records; reached byte/depth limits and larger retries. A private unit test checks consumed approximate-policy rejection. One root SVG adapter case repeats complete fillet replay before further exact operations. Exact geometric expectations are separate from full SVG determinism.',
    'attempts': 'Prototype1 exports the original full circle but its stronger retained-point query fails. The unmodified T baseline reproduces that query gap. Prototype2 connects point-location dispatch but the split/reversed second archive lacks its selected angular record. Prototype3 adds the original independent incident-point record; five cases pass, while the algebraic similarity full-SVG assertion finds a display-only difference after reload. A diagnostic proves exact metadata and viewBox identical and both cold/warm query paths stable. The missing transported chord unit direction changes finite point construction after replay. Prototype4 adds its checked record and stops at a missing test argument borrow. Prototype5 catches the distinction between support and finite-curve references, a redundant direction record on an existing exact-chart fixture, and a malformed contact classified as undecided. Prototype6 preserves kinds, omits reconstructible represented directions, and passes all old replay tests, policy and root adapter checks; the invalid contact assertion remains failing. Prototype7 validates the literal signed relation instead of using the modeling solver’s two-sided search, preserving undecided versus proved-invalid outcomes. It adds the changed-neighbor and mixed-topology witnesses without weakening original assertions. A separate fiber-center probe preserves an outstanding midpoint Ordering blocker, with its initial type-import setup errors retained. The initial MSRV Clippy probe finds one items-after-test-module lint; the helper implementation is moved before the test module, with no behavior change. The original lint log and clean second probe are retained.',
    'limitations': [
        'This finite corpus is not a universal algebraic curve or operation closure proof. Other generated Rational, ParallelNormal and SelectedRadial circle frames, general mapped angular contacts, repeated-offset chart transport and filled-region native archives remain required work.',
        'A correlated degree-seven/five fiber center imports and evaluates its independently derived endpoints, but a midpoint query returns Blocked(Ordering). This is an implementation gap, not resource exhaustion or completed geometric capability. The original positive source and failure remain available.',
        'Depth and extension bytes are checked before publication, and failures do not poison retries. They do not bound total solver work, coefficient growth, scalar expression trees, temporary or retained heap use, or cooperative cancellation. External timeouts are containment only.',
        'Construction-time tangent endpoint flags are not replay authority. The new contact records retain exact normal and selected-point relations; more general contact and provenance transports remain open.',
        'Full repository pre-push qualification, remote publication and published-package delivery remain pending for these source bytes.'
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-circle-replay-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected circle frame replay qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'circle-replay-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
