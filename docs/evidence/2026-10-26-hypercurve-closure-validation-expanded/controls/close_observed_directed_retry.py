from pathlib import Path
import hashlib
import json
import re
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = root / 'directed'
record = root / 'validation-workflow-1793075673461718168'
assert not (record / 'summary.json').exists()
steps = json.loads((record / 'steps.json').read_text())
assert len(steps) == 1 and steps[0]['id'] == 'hyperspatial-directed-0-14'
step = steps[0]
events = [json.loads(line) for line in (record / 'events.jsonl').read_text().splitlines()]
assert len(events) == 1 and events[0]['event'] == 'start'
started = events[0]
assert all(started[key] == value for key, value in step.items())
expected = next(s for s in json.loads((root / 'matrix.json').read_text())['steps']
                if s['id'] == step['id'])
assert step['command'] == expected['command']
assert step['timeout_seconds'] == expected['timeout_seconds'] == 21600

# The original launcher exited 143. Qualification uses the observed exit of its
# unchanged workflow child, not a fabricated successful exit for that launcher.
observed = json.loads((record / 'workflow-child-exit-observed.json').read_text())
trace = (record / 'workflow-child-exit.strace').read_bytes()
assert hashlib.sha256(trace).hexdigest() == observed['trace_sha256']
assert observed['workflow_child_pid'] == 1091388
assert observed['workflow_child_start_ticks'] == '79665495'
assert observed['original_command'] == step['command']
assert observed['launcher_session'] == 86041 and observed['launcher_exit_code'] == 143
assert observed['observer_returncode'] == 0
assert observed['exit_group_codes'] == [0] and observed['observed_normal_exits'] == [0]
assert observed['observed_workflow_exit_code'] == 0
exit_matches = re.findall(rb'^(\d+\.\d+)\s+\+\+\+ exited with 0 \+\+\+', trace, re.MULTILINE)
assert len(exit_matches) == 1
finished_epoch = float(exit_matches[0])
elapsed = finished_epoch - started['started_epoch']
assert 0 < elapsed <= step['timeout_seconds'], elapsed

head = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip()
assert head == json.loads((root / 'publication-source.json').read_text())['head']
assert head == observed['source_head']
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout)
before = json.loads((record / 'sources-before.json').read_text())
names = subprocess.check_output(['git', 'ls-files'], cwd=checkout, text=True).splitlines()
after = {name: hashlib.sha256((checkout / name).read_bytes()).hexdigest()
         for name in names if (checkout / name).is_file()}
assert before == after

campaign_dir = checkout / 'target/hyperspatial-asan'
report = json.loads((campaign_dir / 'report.json').read_text())
durations = {
    'forward_local': 60, 'normal_offset': 60, 'mercator': 60,
    'inverse_isometric': 900, 'ellipsoidal_mercator': 900,
    'transverse_mercator': 900, 'elliptic': 900, 'inverse_legendre': 900,
    'jacobi': 1800, 'complex_jacobi': 1800, 'jacobi_epsilon': 1800,
    'complex_atanh': 60, 'parameter_encodings': 60,
}
assert report['source_revision'] == head
assert report['campaign_seconds'] == durations
assert report['sanitizer'] == 'address' and report['seed'] == 20261018
assert report['seconds_per_input'] == 10 and report['rss_limit_mib'] == 2048
assert report['max_input_bytes'] == 6
assert all(after[name] == digest for name, digest in report['source_sha256'].items())
assert [c['target'] for c in report['campaigns']] == list(durations)
audit = [json.loads(line) for line in (record / 'cargo-invocations.jsonl').read_text().splitlines()]
campaign_receipts = []
for campaign in report['campaigns']:
    target = campaign['target']
    command = ['cargo', '+nightly', 'fuzz', 'run', target,
               '--fuzz-dir', 'crates/hyperspatial/fuzz', '--sanitizer', 'address',
               str(campaign_dir / (target + '-corpus')), '--',
               '-max_total_time=' + str(durations[target]), '-timeout=10',
               '-rss_limit_mb=2048', '-max_len=6', '-seed=20261018']
    assert campaign['command'] == command
    assert campaign['returncode'] == 0
    log = campaign_dir / (target + '.log')
    initialized = completed = None
    for event in re.finditer(r'^#(\d+)\s+(INITED|DONE)\b', log.read_text(), re.MULTILINE):
        if event[2] == 'INITED':
            initialized, completed = int(event[1]), None
        elif initialized is not None:
            completed = int(event[1])
    mutation = {'initialized_runs': initialized, 'completed_runs': completed,
                'mutated': initialized is not None and completed is not None and completed > initialized}
    assert mutation == campaign['mutation_evidence'] and mutation['mutated']
    completed_calls = [a for a in audit if a['event'] == 'finish'
                       and a['requested_arguments'] == command[1:]]
    assert len(completed_calls) == 1 and completed_calls[0]['status'] == 0
    campaign_receipts.append({'target': target, 'seconds': durations[target],
                             'returncode': 0, 'mutation_evidence': mutation,
                             'log_sha256': hashlib.sha256(log.read_bytes()).hexdigest()})

recovery = {
    'launcher_session': 86041, 'launcher_exit_code': 143,
    'workflow_child_pid': observed['workflow_child_pid'],
    'workflow_child_start_ticks': observed['workflow_child_start_ticks'],
    'observed_workflow_exit_code': 0,
    'exit_observation': 'workflow-child-exit-observed.json',
    'exit_trace': 'workflow-child-exit.strace',
    'trace_sha256': observed['trace_sha256'],
    'finished_epoch': finished_epoch, 'recorded_epoch': time.time(),
    'campaigns': campaign_receipts,
    'interpretation': 'The launcher interruption remains a distinct recorded failure. '
                      'The original workflow child continued unchanged; its actual OS '
                      'exit and all 13 full-budget sanitizer campaign outcomes establish '
                      'completion of the original command within its configured timeout. '
                      'No campaign was restarted, skipped, or shortened by this recovery.',
}
row = {**started, 'event': 'finish', 'status': observed['observed_workflow_exit_code'],
       'elapsed_seconds': elapsed, 'finished_epoch': finished_epoch,
       'recovered_exit_observation': recovery}
summary = {
    'record': str(record), 'head': head, 'phase': 'workflow',
    'selection': '^hyperspatial-directed-0-14$', 'planned': 1, 'completed': 1,
    'results': [{k: v for k, v in row.items() if k != 'event'}],
    'source_changes': [], 'all_passed': True, 'recovered_closeout': True,
    'launcher_passed': False, 'workflow_child_passed': True,
    'launcher_interruption': recovery,
}
(record / 'sources-after.json').write_text(json.dumps(after, indent=2) + '\n')
with (record / 'events.jsonl').open('a') as out:
    out.write(json.dumps(row) + '\n')
(record / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
(root / 'directed-retry-recovered-closeout.json').write_text(json.dumps(recovery, indent=2) + '\n')
print(json.dumps({'workflow_exit_code': 0, 'launcher_exit_code': 143,
                  'completed_campaigns': 13, 'elapsed_seconds': elapsed}), flush=True)
