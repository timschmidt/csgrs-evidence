from pathlib import Path
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-polynomial-pairs')
target = Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-diagnostic')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, rows, patch = evidence.source_snapshot()
assert source == json.loads((root / 'polynomial-pair-final-source-before.json').read_text())
assert rows == json.loads((root / 'polynomial-pair-final-files-before.json').read_text())
cache = Path('/tmp/hypercurve-polynomial-pair-ccache')
(cache / 'tmp').mkdir(parents=True, exist_ok=True)
env = {
    **os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': str(target),
    'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2', 'CCACHE_DIR': str(cache), 'CCACHE_TEMPDIR': str(cache / 'tmp'),
}
commands = [
    ('dependent-' + package, ['cargo', 'test', '--locked', '--release', '--all-features', '-p', package, '--no-fail-fast'], {})
    for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
] + [
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py'], {}),
    ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', '/tmp/hypercurve-polynomial-pair-capabilities'], {}),
    ('typos', ['typos'], {}),
    ('budget', ['scripts/check-repository-budget.sh'], {}),
    ('diff', ['git', 'diff', '--check'], {}),
]
previous = json.loads((root / 'polynomial-pair-final-results.json').read_text())
assert len(previous) in [5, 10]
assert all(r['source_stable'] and (r['exit_code'] == 0 or r['name'] == 'dependent-packages') for r in previous)
assert len(previous) == 10 or previous[-1]['exit_code'] != 0
for name in ['polynomial-pair-final-results.json', 'polynomial-pair-final-dependent-packages.log', 'polynomial-pair-final-driver.log']:
    src = root / name
    dest = root / name.replace('polynomial-pair-final-', 'polynomial-pair-first-qualification-')
    assert not dest.exists()
    shutil.copy2(src, dest)
records = [row for row in previous if row['name'] != 'dependent-packages']
evidence.save_json(root / 'polynomial-pair-final-results.json', records)
evidence.save_json(root / 'polynomial-pair-validation-recovery.json', {
    'reason': 'Run each downstream package separately to avoid collisions between same-named example outputs; use a writable task-local C compiler cache.',
    'original_grouped_outcome': next(row for row in previous if row['name'] == 'dependent-packages'),
    'retained_original_log': 'polynomial-pair-first-qualification-dependent-packages.log',
    'source_changes': False,
    'settings': {'CCACHE_DIR': str(cache), 'CCACHE_TEMPDIR': str(cache / 'tmp')},
})
for name, command, extra in commands:
    if any(row['name'] == name for row in records):
        continue
    assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
    print('START', name, flush=True)
    started = time.time()
    with (root / ('polynomial-pair-final-' + name + '.log')).open('w') as log:
        result = subprocess.run(['/usr/bin/time', '-v', *command], cwd=checkout,
                                env={**env, **extra}, stdout=log, stderr=subprocess.STDOUT)
    after, after_rows, _ = evidence.source_snapshot()
    record = {
        'name': name, 'command': command, 'started_epoch': started,
        'elapsed_seconds': time.time() - started, 'exit_code': result.returncode,
        'source_stable': source == after, 'cwd': str(checkout),
        'settings': {key: value for key, value in {**env, **extra}.items()
                     if key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'RUSTFLAGS', 'RUSTC_WRAPPER', 'RUSTC_WORKSPACE_WRAPPER', 'CCACHE_DIR', 'CCACHE_TEMPDIR']},
    }
    records.append(record)
    evidence.save_json(root / 'polynomial-pair-final-results.json', records)
    evidence.save_json(root / 'polynomial-pair-final-source-after.json', after)
    evidence.save_json(root / 'polynomial-pair-final-files-after.json', after_rows)
    print('FINISH', name, result.returncode, round(record['elapsed_seconds'], 2), 'stable', record['source_stable'], flush=True)
    if result.returncode or source != after:
        sys.exit(result.returncode or 1)
logs = [root / ('polynomial-pair-final-dependent-' + package + '.log') for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
(root / 'polynomial-pair-final-dependent-packages.log').write_text('\n'.join(p.read_text() for p in logs))
assert len(records) == 15
print('QUALIFICATION COMPLETE', flush=True)
