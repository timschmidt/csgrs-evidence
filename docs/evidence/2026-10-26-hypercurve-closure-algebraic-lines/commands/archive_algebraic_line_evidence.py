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
checkout = Path('/tmp/hypercurve-closure-algebraic-lines')
base = '45947259afc094e2936eb07621d38dba73f1181a'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'algebraic-line-final-results.json').read_text())
assert len(results) == 9 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'algebraic-line-final-files-before.json').read_text())
after = json.loads((root / 'algebraic-line-final-files-after.json').read_text())
assert before == after
for name, mode, digest in before:
    p = checkout / name
    if mode in ['file', 'executable']:
        assert hashlib.sha256(p.read_bytes()).hexdigest() == digest, name
full = (root / 'algebraic-line-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 74 and counts == {'passed': 2676, 'failed': 0, 'ignored': 34}, counts
downstream = (root / 'algebraic-line-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
assert re.search(r'Ran 16 tests', (root / 'algebraic-line-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-algebraic-line-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 34
record = 'docs/evidence/2026-10-26-hypercurve-closure-algebraic-lines'
staging = Path('/tmp/hypercurve-algebraic-line-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('algebraic-line-*')):
    if source.is_file() and source.suffix in ['.json', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
for name in ['run_algebraic_line_qualification.py', 'archive_algebraic_line_evidence.py']:
    copy(root / name, Path('commands') / name)
for name in ['polynomial_line_components.rs', 'polynomial_algebraic_lines.rs']:
    copy(checkout / 'crates/hypercurve/tests' / name, Path('source') / name)
patch = (root / 'algebraic-line-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve native-line admission, certified substituted coefficients and selected source sections; existing Hypersolve and scalar decisions remain authoritative',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Admitted polynomial graph branches and retained rational similarities versus native LineSeg2 inputs with exact Real algebraic coordinates, selected restrictions and traversal. The source is A plus the frozen component candidate and this admission patch; all file hashes and both new test files are retained.',
    'full_suite': {'suites': len(rows), **counts}, 'downstream_passed': 43,
    'guard_tests': 16, 'matrix_fixtures': 34, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'Direct algebraic-abscissa evaluation already passes; the original irrational vertical and sloped lines and an additional sloped contact reproduce Unsupported at the frozen component candidate.',
        'The first native-line admission prototype passes those cases but falsely reports empty for a component y=-(sqrt(2)+sqrt(3)) of y^4-10y^2+1. The actual failure, candidate patch and exact test are retained.',
        'Certified coefficient decisions replace the structural-zero assumption before distinguishing a common component from finite or empty sections. Other selected branches and 2^-80-displaced supports remain distinct.',
    ],
    'qualification': 'Original frontier inputs retained as exact contact/empty cases; cubic, seventh-root and mixed-radical coordinates, exact defining relations, both operand orders and directions, independently expanded transformed equations, selected source chart replay, common components, split/requery, in-memory definition replay after original object drop, reached counted exhaustion and retry with policy changes.',
    'limitations': [
        'A2 and general algebraic closure remain incomplete. This increment covers native LineSeg2 inputs under the existing exact scalar/field decision requirements; selected chord carriers require separate admission.',
        'Broader algebraic transform coefficients, nonlinear maps, polynomial pairs, repeated/vertical topology components and filled polynomial regions remain gaps.',
        'Point-definition replay is in memory; fresh-process native generated archive replay is not established.',
        'Counted refinements/promotions do not bound total arithmetic, coefficient/system growth, retained memory or cancellation.',
        'Concurrent times and per-command time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending. The frozen 904e validation does not cover this candidate.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-algebraic-line-evidence-2026-10-26'
component_record = json.loads((root / 'polynomial-component-evidence-archive.json').read_text())
parent = component_record['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-line-components-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-algebraic-line-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record algebraic-coordinate native line section qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'algebraic-line-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
