#![cfg(feature = "curve")]
//! R04: an unrelated curved component must not quantize an exact line member.
//!
//! The circular sibling is deliberately sampled by these modeling operations.
//! Its construction qualification must coexist with the other component's exact
//! authored coordinates. This does not claim an analytic circular mesh.

use csgrs::{GeometryCertainty, GeometryContext, GeometryOutcome, Real, TriangleMesh, curve};
use hypercurve::{CircularArc2, Contour2, CurveRegion2, Point2, Segment2};
use hyperlattice::Point3;
use hyperlimit::{PredicateOutcome, PredicatePolicy};

fn r(value: i64) -> Real {
    Real::from(value)
}

fn equal(a: &Real, b: &Real) -> bool {
    matches!(
        hyperlimit::compare_reals(a, b, PredicatePolicy::STRICT),
        PredicateOutcome::Decided {
            value: std::cmp::Ordering::Equal,
            ..
        }
    )
}

fn circular_sibling() -> Contour2 {
    let center = Point2::from_values(10, 0);
    let a = Point2::from_values(11, 0);
    let b = Point2::from_values(9, 0);
    Contour2::try_new(vec![
        Segment2::Arc(
            CircularArc2::try_from_center(a.clone(), b.clone(), center.clone(), false)
                .unwrap(),
        ),
        Segment2::Arc(CircularArc2::try_from_center(b, a, center, false).unwrap()),
    ])
    .unwrap()
}

fn check_exact_member(origin: Real, width: Real) {
    let right = &origin + width;
    let line_loop = Contour2::from_real_ring(&[
        [origin.clone(), r(2)],
        [right.clone(), r(2)],
        [right.clone(), r(3)],
        [origin.clone(), r(3)],
        [origin, r(2)],
    ])
    .unwrap();
    let mut failures = Vec::new();
    for mixed in [false, true] {
        let mut materials = vec![line_loop.clone()];
        if mixed {
            materials.push(circular_sibling());
        }
        let profile = CurveRegion2::try_from_native_contours(materials, Vec::new()).unwrap();
        for operation in ["triangulate", "extrude", "twist-zero", "sweep", "revolve"] {
            let context = &GeometryContext::STRICT;
            let result: Result<GeometryOutcome<TriangleMesh>, _> = match operation {
                "triangulate" => curve::try_triangulate(&profile, context),
                "extrude" => curve::try_extrude(&profile, r(2), context),
                "twist-zero" => {
                    curve::extrude_twisted(&profile, r(2), r(0), [r(1), r(1)], 1, context)
                },
                "sweep" => curve::try_sweep(
                    &profile,
                    &[Point3::origin(), Point3::new(r(0), r(0), r(2))],
                    context,
                ),
                _ => curve::revolve(&profile, r(360), 4, context),
            };
            match result {
                Ok(outcome) => {
                    assert_eq!(outcome.certainty, GeometryCertainty::Certified);
                    let mesh = outcome.into_value();
                    assert_eq!(mesh.construction_evidence().source_sampled(), mixed);
                    if !mixed {
                        assert!(!mesh.construction_evidence().coordinates_projected());
                    }
                    if !mesh.positions.iter().any(|point| {
                        equal(&point.x, &right)
                            && equal(&point.y, &r(2))
                            && equal(&point.z, &r(0))
                    }) {
                        failures
                            .push(format!("{operation}, mixed={mixed}: exact vertex lost"));
                    }
                },
                Err(error) => failures.push(format!("{operation}, mixed={mixed}: {error}")),
            }
        }
    }
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

#[test]
#[ignore = "R04 open: an unrelated curved loop quantizes exact line members"]
fn rational_member_survives_a_curved_sibling() {
    check_exact_member(r(1), (r(1) / r(3)).unwrap());
}

#[test]
#[ignore = "R04 open: an unrelated curved loop quantizes exact line members"]
fn irrational_member_survives_a_curved_sibling() {
    check_exact_member(r(1), r(2).sqrt().unwrap());
}

#[test]
#[ignore = "R04 open: finite projection collapses the narrow exact component"]
fn tiny_member_survives_a_curved_sibling() {
    check_exact_member(r(1), (r(1) / r(2).powi(80.into()).unwrap()).unwrap());
}

#[test]
#[ignore = "R04 open: finite projection collapses the translated exact component"]
fn translated_member_survives_a_curved_sibling() {
    check_exact_member(r(2).powi(70.into()).unwrap(), (r(1) / r(3)).unwrap());
}
