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
checkout = Path('/tmp/hypercurve-closure-fillet-contacts')
base = 'b1af6465b397a2a3cdc3623c7da0a2f068ba07fb'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'mapped-polynomial-final-results.json').read_text())
assert len(results) == 9 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'mapped-polynomial-final-files-before.json').read_text())
after = json.loads((root / 'mapped-polynomial-final-files-after.json').read_text())
assert before == after
for name, mode, digest in before:
    p = checkout / name
    if mode in ['file', 'executable']:
        assert hashlib.sha256(p.read_bytes()).hexdigest() == digest, name
full = (root / 'mapped-polynomial-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 72 and counts == {'passed': 2664, 'failed': 0, 'ignored': 34}, counts
downstream = (root / 'mapped-polynomial-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
assert re.search(r'Ran 16 tests', (root / 'mapped-polynomial-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-mapped-polynomial-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 22
record = 'docs/evidence/2026-10-26-hypercurve-closure-mapped-polynomial'
staging = Path('/tmp/hypercurve-mapped-polynomial-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('mapped-polynomial-*')):
    if source.is_file() and source.suffix in ['.json', '.log', '.patch']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
for name in ['run_mapped_polynomial_qualification.py', 'archive_mapped_polynomial_evidence.py']:
    copy(root / name, Path('commands') / name)
patch = (root / 'mapped-polynomial-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve polynomial source sections, native selected-line evaluation and selected-field point predicates',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Rational native/authored lines and retained restrictions against admitted polynomial graph branches under invertible rational similarities; selected source domains, fiber identities and traversal are retained.',
    'full_suite': {'suites': len(rows), **counts}, 'downstream_passed': 43,
    'guard_tests': 16, 'matrix_fixtures': 22, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The original translated quintic/line fixture reports Unsupported before the section pullback.',
        'A native line evaluated at a transformed selected-fiber parameter produces an undecided point comparison before retaining the affine image of that joint source.',
        'A rotated sloped contact retains an ordinary algebraic base parameter; coordinate comparison and coincidence needed to consume the existing selected-field relation.',
    ],
    'qualification': 'Original translated input retained, independent transformed polynomial and isolating bounds, both operand orders/traversals, tangencies/cusps, algebraic source trims, another transform/reversal, in-memory point replay, 2^-80 separation, actual counted exhaustion and larger-budget retry.',
    'limitations': [
        'A2 and general algebraic closure remain incomplete. Other algebraic transforms, nonlinear rational maps, algebraic-coordinate lines, polynomial pairs and filled polynomial regions remain gaps.',
        'Continuous common polynomial/line components still report Unsupported at this candidate. The separate component prototype is excluded from this record.',
        'Point-definition replay is in memory; fresh-process native generated archive replay is not established.',
        'Counted refinements/promotions do not bound total arithmetic, coefficient/system growth, retained memory or cancellation.',
        'Concurrent times and per-command time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending. The frozen 904e validation does not cover this candidate.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-mapped-polynomial-evidence-2026-10-26'
parent = 'a74b62c4fdd8dd3c361d9f175cfa947c7c1a5635'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-capability-matrix-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-mapped-polynomial-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record mapped polynomial section and selected-point qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'mapped-polynomial-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
