use hypercircuit::LinearMnaSystem;
#[test]
fn existing_mna_has_a_retained_interval_consumer() {
    let system = LinearMnaSystem { unknowns: vec![], matrix: vec![], rhs: vec![] };
    let _ = system.residual_program(&mut hypersolve::expression_program::ExpressionBudget::new(100, 1000));
}
