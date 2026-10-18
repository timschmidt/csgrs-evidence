"""Preserve all four preceding axial source-path STEP consumers."""
import hashlib,json,shutil,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ENV,hashes,run
OLD=OUT.parent/'2026-10-17-partial-prism'
source=hashes();inputs=json.loads((OLD/'consumer-final-inputs.json').read_text())
inputs[str(Path(__file__).resolve())]=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
assert run('previous-axial-build',['cargo','build','--offline','--locked','--release','--manifest-path','/tmp/hyperbrep-axial-consumer/Cargo.toml'],900)==0
binary=Path('/tmp/hyperbrep-spline-exchange-previous-axial');assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-axial-consumer',binary)
metadata=dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
rows=[]
for disjoint in ['false','true']:
 for reflected in ['false','true']:
  case=f'axial-disjoint-{disjoint}-reflected-{reflected}'
  assert run('previous-'+case,[str(binary),str(OUT/'previous-axial-exports'),disjoint,reflected],300)==0
  row=json.loads((OUT/'attempts.json').read_text())[-1]
  assert f'case={case} outcome=certified' in (OUT/row['log']).read_text()
  rows.append(row)
assert hashes()==source and all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
(OUT/'previous-axial-admission.json').write_text(json.dumps(dict(source=source,inputs=inputs,binary=metadata,rows=rows,complete_workflows=4),indent=2)+'\n')
