from pathlib import Path
import subprocess
files={p:p.read_bytes() for p in Path('crates/hyperbrep/src').rglob('*.rs') if 'UnsupportedSelectedEvaluation' in p.read_text()}
patch=[]
try:
 for p,raw in files.items():
  s=raw.decode()
  diagnostic='{ eprintln!("SELECTED STOP {}:{}\\n{}", file!(), line!(), std::backtrace::Backtrace::force_capture()); GeometryError::UnsupportedSelectedEvaluation }'
  s=s.replace('.ok_or(GeometryError::UnsupportedSelectedEvaluation)', '.ok_or_else(|| '+diagnostic+')')
  s=s.replace('return Err(GeometryError::UnsupportedSelectedEvaluation)', 'return Err('+diagnostic+')')
  if s!=raw.decode(): p.write_text(s);patch.append(str(p))
 Path('/tmp/hyperbrep-bridge-selected-trace.patch').write_bytes(subprocess.check_output(['git','diff','--',*patch]))
 with Path('/tmp/hyperbrep-bridge-selected-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print('trace exit',r.returncode,flush=True)
finally:
 for p,raw in files.items():p.write_bytes(raw)
