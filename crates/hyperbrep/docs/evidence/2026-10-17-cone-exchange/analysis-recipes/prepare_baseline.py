"""Freeze the committed predecessor's binaries and prepare a contained probe."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

old = OUT.parent / '2026-10-17-cone-continuation'
read = lambda p: json.loads(p.read_text())
write = lambda p, value: p.write_text(json.dumps(value, indent=2)+'\n')
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
baseline = '490ed3421a471ef010d647def63c083138e45633'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == baseline
assert not (OUT / 'baseline.json').exists()
previous_source = read(old / 'final-source.json')
assert all(sha(ROOT / relative) == expected for relative, expected in previous_source.items())
main = read(old / 'benchmark-v1/executables.json')
dependencies = read(old / 'candidate-dependency-binaries.json')
diagnostics = read(old / 'continuation-binaries.json')
groups = [main['candidate'], dependencies['executables'], diagnostics]
for group in groups:
    for row in group.values():
        path = Path(row['path'])
        assert path.stat().st_size == row['bytes'] and sha(path) == row['sha256']
write(OUT / 'baseline-main-binaries.json', dict(
    executables=main['candidate'], build=main['build'],
    cases=175, provenance=str((old / 'benchmark-v1/executables.json').relative_to(ROOT))))
write(OUT / 'baseline-dependency-binaries.json', dict(
    executables=dependencies['executables'], cases=196,
    provenance=str((old / 'candidate-dependency-binaries.json').relative_to(ROOT))))
write(OUT / 'baseline-diagnostic-binaries.json', dict(executables=diagnostics))
write(OUT / 'baseline-source.json', hashes())
write(OUT / 'baseline.json', dict(
    baseline=baseline, previous_guarded_source=previous_source,
    previous_manifest_sha256=sha(old / 'manifest.json'), frozen_binaries=sum(map(len, groups)),
    main_cases=175, dependency_cases=196, diagnostic_slots=81,
    recipe_sha256=sha(Path(__file__)),
    scope='Prior completed candidate binaries frozen before this increment changes production source. No new timing claim.'))
project = Path('/tmp/hyperbrep-cone-exchange-probe')
assert not project.exists()
(project / 'src').mkdir(parents=True)
shutil.copy2(OUT / 'diagnostic-project/Cargo.toml', project / 'Cargo.toml')
shutil.copy2(OUT / 'diagnostic-inputs/main.rs', project / 'src/main.rs')
print('frozen baseline binaries:', sum(map(len, groups)))
