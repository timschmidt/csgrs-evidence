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
checkout = Path('/tmp/hypercurve-closure-polynomial-chords')
base = 'f0fa18b7b816a4e182138a1230b1220e82ff0393'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'polynomial-chord-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'polynomial-chord-final-files-before.json').read_text())
assert before == json.loads((root / 'polynomial-chord-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'polynomial-chord-final-full-suite.log')
assert full == {'suites': 77, 'passed': 2700, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'polynomial-chord-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'polynomial-chord-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'polynomial-chord-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-polynomial-chord-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 56
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-polynomial-chord-evidence-2026-10-26'
parent = json.loads((root / 'polynomial-pair-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-polynomial-pair-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-26-hypercurve-closure-polynomial-chords'
staging = Path('/tmp/hypercurve-polynomial-chord-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('polynomial-chord-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('run_polynomial_chord_*.py')) | {root / 'prepare_polynomial_chord_catalog.py', Path(__file__)}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['src/polynomial_curve_pair.rs', 'src/polynomial_curve_chord.rs', 'tests/polynomial_curve_pairs.rs', 'tests/polynomial_generated_lines.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'polynomial-chord-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'The committed selected-fiber ordering increment plus the frozen polynomial-pair inputs. The parent integration record and file hashes attribute both; final qualification includes them together with the generated-line extension.',
    'owner': 'Hypercurve polynomial sections, shared chord side predicates, exact point parameters and source-chart correspondences',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Selected polynomial graph slabs and generated exact chords with a retained native support, a represented constant abscissa in the world/source chart, or a certified constant-source-ordinate component. Rational similarities preserve those proofs. General unrelated selected oblique supports remain outside demonstrated coverage.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 56, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'At committed fd1313a23, all three original generated-line fixtures return Unsupported after exact native LineSeg2 controls succeed. The rational vertical chord, unmaterialized selected endpoints and selected common-line overlap are retained intact.',
        'Expanded clipping first fails in public point location even though exact coordinate equality and bounds already succeed. An independent point-location witness reproduces the predicate blocker with and without the selected-fiber prerequisite. The shared chord predicate had bypassed its existing construction-certified cardinal-support proof.',
        'The first prototype does not decide opposite constant components. Polynomial independence of source x proves a constant selected support; exact retained Y order then distinguishes common from disjoint supports without projecting selected ordinates.',
        'The rational quarter-rotation case initially returns Unsupported. Pulling coordinate forms back to the original source chart reuses the retained vertical support proof and transports a canonical support through the similarity while preserving finite chord parameters.',
        'An oblique scale-five similarity is checked against independently expanded quintic and constant-support equations. Original prototype failures and all source snapshots are retained.',
    ],
    'qualification': 'Ten public fixtures exercise native controls, selected endpoints, source drop, both orders and reversals, finite contacts and tangency, common-line correspondence, repeated clipping and split/requery, endpoint-only contacts, 2^-80-distinct supports, independent point location, rational similarities, in-memory checked point replay, actual reached zero-budget exhaustion and a larger retry, policy transitions and typed invalid coincident endpoints.',
    'limitations': [
        'This increment does not complete A2, universal generated-line support, polynomial/rational or polynomial/parallel pair kernels, or general algebraic closure.',
        'Broader coefficient/transform domains, nonlinear maps, unrelated selected oblique supports, polynomial filled regions and exact generated archive replay remain open.',
        'In-memory point-definition replay is not fresh-process native archive replay.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending. Frozen 904e validation does not cover this increment.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-polynomial-chord-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record generated polynomial-line closure and retained parameter qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'polynomial-chord-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
