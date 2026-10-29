"""Read-only integration baseline against attributed, frozen fiber artifacts."""
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
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-query-fibers'
run = c / 'selected-closure-integration-baseline1'
run.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
attribution = json.loads((c / 'selected-query-fibers-fix4/attribution.json').read_text())
assert source == attribution['source']
libraries = attribution['libraries_sha256']
for path, digest in libraries.items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == digest, path
library = next(Path(path) for path in libraries if Path(path).name == 'libhypercurve.rlib')
solver = next(Path(path) for path in libraries if Path(path).name.startswith('libhypersolve-'))
e.save_json(run / 'source-before.json', source)
e.save_json(run / 'files-before.json', files)
(run / 'candidate.patch').write_bytes(patch)
(run / 'driver.py').write_bytes(Path(__file__).read_bytes())
fixture = run / 'original.rs'
fixture.write_bytes((w / 'crates/hypercurve/tests/polynomial_query_fibers.rs').read_bytes() + (c / 'selected-closure-integration-tests.rs').read_bytes())
binary = run / 'original'
commands = [('compile', [
    'rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3',
    str(fixture), '--crate-name', 'selected_closure_integration',
    '-L', 'dependency=' + str(library.parent), '-L', 'dependency=' + str(solver.parent),
    '--extern', 'hypercurve=' + str(library), '--extern', 'hypersolve=' + str(solver), '-o', str(binary),
])]
for name in [
    'integration_dependent_fiber_source_control',
    'integration_dependent_fiber_feeds_derivatives_and_another_polynomial',
    'integration_dependent_fiber_quotient_replay_retains_the_original_pole',
]:
    commands.append((name, [str(binary), name, '--exact', '--nocapture']))
rows = []
for name, command in commands:
    start = time.time()
    with (run / (name + '.log')).open('w') as log:
        process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(run / 'active.json', {'name': name, 'pid': process.pid, 'command': command, 'started_epoch': start})
        try:
            code = process.wait(timeout=180)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, af, _ = e.source_snapshot()
    rows.append({'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - start, 'source_stable': source == after, 'external_timeout_seconds': 180})
    e.save_json(run / 'results.json', rows)
    e.save_json(run / 'source-after.json', after)
    e.save_json(run / 'files-after.json', af)
    assert source == after and files == af
    print(rows[-1], flush=True)
    if name == 'compile':
        assert code == 0
for path, digest in libraries.items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == digest, path
e.save_json(run / 'attribution.json', {**attribution, 'fixture_sha256': hashlib.sha256(fixture.read_bytes()).hexdigest(), 'cargo_builds_started': 0})
e.save_json(run / 'complete.json', {'source': source, 'statuses': [row['exit_code'] for row in rows], 'expected_outcomes_reproduced': [row['exit_code'] for row in rows] == [0, 0, 101, 101], 'scope': 'Original dependent-fiber source passes. Missing derivative consumption and lost original divisor guard are integration witnesses; no production source or running cache was changed.', 'epoch': time.time()})
assert [row['exit_code'] for row in rows] == [0, 0, 101, 101]
