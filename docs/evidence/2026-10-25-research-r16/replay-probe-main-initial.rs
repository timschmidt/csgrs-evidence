use hyperreal::Real;
use hypersolve::{
    AlgebraicFiberRationalReductionStatus, AlgebraicRootRepresentation,
    AlgebraicRootValidationReport, AlgebraicRootValidationStatus, BivariatePolynomial,
    CurveResultantParameter, IsolatedRootInterval, PredicatePolicy, SymbolId,
    reduce_bivariate_rational_function_at_algebraic_parameter,
};
use serde_json::{Value, json};
fn scalar(v: &Value) -> Real {
    v.as_str().expect("exact rational capture").parse().unwrap()
}
fn polynomial(v: &Value) -> BivariatePolynomial {
    BivariatePolynomial::new(
        v.as_array().unwrap().iter().map(|row| row.as_array().unwrap().iter().map(scalar).collect()).collect(),
    )
}
fn main() {
    let args=std::env::args().collect::<Vec<_>>();
    let data:Value=serde_json::from_slice(&std::fs::read(&args[1]).unwrap()).unwrap();
    let control=args.get(2).map(String::as_str).unwrap_or("zero");
    let retained=AlgebraicRootRepresentation {
        constraint_index: data["constraint_index"].as_u64().unwrap() as usize,
        symbol:SymbolId(0),interval_index:data["interval_index"].as_u64().unwrap() as usize,
        polynomial_coefficients:data["root_polynomial"].as_array().unwrap().iter().map(scalar).collect(),
        interval:IsolatedRootInterval { lower:scalar(&data["root_lower"]),upper:scalar(&data["root_upper"]),exact_root:None,distinct_root_count:1 },
        validation:AlgebraicRootValidationReport {status:AlgebraicRootValidationStatus::Valid,message:None},
    };
    assert!(!data["root_has_exact"].as_bool().unwrap());
    let incidence=polynomial(&data["polynomials"][0]);let mut predicate=polynomial(&data["polynomials"][1]);
    if control=="plus-one" { predicate.coefficients[0][0] += Real::one(); }
    let denominator=BivariatePolynomial::new(vec![vec![if control=="zero-denominator" {Real::zero()} else {Real::one()}]]);
    let axis=match data["retained_parameter"].as_str().unwrap(){"First"=>CurveResultantParameter::First,"Second"=>CurveResultantParameter::Second,_=>panic!("axis")};
    let start=std::time::Instant::now();
    let report=reduce_bivariate_rational_function_at_algebraic_parameter(&incidence,&predicate,&denominator,axis,&retained,PredicatePolicy::STRICT);
    let ns=start.elapsed().as_nanos();
    assert_eq!(report.certainty,hypersolve::Certainty::Exact);
    if control=="zero-denominator" {assert_eq!(report.status,AlgebraicFiberRationalReductionStatus::ZeroDenominator);}
    else {
        assert_eq!(report.status,AlgebraicFiberRationalReductionStatus::ReducedToRetainedField);
        assert_eq!(report.denominator_coefficients,vec![Real::one()]);
        assert_eq!(report.numerator_coefficients,vec![if control=="plus-one"{Real::one()}else{Real::zero()}]);
    }
    println!("{}",json!({"control":control,"status":format!("{:?}",report.status),"certainty":format!("{:?}",report.certainty),"query_ns":ns,"numerator":format!("{:?}",report.numerator_coefficients),"denominator":format!("{:?}",report.denominator_coefficients),"scope":"Existing API replay on diagnostic checkout; one observation, no performance claim"}));
}
