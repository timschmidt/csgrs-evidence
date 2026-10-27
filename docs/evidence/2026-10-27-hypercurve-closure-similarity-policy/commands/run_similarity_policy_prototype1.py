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
checkout = Path('/tmp/hypercurve-closure-similarity-policy')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == '2395ba77d81a6eb172f62b99a13bef73a7235a43'
evidence.save_json(root / 'similarity-policy-prototype1-source.json', source)
evidence.save_json(root / 'similarity-policy-prototype1-files.json', files)
(root / 'similarity-policy-prototype1.patch').write_bytes(patch)
(root / 'similarity-policy-prototype1-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/similarity_policy_closure.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-contact-admission', 'CARGO_BUILD_JOBS':'1', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--lib', '--test', 'similarity_policy_closure', '--no-run', '--message-format=json']
started = time.time()
with (root / 'similarity-policy-prototype1-build.jsonl').open('w') as artifacts, (root / 'similarity-policy-prototype1-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'similarity-policy-prototype1-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'similarity-policy-prototype1-build.jsonl').read_text().splitlines()]
binaries = {}
for message in messages:
    if message.get('reason') == 'compiler-artifact' and message.get('executable'):
        name = message['target']['name']
        if name in ['hypercurve', 'similarity_policy_closure']:
            assert name not in binaries
            binaries[name] = message['executable']
assert set(binaries) == {'hypercurve', 'similarity_policy_closure'}
inventory = subprocess.check_output([binaries['hypercurve'], '--list'], cwd=checkout, env=env, text=True)
(root / 'similarity-policy-prototype1-unit-inventory.log').write_text(inventory)
names = [line.removesuffix(': test') for line in inventory.splitlines() if line.endswith(': test')]
cases = [(binaries['similarity_policy_closure'], name) for name in [
    'certified_selected_point_created_under_approximate_policy_replays_under_strict',
    'certified_selected_similarity_created_under_approximate_policy_keeps_strict_endpoints',
]]
for suffix in ['selected_similarity_keeps_approximate_endpoint_dependencies', 'point_similarity_composition_preserves_retained_policy_barriers']:
    selected = [name for name in names if name.endswith('::' + suffix)]
    assert len(selected) == 1, (suffix, selected)
    cases.append((binaries['hypercurve'], selected[0]))
assert evidence.source_snapshot()[0] == source
results = []
for binary, name in cases:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('similarity-policy-prototype1-' + name.replace('::', '_') + '.log')).open('w') as log:
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
    evidence.save_json(root / 'similarity-policy-prototype1-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source

assert len(results) == 4 and all(r["source_stable"] and r["exit_code"] == 0 for r in results)
print("FOCUSED QUALIFICATION COMPLETE", flush=True)
