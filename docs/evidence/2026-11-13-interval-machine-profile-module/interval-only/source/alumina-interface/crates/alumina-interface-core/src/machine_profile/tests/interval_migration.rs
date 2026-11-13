//! Frozen constructor differential; configuration and profile fixtures stay shared.
use super::*;

fn original(scalar: ExactScalar) -> MachineProfileResult<ExactInterval> {
    let nominal = convert_rational(scalar.value)?;
    let uncertainty = convert_rational(scalar.uncertainty)?;
    Ok(ExactInterval {
        lower: &nominal - &uncertainty,
        upper: &nominal + &uncertainty,
        nominal,
    })
}

fn input(n: i64, d: u64, u: i64, v: u64) -> ExactScalar {
    let ConfigurationRecord::Scalar(value) =
        scalar(0, ScalarFact::AxisCalibrationScale, n, d, u, v)
    else {
        unreachable!()
    };
    value
}

#[test]
fn scalar_fields_and_following_operations_match_original() {
    // Configuration's wire format requires reduced fractions, including 0/1.
    // Normalize through the existing scalar authority; keep every generated case.
    let reduced = |n, d| {
        let value = Rational::fraction(n, d).unwrap();
        let (_, numerator, denominator) = value.ratio_parts();
        let magnitude = i128::from(u64::try_from(numerator).unwrap());
        (
            i64::try_from(if n < 0 { -magnitude } else { magnitude }).unwrap(),
            u64::try_from(denominator).unwrap(),
        )
    };
    for n in -8..=8 {
        for d in 1..=7 {
            for u in 0..=8 {
                for v in 1..=7 {
                    let (nn, nd) = reduced(n, d);
                    let (un, ud) = reduced(u, v);
                    let data = input(nn, nd, un, ud);
                    let old = original(data).unwrap();
                    let new = ExactInterval::from_scalar(data).unwrap();
                    assert_eq!(new, old);
                    assert_eq!(format!("{new:?}"), format!("{old:?}"));
                    assert_eq!(
                        new.divided_by_positive_integer(1000),
                        old.divided_by_positive_integer(1000)
                    );
                    let a = new.require_positive_lower(0, ScalarFact::AxisCalibrationScale);
                    let b = old.require_positive_lower(0, ScalarFact::AxisCalibrationScale);
                    assert_eq!(format!("{a:?}"), format!("{b:?}"));
                }
            }
        }
    }
}

#[test]
fn invalid_fraction_and_negative_uncertainty_keep_typed_diagnostics() {
    let mut data = input(1, 1, 1, 2);
    data.uncertainty.denominator = 0;
    let error = ExactInterval::from_scalar(data).unwrap_err();
    assert!(matches!(
        error,
        MachineProfileError::Arithmetic(Problem::DivideByZero)
    ));
    assert!(matches!(
        error.source().unwrap().downcast_ref::<Problem>(),
        Some(Problem::DivideByZero)
    ));

    data.uncertainty.denominator = 2;
    data.uncertainty.numerator = -1;
    assert!(ConfigurationRecord::Scalar(data).encode().is_err());
    let error = ExactInterval::from_scalar(data).unwrap_err();
    assert!(matches!(
        error,
        MachineProfileError::Configuration(ConfigurationError::Scalar)
    ));
    data.uncertainty.denominator = 0;
    assert!(matches!(
        ExactInterval::from_scalar(data),
        Err(MachineProfileError::Arithmetic(Problem::DivideByZero))
    ));
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn fraction_constructor_counts_match_in_fresh_processes() {
    use hyperlimit::{Certainty, PredicateOutcome};
    use hyperreal::dispatch_trace::{self, with_recording};
    const SIDE: &str = "MACHINE_INTERVAL_SIDE";
    const INDEX: &str = "MACHINE_INTERVAL_INDEX";
    const WARM: &str = "MACHINE_INTERVAL_WARM";
    const TEST: &str = "machine_profile::tests::interval_migration::fraction_constructor_counts_match_in_fresh_processes";
    let samples = [
        (0, 1, 0, 1),
        (10, 1, 1, 20),
        (-17, 3, 23, 7),
        (1, 1 << 30, 3, 1 << 29),
        (i64::MAX, 13, i64::MAX - 2, 17),
        (i64::MIN, u64::MAX, i64::MAX, u64::MAX),
    ];
    if let Ok(side) = std::env::var(SIDE) {
        let index: usize = std::env::var(INDEX).unwrap().parse().unwrap();
        let (n, d, u, v) = samples[index];
        let data = input(n, d, u, v);
        let run = || match side.as_str() {
            "original" => original(data),
            "shared" => ExactInterval::from_scalar(data),
            _ => panic!("unknown differential side"),
        };
        if std::env::var(WARM).unwrap() == "true" {
            std::hint::black_box(run().unwrap());
        }
        dispatch_trace::reset();
        let result = with_recording(run).unwrap();
        println!("TRACE={:?}", dispatch_trace::take_trace());
        println!(
            "RESULT={}",
            serde_json::to_string(&(result.nominal(), result.lower(), result.upper())).unwrap()
        );
        for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
            let lower = Real::from(result.lower().clone());
            let upper = Real::from(result.upper().clone());
            dispatch_trace::reset();
            let receipt = with_recording(|| compare_reals(&lower, &upper, policy));
            let trace = dispatch_trace::take_trace();
            assert_eq!(
                trace.path_count("hyperlimit", "compare_reals", "exact-rational"),
                1
            );
            assert!(matches!(
                receipt,
                PredicateOutcome::Decided {
                    value: Ordering::Less | Ordering::Equal,
                    certainty: Certainty::Exact,
                    ..
                }
            ));
            println!("POLICY={policy:?} {receipt:?} {trace:?}");
        }
        return;
    }
    for index in 0..samples.len() {
        for warm in [false, true] {
            let mut observations = Vec::new();
            for side in ["original", "shared"] {
                let child = std::process::Command::new(std::env::current_exe().unwrap())
                    .args(["--exact", TEST, "--nocapture"])
                    .env(SIDE, side)
                    .env(INDEX, index.to_string())
                    .env(WARM, warm.to_string())
                    .output()
                    .unwrap();
                assert!(
                    child.status.success(),
                    "{}",
                    String::from_utf8_lossy(&child.stderr)
                );
                let stdout = String::from_utf8(child.stdout).unwrap();
                let lines: Vec<_> = stdout
                    .lines()
                    .filter(|s| {
                        s.starts_with("TRACE=")
                            || s.starts_with("RESULT=")
                            || s.starts_with("POLICY=")
                    })
                    .map(str::to_owned)
                    .collect();
                assert_eq!(lines.len(), 4, "{stdout}");
                observations.push(lines);
            }
            assert_eq!(
                observations[0], observations[1],
                "sample {index}, warm {warm}"
            );
        }
    }
}
