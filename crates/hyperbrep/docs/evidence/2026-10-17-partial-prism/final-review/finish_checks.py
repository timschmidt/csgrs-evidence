"""Materialize complete consumers and preserve the original diagnostic corpus."""
import hashlib,json,shutil,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
read=lambda n:json.loads((OUT/n).read_text())
source=hashes();assert read('qualification-driver.json')['source']==source and not read('qualification-driver.json')['failures']
latest={r['label']:r for r in read('attempts.json')}
wasm=Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_partial_prism_wasm_probe.wasm'
expected=json.loads((OUT/latest['wasm-runtime']['log']).read_text());assert expected['probe_groups']==127 and expected['imports']==0
assert hashlib.sha256(wasm.read_bytes()).hexdigest()==expected['wasm_sha256']
def freeze(path,target):
 target=Path('/tmp')/target;assert not target.exists();shutil.copy2(path,target)
 return dict(path=str(target),bytes=target.stat().st_size,sha256=hashlib.sha256(target.read_bytes()).hexdigest())
(OUT/'wasm-binary.json').write_text(json.dumps(freeze(wasm,'hyperbrep-axial-final.wasm'),indent=2)+'\n')
items=[json.loads(line) for line in (OUT/latest['axial-benchmark-build']['log']).read_text().splitlines() if line.startswith('{')]
item=next(x for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']=='axial_exchange' and x.get('executable'))
metadata=freeze(item['executable'],'hyperbrep-axial-exchange-benchmark');metadata['features']=item['features']
(OUT/'axial-benchmark-binary.json').write_text(json.dumps(metadata,indent=2)+'\n')
for script,args in [('run_consumer.py',['final']),('components.py',[]),('old_path.py',[]),('continuation.py',[])]:
 subprocess.run(['python3',str(OUT/'final-review'/script),*args],cwd=ROOT,env=ENV,check=True)
for name in ['axial_occt','components_occt','occt_cones','torus_occt','occt_read']:
 args=[]
 if name=='occt_cones':args=[str(OUT/'cone-exports'),str(OUT/'cone-occt.json')]
 assert run(name.replace('_','-'),['python3',str(OUT/'final-review'/(name+'.py')),*args],300)==0
assert hashes()==source
(OUT/'finish-checks.json').write_text(json.dumps(dict(passed=True,source=source,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
