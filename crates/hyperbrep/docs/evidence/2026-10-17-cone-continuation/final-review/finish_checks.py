"""Continue after qualification: complete diagnostics, then isolated costs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import ENV,OUT,ROOT,hashes,run

source=hashes(); recipe=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
helpers=json.loads((OUT.parent/'2026-10-17-curved-continuation/benchmark-helpers.json').read_text())['files']
def check_helpers():
    assert all(hashlib.sha256((ROOT/path).read_bytes()).hexdigest()==expected for path,expected in helpers.items())
check_helpers()
drivers=json.loads((OUT/'qualification-drivers.json').read_text())
assert drivers and set(drivers[-1]['failures']) == {'inherited-zero-factor-default','inherited-zero-factor-all-features'}
subprocess.run(['python3',str(OUT/'final-review/continuation.py')],cwd=ROOT,env=ENV,check=True)
assert hashes()==source
subprocess.run(['python3',str(OUT/'build_benchmarks.py'),'candidate'],cwd=ROOT,env=ENV,check=True)
assert hashes()==source
assert run('benchmarks',['python3',str(OUT/'benchmark.py'),'--name','benchmark-v1'],7200)==0
check_helpers()
assert run('dependency-costs',['python3',str(OUT/'analysis-recipes/dependency_costs.py')],5400)==0
check_helpers()
assert hashes()==source and hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
(OUT/'finish-checks-driver.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,passed=True,
    scope='No tests or compilation from this task run concurrently with a timed campaign. Inherited zero-factor failures remain explicitly excluded from passing owner-wide claims.'),indent=2)+'\n')
