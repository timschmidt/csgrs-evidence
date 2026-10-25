from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-research-baseline-3cca6a8')
env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-check'))
cmd=['cargo','clippy','--offline','--locked','--release','-p','hypercurve','--all-features','--lib','--','-D','warnings']
start=time.time()
with (p/'clean-clippy.log').open('w') as f: r=subprocess.run(cmd,cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600)
(p/'clean-clippy.json').write_text(json.dumps({'command':cmd,'code':r.returncode,'seconds':time.time()-start},indent=2)+'\n')
print('clean candidate Clippy',r.returncode,flush=True)
raise SystemExit(r.returncode)
