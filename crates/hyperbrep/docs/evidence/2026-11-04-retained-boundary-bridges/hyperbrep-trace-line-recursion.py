from pathlib import Path
import subprocess
p=Path('crates/hypercurve/src/curve_evaluation.rs');s=p.read_text()
anchor='    validate_rational_point(source, parameter, family, policy)?;\n    // A parameter-preserving line certificate'
diagnostic='''    thread_local! { static REPLAY_DEPTH: std::cell::Cell<usize> = const { std::cell::Cell::new(0) }; }
    struct ReplayGuard;
    impl Drop for ReplayGuard { fn drop(&mut self) { REPLAY_DEPTH.with(|d| d.set(d.get()-1)); } }
    REPLAY_DEPTH.with(|d| { d.set(d.get()+1); if d.get()>8 { panic!("RATIONAL RECURSION {}", std::backtrace::Backtrace::force_capture()); } });
    let _replay_guard = ReplayGuard;
'''
assert anchor in s
try:
 p.write_text(s.replace(anchor,diagnostic+anchor))
 with Path('/tmp/hyperbrep-line-replay-recursion.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hypercurve','--all-features','--test','polynomial_rational_sections','rational_overlaps_keep_selected_trims_across_policies','--','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print(r.returncode)
finally:p.write_text(s)
