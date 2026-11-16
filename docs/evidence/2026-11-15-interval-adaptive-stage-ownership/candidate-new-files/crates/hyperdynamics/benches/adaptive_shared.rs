//! Complete independent/shared adaptive histories, including all trajectory preparation.
use criterion::{Criterion, criterion_group, criterion_main};
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest},
    taylor_flow::adaptive::{
        AdaptiveTaylorEvolution, AdaptiveTaylorField, AdaptiveTaylorOptions, AdaptiveTaylorStatus,
        shared::{SharedAdaptiveTaylorEvolution, SharedAdaptiveTaylorField},
    },
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
use std::hint::black_box;
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn controller(case: usize) -> AdaptiveTaylorField<1> {
    let t = SymbolId(0);
    let x = SymbolId(1);
    let v = Expr::anonymous_symbol(x);
    let rhs = match case {
        0 => Expr::int(2),
        1 => v,
        _ => v.clone() * v,
    };
    let p = ExpressionProgram::compile(
        &[rhs],
        &[x, t],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    let f = ExpressionField::<1>::from_definition(
        FieldDefinition {
            source: p.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut budget(),
    )
    .unwrap();
    f.adaptive_taylor(AdaptiveTaylorOptions {
        maximum_order: 3,
        remainder_limits: [d(1, 1, -10)],
        native: EvolutionOptions {
            maximum_step: Some(d(1, 1, -3)),
            ..Default::default()
        },
        ..Default::default()
    })
}
fn request() -> EvolutionRequest<1> {
    EvolutionRequest {
        start: d(0, 0, 0),
        end: d(1, 1, -2),
        initial: BoxN::new([d(1, 1, 0)]).unwrap(),
    }
}
enum Outcome {
    Independent(AdaptiveTaylorEvolution<1>),
    Shared(SharedAdaptiveTaylorEvolution<1>),
}
impl Outcome {
    fn report(&self) -> &AdaptiveTaylorEvolution<1> {
        match self {
            Self::Independent(r) => r,
            Self::Shared(r) => r.report(),
        }
    }
}
fn complete(
    c: &AdaptiveTaylorField<1>,
    shared: &SharedAdaptiveTaylorField<1>,
    reuse: bool,
    b: &mut EnclosureBudget,
) -> Outcome {
    let out = if reuse {
        Outcome::Shared(shared.integrate(request(), b))
    } else {
        Outcome::Independent(c.integrate(request(), b))
    };
    assert!(matches!(
        out.report().status(),
        AdaptiveTaylorStatus::Completed
    ));
    for segment in out.report().segments() {
        assert_eq!(segment.refinement().meets_limits(), Some(true));
        assert!(segment.refinement().evidence().remainder().is_some());
    }
    out
}
fn benchmark(c: &mut Criterion) {
    for (case, name) in ["constant", "exponential", "riccati"]
        .into_iter()
        .enumerate()
    {
        let controller = controller(case);
        let shared = controller.clone().share_preparation();
        let expected = complete(&controller, &shared, false, &mut budget());
        let check = complete(&controller, &shared, true, &mut budget());
        assert_eq!(
            format!("{:?}", expected.report()),
            format!("{:?}", check.report())
        );
        for reuse in [false, true] {
            let mode = if reuse { "shared" } else { "independent" };
            c.bench_function(&format!("adaptive_preparation/{name}/{mode}"), |b| {
                b.iter(|| {
                    let out = complete(black_box(&controller), &shared, reuse, &mut budget());
                    assert_eq!(
                        out.report().end_enclosure(),
                        expected.report().end_enclosure()
                    );
                    assert_eq!(
                        out.report().attempts().len(),
                        expected.report().attempts().len()
                    );
                    assert_eq!(
                        out.report().segments().len(),
                        expected.report().segments().len()
                    );
                    drop(black_box(out));
                })
            });
        }
    }
}
criterion_group!(benches, benchmark);
criterion_main!(benches);
