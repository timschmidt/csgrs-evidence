from pathlib import Path
import hashlib
import json
import os
import re
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = root / 'directed'
record = root / 'validation-workflow-1793075673461718168'
pid = 1091388
start_ticks = '79665495'
proc = Path('/proc') / str(pid)
stat = (proc / 'stat').read_text().split(') ', 1)[1].split()
assert stat[19] == start_ticks and stat[0] != 'Z'
assert (proc / 'cwd').resolve() == checkout
args = [a.decode() for a in (proc / 'cmdline').read_bytes().split(b'\0') if a]
assert args[:2] == ['python3', 'crates/hyperspatial/scripts/fuzz-smoke.py']
steps = json.loads((record / 'steps.json').read_text())
assert len(steps) == 1 and steps[0]['id'] == 'hyperspatial-directed-0-14'
assert ' '.join(args) == steps[0]['command'].strip()
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout)
before = json.loads((record / 'sources-before.json').read_text())
for name, digest in before.items():
    assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

trace = record / 'workflow-child-exit.strace'
assert not trace.exists()
command = ['/usr/bin/strace', '-ttt', '-e', 'trace=exit,exit_group', '-e', 'signal=none',
           '-p', str(pid), '-o', str(trace)]
started = time.time()
receipt = {
    'workflow_child_pid': pid, 'workflow_child_start_ticks': start_ticks,
    'original_command': steps[0]['command'], 'original_args': args,
    'observer_command': command, 'started_epoch': started,
    'launcher_session': 86041, 'launcher_exit_code': 143,
    'scope': 'Observe only the original Python workflow process; no fork following, source changes, new test parameters, signal injection, or sanitizer option changes. Preserve its actual OS exit status after the launcher disappeared.',
    'source_head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip(),
}
(record / 'workflow-child-exit-observer-start.json').write_text(json.dumps(receipt, indent=2) + '\n')
observer = subprocess.Popen(command, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
(record / 'workflow-child-exit-observer-pid.json').write_text(json.dumps({'pid': observer.pid}) + '\n')
stderr = observer.communicate()[1]
payload = trace.read_text() if trace.exists() else ''
exit_codes = re.findall(r'exit_group\((\d+)\)', payload)
normal_exits = re.findall(r'\+\+\+ exited with (\d+) \+\+\+', payload)
receipt.update({
    'observer_returncode': observer.returncode, 'observer_stderr': stderr,
    'elapsed_seconds': time.time() - started,
    'exit_group_codes': [int(x) for x in exit_codes],
    'observed_normal_exits': [int(x) for x in normal_exits],
    'trace_sha256': hashlib.sha256(trace.read_bytes()).hexdigest() if trace.exists() else None,
    'observed_workflow_exit_code': int(normal_exits[-1]) if len(normal_exits) == 1 else None,
})
(record / 'workflow-child-exit-observed.json').write_text(json.dumps(receipt, indent=2) + '\n')
print(json.dumps({k: receipt[k] for k in ['observer_returncode', 'observed_workflow_exit_code', 'elapsed_seconds']}), flush=True)
