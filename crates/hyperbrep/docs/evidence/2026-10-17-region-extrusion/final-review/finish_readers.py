"""Complete readers after preserving the first driver's missing cone argument."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes, run

source=hashes()
assert json.loads((OUT/'continuation-admission.json').read_text())['passed']
for name,args in [('occt_cones',['cone-exports']),('torus_occt',[]),('occt_read',[]),('components_occt',[])]:
    assert run(name.replace('_','-'),['python3',str(OUT/'final-review'/(name+'.py')),*args],300)==0
assert run('components-clippy',['cargo','clippy','--offline','--locked','--manifest-path',
    '/tmp/hyperbrep-region-components-probe/Cargo.toml','--','-D','warnings'],900)==0
assert hashes()==source
(OUT/'finish-checks.json').write_text(json.dumps(dict(passed=True,source=source,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    preceding_recipe_sha256=hashlib.sha256((OUT/'final-review/finish_checks.py').read_bytes()).hexdigest(),
    tooling_failure='occt-cones-1.log: original driver omitted the required cone-exports argument; no input was read. Original recipe and failure retained. Corrected invocation only; reader assertions and artifacts unchanged.'),indent=2)+'\n')
