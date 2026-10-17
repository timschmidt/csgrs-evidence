"""Retain completed qualification; rerun only the corrected resource sampler."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

source=hashes()
read=lambda name:json.loads((OUT/name).read_text())
assert source==read('qualification-driver.json')['source']==read('continuation-admission.json')['source']
assert not read('qualification-driver.json')['failures']
correction=read('resource-harness-correction.json')
for key,hash_key in [('original_recipe','original_recipe_sha256'),('original_driver','original_driver_sha256')]:
    assert hashlib.sha256((OUT/correction[key]).read_bytes()).hexdigest()==correction[hash_key]
attempts=read('attempts.json')
latest={row['label']:row for row in attempts}
results=[]
for label,expected in [('continuation-driver',0),('cone-occt',0),('torus-occt',0),('occt-reader',0),
    ('inherited-scalar-default',101),('inherited-scalar-all-features',101)]:
    row=latest[label]
    assert row['exit_code']==expected and read(row['source'])==source
    results.append(dict(label=label,expected_exit=expected,actual_exit=row['exit_code'],log=row['log']))
failed=[latest['resources-baseline-0-Butt-reverse-false'],latest['resource-observations']]
assert [row['exit_code'] for row in failed]==[127,1]
assert '/usr/bin/time' in (OUT/failed[0]['log']).read_text()
assert 'No such file or directory' in (OUT/failed[0]['log']).read_text()
paths=[Path(__file__),*[OUT/'final-review'/name for name in [
    'resources.py','resources-v1.py','measure.py','supplement.py','continuation.py',
    'occt_cones.py','torus_occt.py','occt_read.py']]]
digests=lambda:{str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in paths}
inputs=digests()
code=run('resource-observations',['python3',str(OUT/'final-review/resources.py')],900)
assert code==0 and hashes()==source and digests()==inputs
row=read('attempts.json')[-1]
results.append(dict(label=row['label'],expected_exit=0,actual_exit=code,log=row['log']))
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
    complete=True,tooling_failures_preserved=failed,correction='resource-harness-correction.json',
    scope='The original supplemental driver stopped on missing /usr/bin/time before sampling. Its successful source-bound checks remain admitted; only the corrected sampler was rerun. Inherited scalar failures and unsupported consumer cases remain failed.'),indent=2)+'\n')
print('Supplement complete; all failed sampling attempts preserved.',flush=True)
