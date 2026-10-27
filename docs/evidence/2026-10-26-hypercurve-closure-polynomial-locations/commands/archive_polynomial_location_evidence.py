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
checkout = Path('/tmp/hypercurve-closure-polynomial-locations')
base = '09ce6777463e0e3464ce628fe038f4cc17bfda90'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'polynomial-location-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'polynomial-location-final-files-before.json').read_text())
assert before == json.loads((root / 'polynomial-location-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'polynomial-location-final-full-suite.log')
assert full == {'suites': 80, 'passed': 2738, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'polynomial-location-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'polynomial-location-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'polynomial-location-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-polynomial-location-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 91
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-polynomial-location-evidence-2026-10-26'
parent = json.loads((root / 'rational-section-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-rational-section-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-26-hypercurve-closure-polynomial-locations'
staging = Path('/tmp/hypercurve-polynomial-location-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('polynomial-location-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('run_polynomial_location_*.py')) | {root / 'prepare_polynomial_location_catalog.py', Path(__file__)}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['src/polynomial_curve_abscissa.rs', 'src/polynomial_curve_rational.rs', 'src/polynomial_curve_rational_overlap.rs', 'tests/polynomial_selected_abscissas.rs', 'tests/polynomial_rational_sections.rs', 'tests/polynomial_point_locations.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'polynomial-location-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'Committed generated-line inputs and frozen selected-abscissa and rational-section increments. Final source hashes retain all prerequisite bytes; each prerequisite has a separate admission record.',
    'owner': 'Hypercurve selected polynomial point incidence and original source parameter chart',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Admitted selected polynomial graph slabs and invertible similarities, including the tested algebraic scale, with native and retained exact point inputs and closed algebraic restrictions. Queries require the existing exact scalar and selected-fiber authorities to decide.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 91, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'Three independent public point_locations fixtures reproduce Intersection/ImplicitPolynomial/Unsupported: a branch point_at output, a native parabola point with closed trims and a rationally generated quintic contact.',
        'The branch point-incidence authority recovers the original abscissa via the inverse similarity, rejects points outside the closed domain and validates equality with the original selected fiber. Equal endpoint parameters reuse the retained boundary authority.',
        'All three original fixtures pass after this extension. Expanded tests preserve other-root rejection, near-distinct points, singular endpoints, selected restrictions and later operations, independently expanded transformed equations, actual exhaustion/retry and certainty transitions. Test-only integer-conversion build diagnostics are retained.',
    ],
    'qualification': 'Eight public witnesses cover selected fiber output, independent native points, rationally generated contact replay, both ordered parabola roots, shared node/cusp boundaries, exact 2^-80 offsets, selected trim identity, subsequent intersections and locations on split pieces, quarter rotation/translation, reflection, uniform sqrt(2) scaling, checked in-memory point replay, zero counted allowance and a 100000-refinement/100000-promotion retry. STRICT/APPROXIMATE_512/STRICT outcomes remain Certified.',
    'limitations': [
        'This is point incidence, not filled-region admission or completion of A2/A3. General rational image maps can have multiple or continuous preimages and retain their separate unsupported contract.',
        'Broader nested dependent fibers, arbitrary coefficient fields, singular differential limits, offsets and corners on general implicit curves remain open.',
        'In-memory checked point definitions are not fresh-process native archive replay.',
        'The earlier 904e pre-push attempt failed a pre-existing voxel oracle and does not authorize publication. Full repository qualification of these follow-ons remains required.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound all arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-polynomial-location-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected polynomial point-location qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'polynomial-location-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
