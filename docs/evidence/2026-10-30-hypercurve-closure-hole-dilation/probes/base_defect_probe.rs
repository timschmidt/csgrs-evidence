//! Features that disappear under regularized offsets, followed by further
//! operations on the result. Each expected set is authored independently and
//! compared through an exact empty symmetric difference.
mod support;
// Evidence probe for the base defect table (not committed).

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


fn report(label: &str, framed: &CurveRegion2, distance: Real, points: &[(i64, i64)]) {
    match support::under(&STRICT, || framed.offset(distance, &OffsetCornerStyle2::Round)) {
        Ok(value) => {
            let value = value.into_value();
            let area = support::under(&STRICT, || value.signed_area()).map(|o| o.into_value());
            let locations: Vec<_> = points
                .iter()
                .map(|&(x, y)| {
                    support::under(&STRICT, || value.classify_point(&hypercurve::CurvePoint2::from(p(x, y))))
                        .map(|o| o.into_value())
                })
                .collect();
            // Display only: the exact claims are the classifications and witnesses.
            eprintln!("PROBE {label}: loops {} area/pi ~ {:?} locations {:?}", value.boundary_loops().len(),
                area.ok().flatten().map(|a| (a / Real::pi()).unwrap().to_f64_lossy()), locations);
        }
        Err(error) => eprintln!("PROBE {label}: error {error:?}"),
    }
}

#[test]
#[ignore]
fn base_defect_probe() {
    let annulus = region(&[circle(0, 0, 3, false), circle(0, 0, 1, true)]);
    for (n, d) in [(1, 2), (1, 1), (3, 2), (2, 1)] {
        report(&format!("annulus {n}/{d}"), &annulus, fraction(n, d), &[(0, 0)]);
    }
    let frame = square(8);
    for (name, hole) in [("square", reversed(&square(1))), ("slot", reversed(&polygon(&[(-3, -1), (3, -1), (3, 1), (-3, 1)])))] {
        let framed = region(&[frame.clone(), hole]);
        for (n, d) in [(1, 2), (1, 1), (3, 2), (2, 1)] {
            report(&format!("{name} hole {n}/{d}"), &framed, fraction(n, d), &[(0, 0)]);
        }
    }
    let dumbbell = reversed(&polygon(&[(-6, -2), (-2, -2), (-2, -1), (2, -1), (2, -2), (6, -2), (6, 2), (2, 2), (2, 1), (-2, 1), (-2, 2), (-6, 2)]));
    let framed = region(&[square(10), dumbbell]);
    for (n, d) in [(1, 2), (3, 2), (2, 1), (3, 1)] {
        report(&format!("dumbbell {n}/{d} (lobes, channel)"), &framed, fraction(n, d), &[(-4, 0), (4, 0), (0, 0)]);
    }
    let cut = reversed(&polygon(&[(-4, -4), (4, -4), (4, 3), (3, 4), (-4, 4)]));
    let framed = region(&[square(8), cut]);
    for d in [1, 2] {
        report(&format!("cut-corner hole {d}"), &framed, Real::from(d), &[(0, 0)]);
    }
}
