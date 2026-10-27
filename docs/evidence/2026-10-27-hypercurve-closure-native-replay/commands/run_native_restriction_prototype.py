from pathlib import Path
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-native-replay')
attempt = sys.argv[1]
prefix = 'native-restriction-replay-' + attempt
assert not (root / (prefix + '-results.json')).exists()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
before, files, patch = evidence.source_snapshot()
evidence.save_json(root / (prefix + '-source-before.json'), before)
evidence.save_json(root / (prefix + '-files-before.json'), files)
(root / (prefix + '.patch')).write_bytes(patch)
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-algebraic-similarity-admission', 'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2'}
commands = [
    ('curve', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'svg_selected_replay', '--test', 'hypercurve_svg', '--test', 'svg_scalar_failures', '--no-fail-fast']),
    ('root', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'csgrs', '--test', 'svg_selected_replay', '--test', 'export_projection_contracts', '--test', 'adapter_curve_failures', '--no-fail-fast']),
]
records = []
for label, command in commands:
    assert evidence.source_snapshot()[0] == before
    print('START', label, flush=True)
    started = time.time()
    with (root / (prefix + '-' + label + '.log')).open('w') as log:
        try:
            process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            code = process.wait(timeout=900)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, after_files, _ = evidence.source_snapshot()
    record = {'name': label, 'command': command, 'cwd': str(checkout), 'revision': before['revision'], 'source_stable': before == after, 'exit_code': code, 'elapsed_seconds': time.time() - started, 'external_timeout_seconds': 900,
              'settings': {k: env[k] for k in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS']}}
    records.append(record)
    evidence.save_json(root / (prefix + '-results.json'), records)
    evidence.save_json(root / (prefix + '-source-after.json'), after)
    evidence.save_json(root / (prefix + '-files-after.json'), after_files)
    print('FINISH', label, code, round(record['elapsed_seconds'], 2), 'stable', record['source_stable'], flush=True)
    if code != 0 or not record['source_stable']:
        sys.exit(1)
