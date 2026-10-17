"""Inspect the current continuation failure without replacing its full tests."""
import hashlib,json,shutil
from pathlib import Path
from check import OUT,ENV,run,hashes
binary=Path('/tmp/hyperbrep-axial-shell-diagnostic-v1');assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/axial_shell_diagnostic',binary)
(OUT/'diagnostic-v1-binary.json').write_text(json.dumps(dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),source=hashes()),indent=2)+'\n')
for kind,stage,mode in [(2,'recut','identity'),(2,'union','identity'),(2,'recut','rotated'),(2,'union','rotated'),(2,'recut','reflected'),(3,'recut','identity'),(3,'recut','rotated')]:
 assert run(f'diagnostic-v1-{kind}-{stage}-{mode}',[str(binary),str(kind),stage,mode],240)==0
