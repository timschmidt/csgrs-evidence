"""Build identical full workload executables; freeze baseline before edits."""
import hashlib
import json
import shutil
import subprocess
import sys
from pathlib import Path
from check import ENV, OUT, ROOT, hashes, run

phase = sys.argv[1]
assert phase in ('baseline', 'candidate')
names = ['export', 'faceted', 'advanced', 'circles', 'pcurves', 'analytic_export',
         'kernel', 'closed_edges', 'arc', 'edge_images', 'analytic_similarity',
         'seam_cuts', 'coplanar', 'sectors', 'oblique', 'prisms', 'prism_exchange']
names.append('torus_exchange')
command = ['cargo', 'build', '--offline', '--locked', '--release',
           '--no-default-features', '--features', 'csgrs/curve,hyperreal/serde',
           '-p', 'csgrs', '-p', 'hypermesh', '-p', 'hyperreal', '-p', 'hyperbrep',
           '-p', 'hyperbrep-io', '-p', 'hypercurve']
for name in names:
    command.extend(['--bench', name])
command.append('--message-format=json')
label = 'baseline-build' if phase == 'baseline' else 'benchmark-build'
result = run(label, command, 1200)
if result:
    raise SystemExit(result)
if phase == 'candidate':
    raise SystemExit(0)
attempt = json.loads((OUT/'attempts.json').read_text())[-1]
assert json.loads((OUT/attempt['source']).read_text()) == hashes()
executables = {}
for line in (OUT/attempt['log']).read_text().splitlines():
    if not line.startswith('{'):
        continue
    item = json.loads(line)
    if item.get('reason') != 'compiler-artifact' or item['target']['kind'] != ['bench']:
        continue
    name = item['target']['name']
    path = Path('/tmp')/f'hyperbrep-cone-continuation-baseline-{name}'
    assert not path.exists(), path
    shutil.copy2(item['executable'], path)
    executables[name] = dict(path=str(path), bytes=path.stat().st_size,
                            sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                            features=item['features'])
assert set(executables) == set(names)
(OUT/'baseline-binaries.json').write_text(json.dumps(dict(
    baseline=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
    source=attempt['source'], build=attempt, executables=executables,
    rustc=subprocess.check_output(['rustc', '-Vv'], env=ENV, text=True),
    cargo=subprocess.check_output(['cargo', '-V'], env=ENV, text=True),
), indent=2)+'\n')
