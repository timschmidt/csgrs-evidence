from pathlib import Path
import subprocess,os,time,json
p=Path(__file__).resolve().parent
cmd=['cargo','test','--offline','--locked','--release','-p','hypercurve','--lib','r12_parallel_vector_opposition_preserves_ordered_signs_and_policy','--','--nocapture']
env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-check'))
start=time.time()
with (p/'ordered-expanded-candidate.log').open('w') as f:r=subprocess.run(cmd,cwd='/tmp/csgrs-research-baseline-3cca6a8',env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600)
(p/'ordered-expanded-candidate.json').write_text(json.dumps({'command':cmd,'code':r.returncode,'seconds':time.time()-start},indent=2)+'\n')
print('expanded ordered-pair candidate',r.returncode,flush=True)
