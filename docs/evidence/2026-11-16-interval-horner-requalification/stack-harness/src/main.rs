use hyperlimit::PredicatePolicy;
use hyperreal::{Rational, Real};
use hypersolve::{
    AlgebraicRootPolynomialEvaluationReport, AlgebraicRootPolynomialEvaluationStatus,
    AlgebraicRootRepresentation, AlgebraicRootValidationReport, AlgebraicRootValidationStatus,
    AlgebraicTensorImageReport, AlgebraicTensorImageStatus, DenseTensorPolynomial,
    IsolatedRootInterval, SymbolId, evaluate_polynomial_at_algebraic_root,
    polynomial_has_one_distinct_root_in_open_interval, represent_algebraic_tensor_image,
    validate_algebraic_root_representation,
};
use std::ffi::{c_int, c_void};
unsafe extern "C" {
    fn measure_stack(
        callback: unsafe extern "C" fn(*mut c_void),
        context: *mut c_void,
        warm: c_int,
        pattern: u8,
    ) -> usize;
}
enum Operation {
    Evaluate {
        root: AlgebraicRootRepresentation,
        coefficients: Vec<Real>,
        policy: PredicatePolicy,
        expected: (Rational, Rational),
        point: bool,
    },
    Presence {
        coefficients: Vec<Real>,
        lower: Real,
        upper: Real,
        policy: PredicatePolicy,
    },
    Tensor {
        relation: DenseTensorPolynomial,
        source: AlgebraicRootRepresentation,
        interval: IsolatedRootInterval,
        narrow: bool,
    },
}
#[derive(Debug)]
enum Outcome {
    Evaluation(AlgebraicRootPolynomialEvaluationReport),
    Presence(Option<bool>),
    Tensor(
        AlgebraicTensorImageReport,
        Option<AlgebraicRootPolynomialEvaluationReport>,
    ),
}
struct Case {
    name: String,
    operation: Operation,
    result: Option<Outcome>,
}
unsafe extern "C" fn invoke(context: *mut c_void) {
    let case = unsafe { &mut *context.cast::<Case>() };
    case.result = Some(match &case.operation {
        Operation::Evaluate {
            root,
            coefficients,
            policy,
            ..
        } => Outcome::Evaluation(std::hint::black_box(evaluate_polynomial_at_algebraic_root(
            root,
            coefficients,
            *policy,
        ))),
        Operation::Presence {
            coefficients,
            lower,
            upper,
            policy,
        } => Outcome::Presence(std::hint::black_box(
            polynomial_has_one_distinct_root_in_open_interval(coefficients, lower, upper, *policy),
        )),
        Operation::Tensor {
            relation,
            source,
            interval,
            ..
        } => {
            let report =
                represent_algebraic_tensor_image(relation, std::slice::from_ref(source), interval);
            let next = report.representation.as_ref().map(|root| {
                evaluate_polynomial_at_algebraic_root(
                    root,
                    &[Real::one(), Real::one()],
                    PredicatePolicy::STRICT,
                )
            });
            Outcome::Tensor(std::hint::black_box(report), std::hint::black_box(next))
        }
    });
}
fn root(
    coefficients: Vec<Real>,
    lower: i64,
    upper: i64,
    point: bool,
) -> AlgebraicRootRepresentation {
    let mut root = AlgebraicRootRepresentation {
        constraint_index: 2,
        symbol: SymbolId(2),
        interval_index: 0,
        polynomial_coefficients: coefficients,
        interval: IsolatedRootInterval {
            lower: Real::from(lower),
            upper: Real::from(upper),
            exact_root: point.then(|| Real::from(lower)),
            distinct_root_count: 1,
        },
        validation: AlgebraicRootValidationReport {
            status: AlgebraicRootValidationStatus::Valid,
            message: None,
        },
    };
    root.validation = validate_algebraic_root_representation(&root, PredicatePolicy::STRICT);
    assert_eq!(root.validation.status, AlgebraicRootValidationStatus::Valid);
    root
}
// Independent four-corner interval oracle, outside the measured operation.
fn expected(coefficients: &[Real], lower: i64, upper: i64) -> (Rational, Rational) {
    let a = Rational::from(lower);
    let b = Rational::from(upper);
    let mut lo = Rational::zero();
    let mut hi = Rational::zero();
    for coefficient in coefficients.iter().rev() {
        let products = [&lo * &a, &lo * &b, &hi * &a, &hi * &b];
        let minimum = products
            .iter()
            .min_by(|x, y| x.partial_cmp(y).unwrap())
            .unwrap();
        let maximum = products
            .iter()
            .max_by(|x, y| x.partial_cmp(y).unwrap())
            .unwrap();
        let coefficient = coefficient.exact_rational_ref().unwrap();
        lo = minimum + coefficient;
        hi = maximum + coefficient;
    }
    (lo, hi)
}
fn cases() -> Vec<Case> {
    let mut cases = Vec::new();
    let roots = [
        ("positive-cubic", vec![-2, 0, 0, 1], 1, 2, false),
        ("negative-cubic", vec![2, 0, 0, 1], -2, -1, false),
        ("fifth-root", vec![-2, 0, 0, 0, 0, 1], 1, 2, false),
        ("repeated-cubic", vec![4, 0, 0, -4, 0, 0, 1], 1, 2, false),
        ("exact-point", vec![-3, 1], 3, 3, true),
    ];
    for (name, defining, lower, upper, point) in roots {
        for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
            for degree in [3, 16] {
                for mixed in [false, true] {
                    let coefficients: Vec<_> = (0..=degree)
                        .map(|i| Real::from(if mixed && i % 2 == 1 { -1 } else { 1 }))
                        .collect();
                    let expected = expected(&coefficients, lower, upper);
                    cases.push(Case {
                        name: format!("eval/{name}/{policy:?}/{degree}/{mixed}"),
                        result: None,
                        operation: Operation::Evaluate {
                            root: root(
                                defining.iter().copied().map(Real::from).collect(),
                                lower,
                                upper,
                                point,
                            ),
                            coefficients,
                            policy,
                            expected,
                            point,
                        },
                    });
                }
            }
            if !point {
                cases.push(Case {
                    name: format!("presence/{name}/{policy:?}"),
                    result: None,
                    operation: Operation::Presence {
                        coefficients: defining.iter().copied().map(Real::from).collect(),
                        lower: Real::from(lower),
                        upper: Real::from(upper),
                        policy,
                    },
                });
            }
        }
    }
    for narrow in [true, false] {
        let x = DenseTensorPolynomial::from_axis_polynomial(2, 0, &[Real::zero(), Real::one()])
            .unwrap();
        let z = DenseTensorPolynomial::from_axis_polynomial(2, 1, &[Real::zero(), Real::one()])
            .unwrap();
        let relation = z.multiply(&z.subtract(&x).unwrap()).unwrap();
        let bound = if narrow {
            Real::from(Rational::fraction(1, 4).unwrap())
        } else {
            Real::from(2)
        };
        cases.push(Case {
            name: format!("tensor-cardinal/{narrow}"),
            result: None,
            operation: Operation::Tensor {
                relation,
                source: root(vec![Real::from(-2), Real::zero(), Real::one()], 1, 2, false),
                interval: IsolatedRootInterval {
                    lower: -bound.clone(),
                    upper: bound,
                    exact_root: None,
                    distinct_root_count: 1,
                },
                narrow,
            },
        });
    }
    assert_eq!(cases.len(), 50);
    cases
}
fn validate(case: &Case) {
    match (&case.operation, case.result.as_ref().unwrap()) {
        (
            Operation::Evaluate {
                expected, point, ..
            },
            Outcome::Evaluation(report),
        ) => {
            if *point {
                assert_eq!(
                    report.status,
                    AlgebraicRootPolynomialEvaluationStatus::EvaluatedExactRationalWitness
                );
                assert_eq!(expected.0, expected.1);
                assert_eq!(
                    report.exact_value.as_ref().unwrap().exact_rational_ref(),
                    Some(&expected.0)
                );
            } else {
                let interval = report
                    .interval_value
                    .as_ref()
                    .expect("rational interval evaluation completes");
                assert_eq!(interval.lower.exact_rational_ref(), Some(&expected.0));
                assert_eq!(interval.upper.exact_rational_ref(), Some(&expected.1));
            }
            let sign = if expected.0.is_positive() {
                Some(std::cmp::Ordering::Greater)
            } else if expected.1.is_negative() {
                Some(std::cmp::Ordering::Less)
            } else if *point {
                Some(std::cmp::Ordering::Equal)
            } else {
                None
            };
            assert_eq!(report.sign, sign);
            if !point {
                let expected_status = match sign {
                    Some(std::cmp::Ordering::Greater) => {
                        AlgebraicRootPolynomialEvaluationStatus::IntervalCertifiedPositive
                    }
                    Some(std::cmp::Ordering::Less) => {
                        AlgebraicRootPolynomialEvaluationStatus::IntervalCertifiedNegative
                    }
                    None => AlgebraicRootPolynomialEvaluationStatus::IntervalContainsZero,
                    _ => unreachable!(),
                };
                assert_eq!(report.status, expected_status);
            }
        }
        (Operation::Presence { .. }, Outcome::Presence(value)) => assert_eq!(*value, Some(true)),
        (Operation::Tensor { narrow: true, .. }, Outcome::Tensor(report, next)) => {
            assert_eq!(report.status, AlgebraicTensorImageStatus::Transformed);
            let image = report.representation.as_ref().unwrap();
            assert_eq!(
                image.polynomial_coefficients,
                vec![Real::zero(), Real::one()]
            );
            assert_eq!(image.interval.exact_root, Some(Real::zero()));
            assert_eq!(image.constraint_index, 2);
            assert_eq!(image.symbol, SymbolId(2));
            assert_eq!(report.elimination_count, 1);
            let next = next.as_ref().unwrap();
            assert_eq!(
                next.status,
                AlgebraicRootPolynomialEvaluationStatus::EvaluatedExactRationalWitness
            );
            assert_eq!(next.exact_value, Some(Real::one()));
        }
        (Operation::Tensor { narrow: false, .. }, Outcome::Tensor(report, next)) => {
            assert_eq!(
                report.status,
                AlgebraicTensorImageStatus::NonIsolatingImageInterval
            );
            assert!(report.representation.is_none());
            assert!(next.is_none());
        }
        _ => panic!("wrong outcome for {}", case.name),
    }
}
fn assert_send_sync<T: Send + Sync>() {}
fn main() {
    assert_send_sync::<Case>();
    for repetition in 0..8 {
        for warm in [false, true] {
            for pattern in [0xa5, 0x5a] {
                for mut case in cases() {
                    let peak = unsafe {
                        measure_stack(
                            invoke,
                            (&mut case as *mut Case).cast(),
                            warm.into(),
                            pattern,
                        )
                    };
                    assert!(peak > 0 && peak < 2 * 1024 * 1024 - 4096);
                    validate(&case);
                    println!(
                        "{repetition}\t{}\t{warm}\t{pattern}\t{peak}\t{:?}",
                        case.name,
                        case.result.unwrap()
                    );
                }
            }
        }
    }
}
