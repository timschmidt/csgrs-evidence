import json
import os
from pathlib import Path
import signal
import sys
import time

wanted = sys.argv[1:]
assert wanted and all(s.startswith('python3 target/prepush-20261105/run.py ') for s in wanted)
procs = {}
for p in Path('/proc').iterdir():
    if not p.name.isdigit():
        continue
    try:
        args = [s.decode(errors='replace') for s in (p / 'cmdline').read_bytes().split(b'\0') if s]
        stat = (p / 'stat').read_text().rsplit(')', 1)[1].split()
        procs[int(p.name)] = (int(stat[1]), ' '.join(args))
    except (OSError, IndexError):
        pass
roots = [pid for pid, (_, command) in procs.items() if command in wanted]
targets = set(roots)
while True:
    more = {pid for pid, (parent, _) in procs.items() if parent in targets} - targets
    if not more:
        break
    targets |= more
rows = [dict(pid=pid, command=procs[pid][1]) for pid in sorted(targets)]
for pid in sorted(targets, reverse=True):
    try:
        os.kill(pid, signal.SIGTERM)
    except ProcessLookupError:
        pass
out = Path(__file__).resolve().parent
(out / ('runner-stops-' + str(time.time_ns()) + '.json')).write_text(json.dumps(dict(time=time.time(), processes=rows), indent=2) + '\n')
print('Stopped task runners:', roots, 'total task processes:', len(targets))
