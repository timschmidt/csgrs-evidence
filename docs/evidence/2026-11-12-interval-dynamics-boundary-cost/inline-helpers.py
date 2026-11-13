from pathlib import Path
import subprocess
root=Path('/mnt/development/csgrs-dynamics-cost');out=Path('/tmp/interval-refactor/dynamics-cost')
p=root/'crates/hyperdynamics/src/jerk_schedule.rs';s=p.read_text()
for name in ['certify_jerk_ramp_span_candidate','certify_phase_length_sum','certify_phase_continuity','certify_monotonic_transition_construction','validate_proposal','validate_phase','require_positive_length']:
 assert s.count('\nfn '+name+'(')+s.count('\nfn '+name+'<')==1
 s=s.replace('\nfn '+name, '\n#[inline]\nfn '+name)
p.write_text(s)
p=root/'crates/hyperdynamics/src/guards.rs';s=p.read_text();s=s.replace('\npub fn ','\n#[inline]\npub fn ').replace('\npub(crate) fn ','\n#[inline]\npub(crate) fn ');p.write_text(s)
(out/'inline-helpers.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
