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
checkout = Path('/tmp/hypercurve-closure-selected-abscissas')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == '00dbdb152a465ebc9b2389e6a0d0a5360121878b'
evidence.save_json(root / 'selected-abscissa-prototype1-source.json', source)
evidence.save_json(root / 'selected-abscissa-prototype1-files.json', files)
(root / 'selected-abscissa-prototype1.patch').write_bytes(patch)
(root / 'selected-abscissa-prototype1-source.rs').write_bytes((checkout / 'crates/hypercurve/src/polynomial_curve_abscissa.rs').read_bytes())
(root / 'selected-abscissa-prototype1-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/polynomial_selected_abscissas.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-selected-abscissa-admission', 'CARGO_BUILD_JOBS':'2', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'polynomial_selected_abscissas', '--no-run', '--message-format=json']
started = time.time()
with (root / 'selected-abscissa-prototype1-build.jsonl').open('w') as artifacts, (root / 'selected-abscissa-prototype1-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'selected-abscissa-prototype1-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'selected-abscissa-prototype1-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'polynomial_selected_abscissas'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
for name in ['polynomial_branch_consumes_retained_rational_abscissa', 'polynomial_branch_consumes_fifth_degree_rational_abscissa', 'polynomial_branch_consumes_generic_quintic_abscissa_without_projection']:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('selected-abscissa-prototype1-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'selected-abscissa-prototype1-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source
