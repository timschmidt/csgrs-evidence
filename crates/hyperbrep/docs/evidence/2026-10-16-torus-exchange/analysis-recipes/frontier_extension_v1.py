"""Independently qualify two improved diagnostic slots before reviewing migration."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

project = Path('/tmp/hyperbrep-torus-continuation-probe')
probe = Path(__file__).with_suffix('.rs')
inputs = [Path(__file__), probe, project/'Cargo.toml', project/'Cargo.lock']
digests = lambda: {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}
before = digests()
source = hashes()
(OUT/'frontier-extension-inputs.json').write_text(json.dumps(before, indent=2)+'\n')
shutil.copyfile(probe,project/'src/bin/frontier_extension.rs')
assert run('frontier-extension-build',['cargo','build','--offline','--locked','--release',
    '--manifest-path',str(project/'Cargo.toml'),'--bin','frontier_extension'],900)==0
executable = Path(ENV['CARGO_TARGET_DIR'])/'release/frontier_extension'
assert run('frontier-extension',[str(executable),str(OUT/'frontier-extension-artifacts')],600)==0
assert hashes()==source and digests()==before
artifacts = [dict(file=p.name,bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
    for p in sorted((OUT/'frontier-extension-artifacts').glob('*.json'))]
assert len(artifacts)==2
(OUT/'frontier-extension-summary.json').write_text(json.dumps(dict(
    source=source,input_digests=before,artifacts=artifacts,fixtures=['cone/rational/sector','torus/rational/sector'],
    executable=dict(path=str(executable),bytes=executable.stat().st_size,
        sha256=hashlib.sha256(executable.read_bytes()).hexdigest()),
    scope='Two original full-size diagnostic fixtures with independent analytic volume/area, interior/boundary/exterior points including 1e-12 offsets, edge-use topology, deterministic archive replay, split/reload, recut, canonical clear and empty recovery. Native source probe only; no broader family, package, WASM-group or STEP claim.'
),indent=2)+'\n')
print('two rational-sector continuation fixtures independently checked',flush=True)
