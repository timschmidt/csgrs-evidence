from pathlib import Path
import subprocess,os
p=Path('crates/hyperbrep/src/topology/validation/image.rs');s=p.read_text()
a='''            self.validate_edge_use_image(curve, edge, edge_use, pcurve, surface)?;'''
b='''            let result=self.validate_edge_use_image(curve, edge, edge_use, pcurve, surface);
            if result.is_err() {eprintln!("COLD IMAGE ERROR use={:?} edge={:?} curve={:?} pcurve={:?} surface={:?} direction={:?} map={:?} selected={} error={:?}",edge_use_id,edge_use.edge,curve.kind(),pcurve.kind(),surface.kind(),edge_use.direction,edge_use.parameter_correspondence,edge.domain.try_real_endpoints().is_none(),result);}
            result?;'''
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-stitching-cold-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,HYPERBREP_NONLINEAR_RECUT_REPLAY='/tmp/hyperbrep-selected-stitching-recut.json'))
 print(r.returncode)
finally:p.write_text(s)
