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
checkout = Path('/tmp/hypercurve-closure-selected-integration')
base = 'b6da97710cbc124f243f969c5f224b06826c18d6'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'selected-integration-final-results.json').read_text())
assert len(results) == 16 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'selected-integration-final-files-before.json').read_text())
assert before == json.loads((root / 'selected-integration-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

solver = test_counts(root / 'selected-integration-final-solver-suite.log')
assert solver == {'suites': 24, 'passed': 1223, 'failed': 0, 'ignored': 0}, solver
full = test_counts(root / 'selected-integration-final-full-suite.log')
assert full == {'suites': 84, 'passed': 2770, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'selected-integration-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'selected-integration-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'selected-integration-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-selected-integration-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 123
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-selected-integration-evidence-2026-10-27'
parent = 'de84df74612abfd1e4d447e4827e42ef46f302a6'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', branch], text=True).strip() == parent
record = 'docs/evidence/2026-10-27-hypercurve-closure-selected-composition'
staging = Path('/tmp/hypercurve-selected-integration-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('selected-integration-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*selected_integration*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['crates/hypercurve/tests/polynomial_closure_composition.rs', 'crates/hypercurve/src/curve_region_boolean.rs', 'crates/hypercurve/src/curve_region_boolean/fragment_location.rs', 'crates/hypercurve/src/polynomial_curve_chord.rs']:
    copy(checkout / name, Path('source') / name)
patch = (root / 'selected-integration-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'parents': ['b6da97710cbc124f243f969c5f224b06826c18d6', 'e49c24719f3b7ccf60451e9e4caaeba155d2b550', 'f2d00711141f3738b5049d452f06326019312d5e'],
    'owner': 'Hypercurve shared region face probes and retained branch/chord incidence',
    'properties': ['P4', 'P8', 'P9', 'P12', 'P13', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Composition of previously qualified selected polynomial regions, closed horizontal domain components and algebraic similarity/native-line sections. Original polynomial, branch selectors, source domains, rational-map guards and exact image definitions remain authoritative.',
    'solver_suite': solver, 'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 123, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'prototype2 reproduces Boolean/ImplicitPolynomial/Unsupported for the closed-component clip, reconstruct, subtract and intersect chain; all original assertions remain.',
        'prototype5 adds the quarter-turn quintic strip and reproduces an Unsupported in subsequent Boolean face classification despite successful direct point classification.',
        'prototype6 additionally changed boundary regularization probe directions but did not fix the rotated failure; that change was removed. diagnostic4 locates the rotated failure in the APPROXIMATE_512 iteration: the chord section replaced the replay context with strict_counterpart. Its replacement is the existing strict_predicate_pass with the original context. Diagnostic builds are retained separately, including diagnostic3 rejected for a formatting/source-snapshot race before running tests.',
    ],
    'closure_argument': 'An already represented coordinate defines an exact axis probe to a point outside certified bounds while its companion coordinate and selected source relations remain retained. Existing complete pair replay and winding/filled-side authorities determine incidence and face classification. Polynomial/chord sections suppress terminal decisions through the existing strict-predicate scope while preserving caller replay authority. No dependency policy barrier is removed. No sampled point or replacement filled-set carrier is introduced.',
    'qualification': 'The original y(y-1) closed rectangle exercises both fill rules and traversals, exact endpoint and source/root checks, clipping, reconstruction, disjoint side components, and regularized empty reuse. The quintic strip retains its defining relation through a quarter-turn, further Boolean operations and strict/approximate/strict Certified receipts. A guarded rational identity followed by an algebraic similarity retains original maps and source evidence through both operand orders, reversal, contact replay, overlap subdivision and a further intersection.',
    'limitations': [
        'These are finite composition witnesses, not arbitrary algebraic curve or operation closure. Parent limitations remain, including general repeated/vertical components, coefficient fields, nonlinear rational images, offsets and corner edits.',
        'Checked in-memory point replay is not a new native archive format or a fresh-process region replay claim.',
        'The concurrent publication candidate is excluded. This integration still requires full repository pre-push qualification before remote publication.',
        'Counted work and external fixture timeouts do not bound every arithmetic operation, coefficient growth, expression size, retained byte or cancellation.',
        'Concurrent timings and process peak RSS are observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-selected-integration-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record combined selected branch composition qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, parent], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'selected-integration-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
