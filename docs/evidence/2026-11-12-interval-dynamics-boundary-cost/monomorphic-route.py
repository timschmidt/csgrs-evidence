from pathlib import Path
import subprocess,re
root=Path('/mnt/development/csgrs-dynamics-cost');out=Path('/tmp/interval-refactor/dynamics-cost')
# Reset only the two files changed by the rejected experiment, to this isolated
# checkout's staged and hash-verified combined candidate.
for name in ['jerk_schedule.rs','guards.rs']:
 p=root/'crates/hyperdynamics/src'/name;p.write_bytes(subprocess.check_output(['git','show',':crates/hyperdynamics/src/'+name],cwd=root))
p=root/'crates/hyperdynamics/src/jerk_schedule.rs';s=p.read_text()
for public,private,source in [
 ('plan_monotonic_jerk_transition','plan_single_span_transition','element'),
 ('certify_jerk_ramp_feed_schedule','certify_span_schedule','route'),
 ('certify_multi_phase_jerk_ramp_feed_schedule','certify_phase_schedule','route')]:
 start=s.index('pub fn '+public+'<');stop=s.index(' {',start);signature=s[start:stop]
 args=re.findall(r'^    (\w+):',signature,re.M)
 route='std::slice::from_ref(element)' if source=='element' else 'route'
 wrapper=signature+' {\n    '+private+'(&SliceRoute('+route+'), '+', '.join(args[1:])+')\n}\n\n'
 core=signature.replace('pub fn '+public+'<S: MetricSpan>','fn '+private).replace('element: &S','route: &dyn MetricRoute').replace('route: &[S]','route: &dyn MetricRoute')
 s=s[:start]+wrapper+core+s[stop:]
s=s.replace('let path_length = element.exact_length(policy)?;', 'let path_length = route.exact_length(0, policy)?;',1)
s=s.replace('let mut report = certify_multi_phase_jerk_ramp_feed_schedule(\n        std::slice::from_ref(element),','let mut report = certify_phase_schedule(\n        route,',1)
s=s.replace('for (index, (element, proposal)) in route.iter().zip(proposals).enumerate() {','for (index, proposal) in proposals.iter().enumerate() {')
s=s.replace('let path_length = element.exact_length(policy)?;', 'let path_length = route.exact_length(index, policy)?;')
s=s.replace('for (index, (element, element_phases)) in route.iter().zip(phases).enumerate() {','for (index, element_phases) in phases.iter().enumerate() {')
s=s.replace('let route_length = element.exact_length(policy)?;', 'let route_length = route.exact_length(index, policy)?;')
anchor='/// Exact constant-jerk proposal for one retained path span.'
adapter='''// Only these private slice adapters implement the route protocol. Schedule
// shape checks precede indexing; every query retains the caller's policy and
// exact position in the original validation/replay sequence. Keeping this
// adapter small avoids duplicating the scheduling body for every metric owner.
trait MetricRoute {
    fn len(&self) -> usize;
    fn exact_length(&self, index: usize, policy: PredicatePolicy) -> Result<Real, DynamicsError>;
    fn is_empty(&self) -> bool { self.len() == 0 }
}

struct SliceRoute<'a, S>(&'a [S]);

impl<S: MetricSpan> MetricRoute for SliceRoute<'_, S> {
    fn len(&self) -> usize { self.0.len() }
    fn exact_length(&self, index: usize, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        self.0[index].exact_length(policy)
    }
}

'''
s=s.replace(anchor,adapter+anchor,1);p.write_text(s)
subprocess.run(['rustup','run','1.95.0','rustfmt','--edition','2024','--config-path',str(root/'crates/.rustfmt.toml'),str(p)],check=True)
(out/'monomorphic-route.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
