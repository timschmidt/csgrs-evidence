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
checkout = Path('/tmp/hypercurve-closure-native-replay')
base = 'dca62335496d074239a403ad5ba08dd917a6a24a'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'native-replay-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'native-replay-final-files-before.json').read_text())
assert before == json.loads((root / 'native-replay-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'native-replay-final-full-suite.log')
assert full == {'suites': 87, 'passed': 2790, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'native-replay-final-downstream.log')
assert downstream['suites'] == 7 and downstream['passed'] >= 54 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('native-replay-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3010
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'native-replay-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-native-replay-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 142
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-native-replay-evidence-2026-10-27'
parent = '8b0caa9be41bdacd1f40bd9f60b7b9da3f339962'
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-algebraic-pair-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-native-replay'
staging = Path('/tmp/hypercurve-native-replay-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for pattern in ['native-restriction-*', 'native-replay-*']:
    for source in sorted(root.glob(pattern)):
        if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs']:
            copy(source, Path('commands') / source.name)
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*native_replay*.py')) | set(root.glob('*native_restriction*.py')) | {root / 'check_increment_receipt.py', root / 'native-restriction-replay-prototype2-driver.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
for attempt in ['native-replay-qualification-attempt1']:
    for source in sorted((root / attempt).rglob('*')):
        if source.is_file():
            copy(source, Path('commands') / attempt / source.relative_to(root / attempt))
for name in [
    'crates/hypercurve/src/svg/exact.rs',
    'crates/hypercurve/src/svg/exact/graph.rs',
    'crates/hypercurve/src/svg.rs',
    'crates/hypercurve/src/finite_projection.rs',
    'crates/hypercurve/tests/svg_selected_replay.rs',
    'src/io/svg.rs',
    'tests/svg_selected_replay.rs',
]:
    copy(checkout / name, Path('source') / name)
patch = (root / 'native-replay-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve exact SVG interchange and finite path projection; CSGRS SVG error transport',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P28', 'P29', 'P30'],
    'domain': 'Native authored curve sources restricted in their original Bezier parameter chart, with ascending selected endpoints and separate traversal. Scalar parameters, isolated univariate roots and projective images of selected roots are encoded. This is a stroke-path extension, not a generated-support or filled-region format.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 142, 'commands': results,
    'source_attribution': 'Every final command ran on the identical complete source snapshot in commands/native-replay-final-source-before.json and commands/native-replay-final-files-before.json; the after records agree. The three ledger receipts are added only after qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Clean dca6233549 rejects an authored quadratic restricted at the selected positive root of 2t^2-1 during native SVG export. Its unchanged library also rejects finite projection of the retained line interval [1/4,3/4], whose independent endpoints are (2,0) and (6,0). Both original failures and the library digest are retained.',
    'change': 'HCP4 carries dependency-ordered native source, parameter, selected-root, projective-chart and restriction records. Readers replay all defining relations through existing STRICT constructors, then check the path. Original HCP3 authored paths retain their wire version. Finite projection dispatches retained source spans through its existing fragment sampler, and SVG checks the existing maximum segment count before completion. Exact replay errors retain their kernel category through the root adapter.',
    'closure_argument': 'A native support plus its exact selected parameter interval and traversal specifies the same restricted image after replay. Each root must re-establish its defining polynomial and singleton isolator; projective images retain their base root and prove a nonzero denominator. References only point to prior definitions of the required type, so cycles and dangling references cannot become accepted geometry. Local allocation keys preserve sharing of live immutable storage but are never serialized or treated as mathematical equality. Display coordinates do not enter exact reconstruction.',
    'qualification': 'Nine curve witnesses cover fresh-process replay followed by point incidence, restriction, another archive and reversed overlap; one shared degree-seven root across projective charts; algebraic source coefficients and changed display commands; similarity and replay; rational trims of all eight authored families; invalid selectors, ranges and references; chart poles and unknown tags; actual byte/segment limits and retry; and exact finite projection endpoints/traversal. Two root adapter witnesses cover public replay and invalid selected geometry paired with an empty output path. Existing SVG and scalar-certificate fixtures pass unchanged.',
    'attempts': 'Prototype compilation errors, the six original projection failures and the initial strict-Clippy parity warning are retained with source snapshots. The hard 1e-6-tolerance limit fixture and all pre-existing tests remain unchanged.',
    'limitations': [
        'The eight-family trim witness uses rational trim parameters; algebraic selected trim success is asserted only for the named fixtures.',
        'Other generated supports, selected or joint fibers, filled-region native replay and cross-path dependency sharing remain open.',
        'The existing scalar codec remains authoritative; shared scalar-expression DAG serialization is not added.',
        'Metadata-byte and display-segment limits do not bound total arithmetic, coefficient/system growth, temporary/retained memory or cooperative cancellation.',
        'External fixture timeouts and process peak RSS are containment and observations, not kernel resource bounds or controlled performance comparisons.',
        'Full repository pre-push qualification and published-package delivery remain pending for this increment. The earlier published candidate does not qualify these source bytes.',
    ],
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-native-replay-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record selected native source replay qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'native-replay-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
