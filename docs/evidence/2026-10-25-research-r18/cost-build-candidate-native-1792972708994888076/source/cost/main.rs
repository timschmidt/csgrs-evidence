#[cfg(feature = "allocations")]
use std::alloc::{GlobalAlloc, Layout, System};
use std::{
    io::Write,
    sync::atomic::{AtomicUsize, Ordering},
    time::Instant,
};
#[cfg(feature = "allocations")]
struct CountingAllocator;
static LIVE: AtomicUsize = AtomicUsize::new(0);
static BYTES: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
#[cfg(feature = "allocations")]
fn grow(n: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    BYTES.fetch_add(n, Ordering::Relaxed);
    let live = LIVE.fetch_add(n, Ordering::Relaxed) + n;
    PEAK.fetch_max(live, Ordering::Relaxed);
}
// SAFETY: All pointers and layouts pass unchanged to System. Counters never
// inspect allocations or alter ownership. Realloc traffic counts full requests.
#[cfg(feature = "allocations")]
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 {
        let p = unsafe { System.alloc(l) };
        if !p.is_null() {
            grow(l.size());
        }
        p
    }
    unsafe fn alloc_zeroed(&self, l: Layout) -> *mut u8 {
        let p = unsafe { System.alloc_zeroed(l) };
        if !p.is_null() {
            grow(l.size());
        }
        p
    }
    unsafe fn realloc(&self, p: *mut u8, l: Layout, n: usize) -> *mut u8 {
        let result = unsafe { System.realloc(p, l, n) };
        if !result.is_null() {
            CALLS.fetch_add(1, Ordering::Relaxed);
            BYTES.fetch_add(n, Ordering::Relaxed);
            if n >= l.size() {
                let live = LIVE.fetch_add(n - l.size(), Ordering::Relaxed) + n - l.size();
                PEAK.fetch_max(live, Ordering::Relaxed);
            } else {
                LIVE.fetch_sub(l.size() - n, Ordering::Relaxed);
            }
        }
        result
    }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) {
        LIVE.fetch_sub(l.size(), Ordering::Relaxed);
        unsafe {
            System.dealloc(p, l);
        }
    }
}
#[cfg(feature = "allocations")]
#[global_allocator]
static ALLOCATOR: CountingAllocator = CountingAllocator;
fn counts() -> (usize, usize, usize) {
    (
        LIVE.load(Ordering::Relaxed),
        BYTES.load(Ordering::Relaxed),
        CALLS.load(Ordering::Relaxed),
    )
}
use hyperlimit::{Certainty, PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::{Rational, Real};
use std::hint::black_box;

fn terminal_zero() -> Real {
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
}

fn fixture(kind: usize) -> Real {
    match kind {
        0 => Real::from(17),
        1 => Real::from(2).sqrt().unwrap() - Real::one(),
        2 | 7 => {
            let angle = Real::new(Rational::fraction(1, 10_000).unwrap()).to_radians();
            let sine = angle.clone().sin();
            let cosine = angle.cos();
            let circle = &sine * &sine + &cosine * &cosine;
            let power = (0..if kind == 2 { 5 } else { 7 }).fold(Real::one(), |p, _| p * &circle);
            power - Real::one()
        }
        3 => terminal_zero(),
        4 => {
            let atom = Real::new(Rational::fraction(1, 7).unwrap()).sin();
            let common = atom.powi_i64(12).unwrap() + Real::one();
            &common * (Real::e() + Real::one()).sin()
                - &common * Real::e().sin() * Real::one().cos()
                - &common * Real::e().cos() * Real::one().sin()
        }
        5 => Real::from(2).powi_i64(-600).unwrap(),
        6 => terminal_zero() + Real::from(2).powi_i64(-600).unwrap(),
        _ => panic!("unknown case"),
    }
}

fn validate(outcome: PredicateOutcome<Sign>, kind: usize, policy: PredicatePolicy) -> u64 {
    match (kind, policy, outcome) {
        (
            0 | 1 | 5,
            _,
            PredicateOutcome::Decided {
                value: Sign::Positive,
                certainty: Certainty::Exact,
                ..
            },
        ) => 1,
        (
            2,
            _,
            PredicateOutcome::Decided {
                value: Sign::Zero,
                certainty: Certainty::Exact,
                ..
            },
        ) => 2,
        (3 | 4 | 6 | 7, PredicatePolicy::STRICT, PredicateOutcome::Unknown { .. }) => 3,
        (
            3 | 4 | 6 | 7,
            PredicatePolicy::APPROXIMATE_512,
            PredicateOutcome::Decided {
                value: Sign::Zero,
                certainty: Certainty::Approximate,
                ..
            },
        ) => 4,
        (_, _, other) => panic!("unexpected case {kind} policy {policy:?}: {other:?}"),
    }
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    let kind: usize = args[1].parse().unwrap();
    let policy = match args[2].as_str() {
        "strict" => PredicatePolicy::STRICT,
        "approximate" => PredicatePolicy::APPROXIMATE_512,
        _ => panic!("unknown policy"),
    };
    let cold_iterations: usize = args[3].parse().unwrap();
    let warm_iterations: usize = args[4].parse().unwrap();
    assert!(cold_iterations > 0 && warm_iterations > 0);
    let mut out = std::io::BufWriter::new(std::io::stdout());
    for phase in ["cold", "warm"] {
        let held = fixture(kind);
        if phase == "warm" {
            validate(classify_real_sign(&held, policy), kind, policy);
        }
        for sample in 0..7 {
            let iterations = if phase == "cold" {
                cold_iterations
            } else {
                warm_iterations
            };
            // Construction, result storage allocation, verification, formatting
            // and drop are outside the timed predicate-query interval.
            let inputs: Vec<_> = if phase == "cold" {
                (0..iterations).map(|_| fixture(kind)).collect()
            } else {
                Vec::new()
            };
            let mut outcomes = Vec::with_capacity(iterations);
            let before = counts();
            PEAK.store(before.0, Ordering::Relaxed);
            let start = Instant::now();
            for i in 0..iterations {
                let input = if phase == "cold" { &inputs[i] } else { &held };
                outcomes.push(black_box(classify_real_sign(black_box(input), policy)));
            }
            let ns = start.elapsed().as_nanos();
            let after = counts();
            let mut checksum = 14695981039346656037_u64;
            let mut result_code = None;
            for outcome in outcomes {
                let code = validate(outcome, kind, policy);
                if let Some(expected) = result_code {
                    assert_eq!(code, expected);
                }
                result_code = Some(code);
                checksum = checksum.wrapping_mul(1099511628211) ^ code;
            }
            writeln!(out, "{}", serde_json::json!({
                "kind": kind, "policy": args[2], "phase": phase, "sample": sample,
                "iterations": iterations, "ns": ns, "checksum": checksum.to_string(),
                "outcome": match result_code.unwrap() {1=>"ExactPositive",2=>"ExactZero",3=>"Unknown",4=>"ApproximateZero",_=>unreachable!()},
                "allocation_instrumented": cfg!(feature="allocations"),
                "bytes": after.1-before.1, "calls": after.2-before.2,
                "live_delta": after.0 as i128-before.0 as i128,
                "peak_live_growth": PEAK.load(Ordering::Relaxed).saturating_sub(before.0),
            })).unwrap();
        }
    }
    out.flush().unwrap();
}
