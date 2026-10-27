//! Point identity across independently retained polynomial event fibers.

use hypercurve::{CurvePoint2, PolynomialCurveSet2, Real};
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};

fn curves(rows: &[&[i64]]) -> PolynomialCurveSet2 {
    let polynomial = BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    );
    let topology = decompose_bivariate_curve(
        &polynomial,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    PolynomialCurveSet2::from_topology(topology, AlgebraicFiberRootIsolationConfig::default())
        .unwrap()
}

fn interior_and_event() -> (CurvePoint2, CurvePoint2) {
    let first = curves(&[&[0, 0, 1], &[0], &[-1]]);
    let second = curves(&[&[0, -1, 2], &[1, -2]]);
    let half = (Real::one() / Real::from(2)).unwrap();
    (
        first.curves()[3].point_at(&half.into()).unwrap(),
        second.curves()[1].end().clone(),
    )
}

#[test]
fn interior_and_event_points_compare_with_retained_base_relations() {
    // y=x in F=(y-x)(y+x), and the event (1/2,1/2) of
    // G=(y-x)(2y-1), selected independently after the original sets drop.
    let (first, second) = interior_and_event();
    let result = hypersolve::work_budget::with_budget(
        hypersolve::work_budget::WorkBudget {
            refinements: 512,
            promotions: 1,
        },
        || first.coincides_with(&second),
    );
    eprintln!("comparison work {:?}", result.usage);
    assert!(result.result.unwrap().unwrap());
}
