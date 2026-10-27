from pathlib import Path
import hashlib
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
prior = root / 'algebraic-pair-qualification-attempt2'
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
old_source = json.loads((prior / 'algebraic-pair-final-source-before.json').read_text())
old_files = json.loads((prior / 'algebraic-pair-final-files-before.json').read_text())
assert old_files == json.loads((prior / 'algebraic-pair-final-files-after.json').read_text())
assert old_source == json.loads((prior / 'algebraic-pair-final-source-after.json').read_text())
assert source['revision'] == old_source['revision'] == '4519ec554d0bffdae3c7f45ffaac4a688c7663de'
old_by_path = {r[0]: r[1:] for r in old_files}
new_by_path = {r[0]: r[1:] for r in files}
changed = sorted(p for p in old_by_path.keys() | new_by_path.keys() if old_by_path.get(p) != new_by_path.get(p))
assert changed == ['crates/comparisons/COMPARISON_REPORT.md', 'crates/comparisons/coverage/hyper-crates.tsv'], changed
prior_records = json.loads((prior / 'algebraic-pair-final-results.json').read_text())
assert len(prior_records) == 14 and prior_records[-1]['name'] == 'dependent-comparisons' and prior_records[-1]['exit_code'] == 101
records = []
for old_record in prior_records[:13]:
    assert old_record['exit_code'] == 0 and old_record['source_stable']
    log_name = 'algebraic-pair-final-' + old_record['name'] + '.log'
    assert (root / log_name).read_bytes() == (prior / log_name).read_bytes(), log_name
    records.append({**old_record, 'tested_source_record': 'algebraic-pair-qualification-attempt2/algebraic-pair-final-source-before.json',
                    'tested_files_record': 'algebraic-pair-qualification-attempt2/algebraic-pair-final-files-before.json'})
assert not (root / 'algebraic-pair-metadata-transition.json').exists()
transition = {
    'before_source': old_source, 'after_source': source,
    'changed_paths': changed,
    'changed_file_records': {p: {'before': old_by_path[p], 'after': new_by_path[p]} for p in changed},
    'unchanged_paths': len(files) - len(changed),
    'consumption_search': 'Repository search for hyper-crates.tsv and COMPARISON_REPORT.md in Rust, Cargo, Python and shell sources finds only crates/comparisons/tests/coverage_manifest.rs.',
    'attribution': 'The first 13 groups retain their actual attempt2 source and file snapshots. Only two comparison audit metadata files differ. All Rust, Cargo, test, fixture and capability inputs are byte-identical. The full consuming comparison suite and the remaining qualification checks run on the updated metadata snapshot.',
    'prior_failure_preserved': str(prior),
}
evidence.save_json(root / 'algebraic-pair-metadata-transition.json', transition)
evidence.save_json(root / 'algebraic-pair-final-source-before.json', source)
evidence.save_json(root / 'algebraic-pair-final-files-before.json', files)
(root / 'algebraic-pair-final-candidate.patch').write_bytes(patch)
target = '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-algebraic-similarity-admission'
cache = Path('/tmp/hypercurve-algebraic-pair-ccache')
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': target,
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'EXACTCORE_ROOT': '/home/tim/Documents/GitHub/workspace/exactCorelib-main/trunk',
       'CCACHE_DIR': str(cache), 'CCACHE_TEMPDIR': str(cache / 'tmp')}
commands = [
    ('dependent-comparisons', ['cargo', 'test', '--locked', '--release', '--all-features', '--manifest-path', 'crates/comparisons/Cargo.toml', '--no-fail-fast']),
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', '/tmp/hypercurve-algebraic-pair-capabilities']),
    ('typos', ['typos']),
    ('budget', ['scripts/check-repository-budget.sh']),
    ('diff', ['git', 'diff', '--check']),
]

def oracle_snapshot():
    oracle = Path(env['EXACTCORE_ROOT'])
    return [{'path': str(p.relative_to(oracle)), 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()}
            for part in ['inc', 'ext', 'src'] for p in sorted((oracle / part).rglob('*')) if p.is_file()]

for name, command in commands:
    assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
    print('START', name, flush=True)
    if name == 'dependent-comparisons':
        oracle_before = oracle_snapshot()
        evidence.save_json(root / 'algebraic-pair-final-oracle-before.json', oracle_before)
    started = time.time()
    with (root / ('algebraic-pair-final-' + name + '.log')).open('w') as log:
        result = subprocess.run(['/usr/bin/time', '-v', *command], cwd=checkout, env=env, stdout=log, stderr=subprocess.STDOUT)
    after, after_files, _ = evidence.source_snapshot()
    record = {'name': name, 'command': command, 'started_epoch': started,
              'elapsed_seconds': time.time() - started, 'exit_code': result.returncode,
              'source_stable': source == after, 'cwd': str(checkout),
              'settings': {k: env[k] for k in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'EXACTCORE_ROOT', 'CCACHE_DIR', 'CCACHE_TEMPDIR']},
              'tested_source_record': 'algebraic-pair-final-source-before.json',
              'tested_files_record': 'algebraic-pair-final-files-before.json'}
    if name == 'dependent-comparisons':
        oracle_after = oracle_snapshot()
        evidence.save_json(root / 'algebraic-pair-final-oracle-after.json', oracle_after)
        record['oracle_stable'] = oracle_before == oracle_after
        record['source_stable'] = record['source_stable'] and record['oracle_stable']
    records.append(record)
    evidence.save_json(root / 'algebraic-pair-final-results.json', records)
    evidence.save_json(root / 'algebraic-pair-final-source-after.json', after)
    evidence.save_json(root / 'algebraic-pair-final-files-after.json', after_files)
    print('FINISH', name, result.returncode, round(record['elapsed_seconds'], 2), 'stable', record['source_stable'], flush=True)
    if result.returncode or not record['source_stable']:
        sys.exit(result.returncode or 1)
logs = [root / ('algebraic-pair-final-dependent-' + package + '.log') for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack', 'hyperpath', 'hyperphysics', 'comparisons']]
(root / 'algebraic-pair-final-dependent-packages.log').write_text('\n'.join(p.read_text() for p in logs))
assert len(records) == 19
print('QUALIFICATION COMPLETE; PER-COMMAND SOURCE ATTRIBUTION RETAINED', flush=True)
