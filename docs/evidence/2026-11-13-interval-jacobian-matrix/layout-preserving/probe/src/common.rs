//! Cost control only. Independent derivatives live in the acceptance tests.
//! The handwritten control uses the same fallible scalar copies, budgets,
//! shape/domain semantics, inline storage and retained evidence as the public API.
#[path = "allocations.rs"]
mod allocations;
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice::IntervalMatrix;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{
        ExpressionBudget, ExpressionError, ExpressionProgram, RegularJacobianEnclosure,
    },
};
use std::{hint::black_box, time::Instant};
const WORK: u64 = 1_000_000_000_000;
fn graph() -> ExpressionBudget {
    ExpressionBudget::new(1_000_000, 100_000_000)
}
fn arithmetic() -> DyadicBudget {
    DyadicBudget::new(1_000_000, WORK)
}

fn manual<'a, const R: usize, const C: usize>(
    evidence: &'a RegularJacobianEnclosure,
    graph: &mut ExpressionBudget,
    arithmetic: &mut DyadicBudget,
) -> Result<
    (
        &'a RegularJacobianEnclosure,
        IntervalMatrix<DyadicInterval, R, C>,
    ),
    ExpressionError,
> {
    graph.charge(0)?;
    let program = evidence.program();
    let actual = (
        program.source().definition().outputs.len(),
        program.variables().len(),
    );
    if actual.0 != R {
        return Err(ExpressionError::JacobianRows {
            expected: R,
            actual: actual.0,
        });
    }
    if actual.1 != C {
        return Err(ExpressionError::JacobianColumns {
            expected: C,
            actual: actual.1,
        });
    }
    let entries = R.checked_mul(C).ok_or(ExpressionError::SizeExhausted)?;
    graph.check_entries(&[R, C, entries, evidence.arguments().len()])?;
    graph.charge(evidence.arguments().len())?;
    let matrix = if evidence.arguments().iter().any(DyadicInterval::is_empty) {
        IntervalMatrix::empty().map_err(ExpressionError::Lattice)?
    } else {
        graph.charge(R + entries)?;
        let mut slots: [[Option<DyadicInterval>; C]; R] =
            std::array::from_fn(|_| std::array::from_fn(|_| None));
        for (row, values) in slots.iter_mut().enumerate() {
            for (column, value) in values.iter_mut().enumerate() {
                graph.charge(1)?;
                let index = program.partial_output(row, column).expect("checked shape");
                *value = Some(
                    evidence.values()[index]
                        .checked_pow(1, arithmetic)
                        .map_err(|source| ExpressionError::Enclosure {
                            node: program.program().definition().outputs[index],
                            source,
                        })?,
                );
            }
        }
        graph.charge(R + entries)?;
        IntervalMatrix::new(slots.map(|row| row.map(|v| v.expect("complete matrix"))))
            .map_err(ExpressionError::Lattice)?
    };
    graph.charge(0)?;
    Ok((evidence, matrix))
}
fn fixture<const R: usize, const C: usize>(digits: usize, empty: bool) -> RegularJacobianEnclosure {
    let variables: Vec<_> = (0..C)
        .map(|i| SymbolId(u32::try_from(i).unwrap()))
        .collect();
    let outputs: Vec<_> = (0..R)
        .map(|row| {
            let mut expression = Expr::int(1);
            for (column, variable) in variables.iter().enumerate() {
                expression = expression
                    + Expr::int((row + column + 1) as i64)
                        * Expr::anonymous_symbol(*variable).powi(2);
            }
            expression
        })
        .collect();
    let source = ExpressionProgram::compile(&outputs, &variables, &mut graph()).unwrap();
    let selected: Vec<_> = variables.iter().rev().copied().collect();
    let arguments: Vec<_> = variables
        .iter()
        .map(|_| {
            if empty {
                DyadicInterval::empty()
            } else {
                let upper = format!("1{}", "0".repeat(digits));
                DyadicInterval::new(1.into(), upper.parse().unwrap(), 0).unwrap()
            }
        })
        .collect();
    source
        .jacobian(&selected, &mut graph())
        .unwrap()
        .enclose_regular(&arguments, -32, &mut graph(), &mut arithmetic())
        .unwrap()
}
fn completed<const SHARED: bool, const R: usize, const C: usize>(
    source: &RegularJacobianEnclosure,
) -> (DyadicInterval, usize, u64) {
    let mut graph = graph();
    let mut arithmetic = arithmetic();
    let before = graph.remaining_work();
    let value = if SHARED {
        let projection = source.matrix::<R, C>(&mut graph, &mut arithmetic).unwrap();
        black_box(projection.evidence());
        let value = projection
            .intervals()
            .norm_infinity(&mut arithmetic)
            .unwrap();
        black_box(projection);
        value
    } else {
        let projection = manual::<R, C>(source, &mut graph, &mut arithmetic).unwrap();
        black_box(projection.0);
        let value = projection.1.norm_infinity(&mut arithmetic).unwrap();
        black_box(projection);
        value
    };
    (
        value,
        before - graph.remaining_work(),
        WORK - arithmetic.remaining_work(),
    )
}
fn case<const SHARED: bool, const R: usize, const C: usize>(digits: usize, empty: bool) {
    let source = fixture::<R, C>(digits, empty);
    let matrix = if SHARED {
        source
            .matrix::<R, C>(&mut graph(), &mut arithmetic())
            .unwrap()
            .into_intervals()
    } else {
        manual::<R, C>(&source, &mut graph(), &mut arithmetic())
            .unwrap()
            .1
    };
    println!("VALUE {R} {C} {digits} {empty} {matrix:?}");
    let stats = allocations::measure(16, || completed::<SHARED, R, C>(&source));
    assert_eq!(stats.live_bytes, 0);
    assert_eq!(stats.allocations, stats.deallocations);
    println!(
        "ALLOC {R} {C} {digits} {empty} {} {} {} {} {} {}",
        stats.allocations,
        stats.deallocations,
        stats.reallocations,
        stats.allocated_bytes,
        stats.peak_live_bytes,
        stats.live_bytes
    );
    let (count, bytes) = (
        stats.allocations + stats.reallocations,
        stats.allocated_bytes,
    );
    let (value, graph, arithmetic) = completed::<SHARED, R, C>(&source);
    println!("COST {R} {C} {digits} {empty} {count} {bytes} {graph} {arithmetic} {value:?}");
    if std::env::var_os("TIMING").is_some() {
        let mut samples = Vec::new();
        for _ in 0..31 {
            let start = Instant::now();
            for _ in 0..64 {
                black_box(completed::<SHARED, R, C>(black_box(&source)));
            }
            samples.push(start.elapsed().as_nanos() / 64);
        }
        println!("TIME {R} {C} {digits} {empty} {samples:?}");
    }
}
pub fn run<const SHARED: bool>() {
    for digits in [1, 80, 1200] {
        case::<SHARED, 1, 1>(digits, false);
        case::<SHARED, 3, 2>(digits, false);
        case::<SHARED, 8, 8>(digits, false);
    }
    case::<SHARED, 3, 2>(1, true);
    case::<SHARED, 0, 1>(1, false);
    case::<SHARED, 1, 0>(1, false);
}
