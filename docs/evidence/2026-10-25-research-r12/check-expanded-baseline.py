from pathlib import Path
import subprocess,os,time,json
p=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-research-baseline-3cca6a8')
f=root/'crates/hypercurve/src/bezier_region/offset_joins.rs';candidate=f.read_bytes()
try:
 f.write_bytes(Path('/home/tim/Documents/GitHub/workspace/csgrs/crates/hypercurve/src/bezier_region/offset_joins.rs').read_bytes())
 cmd=['cargo','test','--offline','--locked','--release','-p','hypercurve','--lib','r12_parallel_vector_opposition_preserves_ordered_signs_and_policy','--','--nocapture']
 start=time.time()
 with (p/'ordered-expanded-baseline.log').open('w') as out:r=subprocess.run(cmd,cwd=root,env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-check')),stdout=out,stderr=subprocess.STDOUT,timeout=600)
 (p/'ordered-expanded-baseline.json').write_text(json.dumps({'command':cmd,'code':r.returncode,'seconds':time.time()-start},indent=2)+'\n')
 print('expanded baseline',r.returncode,flush=True)
finally:f.write_bytes(candidate)
