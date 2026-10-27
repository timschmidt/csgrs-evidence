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
checkout = Path('/tmp/hypercurve-closure-selected-abscissas')
base = '00dbdb152a465ebc9b2389e6a0d0a5360121878b'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'selected-abscissa-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'selected-abscissa-final-files-before.json').read_text())
assert before == json.loads((root / 'selected-abscissa-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'selected-abscissa-final-full-suite.log')
assert full == {'suites': 78, 'passed': 2710, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'selected-abscissa-final-downstream.log')['passed'] == 43
assert test_counts(root / 'selected-abscissa-final-solver-suite.log') == {'suites': 23, 'passed': 1213, 'failed': 0, 'ignored': 0}
dependent = test_counts(root / 'selected-abscissa-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'selected-abscissa-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-selected-abscissa-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 66
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-selected-abscissa-evidence-2026-10-26'
parent = json.loads((root / 'polynomial-chord-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-polynomial-chord-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-26-hypercurve-closure-selected-abscissas'
staging = Path('/tmp/hypercurve-selected-abscissa-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('selected-abscissa-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('run_selected_abscissa_*.py')) | {root / 'prepare_selected_abscissa_catalog.py', Path(__file__)}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['src/polynomial_curve_chord.rs', 'src/polynomial_curve_abscissa.rs', 'tests/polynomial_generated_lines.rs', 'tests/polynomial_selected_abscissas.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'selected-abscissa-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'Committed selected-fiber ordering and polynomial-pair increments, plus frozen generated-line inputs. The frozen-base file hashes attribute these prerequisites without a claim that later pre-push checks covered them.',
    'owner': 'Hypercurve polynomial branch evaluation and retained abscissa charts; Hypersolve exact bivariate rational substitution',
    'properties': ['P15', 'P18', 'P19', 'P20'],
    'domain': 'Interior source abscissas retained as rational functions of one selected algebraic base, including unmaterialized generic quintic coordinates. Original denominators remain guarded; source graph slabs retain the ordered Y-root census. Prior polynomial-point maps can be pulled back when their queried rational coordinate is structurally independent of the selected Y fiber.',
    'hypersolve_suite': test_counts(root / 'selected-abscissa-final-solver-suite.log'),
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 66, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The original generic-quintic finite polynomial/rational queries exposed Evaluation/ImplicitPolynomial/Unsupported. A separate public branch.point_at fixture reproduces this without pair dispatch at committed D plus frozen F inputs.',
        'C(t)=(t^2,-t), t^5+t^2+5t-5=0 on [0,1], yields an exact retained X with no ordinary Bezier parameter view. Radical and fifth-root controls already pass and remain unchanged.',
        'The first pullback prototype passes all three original evaluation cases. An expanded output-to-input witness then exposes Unsupported when the output coordinate carries a polynomial point map.',
        'Pulling that coordinate query back to its original fiber proves structural independence of Y and retains the same base. Repeated evaluation no longer rebuilds an independent coordinate root.',
        'The original prototype build diagnostics, seven-pass/one-failure expansion and final ten-pass focused run remain retained. No failure was reclassified as geometric completion.',
    ],
    'qualification': 'Ten public witnesses preserve the original cubic, fifth-root and generic-quintic cases, repeated extraction/reuse of output coordinates, in-memory checked point replay, ordered branch signs, rational denominators with both signs, rejected removable poles, restrictions and reversal, an independently expanded transformed quintic, zero-distance retained parallel definitions, changed selections, 2^-80 distinct coordinates and actual zero-budget exhaustion followed by a larger retry and Certified policy transitions. A Hypersolve identity test verifies active first degree, exact substitution and retained pole factors.',
    'limitations': [
        'This increment does not complete A2, general nested/dependent-fiber abscissas, arbitrary algebraic coefficients, polynomial/rational intersection algorithms, filled polynomial operations or universal closure.',
        'The named generated-line prerequisite and this follow-on still require their own complete repository pre-push qualification; frozen 904e checks do not cover them.',
        'In-memory checked point definitions are not fresh-process native archive replay.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound all arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-selected-abscissa-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record retained polynomial-abscissa fiber pullback qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'selected-abscissa-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
