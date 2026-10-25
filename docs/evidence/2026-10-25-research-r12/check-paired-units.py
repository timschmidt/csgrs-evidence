from pathlib import Path
import subprocess,os,time,json
p=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-research-baseline-3cca6a8')
f=root/'crates/hypercurve/src/bezier_region/offset_joins.rs';candidate=f.read_bytes()
tests=['r12_parallel_vector_opposition_preserves_ordered_signs_and_policy','joint_tangent_query_preserves_cross_only_certainty','ordered_tangent_families_preserve_opposition_frontier']
try:
 for variant in ['baseline','candidate']:
  f.write_bytes(Path('/home/tim/Documents/GitHub/workspace/csgrs/crates/hypercurve/src/bezier_region/offset_joins.rs').read_bytes() if variant=='baseline' else candidate)
  for test in tests:
   cmd=['cargo','test','--offline','--locked','--release','-p','hypercurve','--lib',test,'--','--nocapture']
   start=time.time();log=p/(variant+'-'+test+'.log')
   with log.open('w') as out:r=subprocess.run(cmd,cwd=root,env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-check')),stdout=out,stderr=subprocess.STDOUT,timeout=600)
   (p/(variant+'-'+test+'.json')).write_text(json.dumps({'command':cmd,'code':r.returncode,'seconds':time.time()-start},indent=2)+'\n')
   print(variant,test,r.returncode,flush=True)
   if r.returncode:raise SystemExit(r.returncode)
 a=[x for x in (p/('baseline-'+tests[-1]+'.log')).read_text().splitlines() if x.startswith('R12_MATRIX ')]
 b=[x for x in (p/('candidate-'+tests[-1]+'.log')).read_text().splitlines() if x.startswith('R12_MATRIX ')]
 assert len(a)==len(b)==1152 and a==b
 print('All 1152 ordered-family outcomes and certainty receipts identical',flush=True)
finally:f.write_bytes(candidate)
