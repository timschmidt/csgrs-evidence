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
checkout = Path('/tmp/hypercurve-closure-selected-circle-points')
base = json.loads((root / 'fiber-point-order-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'selected-circle-points-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'selected-circle-points-final-files-before.json').read_text())
assert before == json.loads((root / 'selected-circle-points-final-files-after.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
transition = json.loads((root / 'selected-circle-points-parent-transition.json').read_text())
assert transition['all_non_receipt_bytes_unchanged'] and transition['new'] == base
qualified_source = json.loads((root / 'selected-circle-points-final-source-before.json').read_text())
assert qualified_source == json.loads((root / 'selected-circle-points-final-source-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        if name in receipts:
            assert (checkout / name).read_bytes() == subprocess.check_output(['git', 'show', base + ':' + name], cwd=checkout), name
        else:
            assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'selected-circle-points-final-full-suite.log')
assert full == {'suites': 92, 'passed': 2846, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'selected-circle-points-final-downstream.log')
assert downstream['suites'] == 11 and downstream['passed'] == 64 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('selected-circle-points-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'selected-circle-points-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-selected-circle-points-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 193
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-selected-circle-points-evidence-2026-10-27'
parent = json.loads((root / 'fiber-point-order-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-fiber-point-order-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-selected-circle-points'
staging = Path('/tmp/hypercurve-selected-circle-points-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('selected-circle-points-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c', '.svg']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*selected_circle_points*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'selected-circle-points-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected-circle angular parameter and common point-field query owners; existing native SVG graph replays those definitions',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P26', 'P27', 'P29'],
    'domain': 'Independently defined incident points whose radial coordinates share a checked rational/algebraic field on a circle with a represented unit frame. Keep the original selected base/fiber, circle, signed radius, half chart and traversal. Demonstrated beta degree7 and gamma degree5 coordinates are not materialized independently.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 193, 'commands': results,
    'source_attribution': 'All18 final groups run on the complete identical before/after source based on S, including frozen T/U/V implementations and W. After every group passes and V is committed, reparenting imports only its three receipts and proves all other bytes unchanged. Retain both the full qualified patch against source.json base and the W patch against commit_parent. Three W receipts follow archive creation; no non-receipt source edit follows qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Fresh unchanged V-source compilation reproduces the original positive u=beta point-location assertion as Blocked(Unsupported), although its independent squared-radius identity succeeds. The original complete source and all later split/reversal/replay assertions are preserved. The corrected implementation executes that unchanged original program.',
    'change': 'A private mapped IncidentPoint parameter retains the exact point, selected circle, both radial-coordinate forms in their common field, and inherited policy. Existing circle incidence precedes construction. Signed tangent projection selects the half; endpoints retain canonical zero/one ownership. Comparisons against represented chart parameters use exact radial linear forms, and pairs on one half use the strictly monotone normal coordinate. Similarities transport the circle, point and radial forms through the certified linear part. Native HCP4 uses its existing IncidentPoint record and rechecks incidence, half and field after replay; no new tag or scalar coordinate materialization.',
    'closure_argument': 'For n=(P-C).N and b=turn*cross(N,P-C), the half-chart comparison with v in (0,1) has sign r*((1-2v)b-2v(1-v)n). Signed tangent distinguishes the complementary half and zero tangent gives a diameter endpoint. cos(theta) is strictly decreasing on one half, so -sign(r)*sign((P1-P2).N) orders two selected points. Complete common radial authority, original denominator guards and policy are retained before publication. Transport uses certified similarities only. These local identities do not prove general derivative, arrangement or modeling-operation closure.',
    'qualification': 'Five new public cases supplement the seven common-field cases: original nonconstant angular point; independent equal definitions and cuts separated by2^-80 followed by exact restriction, split, reversal and replay; both signed radii/turns, excluded half and nearby off-support points, sqrt2 rotation/scaling and reflection; a fresh process replaying a reversed split before another split at beta/2; actually reached zero work limits and larger retries followed by Certified strict/approximate/strict archive sequences. Two private owner tests preserve inherited frame policy, decline qualified point dependencies, and reprove invalid incidence and half selection. Earlier point, circle and replay targets remain intact.',
    'attempts': 'Prototype1 records missing exhaustive dispatch arms. Prototype2 passes the original/new point cases but regresses an existing fresh-process circular-fillet replay: one projection can cancel fields without supporting every angular query. Prototype3 retains both radial coordinates and passes the unchanged original plus all12 old targets. Prototype4 fails only the new test harness reference to undeclared tempfile; the source now uses the established standard-library temporary-file pattern. Prototype5 passes all12 public cases in211.705seconds and the unchanged original; filesystem quota later interrupts an older replay test and its report, so no overall success is inferred. Prototype6 reexecutes all12 old targets successfully; one private policy assertion fails because a new public-operation scope is missing after explicitly consumed approximation. Prototype7 preserves that direct call as an inherited-qualification check and adds a fresh operation with Certified certainty and the original strict validation assertion. No production behavior changes for this harness correction. Prototype7 and MSRVprobe3 catch a test-only field-versus-method compile error on CurveOutcome certainty; prototype8 corrects that access. The first MSRV probe is interrupted by quota; the second and final fourth probe pass. Storage recovery preserves all raw captures, verifies moved files, and removes only completed task build artifacts. A later execution-session transition interrupts the final downstream command after six completed groups; its partial log and the process inspection are retained. Only the interrupted command and remaining groups resume on the identical frozen source in a detached host job. The six completed exit statuses remain unchanged; no exit status or success is inferred for the interrupted attempt.',
    'measured_frontiers': 'Positive downstream probes retain actual Blocked(Unsupported) for the public selected-circle derivative and for admission of a closed correlated-center circle into CurveRegion2, before its repeated round-offset chain. These remain implementation gaps. The close-cut case completes within300seconds but coordinate equality and display projection dominate; diagnostic angular comparisons take milliseconds. There is no comparative speedup or total-work claim.',
    'limitations': [
        'No universal arbitrary-degree algebraic or operation-closure claim follows from this finite corpus. General independent fields, other circle frames, selected-circle derivatives, filled-region admission, offsets and corner edits still need completion evidence.',
        'The work counters cover instrumented refinements/promotions only, not total arithmetic, coefficient growth, expression size, heap use or cooperative cancellation. External timeouts are containment only.',
        'Native stroke replay is distinct from a filled-region archive. Full repository pre-push validation and published-package delivery remain pending for these source bytes.',
        'Exact geometric expectations and deterministic serialization are separate assertions. Display chords never become exact source evidence.'
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-selected-circle-points-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected circle-point angular authority qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'selected-circle-points-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
