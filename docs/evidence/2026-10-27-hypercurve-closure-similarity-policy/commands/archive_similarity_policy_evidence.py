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
checkout = Path('/tmp/hypercurve-closure-similarity-policy')
base = '2395ba77d81a6eb172f62b99a13bef73a7235a43'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'similarity-policy-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'similarity-policy-final-files-before.json').read_text())
assert before == json.loads((root / 'similarity-policy-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'similarity-policy-final-full-suite.log')
assert full == {'suites': 85, 'passed': 2773, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'similarity-policy-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'similarity-policy-final-dependent-packages.log')
assert dependent['passed'] == 3010 and dependent['failed'] == 0 and dependent['ignored'] == 0
assert re.search(r'Ran 16 tests', (root / 'similarity-policy-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-similarity-policy-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 125
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-similarity-policy-evidence-2026-10-27'
parent = json.loads((root / 'selected-integration-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-selected-integration-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-similarity-policy'
staging = Path('/tmp/hypercurve-similarity-policy-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('similarity-policy-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*similarity_policy*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['tests/similarity_policy_closure.rs', 'src/polynomial_curve.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'similarity-policy-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected polynomial point and branch similarity construction, using the existing retained-policy protocol',
    'properties': ['P4', 'P8', 'P9', 'P15', 'P18', 'P19', 'P20'],
    'domain': 'Previously admitted selected polynomial graph branches and their existing similarity images. A locally certified selected point or transformed endpoint constructed under APPROXIMATE_512 must retain the policy actually consumed, while nested approximate source dependencies remain qualified.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 125, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Two public witnesses on committed 2395ba77d8 return Certified point/image construction under APPROXIMATE_512, then fail Classification/Unsupported when the same returned points are queried under STRICT. Their independent STRICT reference constructions already succeed. Baseline commands, source snapshots and failures are retained.',
    'change': 'The two PolynomialCurveBranch2 similarity-point construction sites pass retained_object_policy() to the existing BezierSimilarityPoint2 constructor. The generic constructor and its original policy-barrier regression are unchanged.',
    'closure_argument': 'Selecting APPROXIMATE_512 does not consume an approximate terminal. The existing operation receipt determines the local retained policy; an exact similarity preserves the selected source point. The existing constructor only flattens policy-compatible nested images, and checked replay validates the source definition. Incompatible approximate dependencies therefore remain nested and keep their policy barriers.',
    'qualification': 'Two public witnesses exercise the same Certified outputs across APPROXIMATE_512 to STRICT: exact affine relations for a selected quintic root, strict point equality, checked in-memory point-definition replay, generated-chord incidence and further branch subdivision. A new unit witness seeds an observed consumed-policy receipt on the parent, constructs a locally Certified child, and verifies that strict endpoint queries and replay remain blocked. The existing generic nested-similarity policy-barrier test also passes unchanged. All four focused checks pass.',
    'limitations': [
        'This is a selected-polynomial similarity policy fix, not a general audit of all retained point families or arbitrary algebraic operation closure.',
        'The negative dependency witness seeds an observed consumed-policy receipt; it does not claim a newly generated numerically approximated geometric construction.',
        'Checked point-definition replay is in memory and does not establish native archive replay in a fresh process.',
        'No resource algorithm changes. Existing counted limits and external fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) process peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending; the separate earlier publication candidate does not validate these later source bytes.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-similarity-policy-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected similarity point policy qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'similarity-policy-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
