//! Features that disappear under regularized offsets, followed by further
//! operations on the result. Each expected set is authored independently and
//! compared through an exact empty symmetric difference.
mod support;
// TEMPORARY timing probe (not for commit).

use hypercurve::{
    BooleanOp, CircularArc2, Curve2, CurvePath2, CurveRegion2, FillRule, LineSeg2,
    OffsetCornerStyle2, Point2, PredicatePolicy, Real,
};

const STRICT: PredicatePolicy = PredicatePolicy::STRICT;

fn fraction(numerator: i64, denominator: i64) -> Real {
    (Real::from(numerator) / Real::from(denominator)).unwrap()
}

fn p(x: i64, y: i64) -> Point2 {
    Point2::new(Real::from(x), Real::from(y))
}

fn line(start: &Point2, end: &Point2) -> Curve2 {
    Curve2::from(LineSeg2::try_new(start.clone(), end.clone()).unwrap())
}

fn arc(start: &Point2, end: &Point2, center: &Point2, clockwise: bool) -> Curve2 {
    Curve2::from(
        CircularArc2::try_from_center(start.clone(), end.clone(), center.clone(), clockwise)
            .unwrap(),
    )
}

/// A full circle as two half arcs, counterclockwise unless `clockwise`.
fn circle(cx: i64, cy: i64, radius: i64, clockwise: bool) -> CurvePath2 {
    let (east, west, center) = (p(cx + radius, cy), p(cx - radius, cy), p(cx, cy));
    CurvePath2::try_new(vec![
        arc(&east, &west, &center, clockwise),
        arc(&west, &east, &center, clockwise),
    ])
    .unwrap()
}

/// A closed polygon through integer vertices.
fn polygon(points: &[(i64, i64)]) -> CurvePath2 {
    CurvePath2::try_new(
        (0..points.len())
            .map(|i| {
                let (a, b) = (points[i], points[(i + 1) % points.len()]);
                line(&p(a.0, a.1), &p(b.0, b.1))
            })
            .collect(),
    )
    .unwrap()
}

/// The counterclockwise square `[-half, half]^2`.
fn square(half: i64) -> CurvePath2 {
    polygon(&[(-half, -half), (half, -half), (half, half), (-half, half)])
}

fn reversed(path: &CurvePath2) -> CurvePath2 {
    support::under(&STRICT, || path.reversed())
        .unwrap()
        .into_value()
}

/// The square `[-half, half]^2` dilated by `distance` with round corners.
fn rounded_square(half: &Real, distance: &Real) -> CurvePath2 {
    let (near, far) = (half.clone(), half + distance);
    let (nn, nf) = (-near.clone(), -far.clone());
    let q = |x: &Real, y: &Real| Point2::new(x.clone(), y.clone());
    CurvePath2::try_new(vec![
        line(&q(&nn, &nf), &q(&near, &nf)),
        arc(&q(&near, &nf), &q(&far, &nn), &q(&near, &nn), false),
        line(&q(&far, &nn), &q(&far, &near)),
        arc(&q(&far, &near), &q(&near, &far), &q(&near, &near), false),
        line(&q(&near, &far), &q(&nn, &far)),
        arc(&q(&nn, &far), &q(&nf, &near), &q(&nn, &near), false),
        line(&q(&nf, &near), &q(&nf, &nn)),
        arc(&q(&nf, &nn), &q(&nn, &nf), &q(&nn, &nn), false),
    ])
    .unwrap()
}

fn region(paths: &[CurvePath2]) -> CurveRegion2 {
    support::under(&STRICT, || {
        CurveRegion2::try_from_boundary_paths(paths, FillRule::NonZero)
    })
    .unwrap()
    .into_value()
}

fn offset_with(region: &CurveRegion2, distance: Real, style: &OffsetCornerStyle2) -> CurveRegion2 {
    support::under(&STRICT, || region.offset(distance, style))
        .unwrap()
        .into_value()
}

fn offset(region: &CurveRegion2, distance: Real) -> CurveRegion2 {
    offset_with(region, distance, &OffsetCornerStyle2::Round)
}

fn boolean(left: &CurveRegion2, right: &CurveRegion2, op: BooleanOp) -> CurveRegion2 {
    support::under(&STRICT, || left.boolean_region(right, op))
        .unwrap()
        .into_value()
}

fn assert_same_set(label: &str, actual: &CurveRegion2, expected: &CurveRegion2) {
    assert!(
        boolean(actual, expected, BooleanOp::Xor).is_empty(),
        "{label}: the regions differ"
    );
}

#[test]
#[ignore]
fn timing_probe() {
    use std::time::Instant;
    let cases: Vec<(
        &str,
        Box<dyn Fn() -> CurveRegion2>,
        Real,
        OffsetCornerStyle2,
    )> = vec![
        (
            "frame-round",
            Box::new(|| region(&[square(5), reversed(&square(2))])),
            Real::one(),
            OffsetCornerStyle2::Round,
        ),
        (
            "frame-miter",
            Box::new(|| region(&[square(5), reversed(&square(2))])),
            Real::one(),
            OffsetCornerStyle2::Miter {
                limit: Real::from(4),
            },
        ),
        (
            "frame-bevel",
            Box::new(|| region(&[square(5), reversed(&square(2))])),
            Real::one(),
            OffsetCornerStyle2::Bevel,
        ),
        (
            "annulus-half",
            Box::new(|| region(&[circle(0, 0, 3, false), circle(0, 0, 1, true)])),
            fraction(1, 2),
            OffsetCornerStyle2::Round,
        ),
        (
            "pad-hole",
            Box::new(|| region(&[square(3), circle(0, 0, 1, true)])),
            fraction(1, 4),
            OffsetCornerStyle2::Round,
        ),
    ];
    for (label, build, distance, style) in cases {
        let mut samples = Vec::new();
        for _ in 0..15 {
            let r = build();
            let start = Instant::now();
            let out = offset_with(&r, distance.clone(), &style);
            samples.push(start.elapsed());
            std::hint::black_box(out);
        }
        samples.sort();
        eprintln!(
            "TIMING {label}: median {:?} min {:?} max {:?}",
            samples[7], samples[0], samples[14]
        );
    }
}
