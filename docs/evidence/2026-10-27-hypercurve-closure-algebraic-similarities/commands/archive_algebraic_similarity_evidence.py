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
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
base = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'algebraic-similarity-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'algebraic-similarity-final-files-before.json').read_text())
assert before == json.loads((root / 'algebraic-similarity-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'algebraic-similarity-final-full-suite.log')
assert full == {'suites': 81, 'passed': 2745, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'algebraic-similarity-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'algebraic-similarity-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'algebraic-similarity-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-algebraic-similarity-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 98
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-algebraic-similarity-evidence-2026-10-27'
parent = json.loads((root / 'polynomial-location-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-polynomial-location-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-algebraic-similarities'
staging = Path('/tmp/hypercurve-algebraic-similarity-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('algebraic-similarity-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*algebraic_similarity*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['tests/polynomial_algebraic_similarities.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'algebraic-similarity-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve polynomial similarity pullback and existing native-line section authority',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Previously admitted selected rational-coefficient finite-fiber graph branches, closed exact parameter domains and nonsingular algebraic-coefficient similarities, queried against finite native lines. Original image and fiber definitions remain authoritative. Scalar and selected-field decisions must complete exactly.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 98, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Both positive public intersection witnesses reproduce Intersection/ImplicitPolynomial/Unsupported on committed 5de7f0cb05: a sqrt(2) image of the selected quintic and an image translated by (sqrt(3),sqrt(2)). Their original source-line controls already succeed. Raw source snapshots, commands and failures are retained.',
    'change': 'Remove the rational-coefficient-only similarity guard. The existing exact inverse similarity supplies a native line to the existing section algorithm. Source parameters, original selected fibers, active endpoints, overlap correspondences and image definitions are unchanged.',
    'closure_argument': 'A nonsingular similarity is a bijection, so incidence and overlap domains pull back exactly. Source abscissa remains the branch chart. The determinant sign transports oriented tangent crossings. Existing exact coefficient and selected-fiber decisions remain required and preserve their typed failures; no world implicitization or independent coordinate materialization is introduced.',
    'qualification': 'Seven new public witnesses cover quadratic translations/scales, a seventh-root scale, oblique maps with independent sqrt(2)/sqrt(3) coefficients, reflections, operand exchange and traversal, tangency, exact selected trim endpoints, excluded parameters, common components with repeated overlap clipping, distinct source supports separated by 2^-80, checked in-memory point replay, actual reached zero-work exhaustion, a larger retry and Certified policy transitions after dropping originals. Expanded world equations, exact source parameters and topology assertions provide independent expectations.',
    'limitations': [
        'This is bounded A2 progress, not arbitrary algebraic operation closure. General rational images, different-image polynomial pairs, algebraic topology coefficients, repeated/vertical components and implicit offsets/corners remain open.',
        'Checked point-definition replay is in memory and does not establish native archive replay in a fresh process.',
        'This branch is based on the point-location increment and excludes the separate region and horizontal-boundary increments. Its full repository pre-push qualification is still pending.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) process peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-algebraic-similarity-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record algebraic similarity native-line qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'algebraic-similarity-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
