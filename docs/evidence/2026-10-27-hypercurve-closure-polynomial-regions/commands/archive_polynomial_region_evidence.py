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
checkout = Path('/tmp/hypercurve-closure-polynomial-regions')
base = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'polynomial-region-final-results.json').read_text())
assert len(results) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'polynomial-region-final-files-before.json').read_text())
assert before == json.loads((root / 'polynomial-region-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'polynomial-region-final-full-suite.log')
assert full == {'suites': 81, 'passed': 2754, 'failed': 0, 'ignored': 34}, full
assert test_counts(root / 'polynomial-region-final-downstream.log')['passed'] == 43
dependent = test_counts(root / 'polynomial-region-final-dependent-packages.log')
assert re.search(r'Ran 16 tests', (root / 'polynomial-region-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-polynomial-region-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 107
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-polynomial-region-evidence-2026-10-27'
parent = json.loads((root / 'polynomial-location-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-polynomial-location-evidence-2026-10-26'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-polynomial-regions'
staging = Path('/tmp/hypercurve-polynomial-region-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('polynomial-region-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
        copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*polynomial_region*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for name in ['tests/polynomial_region_admission.rs']:
    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)
patch = (root / 'polynomial-region-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'prerequisite': 'Committed point-location increment 5de7f0cb05 includes all qualified section and selected-abscissa prerequisites. The region prototype parent transition preserved every non-receipt source byte.',
    'owner': 'Hypercurve retained polynomial supporting fragments and the existing CurveRegion2 arrangement',
    'properties': ['P12', 'P13', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Selected polynomial graph slabs with closed exact domains and retained invertible similarities, complete pair incidence and decidable original selected-field queries. The maintained cases include rational boundaries, an independently selected degree-five trim, mixed circles, holes, disconnected material, cusps and a node.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 107, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The unchanged H08 parabola boundary reproduced Construction/ImplicitPolynomial/Unsupported for orientation and region admission.',
        'Retaining polynomial supports initially admitted the boundary but returned two loops instead of one for clipping. The original failing fixture remains; reusing existing exact boundary probes restored correct orientation and Boolean geometry.',
        'Selected boundary points require their retained point-on-branch authority before an unrelated probe; reconstructed native-point paths and open authored/generated clipping reproduced further Unsupported failures and now reuse the same classification authority.',
        'Complete pair replay permits selected interior point witnesses for polynomial fragments. This fixes contact-only intersection and subsequent Boolean consumption without projecting coordinates.',
        'The original second quintic cut at x=3/4 correctly retains five pieces, because f(3/4)=-461/1024. The mistaken four-piece test expectation was corrected while retaining that cut and adding a further x=7/8 cut, where f(7/8)=21415/32768 and four pieces are correct.',
        'One prototype build was externally interrupted with SIGTERM and did not qualify. Temporary diagnostics, all failed attempts and the later successful retry are retained. An initial all-target Clippy build exposed one missing test-only diagnostic enum label; the complete qualification was restarted after fixing it.',
    ],
    'api_migration': 'CurveError adds the public UnsupportedFiniteCurveProjection { family } variant. External exhaustive Rust matches must add that arm (or an appropriate catch-all) and retain an unsupported-family outcome without publishing sampled geometry. ExactCurveError adapters preserve Unsupported with the affected family. This is a breaking Rust API addition for exhaustive matches and requires appropriate package release versioning. No package publication is claimed.',
    'full_suite_regression': 'The second qualification attempt, which first completed the full Hypercurve suite, found one existing unsupported-pair API regression: retained polynomial fragments reached the generic fallback and returned an Ok partial pair blocker instead of the original typed Err. The fallback now preserves the unsupported representation failure; the original test assertion remains unchanged. All complete failed-suite output is retained.',
    'qualification': 'Sixteen public region witnesses plus the unchanged promoted H08 fixture cover selected supports, source/root/domain identity, exact point and path location, all four Boolean operations, holes and reversed boundaries under both fill rules, disconnected components, rational similarity transport, contact-only regularized empty, 2^-80 separation, degree-five selected trims and checked point replay, open authored/generated clipping, mixed circular supports, cusp/node incidence, zero offset, explicit remaining operation gaps, actually reached counted exhaustion with larger retry, and Certified policy transitions.',
    'limitations': [
        'This is bounded progress on A3, not arbitrary algebraic region closure. General coefficient fields, rational image preimages, different pair images, vertical/repeated components and all singular local sectors remain open.',
        'Nonzero polynomial-support offsets, fillets, chamfers and finite projection still return Unsupported. Their typed boundary witnesses establish honest failure, not completed geometry support.',
        'Checked point definitions are in-memory replay, not fresh-process native archive replay. BRep trimming of the entire declared domain is not established.',
        'The separate full repository publication candidate b1c011a070 excludes this increment. Full pre-push validation remains required before publishing these source changes.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-polynomial-region-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected polynomial shared-region qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'polynomial-region-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
