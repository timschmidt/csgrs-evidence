use hyperreal::Real;
use hypersolve::{
    AlgebraicFiberRationalReductionStatus, AlgebraicRootRepresentation,
    AlgebraicRootValidationReport, AlgebraicRootValidationStatus, BivariatePolynomial,
    CurveResultantParameter, IsolatedRootInterval, PredicatePolicy, SymbolId,
    reduce_bivariate_rational_function_at_algebraic_parameter,
};
use serde_json::{Value, json};
fn scalar(v: &Value) -> Real {
    if let Some(value) = v.as_str() { return value.parse().unwrap(); }
    let pair = v.as_array().expect("exact quadratic field pair");
    assert_eq!(pair.len(), 2);
    let a: Real = pair[0].as_str().unwrap().parse().unwrap();
    let b: Real = pair[1].as_str().unwrap().parse().unwrap();
    a + b * Real::from(89).sqrt().unwrap()
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
    assert_eq!(report.certainty,hypersolve::PredicateCertainty::Exact);
    // Emit only bounded metadata before any inspection. The earlier probe
    // compared concrete representations with assert_eq!, whose panic can
    // recursively format a very large exact expression.
    eprintln!("R16_KERNEL_RETURN status={:?} certainty={:?} numerator_len={} denominator_len={} query_ns={}",report.status,report.certainty,report.numerator_coefficients.len(),report.denominator_coefficients.len(),ns);
    let literal_numerator = report.numerator_coefficients.len()==1 && report.numerator_coefficients[0].exact_rational_ref().is_some_and(|q| if control=="plus-one"{q.is_one()}else{q.is_zero()});
    let literal_denominator = report.denominator_coefficients.len()==1 && report.denominator_coefficients[0].exact_rational_ref().is_some_and(|q|q.is_one());
    let expected_status = if control=="zero-denominator" {AlgebraicFiberRationalReductionStatus::ZeroDenominator}else{AlgebraicFiberRationalReductionStatus::ReducedToRetainedField};
    assert!(report.status==expected_status,"unexpected reduction status; bounded metadata above");
    println!("{}",json!({"control":control,"status":format!("{:?}",report.status),"certainty":format!("{:?}",report.certainty),"query_ns":ns,"numerator_coefficients":report.numerator_coefficients.len(),"denominator_coefficients":report.denominator_coefficients.len(),"literal_expected_numerator":literal_numerator,"literal_unit_denominator":literal_denominator,"scope":"Shape inspection only. Independent algebra verifies the input quotient; this run does not independently replay the native exported field expression. Nonliteral form is not a semantic failure."}));

}
