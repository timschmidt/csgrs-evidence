use core::num::NonZeroU64;
use hyperinterval::{IntervalError, RationalRadiusRef, RealRadius};
use hyperreal::{Problem, Rational, Real};

#[test]
fn rational_ingress_preserves_exact_values_and_rejects_negative_radius() {
    assert_eq!(
        RationalRadiusRef::new(&Rational::from(-1)),
        Err(IntervalError::NegativeRadius)
    );
    for text in ["0", "1/3", "18446744073709551615/17"] {
        let value: Rational = text.parse().unwrap();
        let radius = RationalRadiusRef::new(&value).unwrap();
        assert_eq!(radius.as_rational(), &value);
        assert!(core::ptr::eq(radius.as_rational(), &value));
        assert_eq!(core::mem::size_of_val(&radius), core::mem::size_of::<&Rational>());
        assert_eq!(RealRadius::from(radius).into_real(), Real::from(value));
    }
    let large: Rational = format!("1{}7/91", "0".repeat(1200)).parse().unwrap();
    assert_eq!(
        RationalRadiusRef::new(&large).unwrap().as_rational(),
        &large
    );
}

#[test]
fn generated_exact_radii_remain_composable_without_rational_demotion() {
    assert_eq!(
        RealRadius::euclidean_norm(&[]).unwrap().into_real(),
        Real::zero()
    );
    assert_eq!(
        RealRadius::euclidean_norm(&[Real::from(-3), Real::from(4)])
            .unwrap()
            .into_real(),
        Real::from(5)
    );
    let root_two = RealRadius::euclidean_norm(&[Real::one(), Real::one()]).unwrap();
    assert_eq!(root_two.as_real() * root_two.as_real(), Real::from(2));
    assert!(!root_two.as_real().is_rational());
    let composed = (root_two.clone() + root_two)
        * RealRadius::from_unsigned_ratio(1, NonZeroU64::new(2).unwrap()).unwrap();
    assert_eq!(composed.as_real() * composed.as_real(), Real::from(2));
    let repeated = RealRadius::euclidean_norm(&[composed.into_real(), Real::from(1)]).unwrap();
    assert_eq!(repeated.as_real() * repeated.as_real(), Real::from(3));
    for numerator in [0, 1, 17, u32::MAX] {
        for denominator in [1, 1000, u64::MAX] {
            let radius =
                RealRadius::from_unsigned_ratio(numerator, NonZeroU64::new(denominator).unwrap())
                    .unwrap();
            assert_eq!(
                radius.into_real() * Real::from(denominator),
                Real::from(numerator)
            );
        }
    }
}

fn legacy(
    source: Rational,
    controller: Rational,
    components: &[Real],
) -> Result<Option<Real>, Problem> {
    if source < Rational::zero() || controller < Rational::zero() {
        return Ok(None);
    }
    let mut squared = Real::zero();
    for component in components {
        squared += component * component;
    }
    let norm = squared.sqrt()?;
    let ratio = (Real::from(17_u32) / Real::from(1000_u64))?;
    let product = norm.clone() * ratio;
    let source = Real::from(source.clone());
    let controller = Real::from(controller.clone());
    Ok(Some(source + controller + norm + product))
}

fn shared(
    source: Rational,
    controller: Rational,
    components: &[Real],
) -> Result<Option<Real>, Problem> {
    let Ok(source) = RationalRadiusRef::new(&source) else {
        return Ok(None);
    };
    let Ok(controller) = RationalRadiusRef::new(&controller) else {
        return Ok(None);
    };
    let norm = RealRadius::euclidean_norm(components)?;
    let ratio = RealRadius::from_unsigned_ratio(17, NonZeroU64::new(1000).unwrap())?;
    let product = norm.clone() * ratio;
    let source = RealRadius::from(source);
    let controller = RealRadius::from(controller);
    Ok(Some((source + controller + norm + product).into_real()))
}

