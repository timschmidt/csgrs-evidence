from pathlib import Path
import subprocess,os,json,time,sys,hashlib
s=Path(__file__).parent
r=Path('/mnt/development/csgrs-surface-interval-ranges')
label,*cmd=sys.argv[1:]
assert cmd and not (s/f'{label}.json').exists()
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/surface-interval-ranges','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()
patch=subprocess.check_output(['git','diff','HEAD','--binary'],cwd=r)
t=time.monotonic()
with (s/f'{label}.log').open('xb') as out:
 p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
record={'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-t,'head':head,'tracked_patch_sha256':hashlib.sha256(patch).hexdigest()}
(s/f'{label}.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record))
print((s/f'{label}.log').read_text()[-4000:])
sys.exit(p.returncode)
