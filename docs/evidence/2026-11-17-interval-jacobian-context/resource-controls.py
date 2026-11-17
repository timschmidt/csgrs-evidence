from pathlib import Path
import json, os, subprocess, time

s=Path(__file__).parent
r=Path('/mnt/development/interval-jacobian-context/csgrs')
candidate=json.loads((s/'candidate-snapshot.json').read_text())['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
assert json.loads((s/'unit-1.95.0-fmt.json').read_text())['exit_code']==0
assert json.loads((s/'unit-stable-clippy.json').read_text())['exit_code']==0
assert json.loads((s/'candidate-trace-resource-build.json').read_text())['functional']
cmd=['cargo','+1.95.0','clippy','--release','--locked','--offline','--all-features','--all-targets','--','-D','warnings']
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/alpha-proof-stack','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
start=time.monotonic()
with (s/'resource-clippy.log').open('w') as log:
    p=subprocess.run(cmd,cwd=s/'resource-harness',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800)
(s/'resource-clippy.json').write_text(json.dumps({'command':cmd,'exit_code':p.returncode,'elapsed':time.monotonic()-start,'environment':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']}},indent=2)+'\n')
assert p.returncode==0
rows=[]
try:
    subprocess.run(['git','switch','--detach','557a349f930b1fde1fcaa6e6d47a10cb661415fb'],cwd=r,check=True)
    for feature in ['default','trace']:
        start=time.monotonic()
        p=subprocess.run(['python3',str(s/'build-resource.py'),'baseline',feature],timeout=1800)
        rows.append({'feature':feature,'exit_code':p.returncode,'elapsed':time.monotonic()-start})
        (s/'resource-controls.json').write_text(json.dumps(rows,indent=2)+'\n')
        assert p.returncode==0
finally:
    subprocess.run(['git','switch','--detach',candidate],cwd=r,check=True)
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
(s/'resource-restoration.json').write_text(json.dumps({'candidate':candidate,'clean':True,'source_restored':True},indent=2)+'\n')
print('Matched baseline resource builds complete; clean candidate restored.',flush=True)
