"""Retry actual external timeouts with more time, preserving full default workloads."""
from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

s = Path(__file__).parent
while not (s / 'owner-benchmarks-round0.json').exists():
    time.sleep(2)
assert all(row['exit_code'] == 0 for row in json.loads((s / 'arc-controlled-repeats' / 'complete.json').read_text())), 'Run and review short diagnostics before longer qualification'
initial = json.loads((s / 'owner-benchmarks-round0.json').read_text())
assert len(initial) == 50 and len({(r['target'], r['label']) for r in initial}) == 50
output = s / 'owner-retries'
output.mkdir(exist_ok=False)
latest = {}
for r in initial:
    row = dict(r, attempt='initial', log_relative_path=f"owner-benchmark-0-{r['target']}-{r['label']}.log")
    latest[(row['target'], row['label'])] = row
unexpected = [r for r in initial if r['exit_code'] != 0 and not (r['exit_code'] == 124 and r.get('external_timeout'))]
targets = sorted({r['target'] for r in initial if r['exit_code'] == 124 and r.get('external_timeout')})
method = {'reason': 'The original editing baseline reached its actual 900-second external limit. Retry incomplete benchmark targets without weakening fixtures or iteration counts.', 'initial_results': 'owner-benchmarks-round0.json', 'targets_with_observed_external_timeouts': targets, 'external_timeout_seconds': 14400, 'order': 'reverse each target\'s original baseline/candidate order; retry both labels for each affected target', 'environment': 'all HYPERCURVE_* overrides removed; same original default corpus', 'unexpected_failures_require_investigation': unexpected, 'scope': 'An external timeout is incomplete measurement, not a typed geometry failure or evidence of completed support. Original failed attempts remain immutable. No runtime work overlaps this retry queue.'}
(output / 'method.json').write_text(json.dumps(method, indent=2) + '\n')
rows = []
if not unexpected:
    env = {k: v for k, v in os.environ.items() if not k.startswith('HYPERCURVE_')}
    for target in targets:
        order = [r['label'] for r in initial if r['target'] == target][::-1]
        assert sorted(order) == ['baseline', 'candidate']
        for label in order:
            original = latest[(target, label)]
            binary = Path(original['command'][0])
            assert hashlib.sha256(binary.read_bytes()).hexdigest() == original['binary_sha256']
            tag = f'{target}-{label}'
            log_path = output / (tag + '.log')
            row = {k: original[k] for k in ['target', 'label', 'command', 'cwd', 'binary_sha256']}
            row.update(attempt='larger-budget-retry-0', external_timeout_seconds=14400, time_started_unix=time.time(), log_relative_path=str(log_path.relative_to(s)))
            (s / 'owner-retry-phase.json').write_text(json.dumps(row, indent=2) + '\n')
            start = time.monotonic()
            before = resource.getrusage(resource.RUSAGE_CHILDREN)
            with log_path.open('w') as log:
                process = subprocess.Popen(row['command'], cwd=row['cwd'], env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
                row['pid'] = process.pid
                try:
                    row['exit_code'] = process.wait(timeout=14400)
                except subprocess.TimeoutExpired:
                    row.update(exit_code=124, external_timeout=True)
                    os.killpg(process.pid, signal.SIGTERM)
                    try:
                        process.wait(timeout=5)
                    except subprocess.TimeoutExpired:
                        os.killpg(process.pid, signal.SIGKILL)
                        process.wait()
                    row['terminated_process_exit_code'] = process.returncode
            after = resource.getrusage(resource.RUSAGE_CHILDREN)
            row.update(wall_seconds=time.monotonic() - start, children_cpu_seconds=after.ru_utime + after.ru_stime - before.ru_utime - before.ru_stime, log_sha256=hashlib.sha256(log_path.read_bytes()).hexdigest())
            rows.append(row)
            latest[(target, label)] = row
            (output / (tag + '.json')).write_text(json.dumps(row, indent=2) + '\n')
            (s / 'owner-retries-progress.json').write_text(json.dumps(rows, indent=2) + '\n')
            print(json.dumps(row), flush=True)
(s / 'owner-retries-complete.json').write_text(json.dumps(rows, indent=2) + '\n')
resolved = [latest[key] for key in sorted(latest)]
result = {'all_completed_successfully': not unexpected and all(r['exit_code'] == 0 for r in resolved), 'initial_results': 'owner-benchmarks-round0.json', 'retry_results': 'owner-retries-complete.json', 'resolved_executions': resolved, 'unexpected_initial_failures': unexpected, 'scope': 'Execution completion qualification only. Original attempts retained. Timing/geometry/dispatch comparisons and the retention decision remain separate obligations.'}
(s / 'owner-runtime-qualification.json').write_text(json.dumps(result, indent=2) + '\n')
raise SystemExit(int(not result['all_completed_successfully']))
