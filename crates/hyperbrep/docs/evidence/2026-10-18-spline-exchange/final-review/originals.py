"""Keep all seven original full retained-region recipes on the final source."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ENV,hashes,run
old=OUT.parent/'2026-10-17-retained-region-extrusion'
project=OUT/'diagnostic-project'
for name in ['main.rs','Cargo.toml','Cargo.lock']:
    assert (project/name).read_bytes()==(old/'consumer-project'/name).read_bytes()
source=hashes()
assert run('final-original-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml')],900)==0
binary=Path('/tmp/hyperbrep-spline-exchange-original-final')
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-retained-region-probe',binary)
rows=[]
for case in ['uncut','difference','xor','affine_difference','affine_xor','parallel_square','parallel_cap']:
    assert run('final-original-'+case,[str(binary),case],300)==0
    attempt=json.loads((OUT/'attempts.json').read_text())[-1]
    text=(OUT/attempt['log']).read_text()
    baseline=OUT.parent/'2026-10-18-native-boundary-images'/('final-original-'+case+'-1.log')
    assert text==baseline.read_text(),case
    rows.append(dict(case=case,log=attempt['log'],outcome='native_result' if case in ['uncut','parallel_square'] else 'unsupported',
                     improved=False,original_unchanged=True))
assert hashes()==source
(OUT/'frontier.json').write_text(json.dumps(dict(source=source,rows=rows,counts=dict(native_result=2,unsupported=5),
    binary=dict(path=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),bytes=binary.stat().st_size),
    scope='Original full geometry, policies and independent assertions retained. All seven native frontier logs remain byte-identical; five remain unsupported. STEP completion is qualified separately in this increment.'),indent=2)+'\n')
