from pathlib import Path
import importlib.util
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-point-replay')
prefix = 'point-replay-prototype6'
assert not (root / (prefix + '-results.json')).exists()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
evidence.save_json(root / (prefix + '-source-before.json'), source)
evidence.save_json(root / (prefix + '-files-before.json'), files)
(root / (prefix + '.patch')).write_bytes(patch)
for name in source['untracked_inputs']:
    destination = root / (prefix + '-inputs') / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes((checkout / name).read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-point-replay-admission', 'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '1', 'CCACHE_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache', 'CCACHE_TEMPDIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
records = []

def execute(name, command, timeout, json_output=False):
    assert evidence.source_snapshot()[0] == source
    started = time.time()
    with (root / (prefix + '-' + name + ('.jsonl' if json_output else '.log'))).open('w') as out, (root / (prefix + '-' + name + '-stderr.log')).open('w') as err:
        proc = subprocess.Popen(command, cwd=checkout, env=env, stdout=out, stderr=err, start_new_session=True)
        try:
            code = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            code = 'external_timeout'
            for stem in ['hypercurve-selected-svg-', 'hypercurve-parallel-svg-', 'hypercurve-chord-svg-', 'hypercurve-point-svg-']:
                temporary = Path(env.get('TMPDIR', '/tmp')) / (stem + str(proc.pid) + '.svg')
                if temporary.is_file():
                    payload = temporary.read_bytes()
                    captured = root / (prefix + '-timeout-' + temporary.name)
                    captured.write_bytes(payload)
                    assert hashlib.sha256(captured.read_bytes()).digest() == hashlib.sha256(payload).digest()
                    temporary.unlink()
    after, after_files, _ = evidence.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - started, 'external_timeout_seconds': timeout, 'source_stable': source == after}
    records.append(row)
    evidence.save_json(root / (prefix + '-results.json'), records)
    evidence.save_json(root / (prefix + '-source-after.json'), after)
    evidence.save_json(root / (prefix + '-files-after.json'), after_files)
    print(row, flush=True)
    assert row['source_stable']
    return code

brep_command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hyperbrep', '--test', 'chord_displacement_archive', '--test', 'supporting_line_archive', '--test', 'archive_limits', '--no-run', '--message-format=json']
if execute('brep-build', brep_command, 1800, True) == 0:
    artifacts = [json.loads(line) for line in (root / (prefix + '-brep-build.jsonl')).read_text().splitlines()]
    brep_binaries = {item['target']['name']: item['executable'] for item in artifacts if item.get('executable')}
    for name in ['chord_displacement_archive', 'supporting_line_archive', 'archive_limits']:
        execute('brep-' + name, [brep_binaries[name]], 600)
execute('fuzz-check', ['cargo', 'check', '--locked', '--manifest-path', 'crates/hypercurve/fuzz/Cargo.toml', '--bins'], 1800)
execute('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py'], 120)
execute('typos', ['typos'], 120)
assert all(row['exit_code'] == 0 for row in records)
print('POINT REPLAY PROTOTYPE PASSED', flush=True)
