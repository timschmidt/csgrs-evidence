"""Complete the preserved-artifact checks not reached by the initial driver."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, ENV, hashes

source = hashes()
latest = {r['label']: r for r in json.loads((OUT/'attempts.json').read_text())}
for prefix, count in [('consumer-', 8), ('previous-axial-disjoint-', 4)]:
    completed = [r for name, r in latest.items() if name.startswith(prefix)]
    assert len(completed) == count
    assert all(r['exit_code'] == 0 and json.loads((OUT/r['source']).read_text()) == source for r in completed)
for name in ['components', 'old_path', 'continuation']:
    subprocess.run(['python3', '-B', str(OUT/'analysis-recipes'/f'{name}.py')], cwd=ROOT, env=ENV, check=True)
    assert hashes() == source
old = OUT.parent/'2026-10-18-selected-profile-extrusion'
rows = []
for previous in json.loads((old/'artifact-comparison.json').read_text())['rows']:
    a, b = old/previous['path'], OUT/previous['path']
    assert a.read_bytes() == b.read_bytes(), previous['path']
    rows.append(dict(path=previous['path'], baseline=str(a.relative_to(ROOT)),
                     bytes=b.stat().st_size, sha256=hashlib.sha256(b.read_bytes()).hexdigest(), unchanged=True))
assert len(rows) == 211 and hashes() == source
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(source=source, rows=rows,
    scope='All 211 preceding final artifacts remain byte-identical after full native continuation. Their previously recorded external-reader observations remain applicable to these exact bytes; selected irrational STEP vertices remain explicitly unencodable.'), indent=2)+'\n')
