from pathlib import Path
import hashlib
import json
import os
import resource
import shutil
import signal
import subprocess
import sys
import time

raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r19-trace')
variant=sys.argv[1];assert variant in ['laurent','structural']
record=raw/('resource-probe-'+variant+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
for name in ['representation.rs','imported_domain_tests.rs']:
    (record/name).write_bytes((root/'crates/hyperreal/src/computable/node'/name).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='')
command=['cargo','test','--locked','--offline','--release','-p','hyperreal','--features','serde,cached-f64-approx','--lib','--no-run','--message-format=json']
with (record/'build.stdout').open('w') as out,(record/'build.stderr').open('w') as err:
    proc=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=err,timeout=900)
assert proc.returncode==0,record
artifacts=[r for line in (record/'build.stdout').read_text().splitlines() if (r:=json.loads(line)).get('reason')=='compiler-artifact' and r.get('executable')]
assert len(artifacts)==1
binary=record/'test-binary';shutil.copy2(artifacts[0]['executable'],binary)
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(512*1024**2,512*1024**2))
    resource.setrlimit(resource.RLIMIT_FSIZE,(16*1024**2,16*1024**2))
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
run=['/usr/bin/time','-v',str(binary),'computable::node::imported_domain_tests::affine_pi_replay_handles_extreme_argument_shifts_without_expansion','--exact','--nocapture','--test-threads=1']
start=time.monotonic()
with (record/'run.stdout').open('w') as out,(record/'run.stderr').open('w') as err:
    p=subprocess.Popen(run,cwd=root,stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
    try:status=p.wait(timeout=30)
    except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
result={'record':str(record),'variant':variant,'build_command':command,'run_command':run,'status':status,
        'seconds':time.monotonic()-start,'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
        'runtime_sha256':hashlib.sha256((record/'representation.rs').read_bytes()).hexdigest(),
        'containment':'30s/512MiB address space/16MiB output/no core dumps; exact one valid-argument helper test, not the full import pipeline.'}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/f'latest-resource-probe-{variant}.json').write_text(json.dumps(result,indent=2)+'\n')
print('R19 RESOURCE PROBE',variant,status,record,flush=True)
