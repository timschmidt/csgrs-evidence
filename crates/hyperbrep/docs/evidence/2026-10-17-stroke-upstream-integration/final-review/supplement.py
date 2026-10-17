"""Execute preserved continuation and optional oracles after qualification."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

source = hashes()
recipes = [Path(__file__),*[OUT/'final-review'/p for p in [
    'continuation.py','occt_cones.py','torus_occt.py','occt_read.py','resources.py']]]
digests = lambda: {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in recipes}
inputs = digests()
assert not json.loads((OUT/'qualification-driver.json').read_text())['failures']
commands = [
    ('continuation-driver',['python3',str(OUT/'final-review/continuation.py')],3600,0),
    ('cone-occt',['python3',str(OUT/'final-review/occt_cones.py'),'cone-exports'],600,0),
    ('torus-occt',['python3',str(OUT/'final-review/torus_occt.py')],600,0),
    ('occt-reader',['python3',str(OUT/'final-review/occt_read.py')],600,0),
]
for features,label in [([], 'inherited-scalar-default'),(['--all-features'],'inherited-scalar-all-features')]:
    commands.append((label,['cargo','test','--offline','--locked','-p','hyperreal',*features,
        '--test','determinant_product_cancellation','other_arities_keep_their_mathematical_values','--','--exact'],600,101))
commands.append(('resource-observations',['python3',str(OUT/'final-review/resources.py')],900,0))
results=[]
for label,command,seconds,expected in commands:
    code = run(label,command,seconds)
    assert hashes()==source and digests()==inputs
    row = json.loads((OUT/'attempts.json').read_text())[-1]
    results.append(dict(label=label,expected_exit=expected,actual_exit=code,log=row['log']))
    if label.startswith('inherited-scalar'):
        assert 'FACTORS > 0' in (OUT/row['log']).read_text()
    assert code == expected, results[-1]
old=OUT.parent/'2026-10-17-cone-exchange'
artifacts=[]
for earlier in sorted((old/'cone-exports').glob('*.step')):
    current=OUT/'cone-exports'/earlier.name
    assert current.read_bytes()==earlier.read_bytes()
    artifacts.append(dict(path=str(current.relative_to(OUT)),bytes=current.stat().st_size,
        sha256=hashlib.sha256(current.read_bytes()).hexdigest(),baseline=str(earlier.relative_to(ROOT))))
assert len(artifacts)==10
(OUT/'preserved-cone-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
(OUT/'supplement-driver.json').write_text(json.dumps(dict(source=source,inputs=inputs,results=results,
    complete=True,scope='Preserved diagnostics and exact artifacts, independent floating-point readers, reproduced inherited failures, and separate resource observations. Inherited scalar failures remain failed.'),indent=2)+'\n')
print('Preserved ten cone STEP artifacts; supplemental checks complete.',flush=True)
