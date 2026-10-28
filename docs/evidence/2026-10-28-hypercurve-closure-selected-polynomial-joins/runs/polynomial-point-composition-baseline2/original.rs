use hypercurve::*;
use hypersolve::{BivariatePolynomial, IsolatedRootInterval};
use std::cmp::Ordering;

fn polynomial(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(rows.iter().map(|row| row.iter().copied().map(Real::from).collect()).collect())
}
fn cube_point(n: i32) -> CurvePoint2 {
    CurvePointDefinition2::PolynomialFiber {
        equation: polynomial(&[&[0, 0, 0, 1], &[-1]]),
        parameter: BezierParameter2::Exact(Real::from(n)),
        root: IsolatedRootInterval { lower: 1.into(), upper: 2.into(), exact_root: None, distinct_root_count: 1 },
    }.into_point().unwrap()
}
fn y(point: &CurvePoint2) -> CurvePointRationalForm2 {
    point.rational_form(polynomial(&[&[0, 1]]), polynomial(&[&[1]])).unwrap()
}
fn constant(point: &CurvePoint2, n: i32) -> CurvePointRationalForm2 {
    point.rational_form(polynomial(&[&[n]]), polynomial(&[&[1]])).unwrap()
}
#[test]
fn independent_polynomial_point_sources_satisfy_original_equations() {
    for n in [2, 3] {
        let p = cube_point(n);
        assert!(p.coordinates().is_none());
        let relation = p.rational_form(polynomial(&[&[0, 0, 0, 1], &[-1]]), polynomial(&[&[1]])).unwrap();
        assert_eq!(relation.compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        let cubic = p.rational_form(polynomial(&[&[0, 0, 0, 1]]), polynomial(&[&[1]])).unwrap();
        assert_eq!(cubic.compare_to_real(&Real::from(n)).unwrap(), Ordering::Equal);
        assert_eq!(y(&p).compare_to_real(&Real::one()).unwrap(), Ordering::Greater);
    }
}
#[test]
fn independent_polynomial_point_queries_compose_and_replay() {
    let first = cube_point(2);
    let second = cube_point(3);
    let sum = y(&first).add(&y(&second)).expect("independent exact point fields must compose");
    assert!(sum.operands().is_some());
    assert_eq!(sum.compare_to_real(&2.into()).unwrap(), Ordering::Greater);
    assert_eq!(sum.compare_to_real(&3.into()).unwrap(), Ordering::Less);
    let cube = sum.multiply(&sum).unwrap().multiply(&sum).unwrap();
    let shifted = cube.subtract(&constant(&first, 5)).unwrap();
    // (a+b)^3-5=3ab(a+b), with a^3=2 and b^3=3.
    let residual = shifted.multiply(&shifted).unwrap().multiply(&shifted).unwrap()
        .subtract(&cube.scaled(&162.into()).unwrap()).unwrap();
    assert_eq!(residual.compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    let replayed_source = sum.source().definition().unwrap().into_point().unwrap();
    let replayed = replayed_source.rational_form(sum.numerator().clone(), sum.denominator().clone()).unwrap();
    assert_eq!(sum.compare(&replayed).unwrap(), Ordering::Equal);
}
#[test]
fn independent_polynomial_point_zero_divisor_stays_invalid() {
    let first = cube_point(2);
    let second = cube_point(3);
    let zero = second.rational_form(polynomial(&[&[-3, 0, 0, 1]]), polynomial(&[&[1]])).unwrap();
    assert!(matches!(y(&first).divide(&zero), Err(ExactCurveError::Invalid { cause: CurveError::ZeroRationalPointDenominator, .. })));
}
