from pathlib import Path
import subprocess,hashlib,json
record=Path(__file__).resolve().parent
module=r'''use std::sync::atomic::{AtomicU64,Ordering};
static COUNTS:[AtomicU64;3]=[const{AtomicU64::new(0)};3];
static NS:[AtomicU64;3]=[const{AtomicU64::new(0)};3];
pub(super) struct Guard{phase:usize,start:std::time::Instant}
impl Guard{pub(super) fn new(phase:usize)->Self{COUNTS[phase].fetch_add(1,Ordering::Relaxed);Self{phase,start:std::time::Instant::now()}}}
impl Drop for Guard{fn drop(&mut self){NS[self.phase].fetch_add(self.start.elapsed().as_nanos() as u64,Ordering::Relaxed);}}
pub(super) fn reset(){for x in COUNTS.iter().chain(NS.iter()){x.store(0,Ordering::Relaxed);}}
pub(super) fn report(leaf:&str){println!("R14_PHASE leaf={leaf} preparation_calls={} preparation_ns={} point_calls={} point_ns={} enclosure_calls={} enclosure_ns={}",COUNTS[0].load(Ordering::Relaxed),NS[0].load(Ordering::Relaxed),COUNTS[1].load(Ordering::Relaxed),NS[1].load(Ordering::Relaxed),COUNTS[2].load(Ordering::Relaxed),NS[2].load(Ordering::Relaxed));}
'''
for variant in ['baseline','candidate']:
 root=Path('/tmp/csgrs-r14-'+variant);p=root/'crates/hypercurve/src/bezier_parameter.rs';s=p.read_text();(record/(variant+'-before-phase.rs')).write_text(s)
 old='    let sign_at = |point: &Real| real_sign(&Real::eval_poly(defining, point), policy);';assert s.count(old)==1
 s=s.replace(old,'''    let sign_at = |point: &Real| {
        #[cfg(test)]
        let _timing = r14_phase_diagnostic::Guard::new(1);
        real_sign(&Real::eval_poly(defining, point), policy)
    };''')
 old='    let enclosure_sign = |lower: &Real, upper: &Real| -> CurveResult<Option<RealSign>> {';assert s.count(old)==1
 s=s.replace(old,old+'\n        #[cfg(test)]\n        let _timing = r14_phase_diagnostic::Guard::new(2);')
 old='    fn new(coefficients: &[Real], lower: &Real, upper: &Real) -> Option<Self> {' if variant=='baseline' else '    fn new(coefficients: &[Real]) -> Option<Self> {'
 assert s.count(old)==1;s=s.replace(old,old+'\n        #[cfg(test)]\n        let _timing = r14_phase_diagnostic::Guard::new(0);')
 marker='            let start = std::time::Instant::now();';assert s.count(marker)==1;s=s.replace(marker,'            r14_phase_diagnostic::reset();\n'+marker)
 marker='            assert_eq!(\n                actual,\n                if name == "leaf_0000.txt"';assert s.count(marker)==1;s=s.replace(marker,'            r14_phase_diagnostic::report(name);\n'+marker)
 s+='\n#[cfg(test)]\nmod r14_phase_diagnostic;\n';p.write_text(s)
 m=root/'crates/hypercurve/src/bezier_parameter/r14_phase_diagnostic.rs';m.write_text(module)
 subprocess.run(['rustfmt','--edition','2024',str(p),str(m)],check=True)
 patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(record/(variant+'-phase.patch')).write_bytes(patch)
(record/'phase-module.rs').write_text(module)
(record/'phase-sampling-contract.json').write_text(json.dumps({'purpose':'diagnose preparation share, not latency admission','variants':['baseline','candidate-v2'],'process_pairs':5,'order':'AB BA AB BA AB','outputs':'helper decisions and phase counts/times; no geometry claim','timeout_seconds':120,'overlapping_phases':'preparation is included in baseline enclosure; candidate preparation precedes enclosure','host_state':'primary correctness suite running concurrently; no performance acceptance claim permitted'},indent=2)+'\n')
print('Private phase instrumentation added; timing is diagnostic only.')
