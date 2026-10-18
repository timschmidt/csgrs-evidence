import hashlib,json,shutil,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ENV,hashes,run
source=hashes();p=Path('/tmp/hyperbrep-selected-procedural-v1-consumer-final');assert not p.exists();shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-axial-shell-consumer',p)
metadata=dict(path=str(p),bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
(OUT/'consumer-binary.json').write_text(json.dumps(metadata,indent=2)+'\n')
for kind in range(4):
 for reflected in ['false','true']:
  assert run(f'consumer-{kind}-{reflected}',[str(p),str(OUT/'final-artifacts'),str(kind),reflected],600)==0
assert hashes()==source
(OUT/'consumer-admission.json').write_text(json.dumps(dict(source=source,binary=metadata,complete_workflows=8,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
