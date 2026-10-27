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
assert source['revision'] == '2395ba77d81a6eb172f62b99a13bef73a7235a43'
evidence.save_json(root / 'algebraic-pair-prototype2-source.json', source)
evidence.save_json(root / 'algebraic-pair-prototype2-files.json', files)
(root / 'algebraic-pair-prototype2.patch').write_bytes(patch)
(root / 'algebraic-pair-prototype2-test.rs').write_bytes((checkout / 'crates/hypercurve/tests/polynomial_algebraic_pairs.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-algebraic-similarity-admission', 'CARGO_BUILD_JOBS':'1', 'RUST_TEST_THREADS':'1'}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--test', 'polynomial_algebraic_pairs', '--no-run', '--message-format=json']
started = time.time()
with (root / 'algebraic-pair-prototype2-build.jsonl').open('w') as artifacts, (root / 'algebraic-pair-prototype2-build.log').open('w') as log:
    build = subprocess.run(command, cwd=checkout, env=env, stdout=artifacts, stderr=log)
evidence.save_json(root / 'algebraic-pair-prototype2-build.json', {'command':command, 'exit_code':build.returncode, 'elapsed_seconds':time.time()-started})
if build.returncode:
    sys.exit(build.returncode)
messages = [json.loads(line) for line in (root / 'algebraic-pair-prototype2-build.jsonl').read_text().splitlines()]
binaries = {r['executable'] for r in messages if r.get('reason') == 'compiler-artifact' and r.get('executable') and r['target']['name'] == 'polynomial_algebraic_pairs'}
assert len(binaries) == 1
binary = binaries.pop()
assert evidence.source_snapshot()[0] == source
results = []
names = ['polynomial_pairs_consume_shared_algebraic_scale', 'polynomial_pairs_consume_shared_algebraic_translation', 'polynomial_pairs_keep_higher_degree_images_and_reflections', 'polynomial_pairs_keep_selected_overlaps_under_equal_algebraic_images', 'polynomial_pairs_keep_tangency_and_distinct_supports_in_algebraic_images', 'polynomial_algebraic_pairs_retry_and_keep_certified_results', 'shared_algebraic_polynomial_pairs_feed_region_booleans']
for name in names:
    command = [binary, name, '--exact', '--nocapture', '--test-threads=1']
    started = time.time()
    with (root / ('algebraic-pair-prototype2-' + name + '.log')).open('w') as log:
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
    evidence.save_json(root / 'algebraic-pair-prototype2-results.json', results)
    print(json.dumps(row), flush=True)
assert evidence.source_snapshot()[0] == source

assert len(results) == 7 and all(r["source_stable"] and r["exit_code"] == 0 for r in results)
print("FOCUSED PAIR CHECKS COMPLETE", flush=True)
