"""Bounded queue gating; never retry a command or change a validation budget."""
from pathlib import Path
import hashlib
import json
import os
import signal
import time

S = Path(__file__).parent
Q = S.parent
PID = 1621335
START = '38218939'
PLAN_HASH = '1674343e351f5abe53f9c7bfdc9a5414f514ae15f38f3b328b1652ef6fb981b4'
HORIZON = 6*3600
QUIET = 60


def save(name, data):
    (S/name).write_text(json.dumps(data, indent=2)+'\n')


def parent_state():
    path = Path(f'/proc/{PID}/stat')
    if not path.exists():
        return None
    raw = path.read_text(); fields = raw[raw.rfind(')')+2:].split()
    if fields[19] != START:
        raise RuntimeError('orchestrator PID was reused; no signal sent')
    return fields[0]


def pause(state):
    if state not in [None, 'T', 't', 'Z', 'X']:
        os.kill(PID, signal.SIGSTOP)


def external():
    result = []
    for proc in Path('/proc').iterdir():
        if not proc.name.isdecimal():
            continue
        try:
            name = (proc/'comm').read_text().strip()
            raw = (proc/'stat').read_text(); f = raw[raw.rfind(')')+2:].split()
            if (name in ['alumina-route', 'kicad-cli', 'cargo', 'rustc', 'clippy-driver'] or name.startswith('alumina-enclos')) and f[0] not in ['T', 't', 'Z', 'X']:
                result.append(dict(pid=int(proc.name), comm=name, state=f[0], starttime=f[19], utime=f[11], stime=f[12]))
        except (FileNotFoundError, ProcessLookupError, PermissionError):
            pass
    return result


def main():
    started=time.monotonic(); quiet_since=None; last_log=0; last_action=None
    save('active.json',dict(pid=os.getpid(),orchestrator=PID,orchestrator_starttime=START,started_unix=time.time(),horizon_seconds=HORIZON,quiet_seconds=QUIET,plan_sha256=PLAN_HASH,scope='Only suspend/resume orchestrator at external contention. Existing child completes. Never retry, discard a failure, change a command or reset any cumulative workload budget.'))
    while True:
        now=time.monotonic(); state=parent_state()
        plan_path=Q/'quiet-workflow-executed-plan.json'
        if hashlib.sha256(plan_path.read_bytes()).hexdigest()!=PLAN_HASH:
            pause(state)
            raise RuntimeError('frozen plan changed; orchestrator held')
        plan=json.loads(plan_path.read_text())
        pending=[row['id'] for row in plan['commands'] if not (Q/'runs'/row['id']/'result.json').exists()]
        running=[name for name in pending if (Q/'runs'/name/'active.json').exists()]
        processes=external()
        if processes:
            quiet_since=None; pause(state); action='held-for-external-work'
        else:
            if quiet_since is None:quiet_since=now
            action='observing-quiet'
        record=dict(at=time.time(),elapsed_seconds=now-started,parent_state=state,pending=len(pending),running=running,processes=processes,quiet_seconds=0 if quiet_since is None else now-quiet_since,action=action)
        if not pending or state in [None,'Z','X']:
            save('result.json',dict(**record,terminal=True,exit_code=0 if not pending else 2,reason='all command outcomes retained' if not pending else 'orchestrator ended with pending work'))
            return
        if now-started >= HORIZON:
            pause(state)
            save('result.json',dict(**record,terminal=True,exit_code=2,reason='observation horizon reached; orchestrator held, current child may finish; fresh evidence/review needed before resumption'))
            return
        if not processes and now-quiet_since >= QUIET and not running and state in ['T','t']:
            os.kill(PID,signal.SIGCONT)
            record['action']='resumed-after-new-quiet-window'
        if now-last_log>=30 or record['action']!=last_action:
            with (S/'observations.jsonl').open('a') as stream:stream.write(json.dumps(record)+'\n')
            last_log=now;last_action=record['action']
        time.sleep(5)


if __name__=='__main__':
    try:
        main()
    except Exception as error:
        pause(parent_state())
        save('failure.json',dict(time=time.time(),terminal=True,exit_code=2,error=repr(error),reason='orchestrator held; inspect before resumption'))
        raise