#[test]
fn ordered_composition_preserves_exact_values_and_serialized_definition() {
    for (source, controller) in [(-1, -1), (0, -1), (0, 0), (1, 2)] {
        for components in [
            vec![],
            vec![Real::from(3), Real::from(4)],
            vec![Real::one(), Real::one()],
        ] {
            for _warm in [false, true] {
                let old = legacy(
                    Rational::from(source),
                    Rational::from(controller),
                    &components,
                );
                let new = shared(
                    Rational::from(source),
                    Rational::from(controller),
                    &components,
                );
                assert_eq!(new, old);
                #[cfg(feature = "serde")]
                assert_eq!(
                    serde_json::to_vec(&new.as_ref().unwrap()).unwrap(),
                    serde_json::to_vec(&old.as_ref().unwrap()).unwrap()
                );
            }
        }
    }
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn radius_trace_child() {
    let Ok(case) = std::env::var("HYPERINTERVAL_RADIUS_TRACE_CASE") else {
        return;
    };
    let parts: Vec<_> = case.split(',').collect();
    assert_eq!(parts.len(), 5);
    let source: i32 = parts[1].parse().unwrap();
    let controller: i32 = parts[2].parse().unwrap();
    let coordinates: &[i32] = match parts[3] {
        "0" => &[],
        "1" => &[3, 4],
        "2" => &[1, 1],
        _ => panic!("invalid case"),
    };
    let components: Vec<_> = coordinates.iter().copied().map(Real::from).collect();
    let operation = match parts[0] {
        "legacy" => legacy,
        "shared" => shared,
        _ => panic!("invalid variant"),
    };
    if parts[4] == "true" {
        operation(
            Rational::from(source),
            Rational::from(controller),
            &components,
        )
        .unwrap();
    }
    hyperreal::dispatch_trace::reset();
    hyperreal::dispatch_trace::reset_rational_stats();
    let result = hyperreal::dispatch_trace::with_recording(|| {
        operation(
            Rational::from(source),
            Rational::from(controller),
            &components,
        )
    });
    let trace = hyperreal::dispatch_trace::take_trace();
    println!("RADIUS_RECEIPT {trace:?}");
    println!("RADIUS_VALUE {result:?}");
    #[cfg(feature = "serde")]
    println!(
        "RADIUS_SERIALIZED {}",
        serde_json::to_string(result.as_ref().unwrap()).unwrap()
    );
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn ordered_composition_preserves_complete_scalar_dispatch_in_fresh_processes() {
    // Small-integer interning can share retained arithmetic even between
    // separately constructed values. Compare matched process-local histories,
    // preserving the complete trace rather than removing cache-sensitive counts.
    for (source, controller) in [(-1, -1), (0, -1), (0, 0), (1, 2)] {
        for vector in 0..3 {
            for warm in [false, true] {
                let capture = |variant| {
                    let output = std::process::Command::new(std::env::current_exe().unwrap())
                        .args([
                            "--exact",
                            "radius_trace_child",
                            "--nocapture",
                            "--test-threads=1",
                        ])
                        .env(
                            "HYPERINTERVAL_RADIUS_TRACE_CASE",
                            format!("{variant},{source},{controller},{vector},{warm}"),
                        )
                        .output()
                        .unwrap();
                    assert!(
                        output.status.success(),
                        "{}",
                        String::from_utf8_lossy(&output.stderr)
                    );
                    let output = String::from_utf8(output.stdout).unwrap();
                    let receipts: Vec<_> = output
                        .lines()
                        .filter_map(|line| {
                            line.split_once("RADIUS_")
                                .map(|(_, receipt)| receipt.to_owned())
                        })
                        .collect();
                    assert_eq!(receipts.len(), if cfg!(feature = "serde") { 3 } else { 2 });
                    receipts
                };
                let expected = capture("legacy");
                let actual = capture("shared");
                assert_eq!(
                    actual, expected,
                    "source={source}, controller={controller}, vector={vector}, warm={warm}"
                );
            }
        }
    }
}
