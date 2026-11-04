//! Elimination must retain selected coefficient fields for its next consumer.
#[path = "support/recursive_quadratic.rs"]
#[allow(dead_code)]
mod support;
use support::{TestContext, constant_tensor};
use hyperreal::{Real, RealSign};
use hypersolve::classification::Classification;
use hypersolve::{CurveResultantParameter, OrderedFieldRootIsolationStatus,
    isolate_ordered_field_polynomial_roots_complete, ordered_field_resultant_bivariate};
use hypersolve::recursive_quadratic_field::RecursiveQuadraticField;
use hypersolve::selected_polynomial_field::{SelectedPolynomialField, SelectedPolynomialContext};

fn decided<T: std::fmt::Debug>(value: Classification<T>) -> T {
    match value {Classification::Decided(value)=>value, other=>panic!("exact result: {other:?}")}
}
fn base() -> SelectedPolynomialField {
    SelectedPolynomialField::from_recursive(RecursiveQuadraticField::base(vec![],
        constant_tensor(0, Real::one()), constant_tensor(0, Real::one())).unwrap())
}
#[test]
fn selected_quintic_coefficients_feed_elimination_and_another_selection() {
    for policy in [TestContext::strict(), TestContext::approximate()] {
        let q=base();
        let field=decided(q.select([5,5,0,0,0,1].into_iter().map(|n|q.constant(n.into()).unwrap()).collect(),
            (-1).into(),0.into(),&policy).unwrap());
        let a=field.generator().unwrap();let b=a.add(&field.constant(1.into()).unwrap()).unwrap();
        let c=|n:i32|field.constant(n.into()).unwrap();
        // F=t-s^2, G=t-(a+1). Elimination is exactly s^2-(a+1),
        // including its scale. It has two real roots, one in each half.
        let first=vec![vec![c(0),c(1)],vec![],vec![c(-1)]];
        let second=vec![vec![b.scale(&(-1).into()).unwrap(),c(1)]];
        let mut context=SelectedPolynomialContext{field:field.clone(),policy:&policy};
        let result=ordered_field_resultant_bivariate(&first,&second,CurveResultantParameter::First,&mut context).unwrap();
        assert_eq!(result.len(),3);
        assert_eq!(decided(result[0].add(&b).unwrap().sign(&policy).unwrap()),RealSign::Zero);
        assert_eq!(decided(result[1].sign(&policy).unwrap()),RealSign::Zero);
        assert_eq!(decided(result[2].subtract(&c(1)).unwrap().sign(&policy).unwrap()),RealSign::Zero);
        let report=isolate_ordered_field_polynomial_roots_complete(result.clone(),&(-1).into(),&1.into(),4,&mut context).unwrap();
        assert_eq!(report.status,OrderedFieldRootIsolationStatus::Isolated);
        assert_eq!(report.intervals.len(),2);
        let root=decided(field.select(result,report.intervals[1].lower.clone(),report.intervals[1].upper.clone(),&policy).unwrap());
        let s=root.generator().unwrap();let lifted=root.lift(&b).unwrap();
        assert_eq!(decided(s.multiply(&s).unwrap().subtract(&lifted).unwrap().sign(&policy).unwrap()),RealSign::Zero);
        assert_eq!(policy.approximations(),0);
    }
}
