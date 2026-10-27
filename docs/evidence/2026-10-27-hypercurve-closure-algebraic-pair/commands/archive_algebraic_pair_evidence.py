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
from validate_algebraic_pair_attribution import validate
attribution = validate(root)
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
base = '4519ec554d0bffdae3c7f45ffaac4a688c7663de'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'algebraic-pair-final-results.json').read_text())
assert len(results) == 19 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'algebraic-pair-final-files-before.json').read_text())
assert before == json.loads((root / 'algebraic-pair-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'algebraic-pair-final-full-suite.log')
assert full == {'suites': 86, 'passed': 2781, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'algebraic-pair-final-downstream.log')['passed'] == 43
solver = test_counts(root / 'algebraic-pair-final-solver-suite.log')
assert solver == {'suites': 25, 'passed': 1233, 'failed': 0, 'ignored': 0}, solver
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack', 'hyperpath', 'hyperphysics', 'comparisons']
package_counts = {name: test_counts(root / ('algebraic-pair-final-dependent-' + name + '.log')) for name in packages}
assert sum(package_counts[name]['passed'] for name in packages[:6]) == 3010
assert all(count['passed'] > 0 and count['failed'] == 0 for count in package_counts.values())
assert all(count['ignored'] == (19 if name == 'comparisons' else 0) for name, count in package_counts.items()), package_counts
dependent = test_counts(root / 'algebraic-pair-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'algebraic-pair-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-algebraic-pair-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 133
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-algebraic-pair-evidence-2026-10-27'
parent = '5c1494e708b19575a7616ee58443d4acf07350f1'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-similarity-policy-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-algebraic-pair'
staging = Path('/tmp/hypercurve-algebraic-pair-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('algebraic-pair-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*algebraic_pair*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for attempt in ['algebraic-pair-qualification-attempt1', 'algebraic-pair-qualification-attempt2']:
    for source in sorted((root / attempt).rglob('*')):
        if source.is_file():
            copy(source, Path('commands') / attempt / source.relative_to(root / attempt))
for name in [
    'crates/hypercurve/tests/polynomial_algebraic_pairs.rs',
    'crates/hypersolve/tests/algebraic_common_fiber_scales.rs',
    'crates/hypersolve/proptest-regressions/algebraic.txt',
    'crates/hypercurve/src/polynomial_curve.rs',
    'crates/hypercurve/src/polynomial_curve_pair.rs',
    'crates/hypercurve/src/polynomial_curve_chord.rs',
    'crates/hypersolve/src/algebraic_fiber.rs',
    'crates/hypersolve/src/curve_resultant.rs',
    'crates/hypersolve/src/root_isolation.rs',
    'crates/comparisons/coverage/hyper-crates.tsv',
    'crates/comparisons/COMPARISON_REPORT.md',
]:
    copy(checkout / name, Path('source') / name)
patch = (root / 'algebraic-pair-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve polynomial shared-image incidence and selected-chord source charts; Hypersolve projective fiber equations and selected-field admission',
    'properties': ['P4', 'P8', 'P9', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Previously admitted selected polynomial graph branches with equal invertible similarities whose six affine coefficients are certified equal, including real-algebraic coefficients. Existing unmapped and rational-image cases remain admitted. Chord supports retain their selected endpoints and original chart.',
    'full_suite': full, 'solver_suite': solver, 'root_downstream_passed': 43,
    'dependent_package_tests': dependent, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 133, 'commands': results,
    'source_attribution': attribution,
    'source_record_paths': 'Each commands entry resolves its tested_source_record and tested_files_record relative to this archive record’s commands directory. The first 13 groups precede the two-file comparison inventory correction; their exact source snapshots and logs remain unchanged. The consuming comparison suite and remaining checks ran after that correction.',
    'audit_followup': 'The comparison inventory guard also fails on clean P4519ec: hyperbrep-io and hyperspatial are missing. Two metadata files now record their actual no-direct-counterpart dispositions, while preserving the historical report measurements. No test or geometric capability claim was weakened.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'All eight public curve witnesses fail on P4519ec with the original rational-only image restrictions. Direct composed seventh-root coefficient equations reproduce Undecided on P4519ec at the solver boundary. Earlier prototypes that admitted the common similarity but lacked the solver fallback exceeded the unchanged public seventh-root fixture’s 300-second external allowance; their exact source snapshots and failures are retained. A mutated selected-root interval is falsely accepted by field admission. Original failures and unchanged hard cases remain retained.',
    'change': 'Compare shared image coefficients by strict value; admit exact algebraic inverse forms for chords; consume a retained source-chart line without a forward/inverse coordinate roundtrip. On an undecided common-fiber GCD only, reuse the existing projective-scale normalization if all coefficient ratios have exact rational proofs. Recheck point membership or one owned interval root at selected-field and projection admission.',
    'closure_argument': 'An equal invertible similarity preserves source incidence, overlap parameters and topology, with orientation transported through the existing map. Dividing an equation by a proved nonzero parameter-independent scalar preserves its roots and multiplicities; parameter factors are not removed. Selected chords retain their endpoints and source support. Mutable field payloads must establish an actual point or exactly one distinct root in (lower, upper]; cached counts alone are not proof.',
    'qualification': 'Eight curve witnesses cover seventh-root scale/reflection, translation, independent equal maps, algebraic trims and overlaps, tangent and near-distinct branches, changed transforms, actual zero-budget denial and retry, policy transitions, both fill rules, reconstruction and subsequent Boolean operations, and oblique selected-endpoint chords. Ten public solver witnesses cover actual composed coefficients, signed/transposed equations, nearby distinct equations, vanishing parameter factors, invalid and valid selectors, uncached singleton points and structural-negation handoff. Existing five unit regressions pass unchanged after moving selection replay from structural arithmetic to its field admission boundary.',
    'limitations': [
        'Shared-image recognition is a sufficient chart certificate, not general pair intersection across unrelated retained maps or arbitrary coefficient fields.',
        'Projective rationalization is an optional proof-preserving fallback; declined recognition retains the original undecided outcome.',
        'Structural root representation validation and witness negation remain their established contracts; this increment does not certify every public represented-root consumer.',
        'Point-definition replay is checked in memory; fresh-process native archive replay and general algebraic offset/corner closure remain open.',
        'Existing counted limits and external fixture timeouts are not total arithmetic, coefficient/system growth, memory or cancellation bounds.',
        'Concurrent timings and time(1) process peak RSS are observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending for this increment; the separate earlier publication candidate does not validate these source bytes.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-algebraic-pair-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record algebraic shared-image incidence and selected-field qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'algebraic-pair-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
