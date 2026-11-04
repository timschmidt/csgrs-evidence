from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/boolean_kernel.rs');s=p.read_text()
a='''            for reverse in [false, true] {
                if restricted_domain.try_real_endpoints().is_some()'''
b='''            if same || reversed {
                eprintln!("MATCH MISS source={:?} first={} kind={:?} candidate={:?} kind={:?} same={} reversed={} domains_selected={}/{}",source_edge_id,is_first,restricted_curve.kind(),candidate.id,candidate.curve.kind(),same,reversed,restricted_domain.try_real_endpoints().is_none(),candidate.domain.try_real_endpoints().is_none());
                if let (Curve3ExactData::Line(a),Curve3ExactData::Line(b))=(restricted_curve.exact_data(),candidate.curve.exact_data()) {
                    eprintln!("NATIVE SUPPORTS {:?} {:?} / {:?} {:?}",a.start,a.end,b.start,b.end);
                }
            }
            for reverse in [false, true] {
                if restricted_domain.try_real_endpoints().is_some()'''
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-stitching-match-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print(r.returncode)
finally:p.write_text(s)
