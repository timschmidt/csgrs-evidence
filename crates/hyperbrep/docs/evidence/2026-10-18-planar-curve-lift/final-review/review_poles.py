"""Additional native boundary probe, separate from timed and WASM cohorts."""
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes, run

probe = Path(__file__).with_name('pole-probe')
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
inputs = {str(p.relative_to(OUT)): digest(p) for p in [Path(__file__), *sorted(probe.iterdir())] if p.is_file()}
manifest = str(probe/'Cargo.toml')
commands = [
    ('pole-boundary-format', ['cargo', 'fmt', '--manifest-path', manifest, '--', '--check']),
    ('pole-boundary-clippy', ['cargo', 'clippy', '--release', '--offline', '--locked', '--manifest-path', manifest, '--', '-D', 'warnings']),
    ('pole-boundary-locked', ['cargo', 'run', '--release', '--offline', '--locked', '--manifest-path', manifest]),
]
for label, command in commands:
    assert run(label, command, seconds=300) == 0
assert hashes() == source
assert all(digest(OUT/p) == value for p, value in inputs.items())
attempts = json.loads((OUT/'attempts.json').read_text())
latest = {row['label']: row for row in attempts}
log = OUT/latest['pole-boundary-locked']['log']
rows = [line for line in log.read_text().splitlines() if line.startswith(('pole_', 'recovery_'))]
assert len(rows) == 7
for label, count in [('pole_evaluation', 2), ('pole_bounds', 2), ('pole_loop', 1), ('pole_face', 1)]:
    values = [row for row in rows if row.startswith(label+'=')]
    assert len(values) == count
    assert all('Blocked(ExactCurveBlocker' in row and 'reason: Boundary' in row and 'family: Some(RationalBezier)' in row for row in values)
assert rows[-1] == 'recovery_face=admitted'
binary = Path('/tmp/hyperbrep-review-target/release/hyperbrep-planar-pole-review')
(OUT/'pole-review.json').write_text(json.dumps(dict(source=source, inputs=inputs,
    checks=[latest[label] for label, _ in commands], rows=rows,
    binary=dict(path=str(binary), sha256=digest(binary), bytes=binary.stat().st_size),
    scope='Supplemental native public-API probe of source definition versus finite-loop admission. The W(t)=(1-2t)^2 pole survives exact native replay; evaluation, bounds, complete loop and face admission retain typed Boundary blockers. A finite source with identical endpoints admits a face afterward. No production edit, general pole-classification claim, WASM or performance result is inferred.'), indent=2)+'\n')
print(json.dumps(dict(passed=True, rows=rows), indent=2))
