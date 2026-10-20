"""Sequential post-qualification consumers and independent STEP readers."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, run

wasm = Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_region_extrusion_wasm_probe.wasm'
expected = json.loads((OUT/'wasm-runtime-1.log').read_text())
assert hashlib.sha256(wasm.read_bytes()).hexdigest() == expected['wasm_sha256']
frozen = Path('/tmp/hyperbrep-region-extrusion-final.wasm')
assert not frozen.exists()
shutil.copy2(wasm, frozen)
(OUT/'wasm-binary.json').write_text(json.dumps(dict(path=str(frozen), bytes=frozen.stat().st_size,
    sha256=hashlib.sha256(frozen.read_bytes()).hexdigest()), indent=2)+'\n')

for script, args in [('run_consumer.py', ['final']), ('components.py', []),
                     ('old_path.py', []), ('continuation.py', [])]:
    subprocess.run(['python3', str(OUT/'final-review'/script), *args], cwd=ROOT, env=ENV, check=True)
for name in ['region_occt', 'occt_cones', 'torus_occt', 'occt_read']:
    assert run(name.replace('_','-'), ['python3', str(OUT/'final-review'/(name+'.py'))], 300) == 0
(OUT/'finish-checks.json').write_text(json.dumps(dict(passed=True,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
