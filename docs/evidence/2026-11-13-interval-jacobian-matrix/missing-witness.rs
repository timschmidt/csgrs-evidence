#![cfg(feature = "interval-program")]
use hyperinterval::{DyadicBudget, DyadicInterval};
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
#[test]
fn fixed_size_projection_retains_source_evidence() {
    let mut graph = ExpressionBudget::new(10000, 1000000);
    let mut arithmetic = DyadicBudget::new(1024, 1000000);
    let source = ExpressionProgram::compile(&[Expr::anonymous_symbol(SymbolId(0))], &[SymbolId(0)], &mut graph).unwrap();
    let jacobian = source.jacobian(&[SymbolId(0)], &mut graph).unwrap();
    let evidence = jacobian.enclose_regular(&[DyadicInterval::new(1.into(), 2.into(), 0).unwrap()], -8, &mut graph, &mut arithmetic).unwrap();
    let projected = evidence.matrix::<1, 1>(&mut graph, &mut arithmetic).unwrap();
    assert!(core::ptr::eq(projected.evidence(), &evidence));
}
