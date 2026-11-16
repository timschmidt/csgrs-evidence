"""Controlled repeat of the first-pass arc slowdown; does not rebuild or filter fixtures."""
from pathlib import Path
import hashlib
import json
import os
import resource
import subprocess
import time

s = Path(__file__).parent
initial = json.loads((s / 'owner-benchmarks-round0.json').read_text())
assert len(initial) == 50
assert all(row['exit_code'] == 0 for row in json.loads((s / 'qualification.json').read_text()))
assert all(row['exit_code'] == 0 for row in initial if row['target'] == 'arc')
assert all(row['exit_code'] == 0 or (row['exit_code'] == 124 and row.get('external_timeout')) for row in initial), 'Investigate unexpected benchmark failures before diagnostic repeats'
# This diagnostic may reject the candidate but cannot waive incomplete owner workloads.

assert not (s / 'successive-run-phase.json').exists(), 'Review active runtime work before starting another measurement'
output = s / 'arc-controlled-repeats'
output.mkdir(exist_ok=False)
cpu = 2
assert cpu in os.sched_getaffinity(0)
env = {k: v for k, v in os.environ.items() if not k.startswith('HYPERCURVE_')}
infos = {label: json.loads((s / f'{label}-benches-binaries.json').read_text())['arc'] for label in ['baseline', 'candidate']}
for info in infos.values():
    assert hashlib.sha256(Path(info['path']).read_bytes()).hexdigest() == info['sha256']
method = {
    'reason': 'Initial complete arc pair candidate/baseline child CPU ratio was 1.0558; determine whether the apparent slowdown repeats.',
    'cpu_affinity': [cpu],
    'fixtures': 'Unchanged full arc benchmark defaults; all HYPERCURVE_* environment variables removed.',
    'warmup': ['baseline', 'candidate'],
    'measured_order': ['baseline', 'candidate', 'candidate', 'baseline'] * 3,
    'limitations': 'This is a diagnostic, not full owner runtime qualification. Other initial workloads may have external timeouts; those remain unresolved for acceptance. Warmups are retained but excluded from measured comparisons. Same artifacts and one logical CPU; no governor, system, fixture, or source changes. Repeated timings do not replace exact behavior tests.',
    'binary_metadata': infos,
}
(output / 'method.json').write_text(json.dumps(method, indent=2) + '\n')
rows = []
for phase, order in [('warmup', method['warmup']), ('measured', method['measured_order'])]:
    for index, label in enumerate(order):
        command = ['taskset', '-c', str(cpu), infos[label]['path']]
        tag = f'{phase}-{index}-{label}'
        row = {'phase': phase, 'index': index, 'label': label, 'command': command, 'cwd': '/mnt/development/interval-profile-static/csgrs/crates/hypercurve', 'binary_sha256': infos[label]['sha256']}
        (s / 'arc-controlled-repeat-phase.json').write_text(json.dumps(row, indent=2) + '\n')
        before = resource.getrusage(resource.RUSAGE_CHILDREN)
        started = time.monotonic()
        with (output / (tag + '.log')).open('w') as log:
            try:
                result = subprocess.run(command, cwd=row['cwd'], env=env, stdout=log, stderr=subprocess.STDOUT, timeout=900)
                row['exit_code'] = result.returncode
            except subprocess.TimeoutExpired:
                row.update(exit_code=124, external_timeout=True)
        after = resource.getrusage(resource.RUSAGE_CHILDREN)
        row.update(wall_seconds=time.monotonic() - started, children_cpu_seconds=after.ru_utime + after.ru_stime - before.ru_utime - before.ru_stime, log_file=tag + '.log', log_sha256=hashlib.sha256((output / (tag + '.log')).read_bytes()).hexdigest())
        rows.append(row)
        (output / (tag + '.json')).write_text(json.dumps(row, indent=2) + '\n')
        (output / 'progress.json').write_text(json.dumps(rows, indent=2) + '\n')
        print(json.dumps(row), flush=True)
(output / 'complete.json').write_text(json.dumps(rows, indent=2) + '\n')
raise SystemExit(int(any(row['exit_code'] != 0 for row in rows)))
