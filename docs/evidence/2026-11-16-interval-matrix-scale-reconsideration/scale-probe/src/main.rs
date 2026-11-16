use hyperlattice_interval::{IntervalArithmetic, IntervalLatticeError, IntervalMatrix};
use hyperlattice_interval::hyperinterval::{DyadicBudget, DyadicInterval, F64Enclosure, FixedInterval, RationalInterval};
use std::{hint::black_box, time::Instant};
mod allocations;
type M<I> = IntervalMatrix<I, 2, 2>;
#[inline(never)]
fn completed<I: IntervalArithmetic>(a: &M<I>, scalar: &I, context: &mut I::Context) -> Result<M<I>, IntervalLatticeError> {
    #[cfg(feature = "shared")]
    { a.scale(scalar, context) }
    #[cfg(not(feature = "shared"))]
    {
        let Some(rows) = a.rows() else { return M::empty(); };
        if scalar.is_empty() { return M::empty(); }
        M::new([
            [rows[0][0].mul(scalar, context)?, rows[0][1].mul(scalar, context)?],
            [rows[1][0].mul(scalar, context)?, rows[1][1].mul(scalar, context)?],
        ])
    }
}
fn run<I: IntervalArithmetic + std::fmt::Debug>(name: &str, a: M<I>, scalar: I, mut context: impl FnMut() -> I::Context, primitive: bool) {
    let output = completed(&a, &scalar, &mut context()).unwrap();
    eprintln!("OUTPUT {name} {output:?}");
    for _ in 0..64 { black_box(completed(black_box(&a), black_box(&scalar), &mut context()).unwrap()); }
    for sample in 0..20 {
        let start = Instant::now();
        let (_, calls, bytes) = allocations::measure(|| {
            for _ in 0..1024 { black_box(completed(black_box(&a), black_box(&scalar), &mut context()).unwrap()); }
        });
        let elapsed = start.elapsed().as_nanos();
        if primitive { assert_eq!((calls, bytes), (0, 0)); }
        println!("{name},{sample},1024,{elapsed},{calls},{bytes}");
    }
}
fn main() {
    println!("case,sample,completed_operations,elapsed_ns,allocation_calls,allocated_bytes");
    let ranges = [[(1, 3), (-2, 1)], [(0, 2), (-4, -1)]];
    type F = FixedInterval<i32,16>;
    run("fixed_q16", M::new(ranges.map(|r|r.map(|(a,b)|F::new(a<<14,b<<14).unwrap()))).unwrap(), F::new(-3<<14,2<<14).unwrap(), || (), true);
    run("strict_f64", M::new(ranges.map(|r|r.map(|(a,b)|F64Enclosure::new(f64::from(a)/4.,f64::from(b)/4.).unwrap()))).unwrap(), F64Enclosure::new(-0.75,0.5).unwrap(), || (), true);
    run("small_rational", M::new(ranges.map(|r|r.map(|(a,b)|RationalInterval::new(a.into(),b.into()).unwrap()))).unwrap(), RationalInterval::new((-3).into(),2.into()).unwrap(), || (), false);
    let wide = RationalInterval::new("12345678901234567890123456789/17".parse().unwrap(),"98765432109876543210987654321/19".parse().unwrap()).unwrap();
    run("wide_rational", M::new(core::array::from_fn(|_|core::array::from_fn(|_|wide.clone()))).unwrap(), wide, || (), false);
    run("dyadic", M::new(ranges.map(|r|r.map(|(a,b)|DyadicInterval::new(a.into(),b.into(),-2).unwrap()))).unwrap(), DyadicInterval::new((-3).into(),2.into(),-2).unwrap(), || DyadicBudget::new(256,1_000_000), false);
}
