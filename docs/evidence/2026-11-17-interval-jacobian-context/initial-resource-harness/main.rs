mod allocation;
use hyperreal::Real;
use hypersolve::jacobian::{FiniteDifferenceConfig, finite_difference_jacobian};
use hypersolve::{
    Constraint, ConstraintKind, EvaluationContext, Expr, Problem, SymbolId, context_from_problem,
};
use std::ffi::c_void;

unsafe extern "C" {
    fn measure_stack(
        callback: unsafe extern "C" fn(*mut c_void),
        context: *mut c_void,
        warm: i32,
        pattern: u8,
    ) -> usize;
}

fn fixture(case: usize) -> (Problem, EvaluationContext, Real, Vec<Vec<f64>>) {
    let mut p = Problem::default();
    let x = Expr::symbol(SymbolId(0), "x");
    let mut step = Real::one();
    let expected = match case {
        0 | 1 => {
            let center = if case == 0 { 1 } else { -3 };
            p.add_variable("x", Real::from(center));
            p.add_constraint(Constraint::equality("square", x.powi(2)));
            vec![vec![f64::from(2 * center + 1)]]
        }
        2 => {
            p.add_variable("x", Real::one());
            p.add_variable("y", Real::from(2));
            let y = Expr::symbol(SymbolId(1), "y");
            p.add_constraint(Constraint::equality(
                "mixed",
                x.clone().powi(2) + y.clone().powi(2) + x * y,
            ));
            vec![vec![5.0, 6.0]]
        }
        3 => {
            p.add_variable("x", Real::one());
            p.add_variable("fixed", Real::from(2));
            p.variables[1].fixed = true;
            p.add_variable("unused", Real::from(4));
            let mut row = Constraint::equality(
                "weighted",
                x.clone().powi(2) + Expr::symbol(SymbolId(1), "fixed"),
            );
            row.weight = Real::from(2);
            p.add_constraint(row);
            let mut inactive = Constraint::equality("inactive", x);
            inactive.active = false;
            p.add_constraint(inactive);
            vec![vec![6.0, 0.0, 0.0]]
        }
        4 => {
            p.add_variable("unused", Real::one());
            vec![]
        }
        5 => {
            p.add_variable("x", Real::from(2));
            p.add_constraint(Constraint::equality(
                "linear",
                Expr::int(3) * x + Expr::int(1),
            ));
            vec![vec![3.0]]
        }
        6 | 7 => {
            p.add_variable("x", Real::one());
            let mut row = Constraint::equality("hinge", x - Expr::int(2));
            row.kind = if case == 6 {
                ConstraintKind::LessOrEqual
            } else {
                ConstraintKind::GreaterOrEqual
            };
            p.add_constraint(row);
            if case == 6 {
                step = Real::from(2);
            }
            vec![vec![if case == 6 { 0.5 } else { -1.0 }]]
        }
        _ => panic!("case"),
    };
    let context = if case == 3 {
        let mut context = EvaluationContext::default();
        context.bind(SymbolId(0), Real::one());
        context.bind(SymbolId(1), Real::from(2));
        context
    } else {
        context_from_problem(&p)
    };
    (p, context, step, expected)
}

fn bits(matrix: &[Vec<f64>]) -> Vec<Vec<u64>> {
    matrix
        .iter()
        .map(|row| row.iter().map(|value| value.to_bits()).collect())
        .collect()
}

struct Context {
    problem: Problem,
    values: EvaluationContext,
    step: Real,
    output: Option<Vec<Vec<f64>>>,
}

unsafe extern "C" fn callback(opaque: *mut c_void) {
    let c = unsafe { &mut *opaque.cast::<Context>() };
    c.output = Some(
        finite_difference_jacobian(
            &c.problem,
            &c.values,
            FiniteDifferenceConfig {
                step: c.step.clone(),
            },
        )
        .unwrap(),
    );
}

fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 4);
    let case: usize = args[0].parse().unwrap();
    let mode = args[1].as_str();
    let warm: i32 = args[2].parse().unwrap();
    assert!((0..=1).contains(&warm));
    let pattern: u8 = args[3].parse().unwrap();
    let (problem, values, step, expected) = fixture(case);
    if mode == "stack" {
        let mut c = Context {
            problem,
            values,
            step,
            output: None,
        };
        let stack =
            unsafe { measure_stack(callback, (&mut c as *mut Context).cast(), warm, pattern) };
        let output = c.output.unwrap();
        assert_eq!(bits(&output), bits(&expected));
        println!("STACK {case} {warm} {pattern} {stack} {:?}", bits(&output));
    } else {
        assert_eq!(mode, "observe");
        let run = || {
            finite_difference_jacobian(
                &problem,
                &values,
                FiniteDifferenceConfig { step: step.clone() },
            )
            .unwrap()
        };
        if warm != 0 {
            for _ in 0..8 {
                drop(std::hint::black_box(run()));
            }
        }
        let (output, measured) = allocation::observe(run);
        assert_eq!(bits(&output), bits(&expected));
        println!("OUTPUT {case} {warm} {:?}", bits(&output));
        println!("ALLOCATION {case} {warm} {measured:?}");
        let (_, cleanup) = allocation::observe(|| drop(output));
        println!("CLEANUP {case} {warm} {cleanup:?}");
        #[cfg(feature = "trace")]
        {
            hyperreal::dispatch_trace::reset();
            let output = hyperreal::dispatch_trace::with_recording(run);
            let trace = hyperreal::dispatch_trace::take_trace();
            assert_eq!(trace.layer_count("hyperlimit"), 0);
            assert_eq!(bits(&output), bits(&expected));
            println!("TRACE {case} {warm} {trace:?}");
        }
    }
}
