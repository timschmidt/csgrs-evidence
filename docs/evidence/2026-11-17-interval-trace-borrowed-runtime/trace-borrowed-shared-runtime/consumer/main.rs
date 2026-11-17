use std::fmt::Write;
use std::hint::black_box;
use std::time::Instant;
use trace_shared_runtime::{candidate, control};

fn cpu_ns(resolution: bool) -> u128 {
    let mut value = std::mem::MaybeUninit::<libc::timespec>::uninit();
    // SAFETY: both clock calls initialize value on successful return.
    let status = unsafe {
        if resolution {
            libc::clock_getres(libc::CLOCK_PROCESS_CPUTIME_ID, value.as_mut_ptr())
        } else {
            libc::clock_gettime(libc::CLOCK_PROCESS_CPUTIME_ID, value.as_mut_ptr())
        }
    };
    assert_eq!(status, 0);
    // SAFETY: the successful clock call initialized value.
    let value = unsafe { value.assume_init() };
    u128::try_from(value.tv_sec).unwrap() * 1_000_000_000 + u128::try_from(value.tv_nsec).unwrap()
}

macro_rules! measure {
    ($module:ident, $labels:expr, $layer:expr, $operation:expr, $expected:expr, $mode:expr, $rounds:expr) => {{
        let wall_start = Instant::now();
        let start = cpu_ns(false);
        let mut output = String::new();
        for _ in 0..$rounds {
            $module::reset();
            let guard = $module::recording_scope();
            for path in $labels {
                $module::record(black_box($layer), black_box($operation), black_box(path));
            }
            let report = match $mode {
                "snapshot" => $module::snapshot(),
                "take" => $module::take(),
                _ => unreachable!(),
            };
            output.clear();
            assert_eq!(report.len(), $expected.len());
            for (row, (path, count)) in report.iter().zip($expected) {
                assert_eq!(row.layer, $layer);
                assert_eq!(row.operation, $operation);
                assert_eq!(row.path, *path);
                assert_eq!(row.count, *count);
                writeln!(
                    output,
                    "ROW {}|{}|{}|{}",
                    row.layer, row.operation, row.path, row.count
                )
                .unwrap();
            }
            if $mode == "take" {
                assert!($module::snapshot().is_empty());
            }
            drop(report);
            $module::reset();
            assert!($module::snapshot().is_empty());
            drop(guard);
        }
        let cpu = cpu_ns(false) - start;
        let wall = wall_start.elapsed().as_nanos();
        (output, cpu, wall)
    }};
}

fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 6);
    let n: usize = args[0].parse().unwrap();
    let groups: usize = args[1].parse().unwrap();
    let length: usize = args[2].parse().unwrap();
    let mode = args[3].as_str();
    let rounds: usize = args[4].parse().unwrap();
    assert!([256, 4096].contains(&n));
    assert!([17, n].contains(&groups));
    assert!([5, 256].contains(&length));
    assert!(["snapshot", "take"].contains(&mode));
    assert_eq!(rounds, 1_048_576_usize.div_ceil(n));
    let labels: Vec<&'static str> = (0..n)
        .map(|i| {
            &*Box::leak(format!("p{:04}{}", i % groups, "x".repeat(length - 5)).into_boxed_str())
        })
        .collect();
    let layer: &'static str = Box::leak("pilot".to_owned().into_boxed_str());
    let operation: &'static str = Box::leak("count".to_owned().into_boxed_str());
    let expected: Vec<_> = (0..groups)
        .map(|i| (labels[i], (i..n).step_by(groups).count() as u64))
        .collect();
    control::reset();
    candidate::reset();
    control::with_recording(|| {
        candidate::with_recording(|| {
            for path in &labels {
                control::record(layer, operation, path);
                candidate::record(layer, operation, path);
            }
        })
    });
    let control_iteration = control::diagnostic_active_iteration();
    let candidate_iteration = candidate::diagnostic_active_iteration();
    assert_eq!(control_iteration, candidate_iteration);
    assert_eq!(control_iteration.len(), n);
    let resolution = cpu_ns(true);
    let (first, second) = match args[5].as_str() {
        "control-first" => (
            (
                "control",
                measure!(control, &labels, layer, operation, &expected, mode, rounds),
            ),
            (
                "borrowed",
                measure!(
                    candidate, &labels, layer, operation, &expected, mode, rounds
                ),
            ),
        ),
        "borrowed-first" => (
            (
                "borrowed",
                measure!(
                    candidate, &labels, layer, operation, &expected, mode, rounds
                ),
            ),
            (
                "control",
                measure!(control, &labels, layer, operation, &expected, mode, rounds),
            ),
        ),
        _ => panic!("order"),
    };
    assert_eq!(first.1.0, second.1.0);
    println!("CONFIG {}", args.join(" "));
    println!("ITERATION_CONTROL {control_iteration:?}");
    println!("ITERATION_BORROWED {candidate_iteration:?}");
    println!("CLOCK_RESOLUTION_NS {resolution}");
    for (label, (output, cpu, wall)) in [first, second] {
        println!("BEGIN {label}");
        println!("CPU_NS {cpu}");
        println!("WALL_NS {wall}");
        print!("{output}");
    }
    println!("COMPLETE {rounds}");
}
