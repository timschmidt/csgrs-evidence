from pathlib import Path
import subprocess,os
p=Path('crates/hypercurve/src/curve_region_boolean.rs');s=p.read_text()
a='''    fn blocked_pair(&self, pair: &RegionCarrierPair, reason: UncertaintyReason) -> ExactCurveError {
'''
b=a+'''        eprintln!("LOOP PAIR BLOCK {} {} {:?} carriers={}", pair.first_carrier_index,pair.second_carrier_index,reason,self.data.carriers.len());
'''
try:
 assert a in s;p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-stitching-cold-loop-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,HYPERBREP_NONLINEAR_RECUT_REPLAY='/tmp/hyperbrep-selected-stitching-recut.json'))
 print(r.returncode)
finally:p.write_text(s)
