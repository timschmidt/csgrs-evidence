from pathlib import Path
import hashlib
import json
import os
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r19-trace')
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
record = raw / ('regression-' + variant + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
sources = ['crates/hyperreal/src/computable/node/representation.rs',
           'crates/hyperreal/tests/serde_cotangent_continuation.rs']
before = {n: hashlib.sha256((root/n).read_bytes()).hexdigest() for n in sources}
for n in sources:
    (record/Path(n).name).write_bytes((root/n).read_bytes())
(record/'sources.json').write_text(json.dumps(before,indent=2)+'\n')
env=os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='')
command=['cargo','test','--locked','--offline','--release','-p','hyperreal','--features','serde,cached-f64-approx','--test','serde_cotangent_continuation','--','--test-threads=1']
start=time.monotonic()
with (record/'test.log').open('w') as out:
    proc=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=900)
log=(record/'test.log').read_text()
assert before=={n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in sources}
result={'record':str(record),'status':proc.returncode,'command':command,'seconds':time.monotonic()-start,
        'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_PROFILE_RELEASE_DEBUG','RUSTFLAGS']},
        'failure_kind':None}
if variant=='baseline' and proc.returncode==101 and 'UnknownCertificate' in log and 'test result: FAILED. 0 passed; 1 failed;' in log:
    result['failure_kind']='reproduced UnknownCertificate'
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/('latest-regression-'+variant+'.json')).write_text(json.dumps(result,indent=2)+'\n')
print('R19 REGRESSION',variant,result['status'],result['failure_kind'],record,flush=True)
if variant=='baseline':
    assert result['failure_kind']=='reproduced UnknownCertificate',record
else:
    assert proc.returncode==0,record
