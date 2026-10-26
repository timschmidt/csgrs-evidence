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
checkout = Path('/tmp/hypercurve-closure-endpoint-identity')
base = '45947259afc094e2936eb07621d38dba73f1181a'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'polynomial-component-final-results.json').read_text())
assert len(results) == 9 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'polynomial-component-final-files-before.json').read_text())
after = json.loads((root / 'polynomial-component-final-files-after.json').read_text())
assert before == after
for name, mode, digest in before:
    p = checkout / name
    if mode in ['file', 'executable']:
        assert hashlib.sha256(p.read_bytes()).hexdigest() == digest, name
full = (root / 'polynomial-component-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 73 and counts == {'passed': 2669, 'failed': 0, 'ignored': 34}, counts
downstream = (root / 'polynomial-component-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
assert re.search(r'Ran 16 tests', (root / 'polynomial-component-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-polynomial-component-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 27
record = 'docs/evidence/2026-10-26-hypercurve-closure-line-components'
staging = Path('/tmp/hypercurve-polynomial-component-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('polynomial-component-*')):
    if source.is_file() and source.suffix in ['.json', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
for name in ['run_polynomial_component_qualification.py', 'archive_polynomial_component_evidence.py']:
    copy(root / name, Path('commands') / name)
copy(checkout / 'crates/hypercurve/tests/polynomial_line_components.rs', Path('source') / 'polynomial_line_components.rs')
patch = (root / 'polynomial-component-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypersolve certified slab and fiber selection consumed by Hypercurve polynomial sections and existing overlap correspondence',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'A rational native line that is a polynomial component, admitted finite-fiber graph branches, rational similarities, exact selected source domains and traversal; overlap on the selected line and finite contacts on the other branches.',
    'full_suite': {'suites': len(rows), **counts}, 'downstream_passed': 43,
    'guard_tests': 16, 'matrix_fixtures': 27, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The original three positive component witnesses reproduced Unsupported at b1af and again on the exact frozen mapped-section candidate, before component production changes.',
        'An early closed-interval selector was replaced after review of isolator endpoint ownership. The irrational-branch fixture passed both versions; it is not a runtime counterexample to that prototype.',
        'Early borrow and missing-chart compilation failures are retained as development attempts, not geometric runtime findings.',
    ],
    'qualification': 'Original common-component inputs retained and promoted; exact line factorization and checked slab/fiber selection, algebraic trim correspondence, both operand orders/reversals, rational similarities, transverse/tangent other-branch contacts, irrational disjoint branches, singleton and nearby separated domains, in-memory point replay, actual counted exhaustion and larger-budget retry with policy changes.',
    'limitations': [
        'A2 and general algebraic closure remain incomplete. Algebraic-coordinate lines, broader maps, polynomial pairs, repeated/vertical topology components and filled polynomial regions remain gaps.',
        'The exact quotient only generates candidates and classifies the noncomponent branch; all points retain the original polynomial, selected fiber and branch domain.',
        'Point-definition replay is in memory; fresh-process native generated archive replay is not established.',
        'Counted refinements/promotions do not bound total arithmetic, coefficient/system growth, retained memory or cancellation.',
        'Concurrent times and per-command time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending. The frozen 904e validation does not cover this candidate.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-line-components-evidence-2026-10-26'
parent = 'f763399f1656e9596f9e63d13661feb89e3ee85b'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-mapped-polynomial-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-polynomial-component-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record polynomial line-component overlap and contact qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'polynomial-component-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
