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
checkout = Path('/tmp/hypercurve-closure-rational-point-images')
base = json.loads((root / 'circle-differentials-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'rational-point-images-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'rational-point-images-final-files-before.json').read_text())
assert before == json.loads((root / 'rational-point-images-final-files-after.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
transition = json.loads((root / 'rational-point-images-parent-transition.json').read_text())
assert transition['all_non_receipt_bytes_unchanged'] and transition['new'] == base
qualified_source = json.loads((root / 'rational-point-images-final-source-before.json').read_text())
assert qualified_source == json.loads((root / 'rational-point-images-final-source-after.json').read_text())
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

full = test_counts(root / 'rational-point-images-final-full-suite.log')
assert full == {'suites': 93, 'passed': 2870, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'rational-point-images-final-downstream.log')
assert downstream['suites'] == 11 and downstream['passed'] == 64 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('rational-point-images-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'rational-point-images-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-rational-point-images-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 213
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-rational-point-images-evidence-2026-10-27'
parent = json.loads((root / 'circle-differentials-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-circle-differentials-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-rational-point-images'
staging = Path('/tmp/hypercurve-rational-point-images-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('rational-point-images-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c', '.svg']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*rational_point_images*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'rational-point-images-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve point-image admission and identity, rational-form pullbacks, native selected-parameter predicates and exact replay; existing point/line consumers',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P26', 'P29'],
    'domain': 'Rational maps of native selected rational-curve point images and their finite map chains. Existing exact, polynomial-fiber, similarity and endpoint inputs remain supported. The original selected parameter and shared point/map dependencies remain authoritative; other point fields and full region/operation closure remain open.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 213, 'commands': results,
    'source_attribution': 'All 18 final groups run on one complete frozen source based on S with T/U/V/W and the differential increment included. After qualification and the differential commit, only its three receipt files are imported; every other qualified byte is unchanged. Both the full patch and final parent-relative patch are retained, followed by three checked receipts for this increment.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'A fresh all-feature build of the preceding frozen differential source passes original scalar-query and invalid-pole controls but rejects the original positive point-image/replay/inverse chain as Construction/ImplicitPolynomial/Unsupported. Prototype3 passes all three unchanged original cases. Prototype5 also passes the signed-denominator/order/bounds and fresh-process native line/split cases.',
    'change': 'Retain a shared rational-map point node with the original source, map, denominator and construction policy. Reuse existing rational query pullbacks, common-field coordinate order, local bounds and homogeneous recursive projective predicates. Existing RationalImage native definitions validate original guards and consume the source graph without a new wire tag. Native selected-parameter predicates reuse retained chart polynomials before optional coordinate materialization. Actual exhaustion is checked before publishing a new image, and qualification survives identity and constant queries and strict native replay.',
    'closure_argument': 'A rational map of a point whose coordinates are rational functions of the same selected parameter remains a pair of rational functions in that field. Homogeneous pullbacks use a common total degree and preserve numerator/denominator signs. The original map and all source guards remain owned and are validated before cancellation or field reduction. Exact query views and optional field representations never replace the original construction graph. This local representation closure does not prove global arrangement or all modeling-operation closure.',
    'qualification': 'Eight public cases retain the original exact point-image chain, independent Bernstein circle, unit-circle residual, inverse map, original and downstream removable poles, negative denominators, near-distinct order, exact enclosures, similarities, fresh-process native line replay and a further exact midpoint split/map. Resource cases separately assert the original no-coordinate-promotion chain, inner typed exhaustion at an actually reached ZERO limit, outer reached counters, larger retries and policy certainty. Three private cases check qualified identity/coordinate queries, constant affine queries and strict native replay inside a provisional scope. Existing native point/circle/rational and differential targets remain part of affected checks and the full final suite.',
    'attempts': 'The original Unsupported baseline and unchanged original source are retained. Prototype1 and2 catch missing exhaustive dispatch cases. Prototype3 passes all original cases. Prototype4 catches a test-only CurveLocation2/CurveParameter2 mismatch; the corrected prototype5 passes all five public cases. A resource observation shows the full point-map/comparison chain reaches a promotion request with4,096 refinements / 0 promotions; a finer probe shows construction itself and scalar guard admission use 64 refinements and 0 promotions, so the promotion belongs to comparison. A positive no-projection assertion preserves that failure. A separate positive baseline proves the constructor returned inner Ok after actual ZERO refinement exhaustion while the outer budget correctly failed. The original policy identity test fails on the initial new wrapper; subsequent policy baseline covers strict replay and constant queries. All raw attempts and original programs are retained. Later focused and final commands must establish the actual completed result before archiving.',
    'measured_frontiers': 'The named exact map, query and native line consumers complete within their recorded fixture envelopes. Other point fields, arbitrary algebraic arrangements, region admission, repeated offsets and corner edits remain implementation gaps. Shared work counters do not bound total arithmetic or retained memory. No comparative speedup or universal closure claim is made.',
    'limitations': ['The general algebraic support envelope and other point-image fields, filled-region admission, offsets and corner edits still require implementation and evidence.', 'Refinement/promotion counters are not total-work, coefficient/expression-size, heap or cancellation bounds; external timeouts are containment only.', 'Native point/stroke replay is distinct from filled-region archives. Full pre-push and package/binding delivery remain pending for this local increment.', 'Independent exact expectations establish fixture geometry separately from deterministic serialization; display output is never exact authority.'],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-rational-point-images-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record retained rational point-image qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'rational-point-images-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
