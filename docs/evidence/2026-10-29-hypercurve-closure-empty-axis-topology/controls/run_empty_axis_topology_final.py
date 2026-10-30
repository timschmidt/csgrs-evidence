"""Qualify the frozen empty-axis increment; no commit or push is performed."""
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[1]
c = root / 'controls'
for phase in ['focus', 'full']:
    command = ['python3', str(c / 'qualify_empty_axis_topology.py'),
               '--phase', phase, '--attempt', 'final1']
    print('START', command, flush=True)
    result = subprocess.run(command, cwd=root / 'empty-axis-topology')
    print('FINISH', result.returncode, flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
print('Empty-axis focused and affected checks passed; evidence closeout remains.', flush=True)
