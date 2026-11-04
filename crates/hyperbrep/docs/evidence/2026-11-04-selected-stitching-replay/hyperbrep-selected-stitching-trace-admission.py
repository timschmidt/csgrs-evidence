from pathlib import Path
import subprocess,os
p=Path('crates/hyperbrep/src/topology/builder.rs');s=p.read_text()
t=s
for call in ['self.validate_wire_image(*wire, surface)','self.validate_wire_simplicity(*wire)','self.validate_wire_orientation(outer, orientation, true, surface)','self.validate_wire_nesting(outer, &inner)']:
 t=t.replace(call+'?;',call+'.map_err(|error| {eprintln!("ADMISSION '+call+' surface={:?} outer={:?} error={:?}",surface,outer,error); error})?;')
try:
 p.write_text(t)
 with Path('/tmp/hyperbrep-selected-stitching-cold-admission-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,HYPERBREP_NONLINEAR_RECUT_REPLAY='/tmp/hyperbrep-selected-stitching-recut.json'))
 print(r.returncode)
finally:p.write_text(s)
