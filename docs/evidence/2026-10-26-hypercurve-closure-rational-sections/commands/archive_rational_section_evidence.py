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
checkout = Path('/tmp/hypercurve-closure-rational-sections')
base = '09ce6777463e0e3464ce628fe038f4cc17bfda90'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'rational-section-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'rational-section-final-files-before.json').read_text())
assert before == json.loads((root / 'rational-section-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'rational-section-final-full-suite.log')
assert full == {'suites': 79, 'passed': 2730, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'rational-section-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'rational-section-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'rational-section-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-rational-section-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 83
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-rational-section-evidence-2026-10-26'
parent = json.loads((root / 'selected-abscissa-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-selected-abscissa-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-26-hypercurve-closure-rational-sections'
staging = Path('/tmp/hypercurve-rational-section-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('rational-section-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('run_rational_section_*.py')) | {root / 'prepare_rational_section_catalog.py', Path(__file__)}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['src/polynomial_curve_abscissa.rs', 'src/polynomial_curve_rational.rs', 'src/polynomial_curve_rational_overlap.rs', 'tests/polynomial_selected_abscissas.rs', 'tests/polynomial_rational_sections.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'rational-section-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'Committed generated-line inputs and frozen selected-abscissa implementation, tests and capability catalog. Final hashes attribute the same prerequisite bytes qualified independently in H; no later pre-push claim is inferred.',
    'owner': 'Hypercurve selected polynomial/rational intersection, common-component correspondence and source-parameter conversion',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Admitted rational-coefficient selected polynomial graph slabs against native polynomial/rational spans, finite splines and circular charts. Rational similarity charts can be pulled back exactly. Finite roots retain the original rational parameter and original denominator guards. Common components require a pole-free rational trace, a nonconstant source abscissa and certified monotone pieces.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 83, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The original four polynomial/rational pair fixtures return typed Unsupported on the generated-line prerequisite: generic quintic versus quadratic and rational circle, and parabola/circle common components.',
        'The finite-pair prototype exposes an independent polynomial point_at gap for a retained generic-quintic abscissa. Radical and binomial controls already pass. The separately qualified selected-abscissa increment supplies that prerequisite.',
        'Expanded common-component tests expose global/local spline overlap confusion, a missing public polynomial parameter_from_span conversion, transformed-source chart gaps and a duplicated isolated contact already covered by a cusp overlap. All original fixtures remain alongside their focused regressions.',
        'Prototype build failures, typed blockers and failed topology assertions are retained. Final focused runs pass 20 tests, including a degree-37 defining relation, without relaxing geometric expectations.',
    ],
    'qualification': 'Twenty focused tests include the four original cases and three preserved abscissa controls; 17 new capability entries avoid duplicating the three existing controls. Independent defining equations, original selected roots, tangent signs, operand exchange, traversal reversal, restrictions, further intersections, both ordered branch signs, splines and NURBS, multiple visits, cusps, singular endpoint-only contacts, exact rotation/reflection, degree-seven and degree-37 sources, selected algebraic overlap clips, no-enlargement checks, checked in-memory point replay and actual zero-budget exhaustion followed by larger retry and Certified policy transitions are exercised. Public parameter_from_span keeps polynomial chart identity on span zero and rejects nonzero spans.',
    'limitations': [
        'This increment does not complete A2, polynomial/normal-parallel pairs, arbitrary algebraic coefficients, nested dependent fibers, filled polynomial operations or universal closure.',
        'Constant-abscissa or collapsed common rational traces and nonlinear branch image maps still require broader algorithms; typed Unsupported is not credited as exact completion.',
        'The 904e pre-push attempt does not qualify these follow-ons. Full repository pre-push qualification remains required.',
        'In-memory checked point definitions are not fresh-process native archive replay.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound all arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-rational-section-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected polynomial and rational section qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'rational-section-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
