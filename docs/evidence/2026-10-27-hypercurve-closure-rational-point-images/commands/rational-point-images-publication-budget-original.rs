use hypercurve::*;
use hypersolve::BivariatePolynomial;
use std::cmp::Ordering;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn polynomial(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter().map(|row| row.iter().copied().map(Real::from).collect()).collect(),
    )
}

fn source_and_independent_circle_point() -> (CurvePoint2, CurvePoint2) {
    let parameter = BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![
                (-1).into(), 0.into(), 0.into(), 0.into(), 0.into(), 0.into(), 0.into(), 2.into(),
            ]).unwrap(),
            BezierParameterInterval::try_new(q(3,4), Real::one()).unwrap(),
        ).unwrap(),
    );
    let parabola = Curve2::from(RationalBezier2::try_new(
        vec![Point2::from_values(0,0), Point2::new(q(1,2),0.into()), Point2::from_values(1,1)],
        vec![1.into();3],
    ).unwrap());
    // Independent Bernstein data for (2t/(1+t²), (1-t²)/(1+t²)).
    let circle = Curve2::from(RationalBezier2::try_new(
        vec![Point2::from_values(0,1), Point2::from_values(1,1), Point2::from_values(1,0)],
        vec![1.into(),1.into(),2.into()],
    ).unwrap());
    (
        parabola.point_at(&parameter.clone().into()).unwrap(),
        circle.point_at(&parameter.into()).unwrap(),
    )
}

fn circle_map() -> RationalMap2 {
    RationalMap2::new(
        [polynomial(&[&[0],&[2]]), polynomial(&[&[1,-1]])],
        polynomial(&[&[1,1]]),
    )
}

#[test]
fn native_scalar_image_rational_query_control() {
    let (source, expected) = source_and_independent_circle_point();
    assert!(source.coordinates().is_none());
    for (numerator, coordinate) in [
        (polynomial(&[&[0],&[2]]), polynomial(&[&[0],&[1]])),
        (polynomial(&[&[1,-1]]), polynomial(&[&[0,1]])),
    ] {
        let actual = source.rational_form(numerator,polynomial(&[&[1,1]])).unwrap();
        let independent = expected.rational_form(coordinate,polynomial(&[&[1]])).unwrap();
        assert_eq!(actual.compare(&independent).unwrap(),Ordering::Equal);
    }
}

#[test]
fn native_scalar_point_image_replays_and_reenters_another_rational_map() {
    let (source, expected) = source_and_independent_circle_point();
    let mapped = source.rational_image(&circle_map()).unwrap();
    assert!(mapped.coincides_with(&expected).unwrap());
    let unit = mapped.rational_form(
        polynomial(&[&[-1,0,1],&[],&[1]]), polynomial(&[&[1]]),
    ).unwrap();
    assert_eq!(unit.compare_to_real(&Real::zero()).unwrap(),Ordering::Equal);
    let replay = mapped.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&expected).unwrap());
    // Recover (t,t²), using t = X/(1+Y) and preserving its original guard.
    let inverse = RationalMap2::new(
        [polynomial(&[&[0],&[1,1]]),polynomial(&[&[],&[],&[1]])],
        polynomial(&[&[1,2,1]]),
    );
    assert!(replay.rational_image(&inverse).unwrap().coincides_with(&source).unwrap());
}

#[test]
fn native_scalar_point_map_rejects_the_original_pole() {
    let (source, _) = source_and_independent_circle_point();
    let pole = polynomial(&[&[-1],&[],&[],&[],&[],&[],&[],&[2]]);
    let invalid = RationalMap2::new([pole.clone(),pole.clone()],pole);
    assert!(matches!(source.rational_image(&invalid),
        Err(ExactCurveError::Invalid {cause:CurveError::ZeroRationalPointDenominator,..})
    ));
}

#[test]
fn native_scalar_point_image_does_not_publish_after_reached_exhaustion() {
    use hypersolve::work_budget::{with_budget,WorkBudget};
    let (source,_)=source_and_independent_circle_point();
    let attempt=with_budget(WorkBudget::ZERO,|| {
        let result=source.rational_image(&circle_map());
        assert!(hypersolve::work_budget::exhaustion().is_some());
        assert!(matches!(result,Err(ExactCurveError::Blocked(blocker)) if blocker.reason()==UncertaintyReason::BudgetExhausted));
    });
    let reached=attempt.result.unwrap_err();
    assert_eq!((reached.limit,reached.used),(0,0));
    assert!(reached.requested>0);
}
