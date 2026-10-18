"""Retain the full preceding continuation and deterministic artifact contracts."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes
from format_comparison import compare
source = hashes()
old = OUT.parent/'2026-10-18-retained-plane-contacts'
for name in ['consumer', 'previous_axial', 'components', 'old_path', 'continuation']:
    subprocess.run(['python3', str(Path(__file__).with_name(name+'.py'))], cwd=ROOT, env=ENV, check=True)
    assert hashes() == source
rows = []
for previous in json.loads((old/'artifact-comparison.json').read_text())['rows']:
    a, b = old/previous['path'], OUT/previous['path']
    rows.append(dict(path=previous['path'], **compare(a, b)))
assert len(rows) == 211
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(source=source, rows=rows,
    scope='All 211 preceding artifacts retain their exact encodings except the audited v9/v10 header and planar source-map schema migration. STEP bytes remain identical; independent continuation and external-reader checks execute separately.'), indent=2)+'\n')
