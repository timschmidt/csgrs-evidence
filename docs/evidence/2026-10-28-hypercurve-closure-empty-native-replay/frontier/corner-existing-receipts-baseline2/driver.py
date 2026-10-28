from pathlib import Path
import argparse
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
parser = argparse.ArgumentParser()
parser.add_argument('--checkout', required=True)
parser.add_argument('--record', required=True)
parser.add_argument('--target', required=True)
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
checkout = root / args.checkout
record = root / 'controls' / args.record
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'csgrs', '--test', 'receipt_composition', '--no-fail-fast']
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_TARGET_DIR':str(root.parent / args.target), 'CARGO_BUILD_JOBS':'2', 'RUST_TEST_THREADS':'2', 'CCACHE_DIR':str(root.parent / 'hypercurve-admission-ccache'), 'CCACHE_TEMPDIR':str(root.parent / 'hypercurve-admission-ccache/tmp')}
started = time.time()
with (record / 'receipt-composition.log').open('w') as log:
    proc = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    e.save_json(record / 'active.json', {'pid':proc.pid, 'command':command, 'started_epoch':started})
    try:
        code = proc.wait(timeout=3600)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        code = 'external_timeout'
after, after_files, _ = e.source_snapshot()
row = {'name':'receipt-composition', 'command':command, 'exit_code':code, 'elapsed_seconds':time.time()-started, 'source_stable':source == after, 'external_timeout_seconds':3600}
e.save_json(record / 'results.json', [row])
e.save_json(record / 'source-after.json', after)
e.save_json(record / 'files-after.json', after_files)
print(json.dumps(row), flush=True)
assert row['source_stable']
