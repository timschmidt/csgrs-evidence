"""Measure one native child with Linux wait4; no optional time executable."""
import json
import os
from pathlib import Path
import subprocess
import sys
import time

destination=Path(sys.argv[1])
command=sys.argv[2:]
started=time.perf_counter()
child=subprocess.Popen(command)
pid,status,usage=os.wait4(child.pid,0)
elapsed=time.perf_counter()-started
assert pid==child.pid
code=os.waitstatus_to_exitcode(status)
child.returncode=code
destination.write_text(json.dumps(dict(wall_seconds=elapsed,user_seconds=usage.ru_utime,
    system_seconds=usage.ru_stime,maximum_rss_kib=usage.ru_maxrss,exit_code=code))+'\n')
raise SystemExit(code if code>=0 else 128-code)
