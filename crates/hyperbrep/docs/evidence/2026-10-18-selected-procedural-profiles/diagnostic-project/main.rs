use hyperbrep::{ArchiveLimits, Curve3, Point3, RawModel, Vector3, builder};
use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, BezierParameterRange2, BooleanOp, Curve2, CurvePath2, CurveRegion2,
    CurveRegionLoopRole, FillRule, LineSeg2, Point2, QuadraticBezier2, Real,
};

#[allow(dead_code)]
#[path = "../../../../tests/support/parallel_profile_extrusion.rs"]
mod original;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn lift() {
    let selected = BezierAlgebraicParameter2::try_isolate(
        BezierParameterPolynomial::try_new_power_basis(vec![
            (-1).into(),
            0.into(),
            0.into(),
            2.into(),
        ])
        .unwrap(),
        BezierParameterInterval::try_new(q(3, 4), q(7, 8)).unwrap(),
    )
    .unwrap();
    let source = Curve2::try_analytic_parallel(
        QuadraticBezier2::new(
            Point2::from_values(0, 0),
            Point2::from_values(2, 2),
            Point2::from_values(4, 0),
        )
        .parallel_left(Real::one())
        .unwrap(),
        BezierParameterRange2::try_new(
            BezierParameter2::Exact(0.into()),
            BezierParameter2::Algebraic(selected),
        )
        .unwrap(),
    )
    .unwrap();
    assert!(source.parameter_endpoints().1.scalar().is_none());
    let _curve = Curve3::planar_image(source, Point3::origin(), Vector3::x(), Vector3::y())
        .expect("selected-domain planar lift must retain its endpoints");
}

fn clipped() {
    let points = [
        Point2::from_values(0, -3),
        Point2::from_values(1, -3),
        Point2::from_values(1, 3),
        Point2::from_values(0, 3),
    ];
    let path = CurvePath2::try_new(
        (0..4)
            .map(|i| {
                Curve2::from(
                    LineSeg2::try_new(points[i].clone(), points[(i + 1) % 4].clone()).unwrap(),
                )
            })
            .collect(),
    )
    .unwrap();
    let clip = CurveRegion2::try_from_boundary_paths_with_loop_semantics(
        &[path],
        &[CurveRegionLoopRole::Material],
        &[FillRule::NonZero],
    )
    .unwrap();
    let region = original::original_parallel_cap()
        .boolean_region(&clip, BooleanOp::Intersection)
        .expect("the owner must complete the original full cap's exact planar cut");
    let selected = region
        .boundary_loops()
        .iter()
        .flat_map(|b| b.curves())
        .filter(|curve| {
            let (a, b) = curve.parameter_endpoints();
            a.scalar().is_none()
                || b.scalar().is_none()
                || curve.start().coordinates().is_none()
                || curve.end().coordinates().is_none()
        })
        .count();
    assert!(selected > 0);
    println!("selected_boundary_curves={selected}");
    for (index, curve) in region.boundary_loops().iter().flat_map(|b| b.curves()).enumerate() {
        let (a, b) = curve.parameter_endpoints();
        println!("boundary={index} family={:?} native={} restriction={} parallel={} scalar_endpoints=({}, {}) bezier_endpoints=({}, {}) chord_endpoints=({}, {}) represented_points=({}, {})",
            curve.family(), curve.geometry().is_some(), curve.source_restriction().is_some(), curve.analytic_parallel().is_some(),
            a.scalar().is_some(), b.scalar().is_some(), a.as_bezier_parameter().is_some(), b.as_bezier_parameter().is_some(), a.is_algebraic_chord(), b.is_algebraic_chord(),
            curve.start().coordinates().is_some(), curve.end().coordinates().is_some());
    }
    let bodies = builder::extrude_curve_region(&region, Real::zero(), Real::from(3))
        .expect("a selected procedural profile must construct a complete solid");
    assert_eq!(bodies.len(), 1);
    let json = bodies
        .model()
        .to_json()
        .expect("selected profile native archive");
    let cold = RawModel::from_json(&json, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .expect("selected profile cold replay");
    assert_eq!(cold.to_json().unwrap(), json);
}

fn main() {
    match std::env::args().nth(1).as_deref() {
        Some("lift") => lift(),
        Some("clip") => clipped(),
        other => panic!("unknown diagnostic {other:?}"),
    }
}
