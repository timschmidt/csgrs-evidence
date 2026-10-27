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
checkout = Path('/tmp/hypercurve-closure-horizontal-boundaries')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
evidence.save_json(root / 'horizontal-boundary-consumer4-source.json', source)
evidence.save_json(root / 'horizontal-boundary-consumer4-files.json', files)
(root / 'horizontal-boundary-consumer4.patch').write_bytes(patch)
(root / 'horizontal-boundary-consumer4-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/polynomial_boundary_components.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-rational-section-admission', 'CARGO_BUILD_JOBS':'2', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'polynomial_boundary_components', '--no-run', '--message-format=json']
started = time.time()
with (root / 'horizontal-boundary-consumer4-build.jsonl').open('w') as artifacts, (root / 'horizontal-boundary-consumer4-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'horizontal-boundary-consumer4-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'horizontal-boundary-consumer4-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'polynomial_boundary_components'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
for name in __import__('re').findall(r'#\[test\]\s+fn (\w+)\(', (checkout / 'crates/hypercurve/tests/polynomial_boundary_components.rs').read_text()):
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('horizontal-boundary-consumer4-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'horizontal-boundary-consumer4-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source
