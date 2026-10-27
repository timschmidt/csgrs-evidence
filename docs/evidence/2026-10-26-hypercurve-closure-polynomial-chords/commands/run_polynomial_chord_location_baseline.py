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
checkout = Path('/tmp/hypercurve-closure-polynomial-chords')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == 'fd1313a23a9718734b8e11bc7382665cf88ba8bd'
evidence.save_json(root / 'polynomial-chord-location-baseline-source.json', source)
evidence.save_json(root / 'polynomial-chord-location-baseline-files.json', files)
(root / 'polynomial-chord-location-baseline.patch').write_bytes(patch)
(root / 'polynomial-chord-location-baseline-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/polynomial_generated_lines.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-polynomial-chord-admission', 'CARGO_BUILD_JOBS':'2', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'polynomial_generated_lines', '--no-run', '--message-format=json']
started = time.time()
with (root / 'polynomial-chord-location-baseline-build.jsonl').open('w') as artifacts, (root / 'polynomial-chord-location-baseline-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'polynomial-chord-location-baseline-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'polynomial-chord-location-baseline-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'polynomial_generated_lines'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
for name in ['generated_constant_line_point_locations_use_selected_coordinate_evidence']:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('polynomial-chord-location-baseline-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'polynomial-chord-location-baseline-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source
