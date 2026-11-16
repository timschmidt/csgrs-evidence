use hyperdynamics::field::{
    EnclosedVectorField, EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest, EvolutionStatus},
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let time = SymbolId(0);
    let state = SymbolId(1);
    let source = ExpressionProgram::compile(
        &[Expr::int(2)],
        &[time, state],
        &mut ExpressionBudget::new(1000, 10000),
    )?;
    let mut budget = EnclosureBudget::new(EnclosurePolicy::default());
    let field = ExpressionField::<1>::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time,
            state: vec![state],
        },
        &mut budget,
    )?;
    let point = |n: i64| DyadicInterval::point(n.into(), 0);
    let mut initial = BoxN::new([point(0)?])?;
    for start in 0..2 {
        let report = field.integrate(
            EvolutionRequest {
                start: point(start)?,
                end: point(start + 1)?,
                initial,
            },
            EvolutionOptions::default(),
            &mut budget,
        );
        assert!(matches!(report.status(), EvolutionStatus::Completed));
        assert_eq!(report.identity(), &field.identity());
        initial = report.end_enclosure().expect("completed horizon").clone();
        assert_eq!(initial.lanes(), Some(&[point(2 * (start + 1))?]));
    }
    Ok(())
}
