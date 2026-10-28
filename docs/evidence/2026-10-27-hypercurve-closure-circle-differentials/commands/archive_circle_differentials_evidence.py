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
checkout = Path('/tmp/hypercurve-closure-circle-differentials')
base = json.loads((root / 'selected-circle-points-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'circle-differentials-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'circle-differentials-final-files-before.json').read_text())
assert before == json.loads((root / 'circle-differentials-final-files-after.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
transition = json.loads((root / 'circle-differentials-parent-transition.json').read_text())
assert transition['all_non_receipt_bytes_unchanged'] and transition['new'] == base
qualified_source = json.loads((root / 'circle-differentials-final-source-before.json').read_text())
assert qualified_source == json.loads((root / 'circle-differentials-final-source-after.json').read_text())
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

full = test_counts(root / 'circle-differentials-final-full-suite.log')
assert full == {'suites': 92, 'passed': 2859, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'circle-differentials-final-downstream.log')
assert downstream['suites'] == 11 and downstream['passed'] == 64 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('circle-differentials-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'circle-differentials-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-circle-differentials-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 205
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-circle-differentials-evidence-2026-10-27'
parent = json.loads((root / 'selected-circle-points-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-selected-circle-points-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-circle-differentials'
staging = Path('/tmp/hypercurve-circle-differentials-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('circle-differentials-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c', '.svg']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*circle_differentials*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'circle-differentials-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve rational derivative recurrence, selected-circle chart and shared point-field image owners; retained point/chord enclosures and immutable curve/path bounds caches; existing point and native graph consumers',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P25', 'P29'],
    'domain': 'Represented unit circle frames, signed radii and selected half charts. Represented angular parameters and retained incident points whose two radial coordinates have a shared polynomial-point field. Demonstrated degree7/5 dependencies remain jointly selected and are not materialized into independent scalar coordinates. Other frame and point-image carriers remain implementation gaps.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 205, 'commands': results,
    'source_attribution': 'All18 final groups execute on identical complete before/after source based on S, including T/U/V/W and this differential extension. After qualification and W commit, only three W receipts are imported; every other source byte remains identical. Preserve the full qualified patch and the final delta against W. Three differential receipts follow archiving; no non-receipt edit follows qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'A fresh all-feature build of frozen W reproduces the original positive exact derivative magnitude assertion as Blocked(Unsupported), while its point-location/split/replay control succeeds. The original program and independent expected derivative map remain unchanged. Prototype2 completes the same original magnitude assertion in12.073seconds.',
    'change': 'Factor the existing rational derivative Leibniz recurrence into a shared field-mapping helper; the original algebraic-root path retains its reducer and image constructor. Selected-circle derivatives use a center-free homogeneous chart and the guarded rational inverse of an incident point, reusing its existing radial forms where retained. A shared guarded angular point(u,0) feeds the individual univariate derivative maps. This retains the point-map graph and original denominator guards instead of permanently expanding the same inverse into every derivative polynomial. Composition publishes exact joint vector point images with frame and parameter qualification. Represented parameters are normalized into the same circle chart. Checked count/allocation guards prevent a reproduced oversized-request capacity panic without mislabeling an implementation limit as work-budget exhaustion. Local selected-point enclosures refine the original guards before line bounds are published. Immutable curve/path caches retain only successful strict bounds, allowing a failed resource-limited attempt to retry. Cardinal ordering of polynomial point carriers and their similarities tries the existing common-field linear predicate before projecting independent scalar coordinates; unsupported common fields retain the original fallback. The shortcut applies to retained maps and similarities; field alignment removes them and compares unmapped selected base/fiber points through the existing scalar path, preventing repeated source-equality recursion.',
    'closure_argument': 'For unit N, radius r and turn s, the center-free rational chart has homogeneous controls(rN,1),(rs*perp(N),0),(-rN,1). Its original polynomials are differentiated with the existing recurrence before field-value reduction. For incident radial projections n,b, u=b/(r+n+b), with the alternate(r-n)/(r-n+b) at the excluded endpoint. Original radial and inverse denominators are checked before applying derivative functions in the original field. The center is held constant even when the query parameter shares its selected base root. Restriction/reversal retain the source chart; similarities act by their linear part on vectors. These local identities do not establish global arrangement or operation closure.',
    'qualification': 'Twelve new public cases cover the original exact magnitude; independent complex closed-form orders1..3 at signed selected points; orders1..8 at endpoints/midpoint with both radius signs/turns; invalid domains and zero order; restriction/reversal and sqrt2 similarities; checked point definitions; differential-point line construction and fresh-process native replay followed by another exact split; actual chain budget exhaustion and retry; strict/approximate/strict certainty; and typed oversized-output rejection. Two minimized bounds witnesses cover an original pole inside the authored isolator, exact endpoint containment, native replay, a reached ZERO limit, a larger-budget retry on the same object, and later warm ZERO success. Two further public cases preserve equal independently mapped points and signed2^-80coordinate differences under ZERO counters, including the initial equality proof used by affine-form comparison. One further distinct-fiber case verifies the base-coordinate identity and strict positive fifth-root order before and after equal translations, preserving the unrelated-field fallback. A private owner test retains qualified frame evidence after center cancellation. The15 earlier point/circle/replay/differential targets and derivative unit cases are retained, followed by the full suite and downstream packages.',
    'attempts': 'Prototype1 reports private vector constructor visibility; its internal visibility is corrected. Prototype2 passes the unchanged original magnitude and point control. Prototype3 catches a test-only Real::from(usize) conversion, corrected to checked u128. Prototype4 passes independent higher orders171.8seconds, scalar endpoints0.3seconds, and restriction/reversal/similarity47.6seconds. Its assumed derivative-only exhaustion is incorrect because the exact query completes with zero charged work. Prototype5 confirms its exact vector comparison also completes uncharged; neither success is converted into exhaustion. Both ZERO successes are asserted, and a source-attributed whole incidence->derivative->comparison probe reaches the real ZERO limit and succeeds on two larger retries. The original failed assertions and full raw output remain retained. MSRVprobe1 reports a test-only missing qualified enum import; corrected probe2 passes. The positive usize::MAX witness first reproduces a capacity panic before its shared allocation guard is fixed. Prototype6 records18 passing public cases and a derivative-point line native-export failure at bounds; a session transition interrupts the later private compilation, and no missing exit status is inferred. The original positive chain and two minimized bounds/retry cases remain unchanged. The bounds baseline reproduces both minimized failures. Local refinement makes the first pass and exposes the cached BudgetExhausted error on a larger retry. Bounds prototype2 catches two additional curve constructors still using the old cache type; their compiler failures are retained before correction. Bounds prototype3 passes both minimized cases and a temporary private diagnostic: the expanded derivative enclosure is unresolved through16steps and succeeds at32. That diagnostic does not replace the original fresh-process acceptance case and is removed before final qualification. The subsequent implementation retains the guarded angular map as a shared source for all derivative maps; the finite local refinement schedule is unchanged. Bounds prototype4 passes both minimized cases and strict MSRVprobe3, but the original cold replay exceeds the unchanged300second fixture envelope. It is externally stopped at607.172seconds, with actual-15status, source snapshots, two read-only stacks and the exact native SVG retained. Stacks identify independent coordinate-image root isolation in chord-range replay. Both the positive ZERO coordinate-order case and its attempted affine-form control reproduce actual AlgebraicPromotion exhaustion; no earlier passing control is assumed. Both positive assertions are preserved before fixing the shared coordinate-order owner. Bounds prototype5 passes all five focused cases, including original cold replay0.56seconds within its unchanged300second envelope. Prototype7 passes23 public cases, the private policy cases and native derivative units, but two older polynomial-point targets expose recursive field alignment. A distinct same-beta/different-fifth-root-fiber positive case independently reproduces stack overflow(-6). The fix requires field alignment to remove maps/wrappers before its base comparison; the original failed targets and minimized case remain intact. The incomplete607second run is not a matched-contract performance baseline.',
    'measured_frontiers': 'Original exact first-derivative magnitude, higher derivatives and transformations complete within the named fixture envelopes. General independent point-image fields and nonrepresented circle frames remain gaps. The previous positive closed correlated-center region probe still identifies admission before repeated round offsets as an open consumer. Work counters do not bound retained rational arithmetic. No comparative speedup or universal closure claim is made.',
    'limitations': ['The general algebraic domain, other field/frame carriers, filled-region admission, repeated offsets and corner edits need further implementation and completion evidence.', 'Instrumented refinement/promotion counts are not bounds on total arithmetic, coefficient or expression growth, heap use, or cancellation. External timeouts are containment only.', 'A typed output-allocation implementation blocker is not completed geometry or a declared work-budget exhaustion.', 'Native point/stroke replay is distinct from filled-region archives. Full pre-push and package/binding delivery remain pending for this increment.', 'Independent exact geometry assertions are separate from deterministic serialization; display values never become exact source.'],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-circle-differentials-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected-circle differential qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'circle-differentials-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
