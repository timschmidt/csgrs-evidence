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
checkout = Path('/tmp/hypercurve-closure-selected-integration')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == 'b6da97710cbc124f243f969c5f224b06826c18d6'
evidence.save_json(root / 'selected-integration-diagnostic1-source.json', source)
evidence.save_json(root / 'selected-integration-diagnostic1-files.json', files)
(root / 'selected-integration-diagnostic1.patch').write_bytes(patch)
(root / 'selected-integration-diagnostic1-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/polynomial_closure_composition.rs').read_bytes())
env = {**os.environ, "HYPERCURVE_INTEGRATION_DIAGNOSTICS": "1", 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-contact-admission', 'CARGO_BUILD_JOBS':'1', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'polynomial_closure_composition', '--no-run', '--message-format=json']
started = time.time()
with (root / 'selected-integration-diagnostic1-build.jsonl').open('w') as artifacts, (root / 'selected-integration-diagnostic1-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'selected-integration-diagnostic1-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'selected-integration-diagnostic1-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'polynomial_closure_composition'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
for name in ["closed_domain_components_remain_filled_boundaries_after_boolean_reconstruction"]:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('selected-integration-diagnostic1-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'selected-integration-diagnostic1-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source

assert all(r["exit_code"] == 0 and r["source_stable"] for r in results)
