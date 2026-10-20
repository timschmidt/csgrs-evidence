"""Retain the full preceding continuation and deterministic artifact contracts."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes
source = hashes()
old = OUT.parent/'2026-10-18-spline-exchange'
for name in ['consumer', 'previous_axial', 'components', 'old_path', 'continuation']:
    subprocess.run(['python3', str(Path(__file__).with_name(name+'.py'))], cwd=ROOT, env=ENV, check=True)
    assert hashes() == source
rows = []
for previous in json.loads((old/'artifact-comparison.json').read_text())['rows']:
    a, b = old/previous['path'], OUT/previous['path']
    assert a.read_bytes() == b.read_bytes(), previous['path']
    rows.append(dict(path=previous['path'], baseline=str(a.relative_to(ROOT)),
        bytes=b.stat().st_size, sha256=hashlib.sha256(b.read_bytes()).hexdigest(), unchanged=True))
assert len(rows) == 211
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(source=source, rows=rows,
    scope='All 211 preceding final artifacts remain byte-identical after full native continuation. Their previously recorded external-reader observations remain applicable to these exact bytes; the new quintic has a separate reader exercise.'), indent=2)+'\n')
