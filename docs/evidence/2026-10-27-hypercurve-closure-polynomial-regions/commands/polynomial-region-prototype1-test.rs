//! The original polynomial-boundary region witness must reach one arrangement.

use hypercurve::{
    Curve2, CurveLoopOrientation2, CurveParameterRange2, CurvePath2, CurveRegion2, FillRule,
    LineSeg2, Point2, PolynomialCurveSet2, Real,
};
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn parabola_path() -> CurvePath2 {
    let equation = BivariatePolynomial::new(vec![
        vec![Real::zero(), Real::zero(), Real::one()],
        vec![(-1).into()],
    ]);
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    let set =
        PolynomialCurveSet2::from_topology(topology, AlgebraicFiberRootIsolationConfig::default())
            .unwrap();
    assert_eq!(set.curves().len(), 2);
    let range = CurveParameterRange2::try_new(Real::zero().into(), q(1, 4).into()).unwrap();
    CurvePath2::try_new(vec![
        set.curves()[0].restrict_source(range.clone()).unwrap(),
        Curve2::from(
            LineSeg2::try_new(
                Point2::new(q(1, 4), q(-1, 2)),
                Point2::new(q(1, 4), q(1, 2)),
            )
            .unwrap(),
        ),
        set.curves()[1]
            .restrict_source(range)
            .unwrap()
            .reversed()
            .unwrap(),
    ])
    .unwrap()
}

#[test]
fn original_parabola_path_has_exact_loop_orientation() {
    let path = parabola_path();
    assert_eq!(
        path.simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Counterclockwise
    );
    assert_eq!(
        path.reversed().unwrap().simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Clockwise
    );
}

#[test]
fn original_parabola_path_is_admitted_to_the_shared_region() {
    let path = parabola_path();
    for fill in [FillRule::NonZero, FillRule::EvenOdd] {
        let region =
            CurveRegion2::try_from_boundary_paths(std::slice::from_ref(&path), fill).unwrap();
        assert_eq!(region.boundary_loops().len(), 1);
        assert_eq!(region.boundary_loops()[0].curves().len(), 3);
    }
}
