"""Repeat unchanged release commands with fresh temporary-registry identities."""
from pathlib import Path
import json
import subprocess
import time

root = Path(__file__).resolve().parent
build = Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-selected-query-release-retry')
assert not build.exists(), 'Retry build root must be new'
phases = json.loads((root / 'normal-phases.json').read_text())
assert [v['phase'] for v in phases] == ['quick', 'lint', 'workflow', 'release']
assert all(v['exit_code'] == 0 for v in phases[:3]) and phases[3]['exit_code'] != 0
assert (root / 'release-registry-attribution/controls-before-retry/normal-phases.json').read_text() == (root / 'normal-phases.json').read_text()
phases = phases[:3]
(root / 'normal-phases.json').write_text(json.dumps(phases, indent=2) + '\n')
command = ['python3', str(root / 'driver.py'), '--checkout', str(root / 'normal'),
           '--phase', 'release', '--build-root', str(build)]
started = time.time()
result = subprocess.run(command, cwd=root / 'normal')
row = {'mode': 'normal', 'phase': 'release', 'command': command, 'exit_code': result.returncode,
       'elapsed_seconds': time.time() - started,
       'prior_failed_attempt': 'release-registry-attribution/controls-before-retry/normal-phases.json',
       'retry_reason': 'Stale extracted Cargo temporary-registry source; original source and workflow command unchanged.'}
phases.append(row)
(root / 'normal-phases.json').write_text(json.dumps(phases, indent=2) + '\n')
assert result.returncode == 0, 'Release retry failed; no cleanup or closeout'
latest = json.loads((root / 'latest-release.json').read_text())
assert latest['all_passed']
subprocess.run(['python3', str(root / 'audit_release_package_sources.py'), '--record', latest['record']], check=True)
with (root / 'cache-cleanup-release-retry.log').open('x') as log:
    process = subprocess.Popen(['python3', str(root / 'cleanup_completed_builds.py')],
                               cwd=root / 'normal', stdout=log, stderr=subprocess.STDOUT,
                               start_new_session=True)
(root / 'cache-cleanup-controller.json').write_text(json.dumps({'pid': process.pid,
    'command': ['python3', str(root / 'cleanup_completed_builds.py')], 'epoch': time.time(),
    'scope': 'Resume the three retained coverage cleanup receipts; remove only completed release build buffers after source attribution audit.'}, indent=2) + '\n')
subprocess.run(['python3', str(root / 'close_validation.py')], cwd=root / 'normal', check=True)
assert process.wait() == 0
print('Release retry and guarded local closeout completed; no push.', flush=True)
