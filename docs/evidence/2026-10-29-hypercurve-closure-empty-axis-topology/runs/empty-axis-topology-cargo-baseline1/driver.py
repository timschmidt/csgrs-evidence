"""Capture source-attributed acceptance for first-coordinate empty support."""
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
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
w = root / 'empty-axis-topology'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', required=True)
parser.add_argument('--owners', action='store_true')
args = parser.parse_args()
record = c / ('empty-axis-topology-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('source_evidence', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'contract.json').write_bytes((c / 'empty-axis-topology-contract.json').read_bytes())
assert source['revision'] == 'd31ef199c3d981547fd31d1b98525de3f2ed9686'
assert not source['untracked_inputs']
command = ['cargo', '+1.98.1', 'test', '--locked', '--release', '--all-features',
           '-p', 'hypersolve', '--test', 'bivariate_empty_axis']
if args.owners:
    command += ['--test', 'bivariate_topology', '--test', 'bivariate_boundary_components']
env = {**os.environ, 'CARGO_NET_OFFLINE': 'true', 'CARGO_BUILD_JOBS': '2',
       'RUST_TEST_THREADS': '2', 'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1',
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp'),
       'CARGO_TARGET_DIR': str(root.parent / 'hypercurve-empty-axis-admission')}
started = time.time()
with (record / 'acceptance.log').open('w') as log:
    process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=env,
                               stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    e.save_json(record / 'active.json', {'pid': process.pid, 'command': command, 'epoch': started})
    try:
        code = process.wait(timeout=3600)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()
        code = 'external_timeout'
after, after_files, _ = e.source_snapshot()
e.save_json(record / 'source-after.json', after)
e.save_json(record / 'files-after.json', after_files)
result = {'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - started,
          'source_stable': source == after and files == after_files, 'source': source,
          'epoch': time.time()}
e.save_json(record / 'result.json', result)
print(json.dumps(result), flush=True)
assert result['source_stable']
raise SystemExit(code if isinstance(code, int) else 1)
