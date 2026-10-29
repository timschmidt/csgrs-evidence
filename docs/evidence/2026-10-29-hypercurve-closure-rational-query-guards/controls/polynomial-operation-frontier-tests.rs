
// An elliptic support prevents the frontier from being reduced to a catalog
// of rationally parameterizable curves. On this selected cap the filled set
// is -1 <= x <= 0 and y^2 <= 1 + x^3, with rational corner coordinates.
fn elliptic_operation_frontier_region() -> CurveRegion2 {
    let equation = BivariatePolynomial::new(vec![
        vec![(-1).into(), 0.into(), 1.into()],
        vec![],
        vec![],
        vec![(-1).into()],
    ]);
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-2).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    ).unwrap();
    let set = PolynomialCurveSet2::from_topology(
        topology, AlgebraicFiberRootIsolationConfig::default(),
    ).unwrap();
    assert_eq!(set.curves().len(), 2);
    let range = CurveParameterRange2::try_new(Real::from(-1).into(), Real::zero().into()).unwrap();
    let path = CurvePath2::try_new(vec![
        set.curves()[0].restrict_source(range.clone()).unwrap(),
        Curve2::from(LineSeg2::try_new(
            Point2::new(0.into(), (-1).into()),
            Point2::new(0.into(), 1.into()),
        ).unwrap()),
        set.curves()[1].restrict_source(range).unwrap().reversed().unwrap(),
    ]).unwrap();
    assert_eq!(path.simple_loop_orientation().unwrap(), CurveLoopOrientation2::Counterclockwise);
    CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero).unwrap()
}

#[test]
fn polynomial_operation_frontier_parabola_control() {
    polynomial_region_classifies_native_and_retained_points();
}

#[test]
fn polynomial_operation_frontier_elliptic_control() {
    let source = elliptic_operation_frontier_region();
    for (x,y,expected) in [
        (q(-1,2), Real::zero(), RegionPointLocation::Inside),
        (q(-1,2), Real::one(), RegionPointLocation::Outside),
        (Real::from(-2), Real::zero(), RegionPointLocation::Outside),
        (Real::from(-1), Real::zero(), RegionPointLocation::Boundary),
        (Real::zero(), Real::zero(), RegionPointLocation::Boundary),
    ] {
        assert_eq!(source.classify_point(&Point2::new(x,y).into()).unwrap(), expected);
    }
    assert_eq!(source.boundary_loops().len(), 1);
    let paths = source.boundary_paths().unwrap();
    assert_eq!(paths[0].curves().iter().filter(|curve| curve.polynomial_branch().is_some()).count(), 2);
}

// These are completion probes, not a full A4 acceptance corpus. A failure is
// retained as a missing-algorithm witness; it is not geometric completion.
#[test]
fn polynomial_operation_frontier_parabola_offset() {
    parabola_region().offset(q(1,64), &hypercurve::OffsetCornerStyle2::Round)
        .expect("A4 nonzero offset of the selected parabola cap");
}

#[test]
fn polynomial_operation_frontier_parabola_chamfer() {
    parabola_region().chamfer_loop_vertex_by_setbacks(
        0,1,q(1,64),q(1,64),hypercurve::CurveCornerMode2::TrimOnly,
    ).expect("A4 chord-setback chamfer of the selected parabola cap");
}

#[test]
fn polynomial_operation_frontier_parabola_fillet() {
    parabola_region().fillet_loop_vertex(
        0,1,&hypercurve::CurveFillet2::new(q(1,64)),hypercurve::CurveCornerMode2::TrimOnly,
    ).expect("A4 circular fillet of the selected parabola cap");
}

#[test]
fn polynomial_operation_frontier_elliptic_offset() {
    elliptic_operation_frontier_region().offset(q(1,64), &hypercurve::OffsetCornerStyle2::Round)
        .expect("A4 nonzero offset of the selected elliptic cap");
}

#[test]
fn polynomial_operation_frontier_elliptic_chamfer() {
    elliptic_operation_frontier_region().chamfer_loop_vertex_by_setbacks(
        0,1,q(1,64),q(1,64),hypercurve::CurveCornerMode2::TrimOnly,
    ).expect("A4 chord-setback chamfer of the selected elliptic cap");
}

#[test]
fn polynomial_operation_frontier_elliptic_fillet() {
    elliptic_operation_frontier_region().fillet_loop_vertex(
        0,1,&hypercurve::CurveFillet2::new(q(1,64)),hypercurve::CurveCornerMode2::TrimOnly,
    ).expect("A4 circular fillet of the selected elliptic cap");
}

fn elliptic_algebraic_corner_frontier() -> (CurveRegion2, usize) {
    let source = elliptic_operation_frontier_region();
    let selected = source.boolean_region(
        &rectangle((-2).into(), 1.into(), (-2).into(), q(1,2)),
        BooleanOp::Intersection,
    ).unwrap();
    let paths = selected.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    let reference = Point2::new(Real::zero(), q(1,2)).into();
    let mut matches = Vec::new();
    for (index, curve) in paths[0].curves().iter().enumerate() {
        if curve.polynomial_branch().is_none() { continue; }
        let point = curve.start();
        if point.compare_coordinate(&reference, hypercurve::Axis2::Y).unwrap() != std::cmp::Ordering::Equal {
            continue;
        }
        assert_eq!(point.compare_coordinate(&reference, hypercurve::Axis2::X).unwrap(), std::cmp::Ordering::Less);
        // The Boolean cut is the unique negative root of x^3 + 3/4,
        // with y=1/2 on the original y^2=1+x^3 support. No rounded
        // coordinate is an input to either the oracle or the next edit.
        let residual = point.rational_form(
            BivariatePolynomial::new(vec![vec![q(3,4)],vec![],vec![],vec![Real::one()]]),
            BivariatePolynomial::new(vec![vec![Real::one()]]),
        ).unwrap();
        assert_eq!(residual.compare_to_real(&Real::zero()).unwrap(), std::cmp::Ordering::Equal);
        let previous = (index + paths[0].curves().len() - 1) % paths[0].curves().len();
        assert!(paths[0].curves()[previous].end().coincides_with(&point).unwrap());
        matches.push(index);
    }
    assert_eq!(matches.len(), 1);
    (selected, matches[0])
}

#[test]
fn polynomial_operation_frontier_elliptic_algebraic_control() {
    elliptic_algebraic_corner_frontier();
}

#[test]
fn polynomial_operation_frontier_elliptic_algebraic_chamfer() {
    let (source, vertex) = elliptic_algebraic_corner_frontier();
    source.chamfer_loop_vertex_by_setbacks(
        0,vertex,q(1,64),q(1,64),hypercurve::CurveCornerMode2::TrimOnly,
    ).expect("A4 chamfer at a generated algebraic corner of the selected elliptic cap");
}
