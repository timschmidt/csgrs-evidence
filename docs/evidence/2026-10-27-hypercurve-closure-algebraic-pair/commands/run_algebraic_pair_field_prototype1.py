from pathlib import Path
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
target = Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-algebraic-similarity-admission')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, rows, patch = evidence.source_snapshot()
assert source['revision'] == '4519ec554d0bffdae3c7f45ffaac4a688c7663de'
evidence.save_json(root / 'algebraic-pair-field-prototype1-source-before.json', source)
evidence.save_json(root / 'algebraic-pair-field-prototype1-files-before.json', rows)
(root / 'algebraic-pair-field-prototype1-candidate.patch').write_bytes(patch)
cache = Path('/tmp/hypercurve-algebraic-pair-ccache')
(cache / 'tmp').mkdir(parents=True, exist_ok=True)
env = {
    **os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': str(target),
    'EXACTCORE_ROOT': '/home/tim/Documents/GitHub/workspace/exactCorelib-main/trunk', 'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2', 'CCACHE_DIR': str(cache), 'CCACHE_TEMPDIR': str(cache / 'tmp'),
}
commands = [
    ('solver-unit', ['cargo', 'test', '--locked', '-p', 'hypersolve', '--release', '--all-features', '--lib'], {}),
    ('solver-public', ['cargo', 'test', '--locked', '-p', 'hypersolve', '--release', '--all-features', '--test', 'algebraic_common_fiber_scales'], {}),
    ('curve-public', ['cargo', 'test', '--locked', '-p', 'hypercurve', '--release', '--all-features', '--test', 'polynomial_algebraic_pairs'], {}),
]
records = []
for name, command, extra in commands:
    assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
    print('START', name, flush=True)
    started = time.time()
    with (root / ('algebraic-pair-field-prototype1-' + name + '.log')).open('w') as log:
        result = subprocess.run(['/usr/bin/time', '-v', *command], cwd=checkout,
                                env={**env, **extra}, stdout=log, stderr=subprocess.STDOUT)
    after, after_rows, _ = evidence.source_snapshot()
    record = {
        'name': name, 'command': command, 'started_epoch': started,
        'elapsed_seconds': time.time() - started, 'exit_code': result.returncode,
        'source_stable': source == after, 'cwd': str(checkout),
        'settings': {key: value for key, value in {**env, **extra}.items()
                     if key in ['EXACTCORE_ROOT', 'RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'RUSTFLAGS', 'RUSTC_WRAPPER', 'RUSTC_WORKSPACE_WRAPPER', 'CCACHE_DIR', 'CCACHE_TEMPDIR']},
    }
    records.append(record)
    evidence.save_json(root / 'algebraic-pair-field-prototype1-results.json', records)
    evidence.save_json(root / 'algebraic-pair-field-prototype1-source-after.json', after)
    evidence.save_json(root / 'algebraic-pair-field-prototype1-files-after.json', after_rows)
    print('FINISH', name, result.returncode, round(record['elapsed_seconds'], 2), 'stable', record['source_stable'], flush=True)
    if result.returncode or source != after:
        sys.exit(result.returncode or 1)
