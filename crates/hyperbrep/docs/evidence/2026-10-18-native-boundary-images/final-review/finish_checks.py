"""Freeze the qualified WASM and consume the complete old and new domains."""
import hashlib,json,shutil,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
read=lambda n:json.loads((OUT/n).read_text())
source=hashes();q=read('qualification-driver.json')
assert q['source']==source and not q['failures'] and 'diff-check' in q['executed']
latest={r['label']:r for r in read('attempts.json')}
wasm=Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_axial_shell_wasm_probe.wasm'
expected=json.loads((OUT/latest['wasm-runtime']['log']).read_text());assert expected['probe_groups']==138 and expected['imports']==0
assert hashlib.sha256(wasm.read_bytes()).hexdigest()==expected['wasm_sha256']
binary=Path('/tmp/hyperbrep-native-images-final.wasm');assert not binary.exists();shutil.copy2(wasm,binary)
(OUT/'wasm-binary.json').write_text(json.dumps(dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest()),indent=2)+'\n')
recipes=['finish_checks','consumer','previous_axial','components','old_path','continuation','prism_occt','axial_shell_occt','previous_axial_occt','components_occt','occt_cones','torus_occt','occt_read']
inputs={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [OUT/'final-review'/(name+'.py') for name in recipes]}
for script in ['consumer','previous_axial','components','old_path','continuation']:
 subprocess.run(['python3',str(OUT/'final-review'/(script+'.py'))],cwd=ROOT,env=ENV,check=True)
for name in ['axial_shell_occt','previous_axial_occt','components_occt','occt_cones','torus_occt','occt_read']:
 args=[str(OUT/'cone-exports'),str(OUT/'cone-occt.json')] if name=='occt_cones' else []
 assert run(name.replace('_','-'),['python3',str(OUT/'final-review'/(name+'.py')),*args],300)==0
assert hashes()==source and all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
(OUT/'finish-checks.json').write_text(json.dumps(dict(passed=True,source=source,inputs=inputs),indent=2)+'\n')
