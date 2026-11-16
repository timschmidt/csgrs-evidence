"""Temporarily stop only the identified goal-owned test group; keep its deadline."""
from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

s = Path(__file__).parent
side = Path('/tmp/interval-refactor/interval-distance-certainty')
record_path = s / 'interface-isolation-scheduling.json'
assert not record_path.exists()
assert not (s / 'quiet-workflow-executed-plan.json').exists()
for checkout in ['/mnt/development/alumina-interface', '/mnt/development/interval-coordinated-stack/alumina-interface']:
    assert subprocess.check_output(['git', 'diff', '--binary', 'HEAD'], cwd=checkout) == (s / 'interface-ui-final-candidate.patch').read_bytes()
assert not (s / 'interface-completed-workload-benchmark').exists()
active = list((s / 'runs').glob('*/active.json'))
assert len(active) == 1 and active[0].parent.name == 'rust.test.m00.03', active
root = json.loads(active[0].read_text())
pid = root['pid']
proc = Path(f'/proc/{pid}/stat')
assert proc.read_text().split()[21] == root['proc_starttime']
assert os.getpgid(pid) == pid
remaining = root['local_timeout_seconds'] - (time.time() - root['started_unix'])
assert remaining > 9000, remaining
assert json.loads((s / 'runs/hyperspatial.representations.base.02/result.json').read_text())['exit_code'] == 0
plan_path = s / 'quiet-workflow-plan.json'
original = plan_path.read_bytes()
plan = json.loads(original)
identifier = 'alumina-interface.completed-workload-cost'
command = next(r for r in plan['commands'] if r['id'] == identifier)
assert command['job_budget_seconds'] == 1800
assert not (s / 'runs' / identifier).exists()
record = {'root_id': root['id'], 'root_pid': pid, 'root_proc_starttime': root['proc_starttime'],
          'root_remaining_seconds_before': remaining, 'root_deadline_unchanged': True,
          'comparison_budget_seconds': 1800, 'comparison_id': identifier,
          'old_quiet_plan_sha256': hashlib.sha256(original).hexdigest(),
          'source_mutation': False, 'time_started_unix': time.time(),
          'reason': 'Spatial representation lane completed; run already-built matched comparison while the sole goal-owned compute group is suspended. Resume unconditionally, with an independent failsafe.'}
(s / 'quiet-workflow-plan.pre-interface-isolation.json').write_bytes(original)
record_path.write_text(json.dumps(record, indent=2) + '\n')
# The independent failsafe resumes the exact original process at 1850 seconds
# even if this controller disappears. It cannot resume an unrelated reused PID.
watcher = '''import json,os,signal,time
from pathlib import Path
p=Path(%r)
time.sleep(1850)
d=json.loads(p.read_text())
if not d.get("resumed_unix"):
 q=Path("/proc/%%d/stat" %% d["root_pid"])
 if q.exists() and q.read_text().split()[21]==d["root_proc_starttime"]:
  os.killpg(d["root_pid"],signal.SIGCONT)
  p.with_suffix(".failsafe.json").write_text(json.dumps({"resumed_unix":time.time()}))
''' % str(record_path)
guard = subprocess.Popen([sys.executable, '-c', watcher], start_new_session=True,
                         stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
record['failsafe_pid'] = guard.pid
try:
    os.killpg(pid, signal.SIGSTOP)
    deadline = time.monotonic() + 10
    while True:
        members = []
        for path in Path('/proc').glob('[0-9]*/stat'):
            try:
                fields = path.read_text().split()
                if fields[4] == str(pid):
                    members.append({'pid': int(fields[0]), 'state': fields[2], 'starttime': fields[21]})
            except (FileNotFoundError, ProcessLookupError):
                pass
        if members and all(p['state'] in ['T', 'Z'] for p in members):
            break
        assert time.monotonic() < deadline, members
        time.sleep(0.1)
    record['stopped_members'] = members
    record['stopped_unix'] = time.time()
    record_path.write_text(json.dumps(record, indent=2) + '\n')
    # Remove only this comparator from the later queue, and add its terminal
    # record as a prerequisite; all remaining bodies/budgets remain identical.
    plan['commands'] = [r for r in plan['commands'] if r['id'] != identifier]
    plan['dependencies'].append(identifier)
    temporary = plan_path.with_suffix('.tmp')
    temporary.write_text(json.dumps(plan, indent=2) + '\n')
    temporary.replace(plan_path)
    row = command | {'local_timeout_seconds': 1800,
                     'timeout_scope': 'Unchanged prepared comparison budget; root watchdog continues during temporary process suspension.'}
    manifest = s / 'interface-isolated-manifest.json'
    manifest.write_text(json.dumps([row], indent=2) + '\n')
    result = subprocess.run([sys.executable, str(s / 'run-one.py'), str(manifest), identifier], timeout=1830)
    record['comparison_runner_exit'] = result.returncode
finally:
    if proc.exists() and proc.read_text().split()[21] == root['proc_starttime']:
        os.killpg(pid, signal.SIGCONT)
        record['resumed_unix'] = time.time()
    else:
        record['root_already_terminal'] = True
    record['controller_finished_unix'] = time.time()
    record_path.write_text(json.dumps(record, indent=2) + '\n')
    guard.terminate()
    guard.wait(timeout=5)
print(json.dumps(record, indent=2), flush=True)
