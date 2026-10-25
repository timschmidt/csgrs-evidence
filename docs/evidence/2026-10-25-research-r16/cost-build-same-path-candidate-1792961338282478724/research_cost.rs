use std::sync::atomic::{AtomicUsize, Ordering as AtomicOrdering};
static R16_LIVE: AtomicUsize = AtomicUsize::new(0);
static R16_BYTES: AtomicUsize = AtomicUsize::new(0);
static R16_CALLS: AtomicUsize = AtomicUsize::new(0);
static R16_PEAK: AtomicUsize = AtomicUsize::new(0);
#[cfg(any())] // R16 allocation probe
struct R16Allocator;
#[cfg(any())] // R16 allocation probe
fn r16_grow(bytes: usize) {
    R16_BYTES.fetch_add(bytes, AtomicOrdering::Relaxed);
    R16_CALLS.fetch_add(1, AtomicOrdering::Relaxed);
    let live = R16_LIVE.fetch_add(bytes, AtomicOrdering::Relaxed) + bytes;
    R16_PEAK.fetch_max(live, AtomicOrdering::Relaxed);
}
#[cfg(any())] // R16 allocation probe
unsafe impl std::alloc::GlobalAlloc for R16Allocator {
    unsafe fn alloc(&self, layout: std::alloc::Layout) -> *mut u8 {
        let p = unsafe { std::alloc::System.alloc(layout) };
        if !p.is_null() { r16_grow(layout.size()); }
        p
    }
    unsafe fn alloc_zeroed(&self, layout: std::alloc::Layout) -> *mut u8 {
        let p = unsafe { std::alloc::System.alloc_zeroed(layout) };
        if !p.is_null() { r16_grow(layout.size()); }
        p
    }
    unsafe fn realloc(&self, p: *mut u8, layout: std::alloc::Layout, n: usize) -> *mut u8 {
        let q = unsafe { std::alloc::System.realloc(p, layout, n) };
        if !q.is_null() {
            R16_BYTES.fetch_add(n, AtomicOrdering::Relaxed);
            R16_CALLS.fetch_add(1, AtomicOrdering::Relaxed);
            if n >= layout.size() {
                let live = R16_LIVE.fetch_add(n-layout.size(), AtomicOrdering::Relaxed)+n-layout.size();
                R16_PEAK.fetch_max(live, AtomicOrdering::Relaxed);
            } else { R16_LIVE.fetch_sub(layout.size()-n, AtomicOrdering::Relaxed); }
        }
        q
    }
    unsafe fn dealloc(&self, p: *mut u8, layout: std::alloc::Layout) {
        R16_LIVE.fetch_sub(layout.size(), AtomicOrdering::Relaxed);
        unsafe { std::alloc::System.dealloc(p, layout); }
    }
}
#[cfg(any())] // R16 allocation probe
#[global_allocator]
static R16_ALLOCATOR: R16Allocator = R16Allocator;
fn r16_counts() -> (usize, usize, usize) {
    (R16_LIVE.load(AtomicOrdering::Relaxed), R16_BYTES.load(AtomicOrdering::Relaxed), R16_CALLS.load(AtomicOrdering::Relaxed))
}

