use hyperinterval::{DyadicBudget, DyadicInterval};
use num_bigint::BigInt;
use std::{hint::black_box, time::Instant};
#[path = "/mnt/development/csgrs/crates/hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
    let sample = std::env::args().nth(1).unwrap_or_else(|| "0".into());
    for (name, a, b, c, d, bits) in [
        ("positive", 1, 3, 5, 7, 0), ("mixed", -3, 7, -5, 9, 0),
        ("negative", -7, -3, -9, -5, 0), ("wide", -3, 7, -5, 9, 256),
        ("zero", 0, 0, -5, 9, 0),
    ] {
        let integer = |x: i32| (BigInt::from(x) << bits) + BigInt::from(x.signum());
        let a = DyadicInterval::new(integer(a), integer(b), -31).unwrap();
        let b = DyadicInterval::new(integer(c), integer(d), -47).unwrap();
        let operation = || {
            let mut budget = DyadicBudget::new(4096, 1_000_000_000);
            let result = black_box(&a).mul(black_box(&b), &mut budget).unwrap();
            (result, budget.remaining_work())
        };
        let ((result, remaining), count, bytes) = allocations::measure(operation);
        let replay = serde_json::to_string(&result).unwrap();
        for _ in 0..4096 { black_box(operation()); }
        let start = Instant::now();
        for _ in 0..65536 { black_box(operation()); }
        println!("{sample}\t{name}\t{}\t65536\t{remaining}\t{count}\t{bytes}\t{replay}", start.elapsed().as_nanos());
    }
}
