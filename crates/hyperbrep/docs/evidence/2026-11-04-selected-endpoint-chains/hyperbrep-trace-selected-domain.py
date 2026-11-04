from pathlib import Path
import subprocess
p=Path('crates/hypercurve/src/bezier_offset.rs');s=p.read_text();a='''        if axis != other.axis() {
            return Err(CurveError::Topology(
                "cannot compare parameters from distinct algebraic-chord domains".into(),'''
b='''        if axis != other.axis() {
            eprintln!("CHORD DOMAIN {:?} {:?}\\n{}", axis, other.axis(), std::backtrace::Backtrace::force_capture());
            return Err(CurveError::Topology(
                "cannot compare parameters from distinct algebraic-chord domains".into(),'''
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-attachment-domain-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--lib','geometry::tests::selected_pcurve_endpoints_attach_without_boundary_contact_records','--','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print(r.returncode)
finally:p.write_text(s)
