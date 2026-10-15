use hyperbrep::*;
use hypercurve::{CircularArc2, Contour2, CurveRegion2, Point2 as UV, Segment2};
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/closed_edge_sets.rs"]
mod body_sets;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/closed_cylinder.rs"]
mod fixture;

fn exact<T>(operation: impl FnOnce() -> hypercurve::ExactCurveResult<T>) -> T {
    let result = hypercurve::evaluate_under(hypercurve::PredicatePolicy::STRICT, operation);
    assert_eq!(result.certainty(), hypercurve::CurveCertainty::Certified);
    result.into_unverified().unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    // Group 1: retain identity and replay both senses with shifted UV charts.
    for reversed in [false, true] {
        let model = fixture::build(Real::zero(), -2, reversed).unwrap();
        assert_eq!((model.counts().vertices, model.counts().edges), (2, 3));
        assert!(model.vertices().all(|v| v.edges().count() == 2));
        fixture::check(&fixture::replay(&model));
        fixture::check(&model);
        // Group 2: equal spatial seam points keep distinct parameter endpoints.
        for edge in model
            .edges()
            .filter(|e| e.curve().kind() == Curve3Kind::CircleArc)
        {
            assert_eq!(edge.start(), edge.end());
            for use_ in edge.uses() {
                let mut ends = Vec::new();
                for i in 0..=4 {
                    let t: Parameter = (Real::tau() * Real::from(i) / Real::from(4))
                        .unwrap()
                        .into();
                    let u = use_.pcurve_parameter_at(&t).unwrap();
                    assert_eq!(
                        use_.edge_parameter_at(&u).unwrap().compare(&t).unwrap(),
                        std::cmp::Ordering::Equal
                    );
                    if i == 0 || i == 4 {
                        ends.push(u);
                    }
                }
                assert_ne!(
                    ends[0].compare(&ends[1]).unwrap(),
                    std::cmp::Ordering::Equal
                );
            }
        }
    }
    // Group 3: split every incident use, then reflect and replay.
    let model = fixture::build(Real::zero(), 0, true).unwrap();
    let split = model
        .edges()
        .find(|e| e.curve().kind() == Curve3Kind::CircleArc)
        .unwrap()
        .split(Real::pi().into())
        .unwrap()
        .into_model();
    assert_eq!(
        (
            split.counts().vertices,
            split.counts().edges,
            split.counts().edge_uses
        ),
        (3, 4, 8)
    );
    let split = split
        .edges()
        .find(|e| e.curve().kind() == Curve3Kind::Line)
        .unwrap()
        .split((Real::one() / Real::from(2)).unwrap().into())
        .unwrap()
        .into_model();
    assert_eq!(
        (
            split.counts().vertices,
            split.counts().edges,
            split.counts().edge_uses
        ),
        (4, 5, 10)
    );
    fixture::check(&fixture::replay(
        &split
            .transformed(&Matrix4::affine_nonuniform_scale([
                -Real::one(),
                Real::one(),
                Real::one(),
            ]))
            .unwrap(),
    ));
    // Group 4: existing regularized cylinder Boolean behavior composes.
    let canonical = builder::cylinder(2.into(), 4.into()).unwrap();
    let a = BodySet::from_solid(model.solids().next().unwrap());
    let b = canonical;
    fixture::check(&fixture::replay(boolean::union(&a, &b).unwrap().model()));
    fixture::check(&fixture::replay(
        boolean::intersection(&a, &b).unwrap().model(),
    ));
    assert_eq!(boolean::difference(&a, &b).unwrap().bodies().count(), 0);
    assert_eq!(boolean::difference(&b, &a).unwrap().bodies().count(), 0);
    // Group 5: the independent regular ellipse carrier also admits a closed edge.
    let mut b = ModelBuilder::new();
    let v = b
        .vertex(Point3::new(3.into(), 0.into(), 0.into()).into())
        .unwrap();
    let c = b
        .curve(
            Curve3::ellipse_arc(
                Point3::origin(),
                Vector3::x(),
                Vector3::y(),
                3.into(),
                2.into(),
                Real::zero(),
                Real::tau(),
            )
            .unwrap(),
        )
        .unwrap();
    let half = ParameterDomain::new(Real::zero(), Real::pi()).unwrap();
    assert!(matches!(
        b.edge(&v, &v, &c, half.into()),
        Err(BuildError::ClosedEdgePeriodMismatch)
    ));
    b.edge(
        &v,
        &v,
        &c,
        ParameterDomain::new(Real::zero(), Real::tau())
            .unwrap()
            .into(),
    )
    .unwrap();
    let ellipse = fixture::replay(&b.finish().unwrap());
    assert_eq!(ellipse.vertices().next().unwrap().edges().count(), 1);
    let split = ellipse
        .edges()
        .next()
        .unwrap()
        .split(Real::pi().into())
        .unwrap()
        .into_model();
    assert_eq!(
        (
            fixture::replay(&split).counts().vertices,
            split.counts().edges
        ),
        (2, 2)
    );
    // Group 6: full-circle contours survive region Boolean and offset composition.
    let p = UV::new(2.into(), 0.into());
    let contour = Contour2::try_new(vec![Segment2::Arc(
        CircularArc2::try_from_center(p.clone(), p, UV::new(0.into(), 0.into()), false).unwrap(),
    )])
    .unwrap();
    let region = exact(|| CurveRegion2::try_from_native_material_contours(vec![contour]));
    let offset = exact(|| region.offset(Real::one(), &hypercurve::OffsetCornerStyle2::Round));
    let ring = exact(|| offset.boolean_region(&region, hypercurve::BooleanOp::Difference));
    assert_eq!(
        exact(|| ring.signed_area()),
        Some(Real::from(5) * Real::pi())
    );
    let back = exact(|| offset.offset(-Real::one(), &hypercurve::OffsetCornerStyle2::Round));
    assert_eq!(
        exact(|| back.signed_area()),
        Some(Real::from(4) * Real::pi())
    );
    // Group 7: untrusted points are rechecked, and incomplete periods were rejected above.
    let mut raw: serde_json::Value = serde_json::from_str(&model.to_json().unwrap()).unwrap();
    raw["vertices"][0]["Coordinates"][0] = serde_json::json!(Real::from(3));
    assert!(
        RawModel::from_json(&raw.to_string(), &ArchiveLimits::default())
            .unwrap()
            .validate()
            .is_err()
    );
    // Group 8: disconnected selected subgraphs and empty outputs compose again.
    body_sets::compose();
    8
}
