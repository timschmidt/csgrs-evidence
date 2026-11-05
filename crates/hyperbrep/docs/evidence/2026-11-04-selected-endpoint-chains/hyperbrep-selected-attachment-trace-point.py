from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/topology/records.rs');s=p.read_text()
a='    pub(crate) fn represented_point(&self) -> Result<&Point3, GeometryError> {\n        self.point'
b='    pub(crate) fn represented_point(&self) -> Result<&Point3, GeometryError> {\n        if self.point.try_coordinates().is_none() {\n            eprintln!("SELECTED VERTEX COORDINATES\\n{}", std::backtrace::Backtrace::force_capture());\n        }\n        self.point'
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-attachment-point-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print(r.returncode)
finally:p.write_text(s)
