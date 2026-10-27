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
checkout = Path('/tmp/hypercurve-closure-parallel-replay')
prefix = 'parallel-replay-prototype3'
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
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-parallel-replay-admission', 'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '1'}
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
            for stem in ['hypercurve-selected-svg-', 'hypercurve-parallel-svg-']:
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

command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'svg_parallel_replay', '--test', 'svg_selected_replay', '--test', 'hypercurve_svg', '--test', 'svg_scalar_failures', '--no-run', '--message-format=json']
if execute('build', command, 1800, True) != 0:
    raise SystemExit(1)
artifacts = [json.loads(line) for line in (root / (prefix + '-build.jsonl')).read_text().splitlines()]
binaries = {item['target']['name']: item['executable'] for item in artifacts if item.get('executable')}
for test in ['parallel_sources_replay_without_changing_their_family_or_normal_side', 'cusp_split_replay_keeps_one_support_and_selected_boundary', 'fresh_process_replays_a_parallel_boundary_before_boolean_and_offset', 'parallel_replay_rejects_invalid_references_and_changed_singular_ranges', 'rational_parallel_replay_checks_only_the_declared_range_for_poles', 'exterior_parallel_projection_keeps_the_original_parameter_chart', 'parallel_byte_exhaustion_keeps_a_later_replay_available', 'selected_parallel_trim_replays_through_a_reflected_algebraic_similarity']:
    if execute(test, [binaries['svg_parallel_replay'], '--exact', test, '--nocapture'], 300) == 0:
        assert 'test result: ok. 1 passed; 0 failed; 0 ignored;' in (root / (prefix + '-' + test + '.log')).read_text()
for name in ['svg_selected_replay', 'hypercurve_svg', 'svg_scalar_failures']:
    execute(name, [binaries[name]], 600)
assert all(row['exit_code'] == 0 for row in records)
print('PARALLEL REPLAY PROTOTYPE PASSED', flush=True)
