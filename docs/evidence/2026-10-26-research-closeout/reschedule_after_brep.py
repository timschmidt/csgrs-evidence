from pathlib import Path
import json, os, signal, subprocess, time, hashlib
root=Path('/tmp/csgrs-research-closeout-checkout')
record=Path('/tmp/csgrs-research-2026-10-25/closeout/validation-workflow-1792991996487568158')
pid=1702875
expected='^(hypersolve-coverage|hypertri-coverage|hyperspatial-coverage|workspace-test-(3|9)-)'
cmdline=Path(f'/proc/{pid}/cmdline').read_bytes().split(b'\0')
assert b'run_matrix.py' in b' '.join(cmdline) and expected.encode() in cmdline
while True:
    rows=[json.loads(x) for x in (record/'events.jsonl').read_text().splitlines()]
    completed=[x for x in rows if x['event']=='finish']
    target=[x for x in completed if x['id']=='workspace-test-3-3']
    if target:break
    time.sleep(0.5)
assert target[0]['status']==0, 'Do not reschedule a failing test'
os.kill(pid,signal.SIGSTOP)
rows=[json.loads(x) for x in (record/'events.jsonl').read_text().splitlines()]
completed=[x for x in rows if x['event']=='finish']
finished={x['id'] for x in completed}
interrupted=[x for x in rows if x['event']=='start' and x['id'] not in finished]
processes=[]
for line in subprocess.check_output(['ps','-eo','pid=,ppid=,pgid='],text=True).splitlines():
    process,parent,group=map(int,line.split());processes.append((process,parent,group))
descendants={pid}
while True:
    enlarged=descendants|{process for process,parent,group in processes if parent in descendants}
    if enlarged==descendants:break
    descendants=enlarged
own_group=os.getpgrp()
groups={group for process,parent,group in processes if process in descendants and process!=pid}
assert own_group not in groups
for group in groups:
    try:os.killpg(group,signal.SIGTERM)
    except ProcessLookupError:pass
os.kill(pid,signal.SIGKILL)
time.sleep(1)
for process in descendants-{pid}:
    try:os.kill(process,signal.SIGKILL)
    except ProcessLookupError:pass
names=subprocess.check_output(['git','ls-files'],cwd=root,text=True).splitlines()
after={n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file()}
before=json.loads((record/'sources-before.json').read_text())
changes=[n for n in before if before[n]!=after.get(n)]
(record/'sources-after-reschedule.json').write_text(json.dumps(after,indent=2)+'\n')
checkpoint={'reason':'Keep completed coverage and BRep results; DRC validation runs separately on the final maintenance source. Any interrupted old-source DRC startup will not be counted as a completed check.','epoch_ns':time.time_ns(),'completed_results':completed,'interrupted_steps':interrupted,'source_changes':changes,'driver_pid':pid,'terminated_task_processes':sorted(descendants)}
assert not changes,changes
(record/'rescheduling-checkpoint.json').write_text(json.dumps(checkpoint,indent=2)+'\n')
print('RESCHEDULE READY',len(completed),'completed; interrupted',[s['id'] for s in interrupted],flush=True)
