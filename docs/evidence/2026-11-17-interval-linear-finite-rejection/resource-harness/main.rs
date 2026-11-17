mod allocation;
use linalg_probe::{
    DenseLinearBackend, LinearAdapterKind, LinearBackend, LinearSolveError, LinearSolveReport,
};
use std::ffi::c_void;
type Output = Result<(Vec<f64>, LinearSolveReport), LinearSolveError>;
unsafe extern "C" {
    fn measure_stack(
        callback: unsafe extern "C" fn(*mut c_void),
        context: *mut c_void,
        warm: i32,
        pattern: u8,
    ) -> usize;
}
struct Fixture {
    method: usize,
    matrix: Vec<Vec<f64>>,
    vector: Vec<f64>,
    parameter: f64,
    expected: Option<Vec<f64>>,
}
fn fixture(case: usize) -> Fixture {
    let (method, matrix, vector, parameter, expected) = match case {
        0 => (0, vec![vec![2.0]], vec![-4.0], 0.0, Some(vec![2.0])),
        1 => (0, vec![vec![2.0]], vec![-5.0], 1.0, Some(vec![2.0])),
        2 => (
            0,
            vec![vec![1.0, 2.0], vec![0.0, 1.0]],
            vec![-7.0, -2.0],
            0.0,
            Some(vec![3.0, 2.0]),
        ),
        3 => (
            0,
            vec![vec![2.0], vec![2.0]],
            vec![-4.0, -4.0],
            0.0,
            Some(vec![2.0]),
        ),
        4 | 5 => {
            let n = if case == 4 { 8 } else { 32 };
            let matrix = (0..n)
                .map(|i| (0..n).map(|j| if i == j { 2.0 } else { 0.0 }).collect())
                .collect();
            (
                0,
                matrix,
                (1..=n).map(|i| -2.0 * i as f64).collect(),
                0.0,
                Some((1..=n).map(|i| i as f64).collect()),
            )
        }
        6 => (0, vec![], vec![], 0.0, Some(vec![])),
        7 => (0, vec![vec![]], vec![1.0], 0.0, Some(vec![])),
        8 => (1, vec![vec![2.0]], vec![-4.0], 3.0, Some(vec![2.0])),
        9 => (1, vec![vec![2.0]], vec![-4.0], 1.0, Some(vec![1.0])),
        10 => (
            1,
            vec![vec![1.0, 0.0], vec![0.0, 2.0]],
            vec![-1.0, -2.0],
            1.2,
            None,
        ),
        11 => (1, vec![], vec![], 1.0, Some(vec![])),
        12 => (
            2,
            vec![vec![1.0, 0.0], vec![0.0, 1.0]],
            vec![3.0, 4.0],
            10.0,
            Some(vec![-3.0, -4.0]),
        ),
        13 => (
            2,
            vec![vec![1.0, 0.0], vec![0.0, 1.0]],
            vec![3.0, 4.0],
            2.5,
            Some(vec![-1.5, -2.0]),
        ),
        14 => (2, vec![], vec![], 1.0, Some(vec![])),
        15 => (0, vec![vec![0.0]], vec![1.0], 0.0, None),
        _ => panic!("case"),
    };
    Fixture {
        method,
        matrix,
        vector,
        parameter,
        expected,
    }
}
fn run(f: &Fixture) -> Output {
    let b = DenseLinearBackend;
    match f.method {
        0 => b.solve_damped_normal(&f.matrix, &f.vector, f.parameter),
        1 => b.solve_dogleg(&f.matrix, &f.vector, f.parameter),
        2 => b.solve_bfgs_direction(&f.matrix, &f.vector, f.parameter),
        _ => unreachable!(),
    }
}
fn validate(f: &Fixture, case: usize, out: &Output) {
    if case == 15 {
        assert_eq!(out.as_ref().unwrap_err(), &LinearSolveError::Singular);
        return;
    }
    let (x, r) = out.as_ref().unwrap();
    assert!(r.lossy && r.is_lossy());
    assert_eq!(r.precision(), r.adapter.precision());
    assert_eq!(
        r.adapter,
        if f.method == 2 {
            LinearAdapterKind::DenseF64BfgsDirection
        } else {
            LinearAdapterKind::DenseF64NormalEquations
        }
    );
    assert_eq!(r.damping.to_bits(), f.parameter.to_bits());
    if let Some(expected) = &f.expected {
        assert_eq!(
            x.iter().map(|v| v.to_bits()).collect::<Vec<_>>(),
            expected.iter().map(|v| v.to_bits()).collect::<Vec<_>>()
        );
    } else {
        let tau = (x[0] - 17.0 / 65.0) / (1.0 - 17.0 / 65.0);
        assert!(tau > 0.0 && tau < 1.0);
        assert!((x[1] - (68.0 / 65.0 + tau * (1.0 - 68.0 / 65.0))).abs() < 1e-14);
        assert!((x[0] * x[0] + x[1] * x[1] - 1.44).abs() < 1e-14);
    }
    let n = f.matrix.first().map_or(0, Vec::len);
    assert_eq!(r.rank_hint, Some(n));
    assert_eq!(r.pivot_count, if f.method == 2 { 0 } else { n });
    assert_eq!(r.row_swaps, usize::from(case == 2));
}
fn record(out: &Output) -> String {
    match out {
        Ok((x, r)) => format!(
            "{:?}|{:?}|{}|{:?}|{}|{}|{}|{:?}|{:?}",
            x.iter().map(|x| x.to_bits()).collect::<Vec<_>>(),
            r.adapter,
            r.lossy,
            r.rank_hint,
            r.damping.to_bits(),
            r.pivot_count,
            r.row_swaps,
            r.min_abs_pivot.map(f64::to_bits),
            r.max_abs_pivot.map(f64::to_bits)
        ),
        Err(e) => format!("{e:?}"),
    }
}
struct Context {
    fixture: Fixture,
    output: Option<Output>,
}
unsafe extern "C" fn callback(p: *mut c_void) {
    let c = unsafe { &mut *p.cast::<Context>() };
    c.output = Some(run(&c.fixture));
}
fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 4);
    let case = args[0].parse().unwrap();
    let mode = &args[1];
    let warm: i32 = args[2].parse().unwrap();
    let pattern: u8 = args[3].parse().unwrap();
    assert!((0..=1).contains(&warm));
    let f = fixture(case);
    if mode == "stack" {
        let mut c = Context {
            fixture: f,
            output: None,
        };
        let stack =
            unsafe { measure_stack(callback, (&mut c as *mut Context).cast(), warm, pattern) };
        let out = c.output.unwrap();
        validate(&c.fixture, case, &out);
        println!("STACK {stack}");
        println!("OUTPUT {}", record(&out));
    } else {
        assert_eq!(mode, "observe");
        if warm != 0 {
            for _ in 0..8 {
                drop(std::hint::black_box(run(&f)));
            }
        }
        let (out, stats) = allocation::observe(|| run(&f));
        validate(&f, case, &out);
        println!("OUTPUT {}", record(&out));
        println!("ALLOCATION {:?}", stats.values());
        let (_, cleanup) = allocation::observe(|| drop(out));
        println!("CLEANUP {:?}", cleanup.values());
    }
}
