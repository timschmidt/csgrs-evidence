//! Lazy shared coefficient preparation with exact uncertain polynomial endpoints.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest},
    taylor_flow::adaptive::{AdaptiveTaylorOptions, AdaptiveTaylorStatus},
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
/// Run the shared controller and check exact endpoint and retained preparation.
pub fn run() -> Result<(), Box<dyn std::error::Error>> {
    let t = SymbolId(0);
    let x = SymbolId(1);
    let mut b = EnclosureBudget::new(EnclosurePolicy::default());
    let source = ExpressionProgram::compile(
        &[Expr::int(2) * Expr::anonymous_symbol(t)],
        &[x, t],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )?;
    let f = ExpressionField::<1>::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut b,
    )?;
    let controller = f
        .adaptive_taylor(AdaptiveTaylorOptions {
            maximum_order: 3,
            remainder_limits: [d(0, 0, 0)],
            native: EvolutionOptions {
                maximum_step: Some(d(1, 1, -3)),
                ..Default::default()
            },
            ..Default::default()
        })
        .share_preparation();
    let outcome = controller.integrate(
        EvolutionRequest {
            start: d(0, 0, 0),
            end: d(1, 1, -1),
            initial: BoxN::new([d(3, 4, 0)])?,
        },
        &mut b,
    );
    let report = outcome.report();
    assert!(matches!(report.status(), AdaptiveTaylorStatus::Completed));
    assert_eq!(
        report.end_enclosure().unwrap().lanes(),
        Some(&[d(13, 17, -2)])
    );
    assert_eq!(
        report
            .programs()
            .iter()
            .map(|p| p.order())
            .collect::<Vec<_>>(),
        [0, 1, 2]
    );
    assert!(std::ptr::eq(
        report.programs()[1].stages()[1].program().definition(),
        report.programs()[2].stages()[1].program().definition()
    ));
    assert!(
        report
            .attempts()
            .iter()
            .flat_map(|a| a.refinements())
            .any(|r| r.meets_limits() == Some(false))
    );
    Ok(())
}
#[cfg(not(test))]
fn main() -> Result<(), Box<dyn std::error::Error>> {
    run()
}
