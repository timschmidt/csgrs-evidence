from pathlib import Path
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-abscissas')
target = Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-selected-abscissa-admission')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, rows, patch = evidence.source_snapshot()
assert source['revision'] == '00dbdb152a465ebc9b2389e6a0d0a5360121878b'
evidence.save_json(root / 'selected-abscissa-final-source-before.json', source)
evidence.save_json(root / 'selected-abscissa-final-files-before.json', rows)
(root / 'selected-abscissa-final-candidate.patch').write_bytes(patch)
cache = Path('/tmp/hypercurve-selected-abscissa-ccache')
(cache / 'tmp').mkdir(parents=True, exist_ok=True)
env = {
    **os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': str(target),
    'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2', 'CCACHE_DIR': str(cache), 'CCACHE_TEMPDIR': str(cache / 'tmp'),
}
commands = [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check'], {}),
    ('msrv-clippy', ['cargo', 'clippy', '--locked', '-p', 'hypercurve', '--all-targets', '--all-features', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': str(target) + '-msrv'}),
    ('solver-msrv-clippy', ['cargo', 'clippy', '--locked', '-p', 'hypersolve', '--all-targets', '--all-features', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': str(target) + '-msrv'}),
    ('solver-suite', ['cargo', 'test', '--locked', '-p', 'hypersolve', '--release', '--all-features', '--no-fail-fast'], {}),
    ('full-suite', ['cargo', 'test', '--locked', '-p', 'hypercurve', '--release', '--all-features', '--no-fail-fast'], {}),
    ('downstream', ['cargo', 'test', '--locked', '-p', 'csgrs', '--release', '--all-features', '--test', 'adapter_curve_failures', '--test', 'downstream_profiles', '--test', 'exact_profile_sweeps', '--test', 'mixed_modeling_profiles'], {}),
    ('dependent-hyperbrep', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hyperbrep', '--no-fail-fast'], {}),
    ('dependent-hyperbrep-io', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hyperbrep-io', '--no-fail-fast'], {}),
    ('dependent-hypercircuit', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercircuit', '--no-fail-fast'], {}),
    ('dependent-hyperdrc', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hyperdrc', '--no-fail-fast'], {}),
    ('dependent-hypergraphics', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypergraphics', '--no-fail-fast'], {}),
    ('dependent-hyperpack', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hyperpack', '--no-fail-fast'], {}),
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py'], {}),
    ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', '/tmp/hypercurve-selected-abscissa-capabilities'], {}),
    ('typos', ['typos'], {}),
    ('budget', ['scripts/check-repository-budget.sh'], {}),
    ('diff', ['git', 'diff', '--check'], {}),
]
records = []
for name, command, extra in commands:
    assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
    print('START', name, flush=True)
    started = time.time()
    with (root / ('selected-abscissa-final-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'selected-abscissa-final-results.json', records)
    evidence.save_json(root / 'selected-abscissa-final-source-after.json', after)
    evidence.save_json(root / 'selected-abscissa-final-files-after.json', after_rows)
    print('FINISH', name, result.returncode, round(record['elapsed_seconds'], 2), 'stable', record['source_stable'], flush=True)
    if result.returncode or source != after:
        sys.exit(result.returncode or 1)
logs = [root / ('selected-abscissa-final-dependent-' + package + '.log') for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
(root / 'selected-abscissa-final-dependent-packages.log').write_text('\n'.join(p.read_text() for p in logs))
assert len(records) == 17
print('QUALIFICATION COMPLETE', flush=True)
