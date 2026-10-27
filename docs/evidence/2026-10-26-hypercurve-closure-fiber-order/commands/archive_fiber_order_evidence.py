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
checkout = Path('/tmp/hypercurve-closure-fiber-order')
base = 'fd1313a23a9718734b8e11bc7382665cf88ba8bd'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'fiber-order-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'fiber-order-final-files-before.json').read_text())
after = json.loads((root / 'fiber-order-final-files-after.json').read_text())
assert before == after
for name, mode, digest in before:
    p = checkout / name
    if mode in ['file', 'executable']:
        assert hashlib.sha256(p.read_bytes()).hexdigest() == digest, name
full = (root / 'fiber-order-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 75 and counts == {'passed': 2681, 'failed': 0, 'ignored': 34}, counts
downstream = (root / 'fiber-order-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
assert re.search(r'Ran 16 tests', (root / 'fiber-order-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-fiber-order-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 37
record = 'docs/evidence/2026-10-26-hypercurve-closure-fiber-order'
staging = Path('/tmp/hypercurve-fiber-order-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('fiber-order-*')):
    if source.is_file() and source.suffix in ['.json', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
for name in ['run_fiber_order_qualification.py', 'resume_fiber_order_qualification.py', 'archive_fiber_order_evidence.py']:
    copy(root / name, Path('commands') / name)
for name in ['polynomial_point_order.rs']:
    copy(checkout / 'crates/hypercurve/tests' / name, Path('source') / name)
patch = (root / 'fiber-order-final-candidate.patch').read_bytes()
dependent = (root / 'fiber-order-final-dependent-packages.log').read_text()
dependent_rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', dependent)
assert dependent_rows and all(row[0] == 'ok' and row[2] == '0' for row in dependent_rows)
dependent_counts = {key: sum(int(row[i]) for row in dependent_rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert dependent_counts['passed'] > 0
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected-fiber scalar predicates and retained native evidence, using existing exact scalar/field authorities',
    'properties': ['P4', 'P15', 'P19', 'P20'],
    'domain': 'Admitted selected fibers with retained exact singleton or certified native parameter evidence, preserving original base and root selections. Native univariate specialization requires both incidence and query to be structurally independent of the base.',
    'full_suite': {'suites': len(rows), **counts}, 'root_downstream_passed': 43,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'dependent_package_tests': {'suites': len(dependent_rows), **dependent_counts},
    'guard_tests': 16, 'matrix_fixtures': 37, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'At committed fd1313a23, the interior point of (y-x)(y+x) and the event singleton of (y-x)(2y-1) at (1/2,1/2) exhaust all 512 counted refinements and make no promotion. Both base parameters are exact 1/2; the failure is singleton containment, not unequal base identities.',
        'The retained-native prototype passes the original point but comparison of sqrt(3) +- 2^-80 over retained sqrt(2) still exhausts the same 512 refinements. Both incidence and query are independent of that base; the original native path refines it unnecessarily.',
        'The final comparison keeps existing zero-step interval proofs first, consumes already retained native evidence in either direction, and retains the original fallback for non-budget unknown outcomes. The independent-base specialization uses existing scalar algorithms and preserves the original fiber definition.',
        'An initial short-name exact unit-test filter ran zero tests and is retained but not credited. The corrected exact registration passes, and the final full suite reruns both new private witnesses.',
    ],
    'qualification': 'Three public point-order fixtures and two private scalar witnesses cover both directions, independent certified native evidence, distinct 2^-80/2^-100 neighbors, negative conjugates, repeated incidence, genuine equation/query base dependencies, in-memory checked definition replay after source drop, policy changes, actual reached zero-budget exhaustion and larger retry.',
    'limitations': [
        'This predicate increment does not complete general polynomial pair or region support, A2, M1, or universal algebraic closure.',
        'In-memory point-definition replay does not establish fresh-process generated native archive replay.',
        'Counted refinements/promotions do not bound total arithmetic, coefficient/system growth, retained memory or cancellation.',
        'Concurrent elapsed times and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'The first grouped dependent-package build failed at a read-only ccache and emitted duplicate example-output warnings. Its raw record is retained; separate package runs with a writable task cache supersede it without source changes.',
        'Full repository pre-push qualification remains pending. The frozen 904e validation does not cover this candidate.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-fiber-order-evidence-2026-10-26'
parent_record = json.loads((root / 'algebraic-line-evidence-archive.json').read_text())
parent = parent_record['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-algebraic-line-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-fiber-order-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected-fiber ordering and native evidence qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'fiber-order-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
