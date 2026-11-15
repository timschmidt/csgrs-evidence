//! Matched completed products, including one preparation and all output drops.
use hyperlattice_interval::hyperinterval::{
    DyadicBudget, DyadicInterval, F64Enclosure, FixedInterval, RationalInterval,
};
use hyperlattice_interval::{IntervalArithmetic, IntervalMatrix, IntervalVector};
use std::{hint::black_box, time::Instant};
mod allocations;

fn completed<I: IntervalArithmetic, const N: usize>(
    matrix: &IntervalMatrix<I, N, N>,
    vector: &IntervalVector<I, N>,
    prepared: bool,
    repeats: usize,
    mut context: impl FnMut() -> I::Context,
) {
    if prepared {
        let plan = black_box(matrix).prepare();
        for _ in 0..repeats {
            let output = plan.mul_vector(black_box(vector), &mut context()).unwrap();
            black_box(&output);
        }
    } else {
        for _ in 0..repeats {
            let output = black_box(matrix)
                .mul_vector(black_box(vector), &mut context())
                .unwrap();
            black_box(&output);
        }
    }
}
fn run<I: IntervalArithmetic + std::fmt::Debug + PartialEq + serde::Serialize, const N: usize>(
    name: &str,
    scalar: impl Fn(i32, i32) -> I,
    context: impl Fn() -> I::Context,
) {
    for dense in [false, true] {
        let matrix = IntervalMatrix::new(core::array::from_fn(|r| {
            core::array::from_fn(|c| {
                if dense || r == c {
                    scalar(1, 2)
                } else {
                    scalar(0, 0)
                }
            })
        }))
        .unwrap();
        let vector =
            IntervalVector::new(core::array::from_fn(|i| scalar(i as i32 + 1, i as i32 + 2)))
                .unwrap();
        let ordinary = matrix.mul_vector(&vector, &mut context()).unwrap();
        let prepared = matrix
            .prepare()
            .mul_vector(&vector, &mut context())
            .unwrap();
        assert_eq!(ordinary, prepared);
        assert_eq!(
            serde_json::to_vec(&ordinary).unwrap(),
            serde_json::to_vec(&prepared).unwrap()
        );
        // Independent integer endpoints for these nonnegative scalar fixtures.
        let expected = IntervalVector::new(core::array::from_fn(|i| {
            let (lo, hi) = if dense {
                (N * (N + 1) / 2, N * (N + 3))
            } else {
                (i + 1, 2 * (i + 2))
            };
            scalar(lo as i32, hi as i32)
        }))
        .unwrap();
        assert_eq!(ordinary, expected);
        for repeats in [1, 16] {
            for prepared in [false, true] {
                let (_, calls, bytes) = allocations::measure(|| {
                    completed(&matrix, &vector, prepared, repeats, &context)
                });
                eprintln!("ALLOC,{name},{N},{dense},{repeats},{prepared},{calls},{bytes}");
                for _ in 0..16 {
                    completed(&matrix, &vector, prepared, repeats, &context);
                }
            }
            for sample in 0..30 {
                for prepared in if sample % 2 == 0 {
                    [false, true]
                } else {
                    [true, false]
                } {
                    let t = Instant::now();
                    for _ in 0..32 {
                        completed(&matrix, &vector, prepared, repeats, &context);
                    }
                    println!(
                        "{name},{N},{dense},{repeats},{sample},{prepared},32,{}",
                        t.elapsed().as_nanos()
                    );
                }
            }
        }
    }
}
fn main() {
    println!("backend,dimension,dense,repeats,sample,prepared,epochs,elapsed_ns");
    macro_rules! dimensions {
        ($name:literal,$scalar:expr,$context:expr) => {{
            run::<_, 4>($name, $scalar, $context);
            run::<_, 16>($name, $scalar, $context);
        }};
    }
    dimensions!(
        "fixed",
        |a, b| FixedInterval::<i32, 0>::new(a, b).unwrap(),
        || ()
    );
    dimensions!(
        "f64",
        |a, b| F64Enclosure::new(f64::from(a), f64::from(b)).unwrap(),
        || ()
    );
    dimensions!(
        "rational",
        |a, b| RationalInterval::new(a.into(), b.into()).unwrap(),
        || ()
    );
    dimensions!(
        "dyadic",
        |a, b| DyadicInterval::new(a.into(), b.into(), 0).unwrap(),
        || DyadicBudget::new(256, 1_000_000_000)
    );
}
