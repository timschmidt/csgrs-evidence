from pathlib import Path
import hashlib
import json
import os
import subprocess
import sys

root = Path(__file__).resolve().parents[1]
probe = root / 'controls' / sys.argv[1]
rows = json.loads((probe / 'results.json').read_text())
assert len(rows) == 11 and all(r['exit_code'] == 0 and r['source_stable'] for r in rows)
record = root / 'controls' / 'selected-corner-adapter-seed'
record.mkdir()
attribution = json.loads((probe / 'attribution.json').read_text())
library = Path(attribution['library'])
assert hashlib.sha256(library.read_bytes()).hexdigest() == attribution['library_sha256']
source = (probe / 'original.rs').read_text()
marker = '    let replay = import_svg_document(&filled).unwrap();'
assert source.count(marker) == 1
source = source.replace(marker, '    std::fs::write(std::env::var_os("HYPERCURVE_FIXTURE_OUTPUT").unwrap(), &filled).unwrap();\n    std::fs::write(std::env::var_os("HYPERCURVE_SEED_OUTPUT").unwrap(), angular_svg(circle_path())).unwrap();\n' + marker)
test = record / 'export.rs'
test.write_text(source)
binary = record / 'export'
command = next(r['command'] for r in rows if r['name'] == 'original-build')
command = [str(test) if arg == str(probe / 'original.rs') else str(binary) if arg == str(probe / 'original') else arg for arg in command]
fixture = record / 'selected_circle_fillet.svg'
with (record / 'build.log').open('w') as log:
    subprocess.run(command, check=True, stdout=log, stderr=subprocess.STDOUT)
with (record / 'run.log').open('w') as log:
    subprocess.run([str(binary), 'selected_circle_diameter_constrained_fillet_reconstructs_replays_and_offsets', '--exact', '--nocapture'],
                   env={**os.environ, 'HYPERCURVE_FIXTURE_OUTPUT': str(fixture), 'HYPERCURVE_SEED_OUTPUT': str(record / 'selected_circle_source.svg')}, check=True, stdout=log, stderr=subprocess.STDOUT)
metadata = dict(probe=probe.name, source=attribution['source'], library_sha256=attribution['library_sha256'],
                test_sha256=hashlib.sha256(test.read_bytes()).hexdigest(), fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                fixture_bytes=fixture.stat().st_size, original_positive_assertions_preserved=True, seed_bytes=(record / 'selected_circle_source.svg').stat().st_size, seed_sha256=hashlib.sha256((record / 'selected_circle_source.svg').read_bytes()).hexdigest())
(record / 'attribution.json').write_text(json.dumps(metadata, indent=2) + '\n')
print(metadata)
