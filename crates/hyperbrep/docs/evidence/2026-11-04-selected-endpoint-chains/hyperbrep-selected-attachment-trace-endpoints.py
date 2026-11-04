from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/topology/edit/partition.rs');s=p.read_text();a='            let chains = closed_trace_chains(&ordered, &uncrossed)?;'
b=a+'''\n            if face_id.index()==3 && matches!(operand, SurfaceIntersectionOperand::Second) {
                let coords = |point: &GeometricPoint3| point.bounds().map(|b| ([b.mins.x.to_f64_lossy(), b.mins.y.to_f64_lossy(), b.mins.z.to_f64_lossy()], [b.maxs.x.to_f64_lossy(), b.maxs.y.to_f64_lossy(), b.maxs.z.to_f64_lossy()]));
                for (trace, parameters) in ordered.iter().zip(&split_parameters) {
                    eprintln!("EXACT TRACE source={} family={:?}", trace.source_index, trace.intersection.curve().kind());
                    for parameter in parameters { eprintln!("POINT ENCLOSURE {:?}", coords(&trace.intersection.curve().point_at(parameter)?)); }
                }
            }
'''
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-attachment-endpoint-trace2.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print('endpoint trace exit',r.returncode)
finally:p.write_text(s)
