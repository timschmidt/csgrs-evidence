use super::*;
use std::hint::black_box;
use std::time::Instant;

struct Inputs {
    left: Rational,
    first: Rational,
    second: Rational,
}

enum Output {
    Scalar(Rational),
    Square(Rational, Rational),
}

fn inputs(wide: bool) -> Inputs {
    Inputs {
        left: if wide {
            Rational::from_parts_raw(
                Plus,
                (BigUint::one() << 513_usize) + 33_u8,
                (BigUint::one() << 257_usize) + 73_u8,
            )
        } else {
            Rational::new(5_000_000_000_i64)
        },
        first: Rational::fraction(11, 1_000_000_000).unwrap(),
        second: Rational::fraction(13, 1_000_000_000).unwrap(),
    }
}

fn linear(inputs: &Inputs, two: bool) {
    black_box(&inputs.left + &inputs.first);
    black_box(&inputs.left + &inputs.first);
    if two {
        black_box(&inputs.left + &inputs.second);
        black_box(&inputs.left + &inputs.second);
    }
}

fn square(inputs: &Inputs) {
    black_box(inputs.left.clone().extract_square_reduced_retained());
    black_box(inputs.left.clone().extract_square_reduced_retained());
}

fn prepare(kind: usize) -> Inputs {
    let inputs = inputs(kind >= 13);
    match kind {
        0 | 13 => linear(&inputs, false),
        1 => linear(&inputs, true),
        2 => {
            square(&inputs);
            linear(&inputs, true);
        }
        3 => {
            black_box(inputs.left.clone().inverse().unwrap());
        }
        4 => {
            linear(&inputs, true);
            black_box(inputs.left.clone().inverse().unwrap());
        }
        5 | 6 => {
            square(&inputs);
            linear(&inputs, true);
            if kind == 6 {
                black_box(-&inputs.left);
            }
            black_box(inputs.left.clone().inverse().unwrap());
        }
        7 => {
            black_box(-&inputs.left);
        }
        8 => {
            linear(&inputs, true);
            black_box(-&inputs.left);
        }
        9 | 10 => {
            square(&inputs);
            linear(&inputs, true);
            if kind == 10 {
                black_box(inputs.left.clone().inverse().unwrap());
            }
            black_box(-&inputs.left);
        }
        11 => {
            linear(&inputs, true);
            square(&inputs);
        }
        12 => {
            black_box(&inputs.left * &inputs.first);
            black_box(&inputs.left * &inputs.first);
        }
        14 => {
            black_box(-&inputs.left);
            linear(&inputs, true);
            black_box(inputs.left.clone().inverse().unwrap());
        }
        15 => {
            black_box(inputs.left.clone().inverse().unwrap());
            linear(&inputs, true);
            black_box(-&inputs.left);
        }
        _ => unreachable!(),
    }
    inputs
}

fn query(kind: usize, inputs: &Inputs) -> Output {
    match kind {
        0 | 13 => Output::Scalar(black_box(&inputs.left) + black_box(&inputs.first)),
        1 | 2 => Output::Scalar(black_box(&inputs.left) + black_box(&inputs.second)),
        3..=6 | 14 => Output::Scalar(black_box(inputs.left.clone()).inverse().unwrap()),
        7..=10 | 15 => Output::Scalar(-black_box::<&Rational>(&inputs.left)),
        11 => {
            let (a, b) = black_box(inputs.left.clone()).extract_square_reduced_retained();
            Output::Square(a, b)
        }
        12 => Output::Scalar(black_box(&inputs.left) * black_box(&inputs.first)),
        _ => unreachable!(),
    }
}

fn reference(value: &Rational) -> num::BigRational {
    num::BigRational::new(
        BigInt::from_biguint(value.sign(), value.numerator().clone()),
        BigInt::from(value.denominator().clone()),
    )
}

