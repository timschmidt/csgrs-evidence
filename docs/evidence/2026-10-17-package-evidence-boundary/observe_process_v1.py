"""Read a known Cargo inventory process's progress without modifying it."""
import json
import os
from pathlib import Path
import time

pid = 1277532
folder = Path('/proc') / str(pid)
identity = None
for sample in range(3):
    try:
        command = (folder / 'cmdline').read_bytes().replace(b'\0', b' ').decode()
        assert 'cargo package --list --offline --locked --allow-dirty -p csgrs' in command
        stat = (folder / 'stat').read_text().rsplit(')', 1)[1].split()
        if identity is None:
            identity = stat[19]
        assert stat[19] == identity
        status = dict(line.split(':', 1) for line in (folder / 'status').read_text().splitlines() if ':' in line)
        descriptors = {}
        for descriptor in (folder / 'fd').iterdir():
            try:
                descriptors[descriptor.name] = os.readlink(descriptor)
            except OSError:
                pass
        print(json.dumps({'sample': sample, 'time_unix': time.time(), 'pid': pid,
            'process_start_ticks': identity, 'state': stat[0], 'user_cpu_ticks': stat[11],
            'system_cpu_ticks': stat[12], 'clock_ticks_per_second': os.sysconf('SC_CLK_TCK'),
            'VmRSS': status.get('VmRSS'), 'io': (folder / 'io').read_text(),
            'wait_channel': (folder / 'wchan').read_text(), 'open_descriptors': descriptors}), flush=True)
    except FileNotFoundError:
        print(json.dumps({'sample': sample, 'process_terminal': True}), flush=True)
        break
    if sample < 2:
        time.sleep(5)
