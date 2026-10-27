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
checkout = Path('/tmp/hypercurve-closure-horizontal-boundaries')
base = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'horizontal-boundary-final-results.json').read_text())
assert len(results) == 16 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'horizontal-boundary-final-files-before.json').read_text())
assert before == json.loads((root / 'horizontal-boundary-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

solver = test_counts(root / 'horizontal-boundary-final-solver-suite.log')
assert solver == {'suites': 24, 'passed': 1223, 'failed': 0, 'ignored': 0}, solver
full = test_counts(root / 'horizontal-boundary-final-full-suite.log')
assert full == {'suites': 81, 'passed': 2744, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'horizontal-boundary-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'horizontal-boundary-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'horizontal-boundary-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-horizontal-boundary-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 97
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-horizontal-boundary-evidence-2026-10-27'
parent = json.loads((root / 'polynomial-location-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-polynomial-location-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-horizontal-boundaries'
staging = Path('/tmp/hypercurve-horizontal-boundary-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('horizontal-boundary-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*horizontal_boundary*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['crates/hypersolve/tests/bivariate_boundary_components.rs', 'crates/hypercurve/tests/polynomial_boundary_components.rs', 'crates/hyperbrep/tests/support/plane_tensor_sections.rs', 'crates/hyperbrep/src/geometry/selected_pcurves.rs']:
    copy(checkout / name, Path('source') / name)
patch = (root / 'horizontal-boundary-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypersolve finite-fiber topology projection and existing closed-fiber adjacency, consumed by Hypercurve and HyperBRep',
    'properties': ['P11', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Rational finite-fiber polynomial zero sets with simple generic fibers in a closed rational rectangle, including simple horizontal factors lying on either horizontal boundary. Original equations, factors, branch selections and closed-domain incidence remain authoritative.',
    'solver_suite': solver, 'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 97, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'Two positive witnesses reproduce BoundaryComponent on committed 5de7f0cb05: the original y+2=0 graph on [-2,2]^2 and y^2-4=0 retaining both boundary components.',
        'The original HyperBRep boundary-section fixture still expected the old BoundaryComponent rejection. Its original tensor surface is retained and promoted to exact section and whole-image/native-replay assertions, with the upper-boundary counterpart added.',
        'The first Hypercurve consumer build failed due to test-only integer parameter conversions and an unavailable JSON dependency. Explicit Real conversion and a dependency-free diagnostic exact-source encoding resolved those compile errors; all raw attempts are retained.',
    ],
    'downstream_findings': ['The stronger BRep fixture reproduced a directed correspondence mismatch after restriction/reversal. An already admitted rational pcurve independently reproduces it. Materialization now maps directed endpoints, without weakening edge-image validation.', 'Native and affine BRep replay then succeeded, but a further plane contact reproduced Unsupported because the source stored an exact similarity as a rational map. Line sections now derive a checked rational-similarity view while retaining the original maps and denominator guards; general nonlinear or nonuniform images remain open.'],
    'closure_argument': 'When F(x,b) vanishes identically, y-b is a retained factor of F. A simple generic boundary graph persists across each projection slab. A contact with another branch makes F_y vanish at that point and is already a resultant event. Existing exact closed-fiber isolation retains the boundary root; root-free separators and closed strip counts prove its event incidence. No factor is removed, no new geometry carrier is introduced, and no multiplicity or vertical-component blocker is bypassed.',
    'qualification': 'Ten solver witnesses use original lower/upper boundary cases, distinct boundary components, tangent parabola and circle contacts, partial-domain crossings, algebraic event fibers, 2^-80 separation, independent rational closed Sturm counts, source replay and actual budget failure/retry. Six Hypercurve witnesses exercise selected degree-five trims, different ordered branches, finite contacts and overlaps, retained singular endpoint incidence, reversal, rotated vertical images and diagnostic exact-source replay in a fresh process followed by further operation. The original HyperBRep surface fixture exercises both pcurves, whole-image validation, native archive replay and affine transport/revalidation.',
    'limitations': [
        'This is bounded A1 progress; vertical components, generic repeated components and algebraic coefficient fields remain open. The original polynomial is never square-free reduced by this change.',
        'Diagnostic equation/domain replay is not a new native Hypercurve archive format. HyperBRep native replay applies only to its admitted section witnesses, not general region/solid closure.',
        'This increment is based on the point-location branch and excludes the parallel shared-region increment. Its full repository pre-push qualification remains pending.',
        'Counted refinement/promotion work, degree/refinement controls and external 300-second fixture containment do not bound total arithmetic, coefficient growth, retained memory or cancellation.',
        'Concurrent qualification timings and process peak RSS are observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-horizontal-boundary-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record closed horizontal boundary component qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'horizontal-boundary-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
