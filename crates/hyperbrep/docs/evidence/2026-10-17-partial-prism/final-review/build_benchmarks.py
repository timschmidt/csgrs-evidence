"""Freeze matched complete-work corpus executables before production edits."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

phase=sys.argv[1]
assert phase.isalnum()
names=['export','faceted','advanced','circles','pcurves','analytic_export','kernel','closed_edges',
    'arc','edge_images','analytic_similarity','seam_cuts','coplanar','sectors','oblique','prisms',
    'prism_exchange','torus_exchange','cone_exchange','region_exchange']
command=['cargo','build','--offline','--locked','--release','--no-default-features',
    '--features','csgrs/curve,hyperreal/serde','-p','csgrs','-p','hypermesh','-p','hyperreal',
    '-p','hyperbrep','-p','hyperbrep-io','-p','hypercurve']
for name in names:command+=['--bench',name]
command+=['--message-format=json']
source=hashes()
assert run(phase+'-benchmark-build',command,1800)==0
attempt=json.loads((OUT/'attempts.json').read_text())[-1]
binaries={}
for line in (OUT/attempt['log']).read_text().splitlines():
    if not line.startswith('{'):continue
    item=json.loads(line)
    if item.get('reason')!='compiler-artifact' or item['target']['kind']!=['bench']:continue
    name=item['target']['name']
    path=Path('/tmp')/f'hyperbrep-partial-prism-{phase}-{name}'
    assert not path.exists()
    shutil.copy2(item['executable'],path)
    binaries[name]=dict(path=str(path),bytes=path.stat().st_size,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),features=item['features'])
assert set(binaries)==set(names) and hashes()==source
(OUT/(phase+'-benchmark-binaries.json')).write_text(json.dumps(dict(source=source,build=attempt,
    executables=binaries,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
print('Frozen',phase,len(binaries),'complete benchmark corpora.',flush=True)