fn check(kind: usize, inputs: &Inputs, value: Output) -> Vec<String> {
    let left = if kind >= 13 {
        num::BigRational::new(
            (BigInt::one() << 513_usize) + 33_u8,
            (BigInt::one() << 257_usize) + 73_u8,
        )
    } else {
        num::BigRational::from_integer(BigInt::from(5_000_000_000_i64))
    };
    let expected = match kind {
        0 | 13 => vec![&left + num::BigRational::new(11.into(), 1_000_000_000.into())],
        1 | 2 => vec![&left + num::BigRational::new(13.into(), 1_000_000_000.into())],
        3..=6 | 14 => vec![left.recip()],
        7..=10 | 15 => vec![-left],
        11 => vec![
            num::BigRational::from_integer(50_000.into()),
            num::BigRational::from_integer(2.into()),
        ],
        12 => vec![&left * num::BigRational::new(11.into(), 1_000_000_000.into())],
        _ => unreachable!(),
    };
    let actual = match value {
        Output::Scalar(value) => vec![reference(&value)],
        Output::Square(a, b) => vec![reference(&a), reference(&b)],
    };
    assert_eq!(actual, expected);
    if kind != 12 {
        let cached = inputs.left.linear_cache.get().expect("retained cache");
        match kind {
            0 | 1 | 4 | 8 | 11 | 13 => {
                assert_eq!(cached.primary.kind, CachedRationalLinearKind::Sum);
            }
            2 | 5 | 6 | 9 | 10 => {
                assert_eq!(
                    cached.primary.kind,
                    CachedRationalLinearKind::SquareReductionPlaceholder
                );
                assert_eq!(
                    cached.secondary.get().unwrap().kind,
                    CachedRationalLinearKind::Sum
                );
                assert_eq!(
                    cached.tertiary.get().unwrap().kind,
                    CachedRationalLinearKind::Sum
                );
            }
            3 | 15 => assert!(cached.primary.kind.is_inverse_placeholder()),
            7 | 14 => assert!(cached.primary.kind.is_negation_placeholder()),
            _ => unreachable!(),
        }
        if kind == 4 {
            assert!(cached.tertiary.get().unwrap().kind.is_inverse_placeholder());
        }
        if kind == 8 {
            assert!(
                cached
                    .tertiary
                    .get()
                    .unwrap()
                    .kind
                    .is_negation_placeholder()
            );
        }
    }
    actual.into_iter().map(|v| v.to_string()).collect()
}

#[test]
#[ignore = "private R17 native comparison; selected by the recorded driver"]
fn r17_layout_cost_probe() {
    let kind: usize = std::env::var("R17_KIND").unwrap().parse().unwrap();
    assert!(kind < 16);
    let cold_batch: usize = std::env::var("R17_COLD_BATCH").unwrap().parse().unwrap();
    let warm_batch: usize = std::env::var("R17_WARM_BATCH").unwrap().parse().unwrap();
    assert!(cold_batch > 0 && warm_batch > 0);
    let prepared = prepare(kind);
    let exact = check(kind, &prepared, query(kind, &prepared));
    eprintln!(
        "R17_LAYOUT {{\"main_bytes\":{},\"exact\":{:?}}}",
        std::mem::size_of::<CachedRationalArithmetic>(),
        exact
    );
    for sample in 0..7 {
        let start = Instant::now();
        for _ in 0..cold_batch {
            let fresh = prepare(black_box(kind));
            black_box(query(kind, &fresh));
        }
        let cold_ns = start.elapsed().as_nanos();
        let start = Instant::now();
        for _ in 0..warm_batch {
            black_box(query(black_box(kind), &prepared));
        }
        let warm_ns = start.elapsed().as_nanos();
        let after = check(kind, &prepared, query(kind, &prepared));
        assert_eq!(after, exact);
        eprintln!(
            "R17_SAMPLE {{\"kind\":{kind},\"sample\":{sample},\"cold_iterations\":{cold_batch},\"cold_ns\":{cold_ns},\"warm_iterations\":{warm_batch},\"warm_ns\":{warm_ns},\"exact\":{after:?}}}"
        );
    }
}
