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
checkout = Path('/tmp/hypercurve-closure-selected-circle-points')
prefix = 'selected-circle-points-near-cut-diagnostic'
assert not (root / (prefix + '.json')).exists()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
assert source == json.loads((root / 'selected-circle-points-prototype5-source-before.json').read_text())
e.save_json(root / (prefix + '-source.json'), source)
e.save_json(root / (prefix + '-files.json'), files)
(root / (prefix + '.patch')).write_bytes(patch)
artifacts = [json.loads(line) for line in (root / 'selected-circle-points-prototype5-build.jsonl').read_text().splitlines()]
def library(name):
    return Path(next(f for a in artifacts if a.get('reason') == 'compiler-artifact' and a['target']['name'] == name for f in a['filenames'] if f.endswith('.rlib')))
curve, solve = library('hypercurve'), library('hypersolve')
program, binary = root / (prefix + '.rs'), root / prefix
command = ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(program), '--crate-name', 'selected_circle_point_consumers', '-L', 'dependency=' + str(solve.parent), '--extern', 'hypercurve=' + str(curve), '--extern', 'hypersolve=' + str(solve), '-o', str(binary)]
rows = []
def run(name, command, timeout):
    start = time.time()
    with (root / (prefix + '-' + name + '.log')).open('w') as log:
        process = subprocess.Popen(command, cwd=checkout, env={**os.environ, 'RUST_TEST_THREADS': '1'}, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    stable = e.source_snapshot()[0] == source
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - start, 'source_stable': stable, 'external_timeout_seconds': timeout}
    rows.append(row)
    e.save_json(root / (prefix + '.json'), {'source': source, 'program_sha256': hashlib.sha256(program.read_bytes()).hexdigest(), 'library_sha256': hashlib.sha256(curve.read_bytes()).hexdigest(), 'commands': rows, 'scope': 'Positive downstream frontier probes, not completed qualification fixtures; preserve failures as implementation gaps.'})
    print(row, flush=True)
    assert stable
    return code
assert run('compile', command, 120) == 0
for name in ['selected_circle_points_order_independent_definitions_and_nearby_cuts']:
    run(name, [str(binary), name, '--exact', '--nocapture'], 300)
