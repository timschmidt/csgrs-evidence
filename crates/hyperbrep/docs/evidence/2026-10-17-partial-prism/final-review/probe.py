"""Freeze and run every partial-slab diagnostic; retain failures individually."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

phase=sys.argv[1];assert phase.isalnum()
source=hashes()
binary=Path('/tmp')/f'hyperbrep-partial-prism-{phase}-graph'
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/graph',binary)
metadata=dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
rows=[]
for slab in ['cover','tiny_upper_gap','tiny_lower_gap','interior','touch','disjoint']:
    code=run(f'{phase}-graph-{slab}',[str(binary),slab],300)
    rows.append(dict(slab=slab,exit_code=code,command=json.loads((OUT/'attempts.json').read_text())[-1]))
assert hashes()==source
(OUT/(phase+'-graph.json')).write_text(json.dumps(dict(source=source,binary=metadata,rows=rows,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),scope='Stage diagnostics; only explicit completed modeling assertions establish capability.'),indent=2)+'\n')
