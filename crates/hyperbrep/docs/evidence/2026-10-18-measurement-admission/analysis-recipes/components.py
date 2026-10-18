"""Build and execute the supplementary multi-component public consumer."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

PROJECT=Path('/tmp/hyperbrep-region-components-probe')
source=hashes()
assert (PROJECT/'src/main.rs').read_bytes()==(OUT/'analysis-recipes/region_components.rs').read_bytes()
assert (PROJECT/'Cargo.toml').read_bytes()==(OUT/'analysis-recipes/components-Cargo.toml').read_bytes()
assert (PROJECT/'Cargo.lock').read_bytes()==(OUT/'analysis-recipes/components-Cargo.lock').read_bytes()
paths=[Path(__file__),OUT/'analysis-recipes/region_components.rs',OUT/'analysis-recipes/components-Cargo.toml',
    OUT/'analysis-recipes/components-Cargo.lock',PROJECT/'src/main.rs',PROJECT/'Cargo.toml',PROJECT/'Cargo.lock']
digests=lambda:{str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in paths}
inputs=digests()
(OUT/'components-inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
assert run('components-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(PROJECT/'Cargo.toml')],900)==0
binary=Path('/tmp/hyperbrep-measurement-admission-components-consumer')
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-region-components-probe',binary)
metadata=dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
(OUT/'components-binary.json').write_text(json.dumps(metadata,indent=2)+'\n')
code=run('components-runtime',[str(binary),str(OUT/'component-exports')],600)
command=json.loads((OUT/'attempts.json').read_text())[-1]
assert hashes()==source and digests()==inputs
assert code==0
log=(OUT/command['log']).read_text()
for reverse in ['false','true']:
    assert f'case=components-reverse-{reverse} outcome=certified bodies=3 volume=75 area=206' in log
(OUT/'components-admission.json').write_text(json.dumps(dict(source=source,inputs=inputs,binary=metadata,
    command=command,complete_workflows=2,scope='Both authored directions of one material ring, its island and a separate component complete exact STEP, cold replay, Boolean reuse and empty recovery. Independent volume 75, area 206 and exact near-hole classifications.'),indent=2)+'\n')
print('Two multi-component STEP workflows completed.',flush=True)
