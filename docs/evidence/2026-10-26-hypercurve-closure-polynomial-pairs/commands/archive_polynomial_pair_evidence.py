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
checkout = Path('/tmp/hypercurve-closure-polynomial-pairs')
base = 'fd1313a23a9718734b8e11bc7382665cf88ba8bd'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'polynomial-pair-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'polynomial-pair-final-files-before.json').read_text())
after = json.loads((root / 'polynomial-pair-final-files-after.json').read_text())
assert before == after
for name, mode, digest in before:
    p = checkout / name
    if mode in ['file', 'executable']:
        assert hashlib.sha256(p.read_bytes()).hexdigest() == digest, name
full = (root / 'polynomial-pair-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 76 and counts == {'passed': 2690, 'failed': 0, 'ignored': 34}, counts
downstream = (root / 'polynomial-pair-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
assert re.search(r'Ran 16 tests', (root / 'polynomial-pair-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-polynomial-pair-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 46
record = 'docs/evidence/2026-10-26-hypercurve-closure-polynomial-pairs'
staging = Path('/tmp/hypercurve-polynomial-pair-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('polynomial-pair-*')):
    if source.is_file() and source.suffix in ['.json', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
for name in ['run_polynomial_pair_qualification.py', 'resume_polynomial_pair_qualification.py', 'archive_polynomial_pair_evidence.py']:
    copy(root / name, Path('commands') / name)
for name in ['polynomial_point_order.rs', 'polynomial_curve_pairs.rs']:
    copy(checkout / 'crates/hypercurve/tests' / name, Path('source') / name)
patch = (root / 'polynomial-pair-final-candidate.patch').read_bytes()
dependent = (root / 'polynomial-pair-final-dependent-packages.log').read_text()
dependent_rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', dependent)
assert dependent_rows and all(row[0] == 'ok' and row[2] == '0' for row in dependent_rows)
dependent_counts = {key: sum(int(row[i]) for row in dependent_rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert dependent_counts['passed'] > 0
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'Frozen selected-fiber ordering inputs are attributed by file hashes. Their separate qualification record precedes this record; the source snapshot here contains those inputs plus the pair patch.',
    'owner': 'Hypercurve selected polynomial incidence and source correspondence; existing Hypersolve resultant, component and root authorities',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Admitted selected polynomial graph slabs in a common source chart or equal rational similarity image, with exact trim parameters and traversal. Original selected fibers decide candidate incidence; common factors retain overlaps and residual/mixed contacts.',
    'full_suite': {'suites': len(rows), **counts}, 'root_downstream_passed': 43,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'dependent_package_tests': {'suites': len(dependent_rows), **dependent_counts},
    'guard_tests': 16, 'matrix_fixtures': 46, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'Three original pair regressions reproduce Unsupported at committed fd1313a23. The original positive-parabola frontier input is retained intact as a proved empty result, in both APIs and operand orders; its filled-region blocker is unchanged.',
        'The first prototype retains residual and common-component cases but stalls on the mixed contact at (1/2,1/2). A stack and an instrumented 120-second externally stopped run locate Y comparison. Independent public point-order reproduction and the lowest-layer fix are in the prerequisite record.',
        'A valid negative overlap restriction returns false empty when the identity correspondence is built over [0,1]. The retained implementation uses the original source rectangle abscissa chart; the original failing restriction is retained.',
        'Shared rational similarity pairs initially reproduce Unsupported. The retained path compares all affine coefficients exactly by value, transports source incidence and accounts for orientation; differing images keep typed blockers.',
        'The degree-37 graph explicitly exceeds the ordinary bounded resultant schedule, while the complete pair path finishes with the original selected fiber and exact defining relation.',
        'Initial compiler errors and a restriction fixture violating the documented ordered-range precondition remain separate from actual geometric counterexamples. No zero-test or externally stopped run is counted as exact success.',
    ],
    'qualification': 'Nine public pair fixtures cover finite and empty incidence, exact defining equations and selectors, algebraic trims, common/residual/mixed components, singular incidence without fabricated tangent evidence, exact tangent/cross signs when proved, 2^-100-distinct supports, original negative parameter maps, reversal and operand exchange, shared rational images, split/requery, in-memory definition replay, counted exhaustion and retry, policy transitions and degree-37 continuation.',
    'limitations': [
        'This scoped incidence increment does not complete A2 or universal algebraic closure. Different image transforms, broader coefficient cases, nonlinear maps and vertical/repeated topology components remain separate gaps.',
        'Polynomial region admission, Booleans and offsets remain open; a complete incidence result with an absent singular tangent sign does not establish differential or arrangement completion.',
        'In-memory point-definition replay does not establish fresh-process generated native archive replay.',
        'Counted refinements/promotions and 300-second external fixture limits do not bound total arithmetic, coefficient/system growth, retained memory or cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'The initial grouped downstream invocation and its same-named example-output warnings are retained. Separate per-package runs with a writable task-local compiler cache supersede that invocation without source changes.',
        'Full repository pre-push qualification remains pending. The frozen 904e validation does not cover this candidate.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-polynomial-pair-evidence-2026-10-26'
parent_record = json.loads((root / 'fiber-order-evidence-archive.json').read_text())
parent = parent_record['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-fiber-order-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-polynomial-pair-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected polynomial pair incidence and correspondence qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'polynomial-pair-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