fn r16_cost_fixture(kind: usize) -> (BezierAlgebraicSelectedFiberParameter2, BivariatePolynomial, RealSign) {
    let point = || selected(base(), incidence(1, false), true);
    match kind {
        0 => (point(), predicate(0), RealSign::Zero),
        1 => (point(), predicate(1), RealSign::Positive),
        2 => (point(), predicate(-1), RealSign::Negative),
        3 => (point(), BivariatePolynomial::new(vec![vec![-fraction(1,2),Real::one()]]), RealSign::Positive),
        4 => (selected(base(),incidence(1,true),true),predicate(0),RealSign::Zero),
        5 => (selected(vec![Real::one(),-fraction(1,2),Real::from(-2),Real::one()],incidence(1,false),true),predicate(0),RealSign::Zero),
        6 | 7 => {
            let mut epsilon=Real::one();for _ in 0..120 { epsilon= (epsilon/Real::from(2)).unwrap(); }
            if kind==7 { epsilon=-epsilon; }
            let mut query=predicate(0);query.coefficients[0][0]+=&epsilon;
            (point(),query,if kind==6 {RealSign::Positive}else{RealSign::Negative})
        }
        8 => {
            let gamma=fraction(1,2).sqrt().unwrap();
            // alpha^3+alpha=gamma has one root in (0,1). On the selected
            // incidence, y=4t-2 satisfies y^2=alpha, hence y^6+y^2-gamma=0.
            let parameter=selected(vec![-&gamma,Real::one(),Real::zero(),Real::one()],incidence(1,false),true);
            let query=BivariatePolynomial::new(vec![vec![Real::from(68)-gamma,Real::from(-784),Real::from(3856),Real::from(-10240),Real::from(15360),Real::from(-12288),Real::from(4096)]]);
            (parameter,query,RealSign::Zero)
        }
        9 => (point(),BivariatePolynomial::new(vec![vec![Real::zero()]]),RealSign::Zero),
        10 => (point(),incidence(1,false),RealSign::Zero),
        11 => (selected(vec![-fraction(1,3),Real::zero(),Real::one()],incidence(1,false),true),predicate(0),RealSign::Negative),
        _ => panic!("unknown cost fixture"),
    }
}

#[test]
#[ignore = "private research cost probe; separately bounded driver"]
fn r16_cost_probe() {
    let kind:usize=std::env::var("R16_COST_KIND").unwrap().parse().unwrap();
    let policy_name=std::env::var("R16_COST_POLICY").unwrap();
    let policy=if policy_name=="strict" {CurveContext::STRICT}else {assert_eq!(policy_name,"approximate");CurveContext::APPROXIMATE_512};
    let batch:usize=std::env::var("R16_COST_BATCH").unwrap().parse().unwrap();assert!(batch>0);
    let trace=std::env::var_os("R16_COST_TRACE").is_some();
    let (parameter,query,expected)=r16_cost_fixture(kind);
    let code=match expected {RealSign::Negative=>1_u64,RealSign::Zero=>2,RealSign::Positive=>3};
    hyperreal::dispatch_trace::reset();
    let _recording=trace.then(hyperreal::dispatch_trace::recording_scope);
    for sample in 0..8 {
        let iterations=if sample==0 {1}else{batch};
        let before=r16_counts();R16_PEAK.store(before.0,AtomicOrdering::Relaxed);
        let start=std::time::Instant::now();let mut checksum=14695981039346656037_u64;
        for _ in 0..iterations {
            let outcome=crate::evaluate_under(policy.predicate_policy(),||parameter.predicate_sign(std::hint::black_box(&query),&policy));
            assert_eq!(outcome.certainty(),crate::CurveCertainty::Certified);
            let answer=outcome.certified().unwrap().unwrap();assert_eq!(answer,Classification::Decided(expected));
            std::hint::black_box(answer);checksum=checksum.wrapping_mul(1099511628211)^code;
        }
        let ns=start.elapsed().as_nanos();let after=r16_counts();let peak=R16_PEAK.load(AtomicOrdering::Relaxed).saturating_sub(before.0);
        let hits=hyperreal::dispatch_trace::snapshot_trace().path_count("hypercurve","selected-fiber-predicate-sign","complete-quotient-zero");
        eprintln!(r#"R16_SAMPLE {{"kind":{kind},"policy":"{policy_name}","sample":{sample},"iterations":{iterations},"ns":{ns},"certainty":"Certified","sign":"{expected:?}","checksum":"{checksum}","bytes":{},"calls":{},"live_delta":{},"peak_growth":{peak},"trace":{trace},"quotient_zero_hits":{hits}}}"#,after.1-before.1,after.2-before.2,after.0 as i128-before.0 as i128);
    }
    drop(parameter);drop(query);
}
