import os, subprocess, time, json, sys
from pathlib import Path
stage=Path(__file__).parent
name=sys.argv[1]
cmd=sys.argv[2:]
env=os.environ.copy()
env['CARGO_BUILD_JOBS']='12'
env['CARGO_TARGET_DIR']='/mnt/development/.interval-refactor-build/lattice-facts-'+ ('msrv' if '+1.95.0' in cmd else 'native')
start=time.monotonic()
with (stage/(name+'.log')).open('w') as f:
    r=subprocess.run(cmd,env=env,stdout=f,stderr=subprocess.STDOUT)
record={'command':cmd,'cwd':os.getcwd(),'exit_code':r.returncode,'seconds':time.monotonic()-start}
(stage/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record))
if r.returncode: print((stage/(name+'.log')).read_text()[-10000:])
sys.exit(r.returncode)
