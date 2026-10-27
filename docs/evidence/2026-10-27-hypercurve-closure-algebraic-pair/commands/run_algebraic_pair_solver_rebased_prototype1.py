from pathlib import Path
import hashlib
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == '4519ec554d0bffdae3c7f45ffaac4a688c7663de'
evidence.save_json(root / 'algebraic-pair-solver-rebased-prototype1-source.json', source)
evidence.save_json(root / 'algebraic-pair-solver-rebased-prototype1-files.json', files)
(root / 'algebraic-pair-solver-rebased-prototype1.patch').write_bytes(patch)
(root / 'algebraic-pair-solver-rebased-prototype1-test.rs').write_bytes((checkout / 'crates/hypersolve/tests/algebraic_common_fiber_scales.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-rational-section-admission', 'CARGO_BUILD_JOBS':'1', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypersolve', '--test', 'algebraic_common_fiber_scales', '--no-run', '--message-format=json']
started = time.time()
with (root / 'algebraic-pair-solver-rebased-prototype1-build.jsonl').open('w') as artifacts, (root / 'algebraic-pair-solver-rebased-prototype1-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'algebraic-pair-solver-rebased-prototype1-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'algebraic-pair-solver-rebased-prototype1-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'algebraic_common_fiber_scales'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
for name in ['unscaled_quintic_common_fiber_is_exact', 'common_fiber_count_preserves_algebraic_constant_scaling', 'common_fiber_count_preserves_composed_seventh_root_scale', 'common_fiber_count_keeps_nearby_distinct_composed_equations', 'common_fiber_count_keeps_signed_scales_and_transposed_parameters', 'common_fiber_count_preserves_vanishing_parameter_factors_and_selector_validation', 'selected_root_replay_rejects_empty_and_multiple_isolators', 'selected_root_replay_preserves_owned_endpoints_repetitions_and_exact_coefficients']:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('algebraic-pair-solver-rebased-prototype1-' + name + '.log')).open('w') as log:
        child = subprocess.Popen(command, cwd=checkout, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        outcome = 'completed'
        try:
            status = child.wait(timeout=300)
        except subprocess.TimeoutExpired:
            outcome = 'external_timeout'
            os.killpg(child.pid, signal.SIGTERM)
            try:
                status = child.wait(timeout=10)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL)
                status = child.wait()
    row = {'test':name, 'command':command, 'outcome':outcome, 'exit_code':status, 'elapsed_seconds':time.time()-started, 'external_timeout_seconds':300, 'source_stable':evidence.source_snapshot()[0] == source}
    results.append(row)
    evidence.save_json(root / 'algebraic-pair-solver-rebased-prototype1-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source

assert len(results) == 8 and all(r["source_stable"] and r["exit_code"] == 0 for r in results)
