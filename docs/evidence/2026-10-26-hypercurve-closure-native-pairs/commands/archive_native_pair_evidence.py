from pathlib import Path
import hashlib, importlib.util, json, os, re, subprocess, time
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-endpoint-identity')
base = '515e7647a9892c79ec18b97b217edab60b1b62ae'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'native-pair-final-results.json').read_text())
assert len(results) == 5 and all(r['exit_code'] == 0 for r in results)
full = (root / 'native-pair-final-full-suite.log').read_text()
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', full)
counts = {key: sum(int(r[i]) for r in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}
assert len(rows) == 72 and counts == {'passed': 2660, 'failed': 0, 'ignored': 34}
assert '1 passed; 0 failed; 0 ignored;' in (root / 'native-pair-final-original-workflow.log').read_text()
downstream = (root / 'native-pair-final-downstream.log').read_text()
assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed;', downstream))) == 43
for name in ['fmt', 'msrv-clippy', 'full-suite', 'downstream', 'original-workflow']:
    assert 'Exit status: 0' in (root / ('native-pair-final-' + name + '.log')).read_text()
proof = json.loads((root / 'native-pair-isolation-proof.json').read_text())
assert proof['qualified_before_equals_after'] and proof['all_build_and_test_inputs_preserved']
expected = [
 'crates/hypercurve/src/bezier_offset/parallel.rs',
 'crates/hypercurve/src/bezier_offset/parallel/circular_incidence_tests.rs',
 'crates/hypercurve/src/bezier_offset/parallel/pair_kernel.rs',
 'crates/hypercurve/src/bezier_offset/parallel/rational_kernel.rs',
 'crates/hypercurve/src/curve_region_boolean/certified_successor_tests.rs',
 'crates/hypercurve/src/curve_region_boolean/pair_kernels.rs',
 'crates/hypercurve/tests/hypercurve_open_path_compositions.rs',
]
changed = subprocess.check_output(['git', 'diff', '--name-only', base, '--', 'crates/hypercurve/src', 'crates/hypercurve/tests'], cwd=checkout, text=True).splitlines()
assert changed == expected, changed
before = json.loads((root / 'native-pair-final-tracked-before.json').read_text())
for name in before:
    if name not in proof['restored_documentation']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == before[name], name
record = 'docs/evidence/2026-10-26-hypercurve-closure-native-pairs'
staging = Path('/tmp/hypercurve-closure-native-pair-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
files = sorted(p for p in root.iterdir() if p.is_file() and p.name.startswith('native-pair-') and p.suffix in ['.log', '.json', '.patch'])
files += [root / 'run_native_pair_qualification.py', root / 'archive_native_pair_evidence.py']
# The isolated preceding source is the relevant failing whole-workflow baseline.
files += [root / 'line-fragment-final-original-workflow.log', root / 'line-fragment-early-original.log']
manifest = []
for p in files:
    data = p.read_bytes(); dest = out / 'commands' / p.name
    dest.parent.mkdir(exist_ok=True); dest.write_bytes(data)
    manifest.append({'path': str(dest.relative_to(out)), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})
patch = subprocess.check_output(['git', 'diff', '--binary', base, '--', *expected], cwd=checkout)
(out / 'implementation.patch').write_bytes(patch)
source = {
 'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
 'qualification_checkout_base': proof['qualification_base'], 'source_equivalence': 'commands/native-pair-isolation-proof.json',
 'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
 'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
 'platform': subprocess.check_output(['uname', '-a'], text=True),
 'properties': ['P12', 'P15', 'P17', 'P18', 'P19', 'P20'],
 'owner': 'Hypercurve native line/circle representations and parallel/region pair kernels',
 'domain': 'Native affine line sources and retained quadratic circular rational charts on certified unit subranges, with exact signed offsets, algebraic trims, normal-side selection and traversal.',
 'full_suite': {'suites': 72, **counts}, 'downstream_passed': 43, 'commands': results,
 'original_workflow': 'Unchanged inputs and assertions pass as an ordinary test and in a fresh test process: fillet, round stroke, boundary reconstruction/reversal, XOR empty check, refillet, material difference checks, erosion and further difference empty check.',
 'focused_witnesses': [
  'native_affine_parallel_pairs_retain_selected_trim_parameters',
  'native_circular_parallel_pair_retries_an_exhausted_trim',
  'circular_native_components_preserve_normal_side_and_contacts',
  'circular_component_does_not_fill_a_stationary_normal_parameter',
 ],
 'limits': [
  'Full repository pre-push qualification for this increment is pending; frozen904e validation does not cover it.',
  'Only the named scoped witnesses complete. M1 and general algebraic operation closure remain open.',
  'The stationary-normal regression rejects an unsound unguarded prototype; higher-degree general paths retain their prior authority.',
  'A zero counted-refinement budget and larger retry are tested. These counts do not bound total arithmetic, graph size, retained memory or cancellation.',
  'Concurrent qualification timings are not controlled performance comparisons.',
  'Native generated save/reload, complete transformed chains and general polynomial region admission are not newly qualified.',
  'Test registration promotion removes an ignore annotation and obsolete blocker commentary only; original geometry and assertions are unchanged.',
 ],
}
(out / 'source.json').write_text(json.dumps(source, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-native-pair-evidence-2026-10-26'
parent = subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-line-fragment-evidence-2026-10-26'], text=True).strip()
assert parent == 'baf93f7321f69b0870da921b738f6549294fd8fb'
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-closure-native-pair-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record native parallel pair closure qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module); module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit); assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1]}
(root / 'native-pair-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
