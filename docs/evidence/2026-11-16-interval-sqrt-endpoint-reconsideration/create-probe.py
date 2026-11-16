from pathlib import Path
import shutil
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');p=s/'sqrt-probe';(p/'src').mkdir(parents=True)
manifest=(s.with_name('sqrt-endpoint-migration')/'probe-Cargo.toml').read_text().replace('/mnt/development/csgrs-sqrt-endpoint-migration','/mnt/development/interval-profile-static/csgrs')
manifest+='\n[features]\ntrace = ["hypersolve/dispatch-trace"]\n'
(p/'Cargo.toml').write_text(manifest)
original=(s.with_name('sqrt-endpoint-migration')/'probe-src/main.rs').read_text();start=original.index('        let (lower, upper, precision)');end=original.index('        let result=')
fixture=original[start:end].replace('        let (lower, upper, precision) = match black_box(case) {','    match black_box(case) {');fixture=fixture.rstrip().removesuffix(';')
allocation=(root/'crates/hypersolve/examples/allocation_profile.rs').read_text();a=allocation.index('struct CountingAllocator;');b=allocation.index('fn measure<T>');allocation=allocation[a:b]
code='''use hyperreal::{Rational, Real};
use hypersolve::real_interval::RealInterval;
use std::hint::black_box;
use std::time::Instant;
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
'''+allocation+'''
fn fixture(case:usize)->(Real,Real,Option<i32>) {
'''+fixture+'''
}
fn main() {
    let timed=std::env::var_os("SQRT_TIMING").is_some();
    for case in 0..12 {
        let (lower,upper,precision)=fixture(case);
        let input=RealInterval{lower,upper};
        let operation=|| black_box(&input).nonnegative_square_root(black_box(precision));
        #[cfg(feature="trace")]
        { hyperreal::dispatch_trace::reset(); hyperreal::dispatch_trace::reset_rational_stats(); }
        #[cfg(feature="trace")]
        let result=hyperreal::dispatch_trace::with_recording(operation);
        #[cfg(not(feature="trace"))]
        let result=operation();
        #[cfg(feature="trace")]
        println!("TRACE {case} {:?}",hyperreal::dispatch_trace::take_trace());
        let output=result.as_ref().map(|r|(&r.lower,&r.upper));
        let orders=result.as_ref().map(|r|[hyperlimit::PredicatePolicy::STRICT,hyperlimit::PredicatePolicy::APPROXIMATE_512].map(|policy|format!("{:?}",hyperlimit::compare_reals(&r.lower,&r.upper,policy))));
        let squared=result.as_ref().map(|r|r.square());
        let squared_output=squared.as_ref().and_then(|r|r.as_ref().map(|r|(&r.lower,&r.upper)));
        println!("RESULT {}",serde_json::json!({"case":case,"output":output,"orders":orders,"squared":squared_output}));
        drop(squared);drop(result);
        for _ in 0..8 {drop(black_box(operation()));}
        let guard=CountingGuard::start();
        for _ in 0..16 {drop(black_box(operation()));}
        let stats=AllocationStats::snapshot();drop(guard);
        println!("ALLOC {case} {} {} {} {} {} {}",stats.allocations,stats.deallocations,stats.reallocations,stats.allocated_bytes,stats.peak_live_bytes,stats.live_bytes);
        if timed {
            let mut samples=Vec::new();
            for _ in 0..31 {
                let start=Instant::now();
                for _ in 0..128 {drop(black_box(operation()));}
                samples.push(start.elapsed().as_nanos() as f64 /128.0);
            }
            println!("TIMING {case} {samples:?}");
        }
    }
}
'''
(p/'src/main.rs').write_text(code)
