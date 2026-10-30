//! Repeated offsets of a convex region bounded by a Pythagorean-hodograph
//! cubic and its chord. Disk offsets of a convex set obey exact identities:
//! dilations compose, closing returns the set, and a dilation followed by a
//! smaller erosion is the difference dilation. The dilated boundary is also
//! rebuilt independently from the materialized rational PH offset.
mod support;
// Evidence probe for the erosion-composition stall (not committed).

use hypercurve::{
    BooleanOp, CircularArc2, Classification, CubicBezier2, Curve2, CurvePath2, CurveRegion2,
    FillRule, LineSeg2, OffsetCornerStyle2, Point2, PredicatePolicy, Real,
};

const STRICT: PredicatePolicy = PredicatePolicy::STRICT;

fn fraction(numerator: i64, denominator: i64) -> Real {
    (Real::from(numerator) / Real::from(denominator)).unwrap()
}

/// P(t) = (t - t^3/3, t^2) on [0, 1], with P'(t) = (1 - t^2, 2t) and
/// |P'(t)| = 1 + t^2. It turns left everywhere, so with the chord back to the
/// origin it bounds a convex region traversed counterclockwise.
fn ph_cubic() -> CubicBezier2 {
    CubicBezier2::new(
        Point2::new(Real::zero(), Real::zero()),
        Point2::new(fraction(1, 3), Real::zero()),
        Point2::new(fraction(2, 3), fraction(1, 3)),
        Point2::new(fraction(2, 3), Real::one()),
    )
}

fn line(start: &Point2, end: &Point2) -> Curve2 {
    Curve2::from(LineSeg2::try_new(start.clone(), end.clone()).unwrap())
}

fn region(paths: &[CurvePath2]) -> CurveRegion2 {
    support::under(&STRICT, || {
        CurveRegion2::try_from_boundary_paths(paths, FillRule::NonZero)
    })
    .unwrap()
    .into_value()
}

fn ph_region() -> CurveRegion2 {
    let end = Point2::new(fraction(2, 3), Real::one());
    region(&[CurvePath2::try_new(vec![
        Curve2::from(ph_cubic()),
        line(&end, &Point2::new(Real::zero(), Real::zero())),
    ])
    .unwrap()])
}

fn offset(region: &CurveRegion2, distance: Real) -> CurveRegion2 {
    support::under(&STRICT, || {
        region.offset(distance, &OffsetCornerStyle2::Round)
    })
    .unwrap()
    .into_value()
}

fn assert_same_set(label: &str, actual: &CurveRegion2, expected: &CurveRegion2) {
    let difference = support::under(&STRICT, || actual.boolean_region(expected, BooleanOp::Xor))
        .unwrap()
        .into_value();
    assert!(difference.is_empty(), "{label}: the regions differ");
}


#[test]
#[ignore]
fn ph_erosion_composition_probe() {
    let source = ph_region();
    let started = std::time::Instant::now();
    let once = offset(&source, -fraction(1, 16));
    eprintln!("PROBE erode 1/16 after {:?}", started.elapsed());
    let started = std::time::Instant::now();
    let twice = offset(&once, -fraction(1, 16));
    eprintln!("PROBE erode 1/16 twice after {:?}: empty {}", started.elapsed(), twice.is_empty());
}
