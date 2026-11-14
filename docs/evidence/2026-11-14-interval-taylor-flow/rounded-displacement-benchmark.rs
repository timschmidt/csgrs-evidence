//! Completed flow proof for x'=x, x(0)=1, horizon 1/4, endpoint width <= 1/8192.
//! Every method retains all required reports and includes output destruction.
//! Exact field/derivative preparation is outside repeated-query measurements.
use criterion::{Criterion, criterion_group, criterion_main};
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    picard::{PicardProposal, PicardReport, PicardStatus},
    taylor_flow::{FlowTaylorProgram, FlowTaylorReport, FlowTaylorStatus},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperreal::Rational;
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
fn scalar() -> DyadicBudget {
    DyadicBudget::new(16384, 1_000_000_000_000)
}
fn field() -> ExpressionField<1> {
    let x = SymbolId(1);
    let t = SymbolId(0);
    let source = ExpressionProgram::compile(
        &[Expr::anonymous_symbol(x)],
        &[x, t],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    ExpressionField::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut budget(),
    )
    .unwrap()
}
fn proposal() -> PicardProposal<1> {
    PicardProposal {
        start: d(0, 0, 0),
        end: d(1, 1, -2),
        initial: BoxN::new([d(1, 1, 0)]).unwrap(),
        candidate: BoxN::new([d(1, 2, 0)]).unwrap(),
    }
}
fn taylor(program: &FlowTaylorProgram<1>) -> FlowTaylorReport<1> {
    let result = program.certify_step(proposal(), &mut budget());
    assert!(matches!(result.status(), FlowTaylorStatus::Certified));
    result
}
fn picard(field: &ExpressionField<1>) -> Vec<PicardReport<1>> {
    // The candidate spans from the current initial lower endpoint through its
    // upper endpoint +2h. Picard verifies this proposal at every actual step.
    // All proposal arithmetic and caller-owned work share their respective
    // explicit budgets; no step resets the field proof budget.
    let mut native = budget();
    let mut arithmetic = scalar();
    let mut initial = BoxN::new([d(1, 1, 0)]).unwrap();
    let mut reports = Vec::new();
    for i in 0..2048 {
        let widened = initial.lanes().unwrap()[0]
            .add(&d(0, 2, -13), &mut arithmetic)
            .unwrap();
        let report = field.certify_step(
            PicardProposal {
                start: d(i, i, -13),
                end: d(i + 1, i + 1, -13),
                initial,
                candidate: BoxN::new([widened]).unwrap(),
            },
            &mut native,
        );
        assert!(
            matches!(report.status(), PicardStatus::Certified),
            "step {i}: {:?}",
            report.status()
        );
        let endpoint = report.end_enclosure().unwrap();
        // Outward transport bounds denominator growth without altering the
        // represented source. Every carried box contains its certified endpoint,
        // and the next report retains that carried box as its exact initial set.
        initial = endpoint.regrid(-64, &mut arithmetic).unwrap();
        assert!(endpoint.subset_of(&initial, &mut arithmetic).unwrap());
        reports.push(report);
    }
    reports
}
fn validate(name: &str, end: &BoxN<DyadicInterval, 1>) {
    let value = end.lanes().unwrap()[0].to_rational(&mut scalar()).unwrap();
    let mut term = Rational::from(1);
    let mut lower = term.clone();
    for k in 1..=10 {
        term = term / (Rational::from(4) * Rational::from(k));
        lower = lower + &term;
    }
    let upper = &lower
        + (&term / Rational::from(44))
            / (Rational::from(1) - Rational::from(1) / Rational::from(48));
    assert!(value.contains_point(&lower));
    assert!(value.contains_point(&upper));
    let width = value.upper().unwrap() - value.lower().unwrap();
    assert!(
        width <= Rational::from(1) / Rational::from(8192),
        "{name}: {width:?}"
    );
    eprintln!("COMPLETED {name} end={end:?} width={width:?}");
}
fn benchmarks(c: &mut Criterion) {
    let field = field();
    let program = field.flow_taylor(3, &mut budget()).unwrap();
    let report = taylor(&program);
    validate("taylor3", report.end_enclosure().unwrap());
    let reports = picard(&field);
    validate(
        "picard2048",
        reports.last().unwrap().end_enclosure().unwrap(),
    );
    assert_eq!(reports.last().unwrap().proposal().end, d(1, 1, -2));
    drop((report, reports));
    let mut group = c.benchmark_group("flow_endpoint_width_1_over_8192");
    group.bench_function("taylor3", |b| {
        b.iter(|| drop(black_box(taylor(black_box(&program)))))
    });
    group.bench_function("picard2048", |b| {
        b.iter(|| drop(black_box(picard(black_box(&field)))))
    });
    group.finish();
    c.bench_function("flow_taylor_prepare_order3", |b| {
        b.iter(|| {
            drop(black_box(
                black_box(&field).flow_taylor(3, &mut budget()).unwrap(),
            ))
        })
    });
}
criterion_group!(benches, benchmarks);
criterion_main!(benches);
