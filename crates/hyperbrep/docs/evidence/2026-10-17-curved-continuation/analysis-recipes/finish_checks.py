"""Continue after qualification: complete diagnostics, then isolated costs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import ENV,OUT,ROOT,hashes,run

source=hashes(); recipe=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
helpers=json.loads((OUT/'benchmark-helpers.json').read_text())['files']
def check_helpers():
    assert all(hashlib.sha256((ROOT/path).read_bytes()).hexdigest()==expected for path,expected in helpers.items())
check_helpers()
drivers=json.loads((OUT/'qualification-drivers.json').read_text())
assert drivers and not drivers[-1]['failures']
for features,name in [(['--all-features'],'all-features'),(['--no-default-features'],'minimal')]:
    assert run('congruence-debug-'+name,['cargo','test','--offline','--locked','-p','hyperreal',*features,'--lib','ring_trig_congruence_tests','--no-fail-fast'],600)==0
for features,name in [([], 'default'),(['--all-features'],'all-features')]:
    # Preserve the inherited external-owner failure; never amend its assertion
    # or count it as successful qualification of the scalar crate as a whole.
    assert run('inherited-zero-factor-'+name,['cargo','test','--offline','--locked','-p','hyperreal',*features,'--test','determinant_product_cancellation','other_arities_keep_their_mathematical_values','--','--exact'],600)==101
subprocess.run(['python3',str(Path(__file__).with_name('continuation.py'))],cwd=ROOT,env=ENV,check=True)
assert hashes()==source
subprocess.run(['python3',str(OUT/'build_benchmarks.py'),'candidate'],cwd=ROOT,env=ENV,check=True)
assert hashes()==source
assert run('benchmarks',['python3',str(OUT/'benchmark.py'),'--name','benchmark-v1'],7200)==0
check_helpers()
assert run('dependency-costs',['python3',str(Path(__file__).with_name('dependency_costs.py'))],5400)==0
check_helpers()
assert hashes()==source and hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
(OUT/'finish-checks-driver.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,passed=True,
    scope='No tests or compilation from this task run concurrently with a timed campaign. Inherited zero-factor failures remain explicitly excluded from passing owner-wide claims.'),indent=2)+'\n')
