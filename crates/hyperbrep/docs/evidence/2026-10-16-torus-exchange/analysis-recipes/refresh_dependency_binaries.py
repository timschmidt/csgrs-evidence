"""Freeze final-source microbench binaries, preserving the unmeasured precursor."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, run

path = OUT / 'dependency-candidate-binaries.json'
previous = OUT / 'dependency-candidate-v1-binaries.json'
assert not previous.exists()
shutil.copy2(path, previous)
metadata = json.loads(path.read_text())
assert run('dependency-candidate-build', metadata['build']['command'], 1200) == 0
attempt = json.loads((OUT / 'attempts.json').read_text())[-1]
executables = {}
for line in (OUT / attempt['log']).read_text().splitlines():
    if not line.startswith('{'):
        continue
    item = json.loads(line)
    if item.get('reason') != 'compiler-artifact' or item['target']['kind'] != ['bench']:
        continue
    name = item['target']['name']
    target = Path('/tmp') / f'hyperbrep-torus-dependency-candidate-v2-{name}'
    assert not target.exists()
    shutil.copy2(item['executable'], target)
    executables[name] = dict(path=str(target), bytes=target.stat().st_size,
        sha256=hashlib.sha256(target.read_bytes()).hexdigest(), features=item['features'])
assert set(executables) == {'scalar_micro', 'predicates'}
metadata.update(build=attempt, executables=executables, previous=previous.name,
    refresh='Final source after removing incidental scalar formatting. Precursor binaries and metadata retained; no earlier microcost samples discarded.')
path.write_text(json.dumps(metadata, indent=2) + '\n')
