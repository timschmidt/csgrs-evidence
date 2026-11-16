#[cfg(feature = "noise")]
use hyperdynamics::field::taylor_flow::noise::{FlowNoiseRequest, FlowNoiseState, FlowNoiseStatus};
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    picard::PicardProposal,
    taylor_flow::{FlowTaylorProgram, FlowTaylorReport, FlowTaylorStatus},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
#[cfg(feature = "noise")]
use std::sync::Arc;
use std::{hint::black_box, time::Instant};
#[cfg(feature = "allocation")]
mod allocation;

type Box2 = BoxN<DyadicInterval, 2>;
fn interval(lo: i64, hi: i64, exponent: i32) -> DyadicInterval {
    DyadicInterval::new(lo.into(), hi.into(), exponent).unwrap()
}
fn initial() -> Box2 {
    BoxN::new([interval(-1, 1, 0), interval(-1, 1, 0)]).unwrap()
}
fn candidate() -> Box2 {
    BoxN::new([interval(-2, 2, 0), interval(-1, 1, 0)]).unwrap()
}
fn fields(constant: bool) -> [ExpressionField<2>; 2] {
    let time = SymbolId(10);
    let x = SymbolId(20);
    let y = SymbolId(30);
    [1, -1].map(|sign| {
        let source = ExpressionProgram::compile(
            &[
                Expr::int(sign)
                    * if constant {
                        Expr::int(1)
                    } else {
                        Expr::anonymous_symbol(y)
                    },
                Expr::int(0),
            ],
            &[y, time, x],
            &mut ExpressionBudget::new(100_000, 1_000_000),
        )
        .unwrap();
        ExpressionField::from_definition(
            FieldDefinition {
                source: source.definition().clone(),
                time,
                state: vec![x, y],
            },
            &mut EnclosureBudget::new(EnclosurePolicy::default()),
        )
        .unwrap()
    })
}
fn prepare(
    fields: &[ExpressionField<2>; 2],
    budget: &mut EnclosureBudget,
) -> [FlowTaylorProgram<2>; 2] {
    fields
        .each_ref()
        .map(|field| field.flow_taylor(1, budget).unwrap())
}
enum Proofs {
    Boxes(Vec<FlowTaylorReport<2>>),
    #[cfg(feature = "noise")]
    Noise(Arc<FlowNoiseState<2>>),
}
struct Output {
    hull: Box2,
    hull_work: u64,
    // Both paths retain the complete two-step evidence until destruction.
    proofs: Proofs,
    cover: Vec<Box2>,
}
fn complete(
    programs: &[FlowTaylorProgram<2>; 2],
    noise: bool,
    cells: usize,
    constant: bool,
    budget: &mut EnclosureBudget,
) -> Output {
    if noise {
        #[cfg(feature = "noise")]
        {
            let mut state =
                Arc::new(FlowNoiseState::new(interval(0, 0, 0), initial(), budget).unwrap());
            for (step, program) in programs.iter().enumerate() {
                let report = program.certify_noise_step(
                    state,
                    FlowNoiseRequest {
                        end: interval(step as i64 + 1, step as i64 + 1, -2),
                        candidate: candidate(),
                        maximum_noise: 2,
                    },
                    budget,
                );
                assert!(
                    matches!(report.status(), FlowNoiseStatus::Certified),
                    "{:?}",
                    report.status()
                );
                state = report.end_state().unwrap().clone();
            }
            let hull = state.enclosure().clone();
            return Output {
                hull_work: 0,
                cover: vec![hull.clone()],
                hull,
                proofs: Proofs::Noise(state),
            };
        }
        #[cfg(not(feature = "noise"))]
        panic!("noise feature disabled");
    }
    let cells = if constant { 1 } else { cells };
    assert!(cells.is_power_of_two() && cells >= 1);
    let mut proofs = Vec::with_capacity(2 * cells);
    let mut cover = Vec::with_capacity(cells);
    let mut hull = Box2::empty().unwrap();
    let mut arithmetic = DyadicBudget::new(16_384, 1_000_000_000_000);
    for cell in 0..cells {
        // Consecutive dyadic cells cover [-1,1] exactly, sharing boundaries.
        let y = interval(
            2 * cell as i64 - cells as i64,
            2 * cell as i64 + 2 - cells as i64,
            -(cells.ilog2() as i32),
        );
        let mut state = Box2::new([interval(-1, 1, 0), y]).unwrap();
        for (step, program) in programs.iter().enumerate() {
            let report = program.certify_step(
                PicardProposal {
                    start: interval(step as i64, step as i64, -2),
                    end: interval(step as i64 + 1, step as i64 + 1, -2),
                    initial: state,
                    candidate: candidate(),
                },
                budget,
            );
            assert!(
                matches!(report.status(), FlowTaylorStatus::Certified),
                "{:?}",
                report.status()
            );
            state = report.end_enclosure().unwrap().clone();
            proofs.push(report);
        }
        hull = hull.hull(&state, &mut arithmetic).unwrap();
        cover.push(state);
    }
    Output {
        hull,
        hull_work: 1_000_000_000_000 - arithmetic.remaining_work(),
        cover,
        proofs: Proofs::Boxes(proofs),
    }
}
fn validate(output: &Output, noise: bool, cells: usize, constant: bool) {
    // Independent exact map is identity. A y-cell of width 2/M produces x
    // width 2+1/M under independent box propagation; noise retains width 2.
    let expected = if noise || constant {
        initial()
    } else {
        let bound = 2 * cells as i64 + 1;
        Box2::new([
            interval(-bound, bound, -(cells.ilog2() as i32) - 1),
            interval(-1, 1, 0),
        ])
        .unwrap()
    };
    assert_eq!(output.hull, expected);
    match &output.proofs {
        Proofs::Boxes(reports) => {
            let count = if constant { 1 } else { cells };
            assert_eq!(reports.len(), 2 * count);
            assert_eq!(output.cover.len(), count);
        }
        #[cfg(feature = "noise")]
        Proofs::Noise(state) => {
            assert_eq!(state.enclosure(), &output.hull);
            assert!(state.evidence().unwrap().initial().evidence().is_some());
            assert_eq!(output.cover.len(), 1);
        }
    }
}
fn main() {
    let args: Vec<String> = std::env::args().collect();
    let noise = args[1] == "noise";
    let constant = args[2] == "constant";
    let cells: usize = args[3].parse().unwrap();
    let cold = args[4] == "cold";
    let rounds: usize = args[5].parse().unwrap();
    let source = fields(constant);
    let prepared = (!cold).then(|| {
        prepare(
            &source,
            &mut EnclosureBudget::new(EnclosurePolicy::default()),
        )
    });
    for iteration in 0..rounds {
        let mut budget = EnclosureBudget::new(EnclosurePolicy::default());
        #[cfg(feature = "allocation")]
        let baseline = allocation::AllocationStats::rust_snapshot().live_bytes;
        #[cfg(feature = "allocation")]
        {
            allocation::rust_tracking_reset();
            allocation::rust_tracking_enable(true);
        }
        let started = Instant::now();
        let local = prepared
            .is_none()
            .then(|| prepare(black_box(&source), &mut budget));
        let programs = prepared.as_ref().or(local.as_ref()).unwrap();
        let output = complete(black_box(programs), noise, cells, constant, &mut budget);
        validate(&output, noise, cells, constant);
        #[cfg(feature = "allocation")]
        let retained = allocation::AllocationStats::rust_snapshot();
        let hull_work = output.hull_work;
        drop(black_box(output));
        // The cold programs must be destroyed before the timer ends, too.
        drop(local);
        let elapsed = started.elapsed().as_nanos();
        #[cfg(feature = "allocation")]
        {
            allocation::rust_tracking_enable(false);
            if iteration > 0 {
                assert_eq!(
                    allocation::AllocationStats::rust_snapshot().live_bytes,
                    baseline,
                    "no retained growth after the first complete workload"
                );
            }
            println!(
                "allocation iteration={iteration} baseline={baseline} retained={retained:?} final={:?}",
                allocation::AllocationStats::rust_snapshot()
            );
        }
        println!(
            "sample iteration={iteration} ns={elapsed} graph={} scalar={} hull_scalar={hull_work} certified=true",
            budget.policy().graph_work - budget.remaining_graph_work(),
            budget.policy().scalar_work - budget.remaining_scalar_work()
        );
    }
    drop(prepared);
    #[cfg(feature = "allocation")]
    let after_prepared = allocation::AllocationStats::rust_snapshot().live_bytes;
    drop(source);
    #[cfg(feature = "allocation")]
    println!(
        "cleanup after_prepared={after_prepared} after_source={}",
        allocation::AllocationStats::rust_snapshot().live_bytes
    );
}
