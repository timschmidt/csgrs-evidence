#![cfg(feature = "field")]
use std::sync::Arc;
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest, EvolutionStatus},
    sensitivity::SensitivityOptions,
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::{BoxN, IntervalMatrix};
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
fn d(a: i64, b: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(a.into(), b.into(), e).unwrap()
}
fn budget() -> EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn field<const N: usize>(outputs: &[Expr]) -> ExpressionField<N> {
    let state: Vec<_> = (0..N).map(|i| SymbolId(i as u32)).collect();
    let time = SymbolId(u32::MAX);
    let mut variables = state.clone(); variables.push(time);
    let source = ExpressionProgram::compile(outputs, &variables,
        &mut ExpressionBudget::new(1_000_000, 100_000_000)).unwrap();
    ExpressionField::from_definition(FieldDefinition {
        source: source.definition().clone(), time, state,
    }, &mut budget()).unwrap()
}
#[test]
fn uncertain_shear_has_exact_composed_initial_state_sensitivity() {
    let f = field::<2>(&[Expr::anonymous_symbol(SymbolId(1)), Expr::int(0)]);
    let source = Arc::new(f.integrate(EvolutionRequest {
        start: d(0,0,0), end: d(1,1,-1),
        initial: BoxN::new([d(-1,1,0), d(-1,1,0)]).unwrap(),
    }, EvolutionOptions { maximum_step: Some(d(1,1,-3)), ..Default::default() }, &mut budget()));
    assert!(matches!(source.status(), EvolutionStatus::Completed));
    let result = source.clone().sensitivity(SensitivityOptions::default(), &mut budget()).unwrap();
    assert!(Arc::ptr_eq(result.source(), &source));
    assert_eq!(result.steps().len(), 4);
    let expected = IntervalMatrix::new([[d(1,1,0), d(1,1,-1)], [d(0,0,0),d(1,1,0)]]).unwrap();
    assert_eq!(result.end_matrix(), Some(&expected));
    assert!(result.steps().iter().all(|s| s.tail_norm_bound()==&d(0,0,0)));
}
